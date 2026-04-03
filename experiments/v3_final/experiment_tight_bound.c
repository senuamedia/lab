/*
 * experiment_tight_bound.c — Tighten the per-triad bound using measured data
 *
 * The current per-triad bound is |c̄(S,K)| ≤ C_geom·√E₀·√(E_S·E_K)
 * with C_geom = 0.157 (proved, 217× loose).
 *
 * The actual |c̄(S,K)| is ~217× smaller. Where does the looseness come from?
 * Can we identify a tighter PROVABLE bound?
 *
 * Strategy: measure |T_{S→K}|² / (n(S,K)² · E_S · E_K) at each (S,K)
 * and see if it has a PROVABLE K-dependent decay.
 *
 * The Cauchy-Schwarz chain gives:
 *   |T_{S→K}|² ≤ 4·E_S·E_K · (K+S+2)²·M_S·2E
 *
 * The ACTUAL |T_{S→K}|² is much smaller. The ratio:
 *   η(S,K) = |T_{S→K}|² / (4·E_S·E_K·(K+S+2)²·M_S·2E·n(S,K)²)
 *
 * If η(S,K) decays as K^{-2δ}: the effective C_geom gets a factor K^{-δ},
 * and β_eff increases by δ.
 *
 * We need δ ≥ 0.3 to close the gap from β=1.62 to β=2 at s=3.5.
 *
 * Also: try an alternative bound using the COLUMN ZERO-SUM constraint.
 * Since Σ_K T_{S→K} = 0: the entries can't all be at maximum simultaneously.
 * The variance is Σ T_{S→K}² ≤ (max |T_{S→K}|) · Σ|T_{S→K}|
 * and the zero-mean gives: max|T_{S→K}| ≥ (1/N)·Σ|T_{S→K}|
 *
 * BUILD:
 *   clang -O3 experiments/experiment_tight_bound.c \
 *         src/triad_kernel_v3_accessible.c -o build/tight_bound -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_zero_state(int64_t num_modes);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_get_num_modes(void);
extern int64_t c3d_apply_state(void);
extern int64_t c3d_enforce_symmetry(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);
extern int64_t c3d_energy(void);
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);
extern int64_t c3d_get_state_ux_im(int64_t idx);
extern int64_t c3d_get_state_uy_im(int64_t idx);
extern int64_t c3d_get_state_uz_im(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }

#define MAX_BASE 500
static int bkx_s[MAX_BASE],bky_s[MAX_BASE],bkz_s[MAX_BASE];
static double bux_s[MAX_BASE],buy_s[MAX_BASE],buz_s[MAX_BASE];
static int nbm=0;

static void ic_spectral(int n_base,double amp,double alpha){
    int nm=(int)c3d_enumerate_modes(n_base);c3d_precompute_triads(n_base);
    nbm=(nm<MAX_BASE)?nm:MAX_BASE;
    for(int i=0;i<nbm;i++){
        bkx_s[i]=(int)c3d_get_kx(i);bky_s[i]=(int)c3d_get_ky(i);bkz_s[i]=(int)c3d_get_kz(i);
        double k2=(double)(bkx_s[i]*bkx_s[i]+bky_s[i]*bky_s[i]+bkz_s[i]*bkz_s[i]);
        double km=sqrt(k2);if(km<0.001)km=1.0;
        double va=amp*pow(km,-alpha),phase=(double)i*0.7+0.3;
        double ux=va*sin(M_PI*phase),uy=va*sin(M_PI*(phase+0.4)),uz=0.0;
        if(bkz_s[i]!=0)uz=-((double)bkx_s[i]*ux+(double)bky_s[i]*uy)/(double)bkz_s[i];
        else if(bky_s[i]!=0)uy=-(double)bkx_s[i]*ux/(double)bky_s[i];
        else ux=0.0;
        bux_s[i]=ux;buy_s[i]=uy;buz_s[i]=uz;
    }
}

static void apply_ic(int N){
    int nm=(int)c3d_enumerate_modes(N);c3d_precompute_triads(N);c3d_zero_state(nm);
    for(int i=0;i<nm;i++){
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        for(int j=0;j<nbm;j++){
            if(bkx_s[j]==kx&&bky_s[j]==ky&&bkz_s[j]==kz){
                buf_set(0,(double)i);buf_set(1,bux_s[j]);buf_set(2,buy_s[j]);buf_set(3,buz_s[j]);
                c3d_apply_state();break;}}
    }
    c3d_enforce_symmetry();
}

#define MAX_MODES 3000
#define MSH 10
static int mkx[MAX_MODES],mky[MAX_MODES],mkz[MAX_MODES];
static double ur[MAX_MODES][3],ui[MAX_MODES][3];
static int nm_g;

static int find_mode(int kx,int ky,int kz){
    for(int i=0;i<nm_g;i++)if(mkx[i]==kx&&mky[i]==ky&&mkz[i]==kz)return i;return -1;
}

static double triad_contrib(int k_idx,int p_idx,int q_idx){
    int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx],k2=kx*kx+ky*ky+kz*kz;
    double updq_re=ur[p_idx][0]*(double)mkx[q_idx]+ur[p_idx][1]*(double)mky[q_idx]+ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im=ui[p_idx][0]*(double)mkx[q_idx]+ui[p_idx][1]*(double)mky[q_idx]+ui[p_idx][2]*(double)mkz[q_idx];
    double kduq_re=(double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
    double kduq_im=(double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
    double sc_re=kduq_re/(double)k2,sc_im=kduq_im/(double)k2;
    double c=0;
    for(int cc=0;cc<3;cc++){
        double kc=(cc==0)?(double)kx:(cc==1)?(double)ky:(double)kz;
        double pq_re=ur[q_idx][cc]-sc_re*kc,pq_im=ui[q_idx][cc]-sc_im*kc;
        double pr=updq_re*pq_re-updq_im*pq_im,pi_v=updq_re*pq_im+updq_im*pq_re;
        c+=ur[k_idx][cc]*pi_v+ui[k_idx][cc]*(-pr);
    }
    return c;
}

static void read_state(void){
    for(int i=0;i<nm_g&&i<MAX_MODES;i++){
        mkx[i]=(int)c3d_get_kx(i);mky[i]=(int)c3d_get_ky(i);mkz[i]=(int)c3d_get_kz(i);
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i));ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i));ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i));ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

int main(void){
    int N=8,n_base=3;
    double nu=0.01,dt=0.0001;
    int n_max_sq=N*N;

    printf("################################################################\n");
    printf("#  TIGHT BOUND: Where does the 217× looseness live?            #\n");
    printf("#                                                              #\n");
    printf("#  Measure the ACTUAL ratio vs Cauchy-Schwarz at each (S,K).  #\n");
    printf("#  Look for K-dependent tightening factor.                     #\n");
    printf("#  Need factor K^{-0.3} to close gap from β=1.62 to β=2.    #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Test at multiple spectral indices to see how the looseness depends on spectrum */
    double alphas[] = {0.0, 0.5, 1.0, 1.5, 2.0, 3.0};
    int n_alphas = 6;

    for(int si=0;si<n_alphas;si++){
        double alpha=alphas[si], amp=0.30;
        ic_spectral(n_base,amp,alpha);apply_ic(N);
        nm_g=(int)c3d_get_num_modes();buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<500;s++)c3d_do_step();
        read_state();

        /* Compute shell energies and mode counts */
        double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
        int M_sh[MSH]; memset(M_sh,0,sizeof(M_sh));
        for(int i=0;i<nm_g;i++){
            int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
            int sh=(int)(sqrt((double)k2)+0.5);
            if(sh<MSH){
                double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];
                E_sh[sh]+=0.5*e;M_sh[sh]++;
            }
        }
        double E_total=bits_to_dbl(c3d_energy());

        /* Compute T_{S→K} and n(S,K) */
        double T_SK[MSH][MSH]; long n_SK[MSH][MSH];
        memset(T_SK,0,sizeof(T_SK));memset(n_SK,0,sizeof(n_SK));
        for(int p_idx=0;p_idx<nm_g;p_idx++){
            int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
            int p2=px*px+py*py+pz*pz;int ps=(int)(sqrt((double)p2)+0.5);if(ps>=MSH)continue;
            for(int k_idx=0;k_idx<nm_g;k_idx++){
                int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
                int k2=kx*kx+ky*ky+kz*kz;int ks=(int)(sqrt((double)k2)+0.5);if(ks>=MSH)continue;
                int qx=kx-px,qy=ky-py,qz=kz-pz;int q2=qx*qx+qy*qy+qz*qz;
                if(q2<=0||q2>n_max_sq)continue;int q_idx=find_mode(qx,qy,qz);if(q_idx<0)continue;
                T_SK[ks][ps]+=triad_contrib(k_idx,p_idx,q_idx);n_SK[ks][ps]++;
            }
        }

        printf("  === α = %.1f (E = %.3f) ===\n\n", alpha, E_total);

        /* For each K: compute the ratio actual/CS at each S,
         * then the K-weighted row sum */
        printf("  K     actual_ρ²   CS_ρ²       ratio       log10(rat)  fitted δ\n");
        printf("  ----  ----------  ----------  ----------  ----------  --------\n");

        double lk_arr[MSH],lr_arr[MSH];int np=0;

        for(int K=2;K<=N-1;K++){
            /* Actual ρ_K² = Σ_S T_{S→K}² */
            double actual_rho2=0;
            for(int S=1;S<=N&&S<MSH;S++) actual_rho2+=T_SK[K][S]*T_SK[K][S];

            /* CS bound ρ_K² ≤ Σ_S [n(S,K)·C_geom·√E₀·√(E_S·E_K)]²
             * = C_geom²·E₀·E_K·Σ_S n(S,K)²·E_S
             * But let's use the FULL CS bound with M_S: */
            double cs_rho2=0;
            for(int S=1;S<=N&&S<MSH;S++){
                if(n_SK[K][S]>0&&E_sh[S]>1e-30&&E_sh[K]>1e-30){
                    double bound_sq = 4.0*E_sh[S]*E_sh[K] * (double)((K+S+2)*(K+S+2)) * M_sh[S] * 2.0*E_total;
                    /* CS: |T_{S→K}|² ≤ bound_sq (from proof) */
                    cs_rho2 += bound_sq;
                }
            }

            double ratio=(cs_rho2>1e-30)?actual_rho2/cs_rho2:0;
            double log_r=(ratio>1e-30)?log10(ratio):-99;

            if(ratio>1e-30){lk_arr[np]=log((double)K);lr_arr[np]=log(ratio);np++;}

            printf("  %-4d  %10.3e  %10.3e  %10.3e  %+10.4f\n",
                   K,actual_rho2,cs_rho2,ratio,log_r);
        }

        /* Fit ratio ~ K^{-2δ} */
        double sx=0,sy=0,sxx=0,sxy=0;
        for(int i=0;i<np;i++){sx+=lk_arr[i];sy+=lr_arr[i];sxx+=lk_arr[i]*lk_arr[i];sxy+=lk_arr[i]*lr_arr[i];}
        double slope=(np>=2)?(np*sxy-sx*sy)/(np*sxx-sx*sx):0;
        double delta=-slope/2.0;

        printf("  Fitted: ratio ~ K^{%.2f} → δ = %.4f\n", slope, delta);
        printf("  β_eff improved by δ: β_new(s=3.5) ≈ 1.62 + %.2f = %.2f\n",
               delta, 1.62+delta);
        printf("  Closes Step 5 at s=3.5? %s\n\n", (1.62+delta > 2.0)?"YES":"no");
        fflush(stdout);

        np=0;
    }

    printf("################################################################\n");
    printf("#  If δ ≥ 0.4 universally:                                     #\n");
    printf("#    β_eff = β_CS + δ ≥ 1.62 + 0.4 = 2.02 > 2               #\n");
    printf("#    Step 5 closes at s = 3.5 = 7/2.                          #\n");
    printf("#                                                              #\n");
    printf("#  The δ represents the PHASE CANCELLATION gain — the factor  #\n");
    printf("#  by which the actual ρ_K² decays faster than the CS bound   #\n");
    printf("#  predicts, due to the -i phase structure.                    #\n");
    printf("################################################################\n");

    return 0;
}
