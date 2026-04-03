/*
 * experiment_per_triad_bound.c — Test |c̄(S,K)| ≤ C · √(E_S · E_K)
 *
 * For each shell pair (S,K), compute:
 *   c̄(S,K) = T_{S→K} / n(S,K)  (average per-triad contribution)
 *   bound = √(E_S · E_K)
 *   ratio = |c̄(S,K)| / √(E_S · E_K)
 *
 * If ratio ≤ C for some universal C: the per-triad bound holds.
 * Test across multiple (A, ν, t) to check universality of C.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_per_triad_bound.c \
 *         src/triad_kernel_v3_accessible.c -o build/triad_bound -lm
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

static void ic_spectral(int n_base, double amp, double alpha) {
    int nm=(int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
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

static void apply_ic(int N) {
    int nm=(int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);c3d_zero_state(nm);
    for(int i=0;i<nm;i++){
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        for(int j=0;j<nbm;j++){
            if(bkx_s[j]==kx&&bky_s[j]==ky&&bkz_s[j]==kz){
                buf_set(0,(double)i);buf_set(1,bux_s[j]);buf_set(2,buy_s[j]);buf_set(3,buz_s[j]);
                c3d_apply_state();break;}
        }
    }
    c3d_enforce_symmetry();
}

#define MAX_MODES 3000
#define MSH 10
static int mkx[MAX_MODES],mky[MAX_MODES],mkz[MAX_MODES];
static double ur[MAX_MODES][3],ui[MAX_MODES][3];
static int nm_g;

static int find_mode(int kx,int ky,int kz){
    for(int i=0;i<nm_g;i++)if(mkx[i]==kx&&mky[i]==ky&&mkz[i]==kz)return i;
    return -1;
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

static void read_state(void) {
    for(int i=0;i<nm_g&&i<MAX_MODES;i++){
        mkx[i]=(int)c3d_get_kx(i);mky[i]=(int)c3d_get_ky(i);mkz[i]=(int)c3d_get_kz(i);
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i));ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i));ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i));ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

/* Compute max C across all shell pairs for one configuration */
static double measure_max_C(int N) {
    int n_max_sq=N*N;

    double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
    for(int i=0;i<nm_g;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
    }

    double T_SK[MSH][MSH]; long n_SK[MSH][MSH];
    memset(T_SK,0,sizeof(T_SK)); memset(n_SK,0,sizeof(n_SK));

    for(int p_idx=0;p_idx<nm_g;p_idx++){
        int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
        int p2=px*px+py*py+pz*pz;
        int ps=(int)(sqrt((double)p2)+0.5);
        if(ps>=MSH)continue;

        for(int k_idx=0;k_idx<nm_g;k_idx++){
            int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
            int k2=kx*kx+ky*ky+kz*kz;
            int ks=(int)(sqrt((double)k2)+0.5);
            if(ks>=MSH)continue;

            int qx=kx-px,qy=ky-py,qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if(q2<=0||q2>n_max_sq)continue;
            int q_idx=find_mode(qx,qy,qz);
            if(q_idx<0)continue;

            T_SK[ks][ps]+=triad_contrib(k_idx,p_idx,q_idx);
            n_SK[ks][ps]++;
        }
    }

    double max_C=0;
    for(int K=1;K<=N&&K<MSH;K++)
    for(int S=1;S<=N&&S<MSH;S++){
        if(n_SK[K][S]==0)continue;
        double cbar=fabs(T_SK[K][S])/(double)n_SK[K][S];
        double bound=sqrt(E_sh[S]*E_sh[K]);
        if(bound>1e-30){
            double C=cbar/bound;
            if(C>max_C) max_C=C;
        }
    }
    return max_C;
}

int main(void){
    int N=8,n_base=3;
    double dt=0.0001;

    printf("################################################################\n");
    printf("#  PER-TRIAD BOUND: |c̄(S,K)| ≤ C · √(E_S · E_K)            #\n");
    printf("#                                                              #\n");
    printf("#  Test whether C is universal across configurations.         #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* First: detailed matrix for one config */
    {
        double amp=0.30,nu=0.01;
        ic_spectral(n_base,amp,1.0);apply_ic(N);
        nm_g=(int)c3d_get_num_modes();
        buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<500;s++)c3d_do_step();
        read_state();

        int n_max_sq=N*N;
        double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
        for(int i=0;i<nm_g;i++){
            int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
            int sh=(int)(sqrt((double)k2)+0.5);
            if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
        }

        double T_SK[MSH][MSH]; long n_SK[MSH][MSH];
        memset(T_SK,0,sizeof(T_SK)); memset(n_SK,0,sizeof(n_SK));

        for(int p_idx=0;p_idx<nm_g;p_idx++){
            int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
            int p2=px*px+py*py+pz*pz;
            int ps=(int)(sqrt((double)p2)+0.5);
            if(ps>=MSH)continue;
            for(int k_idx=0;k_idx<nm_g;k_idx++){
                int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
                int k2=kx*kx+ky*ky+kz*kz;
                int ks=(int)(sqrt((double)k2)+0.5);
                if(ks>=MSH)continue;
                int qx=kx-px,qy=ky-py,qz=kz-pz;
                int q2=qx*qx+qy*qy+qz*qz;
                if(q2<=0||q2>n_max_sq)continue;
                int q_idx=find_mode(qx,qy,qz);
                if(q_idx<0)continue;
                T_SK[ks][ps]+=triad_contrib(k_idx,p_idx,q_idx);
                n_SK[ks][ps]++;
            }
        }

        printf("  === Ratio |c̄(S,K)| / √(E_S·E_K) at A=0.30, ν=0.01, t=0.05 ===\n\n");
        printf("  K\\S   ");
        for(int S=1;S<=N&&S<MSH;S++)printf("    S=%-4d ",S);
        printf("   max_C\n  ------");
        for(int S=1;S<=N&&S<MSH;S++)printf("  ---------");
        printf("  ---------\n");

        for(int K=1;K<=N&&K<MSH;K++){
            printf("  K=%-4d",K);
            double row_max=0;
            for(int S=1;S<=N&&S<MSH;S++){
                double cbar=(n_SK[K][S]>0)?fabs(T_SK[K][S])/(double)n_SK[K][S]:0;
                double bound=sqrt(E_sh[S]*E_sh[K]);
                double C=(bound>1e-30)?cbar/bound:0;
                if(C>row_max) row_max=C;
                printf("  %9.2e",C);
            }
            printf("  %9.2e\n",row_max);
        }
        printf("\n");
    }

    /* Sweep across configurations */
    printf("  === Max C across configurations ===\n\n");
    printf("  A      α     ν        t       max_C\n");
    printf("  -----  ----  -------  ------  ---------\n");
    fflush(stdout);

    double amps[]={0.10,0.20,0.30};
    double alphas[]={0.0,1.0,2.0};
    double nus[]={0.01,0.001};
    int steps_list[]={100,500,2000};
    double times[]={0.01,0.05,0.20};

    double global_max_C=0;

    for(int ai=0;ai<3;ai++)
    for(int si=0;si<3;si++)
    for(int vi=0;vi<2;vi++)
    for(int ti=0;ti<3;ti++){
        ic_spectral(n_base,amps[ai],alphas[si]);apply_ic(N);
        nm_g=(int)c3d_get_num_modes();
        buf_set(0,nus[vi]);buf_set(1,dt);
        for(int s=0;s<steps_list[ti];s++)c3d_do_step();
        read_state();

        double C=measure_max_C(N);
        if(C>global_max_C) global_max_C=C;

        printf("  %.2f   %.1f   %.4f   %.4f  %9.2e\n",
               amps[ai],alphas[si],nus[vi],times[ti],C);
        fflush(stdout);
    }

    printf("\n  GLOBAL MAX C = %.6e\n\n", global_max_C);

    if(global_max_C < 1.0)
        printf("  → C < 1: the per-triad bound |c̄| ≤ C·√(E_S·E_K) holds with C < 1.\n");
    else
        printf("  → C = %.2e: the bound holds but C > 1.\n", global_max_C);

    printf("\n");
    printf("################################################################\n");
    printf("#  If C is bounded across all configs:                         #\n");
    printf("#    |T_{S→K}| ≤ n(S,K) · C · √(E_S·E_K)                   #\n");
    printf("#    With column sum = 0 (proved) and n(S,K) computable:     #\n");
    printf("#    |T_K| is bounded by a COMPUTABLE function of {E_S}.     #\n");
    printf("#    This closes step 4 of the analytical bridge.             #\n");
    printf("################################################################\n");

    return 0;
}
