/*
 * experiment_row_rms.c — Row RMS of the transfer matrix
 *
 * ρ_K = √(Σ_S T_{S→K}²) — the RMS of each row (target shell K).
 *
 * T_K = Σ_S T_{S→K}, and |T_K| ≤ ρ_K · √N (by Cauchy-Schwarz on the sum).
 * But actually |T_K| ≤ Σ_S |T_{S→K}| ≤ √N · ρ_K (looser than needed).
 *
 * The KEY: does ρ_K decay with K?
 * If ρ_K ~ K^{-β} for β > 0: then |T_K| ≤ √N · K^{-β}
 * Combined with diffusion νK²: the cascade/diffusion ratio is
 *   |T_K|/(νK²E_K) ≤ √N · K^{-β} / (νK²E_K)
 *
 * Also compare: σ_S (column RMS) vs ρ_K (row RMS).
 * The column RMS is bounded by the per-triad bound (proved).
 * If the row RMS decays faster than the column RMS: that's progress.
 *
 * Also: decompose ρ_K into contributions from energy-rich sources (S ≤ 3)
 * vs energy-poor sources (S > 3). If the energy-rich sources dominate,
 * the row RMS inherits their spectral decay.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_row_rms.c \
 *         src/triad_kernel_v3_accessible.c -o build/row_rms -lm
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

int main(void){
    int N=8,n_base=3;
    double nu=0.01,dt=0.0001;

    printf("################################################################\n");
    printf("#  ROW RMS: ρ_K = √(Σ_S T_{S→K}²)                           #\n");
    printf("#                                                              #\n");
    printf("#  Does ρ_K decay with K? If so: K-dependent bound exists.    #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Sweep across configs */
    double amps[]={0.10,0.20,0.30};
    double alphas[]={0.0,1.0,2.0};
    int steps_list[]={500,2000};
    double times[]={0.05,0.20};
    int n_max_sq=N*N;

    printf("  A      α     t       ρ(1)       ρ(2)       ρ(3)       ρ(4)       ρ(5)       ρ(6)       ρ(7)       ρ(8)       β_fit\n");
    printf("  -----  ----  ------  ---------  ---------  ---------  ---------  ---------  ---------  ---------  ---------  ------\n");

    for(int ai=0;ai<3;ai++)
    for(int si=0;si<3;si++)
    for(int ti=0;ti<2;ti++){
        ic_spectral(n_base,amps[ai],alphas[si]);apply_ic(N);
        nm_g=(int)c3d_get_num_modes();buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<steps_list[ti];s++)c3d_do_step();
        read_state();

        /* Compute T_{S→K} */
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

        /* Row RMS: ρ_K */
        double rho[MSH];
        printf("  %.2f   %.1f   %.4f",amps[ai],alphas[si],times[ti]);
        double sx=0,sy=0,sxx=0,sxy=0;int npts=0;
        for(int K=1;K<=N;K++){
            double ssq=0;
            for(int S=1;S<=N&&S<MSH;S++) ssq+=T_SK[K][S]*T_SK[K][S];
            rho[K]=sqrt(ssq);
            printf("  %9.2e",rho[K]);
            if(K>=2&&K<=7&&rho[K]>1e-30){
                double lk=log((double)K),lr=log(rho[K]);
                sx+=lk;sy+=lr;sxx+=lk*lk;sxy+=lk*lr;npts++;
            }
        }
        double beta=(npts>=2)?-(npts*sxy-sx*sy)/(npts*sxx-sx*sx):0;
        printf("  %+6.2f\n",beta);
        fflush(stdout);
    }

    printf("\n");

    /* Detailed: compare ρ_K with |T_K|, E_K, νK²E_K */
    printf("  === Detailed: A=0.30, α=1, t=0.05 ===\n\n");
    ic_spectral(n_base,0.30,1.0);apply_ic(N);nm_g=(int)c3d_get_num_modes();
    buf_set(0,nu);buf_set(1,dt);for(int s=0;s<500;s++)c3d_do_step();read_state();

    double T_SK[MSH][MSH],E_sh[MSH];
    memset(T_SK,0,sizeof(T_SK));memset(E_sh,0,sizeof(E_sh));
    for(int i=0;i<nm_g;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
    }
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

    printf("  K     ρ_K         |T_K|       E_K         ρ_K/E_K     ρ_K/√E_K    νK²E_K      ρ/νK²E\n");
    printf("  ----  ----------  ----------  ----------  ----------  ----------  ----------  ----------\n");
    for(int K=1;K<=N;K++){
        double ssq=0,tk=0;
        for(int S=1;S<=N&&S<MSH;S++){ssq+=T_SK[K][S]*T_SK[K][S];tk+=T_SK[K][S];}
        double rho_K=sqrt(ssq);
        double diff=nu*(double)(K*K)*E_sh[K];
        printf("  %-4d  %10.3e  %10.3e  %10.3e  %10.3e  %10.3e  %10.3e  %10.3e\n",
               K,rho_K,fabs(tk),E_sh[K],
               (E_sh[K]>1e-30)?rho_K/E_sh[K]:0,
               (E_sh[K]>1e-30)?rho_K/sqrt(E_sh[K]):0,
               diff,(diff>1e-30)?rho_K/diff:0);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  If β > 0: ρ_K decays → K-dependent bound on |T_K|.        #\n");
    printf("#  If ρ_K/√E_K is bounded: ρ_K ≤ C·√E_K → |T_K| ≤ C·√E_K. #\n");
    printf("#    Then |T_K|/(νK²E_K) ≤ C/(νK²√E_K) → ∞ at high K.      #\n");
    printf("#    Still needs Sobolev decay to close.                       #\n");
    printf("#                                                              #\n");
    printf("#  If ρ_K/E_K is bounded: ρ_K ≤ C·E_K → |T_K| ≤ C·E_K.     #\n");
    printf("#    Then |T_K|/(νK²E_K) ≤ C/(νK²) → 0 at high K!          #\n");
    printf("#    THIS WOULD CLOSE STEP 5 UNCONDITIONALLY.                 #\n");
    printf("################################################################\n");

    return 0;
}
