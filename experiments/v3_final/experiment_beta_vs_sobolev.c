/*
 * experiment_beta_vs_sobolev.c — Relationship between β and Sobolev index
 *
 * β is the decay exponent of ρ_K (row RMS of transfer matrix).
 * s is the effective Sobolev index (E_K ~ K^{-2s} per shell).
 *
 * If β > 2 for all s > s_critical: Step 5 closes for smooth data.
 * If β = f(s) with f(s) > 2 for s > some threshold: we have
 * an analytical formula connecting the spectral decay to the
 * transfer decay.
 *
 * This experiment:
 *   1. Measure β at many spectral indices α (0, 0.25, 0.5, ..., 3.0)
 *   2. Also measure the ACTUAL Sobolev index of the evolved field
 *      (which may differ from the IC spectral index)
 *   3. Fit the relationship β = f(s_actual)
 *   4. Determine the critical s where β = 2
 *   5. Test at multiple A, ν, t to check universality
 *
 * The formula to derive: if β = a·s + b with a > 0, then
 *   β > 2 ⟺ s > (2-b)/a = s_critical
 * For smooth data (s → ∞): β → ∞ and Step 5 closes.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_beta_vs_sobolev.c \
 *         src/triad_kernel_v3_accessible.c -o build/beta_vs_s -lm
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
extern int64_t c3d_enstrophy(void);
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

/* Measure the actual Sobolev index of the current state:
 * fit E_K ~ K^{-2s} from the shell energy spectrum */
static double measure_sobolev(int N, double E_sh[MSH]) {
    double sx=0,sy=0,sxx=0,sxy=0;int n=0;
    for(int K=2;K<=N-1;K++){
        if(E_sh[K]>1e-30){
            double lk=log((double)K),le=log(E_sh[K]);
            sx+=lk;sy+=le;sxx+=lk*lk;sxy+=lk*le;n++;
        }
    }
    if(n<2) return 0;
    double slope=(n*sxy-sx*sy)/(n*sxx-sx*sx);
    return -slope/2.0; /* E_K ~ K^{-2s} → slope = -2s */
}

/* Measure β from row RMS ρ_K ~ K^{-β} */
static double measure_beta(int N, double T_SK[MSH][MSH]) {
    double sx=0,sy=0,sxx=0,sxy=0;int n=0;
    for(int K=2;K<=N-1;K++){
        double ssq=0;
        for(int S=1;S<=N&&S<MSH;S++) ssq+=T_SK[K][S]*T_SK[K][S];
        double rho=sqrt(ssq);
        if(rho>1e-30){
            double lk=log((double)K),lr=log(rho);
            sx+=lk;sy+=lr;sxx+=lk*lk;sxy+=lk*lr;n++;
        }
    }
    if(n<2) return 0;
    return -(n*sxy-sx*sy)/(n*sxx-sx*sx);
}

int main(void){
    int N=8,n_base=3;
    double nu=0.01,dt=0.0001;
    int n_max_sq=N*N;

    printf("################################################################\n");
    printf("#  β vs SOBOLEV INDEX s                                        #\n");
    printf("#                                                              #\n");
    printf("#  β = row RMS decay exponent (ρ_K ~ K^{-β})                  #\n");
    printf("#  s = actual Sobolev index (E_K ~ K^{-2s})                   #\n");
    printf("#                                                              #\n");
    printf("#  If β > 2 when s > s_crit: Step 5 closes for smooth data.  #\n");
    printf("#  If β = a·s + b: analytical formula exists.                  #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Fine sweep of spectral index α */
    double alphas[] = {0.0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.5, 3.0};
    int n_alphas = 11;
    double amps[] = {0.10, 0.30};
    int n_amps = 2;
    int steps_list[] = {500, 2000};
    double times[] = {0.05, 0.20};
    int n_times = 2;

    printf("  A      α_IC   t       s_actual   β          β/s        β > 2?   diff_wins?\n");
    printf("  -----  -----  ------  ---------  ---------  ---------  ------   ---------\n");

    /* Collect (s, β) pairs for regression */
    double all_s[200], all_beta[200];
    int n_points = 0;

    for(int ai=0;ai<n_amps;ai++)
    for(int si=0;si<n_alphas;si++)
    for(int ti=0;ti<n_times;ti++){
        double amp=amps[ai], alpha=alphas[si];
        ic_spectral(n_base,amp,alpha);apply_ic(N);
        nm_g=(int)c3d_get_num_modes();buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<steps_list[ti];s++)c3d_do_step();
        read_state();

        /* Shell energies */
        double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
        for(int i=0;i<nm_g;i++){
            int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
            int sh=(int)(sqrt((double)k2)+0.5);
            if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
        }

        /* Transfer matrix */
        double T_SK[MSH][MSH]; memset(T_SK,0,sizeof(T_SK));
        for(int p_idx=0;p_idx<nm_g;p_idx++){
            int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
            int p2=px*px+py*py+pz*pz;int ps=(int)(sqrt((double)p2)+0.5);if(ps>=MSH)continue;
            for(int k_idx=0;k_idx<nm_g;k_idx++){
                int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
                int k2=kx*kx+ky*ky+kz*kz;int ks=(int)(sqrt((double)k2)+0.5);if(ks>=MSH)continue;
                int qx=kx-px,qy=ky-py,qz=kz-pz;int q2=qx*qx+qy*qy+qz*qz;
                if(q2<=0||q2>n_max_sq)continue;int q_idx=find_mode(qx,qy,qz);if(q_idx<0)continue;
                T_SK[ks][ps]+=triad_contrib(k_idx,p_idx,q_idx);
            }
        }

        double s_act = measure_sobolev(N, E_sh);
        double beta = measure_beta(N, T_SK);
        double beta_s = (s_act > 0.01) ? beta / s_act : 0;
        int beta_gt2 = (beta > 2.0) ? 1 : 0;

        /* Check if ρ_K < νK² at the highest interior shell (K=7) */
        double rho7_ssq = 0;
        for(int S=1;S<=N&&S<MSH;S++) rho7_ssq+=T_SK[7][S]*T_SK[7][S];
        double rho7 = sqrt(rho7_ssq);
        double diff7 = nu * 49.0; /* νK² at K=7, without E_K */
        int diff_wins = (rho7 < diff7 * E_sh[7]) ? 1 : 0;

        printf("  %.2f   %5.2f  %.4f  %9.4f  %9.4f  %9.4f  %s     %s\n",
               amp,alpha,times[ti],s_act,beta,beta_s,
               beta_gt2?"YES":"no",diff_wins?"YES":"no");

        if(s_act > 0.01 && beta > 0.01){
            all_s[n_points] = s_act;
            all_beta[n_points] = beta;
            n_points++;
        }
        fflush(stdout);
    }

    /* Fit β = a·s + b */
    printf("\n  === Regression: β = a·s + b ===\n\n");
    double sx=0,sy=0,sxx=0,sxy=0;
    for(int i=0;i<n_points;i++){
        sx+=all_s[i];sy+=all_beta[i];sxx+=all_s[i]*all_s[i];sxy+=all_s[i]*all_beta[i];
    }
    double a = (n_points*sxy - sx*sy) / (n_points*sxx - sx*sx);
    double b = (sy - a*sx) / n_points;
    double s_crit = (a > 0.01) ? (2.0 - b) / a : 999;

    printf("  Fitted: β = %.4f · s + %.4f\n", a, b);
    printf("  β = 2 when s = %.4f\n", s_crit);
    printf("  For s > %.4f: β > 2 → ρ_K decays faster than K²\n", s_crit);
    printf("  For H^s with s > 7/2 = 3.5: β ≈ %.1f (far above 2)\n", a*3.5+b);
    printf("\n");

    printf("  n_points = %d\n\n", n_points);

    printf("################################################################\n");
    printf("#  If s_crit < 7/2:                                            #\n");
    printf("#    For smooth data (s > 7/2), β > 2 ALWAYS.                #\n");
    printf("#    ρ_K ~ K^{-β} with β > 2 → ρ_K decays faster than K².  #\n");
    printf("#    |T_K| ≤ √N·ρ_K ≤ √N·C·K^{-β} < νK²E_K at high K.    #\n");
    printf("#    Step 5 closes: diffusion wins at every shell.            #\n");
    printf("#                                                              #\n");
    printf("#  The formula β = a·s + b is PROVABLE if:                   #\n");
    printf("#    1. ρ_K ≤ C·(Σ_S T_{S→K}²)^{1/2} (definition)          #\n");
    printf("#    2. T_{S→K} ≤ n(S,K)·C_geom·√E₀·√(E_S·E_K) (proved)   #\n");
    printf("#    3. E_K ~ K^{-2s} (Sobolev decay, from H^s assumption)   #\n");
    printf("#    Substituting 2 into 1 with 3 gives ρ_K ~ K^{-f(s)}     #\n");
    printf("#    where f(s) depends on the triad count scaling.            #\n");
    printf("################################################################\n");

    return 0;
}
