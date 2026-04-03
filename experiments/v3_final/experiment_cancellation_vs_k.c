/*
 * experiment_cancellation_vs_k.c — How does |Σc_i| / Σ|c_i| depend on K?
 *
 * The gap in Step 5 is that |Σc_i| ≤ Σ|c_i| (triangle inequality)
 * overestimates by ~10^5. The actual cancellation ratio |Σc_i|/Σ|c_i|
 * is small because of the -i phase structure.
 *
 * This experiment measures the cancellation ratio at each TARGET shell K
 * (not source shell S), and fits its K-dependence.
 *
 * If |Σc_i|/Σ|c_i| ~ K^{-β} for some β > 0: the cancellation grows
 * with K in a provable way. Combined with the Σ|c_i| bound from Steps 1-4,
 * this would give |T_K| ~ Σ|c_i| · K^{-β}, reducing the effective γ
 * by β. If β is large enough: Step 5 closes.
 *
 * Also track:
 *   - The cancellation ratio separately for "local" triads (|S-K| ≤ 2)
 *     vs "distant" triads (|S-K| > 2)
 *   - How the ratio changes with time (does the cascade evolution
 *     increase or decrease the cancellation?)
 *   - The ratio at different amplitudes
 *
 * BUILD:
 *   clang -O3 experiments/experiment_cancellation_vs_k.c \
 *         src/triad_kernel_v3_accessible.c -o build/cancel_vs_k -lm
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
                c3d_apply_state();break;
            }
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

static void read_state(void){
    for(int i=0;i<nm_g&&i<MAX_MODES;i++){
        mkx[i]=(int)c3d_get_kx(i);mky[i]=(int)c3d_get_ky(i);mkz[i]=(int)c3d_get_kz(i);
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i));ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i));ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i));ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

/* Measure per-shell cancellation: |T_K| vs Σ|contrib at K| */
static void measure_cancel_by_k(int N, double ratio_out[MSH], double abs_out[MSH], double signed_out[MSH]) {
    int n_max_sq=N*N;
    for(int K=0;K<MSH;K++){ratio_out[K]=0;abs_out[K]=0;signed_out[K]=0;}

    for(int k_idx=0;k_idx<nm_g;k_idx++){
        int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
        int k2=kx*kx+ky*ky+kz*kz;
        int ks=(int)(sqrt((double)k2)+0.5);
        if(ks>=MSH)continue;

        for(int p_idx=0;p_idx<nm_g;p_idx++){
            int qx=kx-mkx[p_idx],qy=ky-mky[p_idx],qz=kz-mkz[p_idx];
            int q2=qx*qx+qy*qy+qz*qz;
            if(q2<=0||q2>n_max_sq)continue;
            int q_idx=find_mode(qx,qy,qz);
            if(q_idx<0)continue;

            double c=triad_contrib(k_idx,p_idx,q_idx);
            signed_out[ks]+=c;
            abs_out[ks]+=fabs(c);
        }
    }

    for(int K=1;K<=N&&K<MSH;K++){
        ratio_out[K]=(abs_out[K]>1e-30)?fabs(signed_out[K])/abs_out[K]:0;
    }
}

int main(void){
    int N=8,n_base=3;
    double dt=0.0001;

    printf("################################################################\n");
    printf("#  CANCELLATION RATIO vs K                                     #\n");
    printf("#                                                              #\n");
    printf("#  r(K) = |T_K| / Σ|c_i at K|                                #\n");
    printf("#  If r(K) ~ K^{-β}: cancellation grows with K.              #\n");
    printf("#  The exponent β is what would close Step 5.                 #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Multiple configs: amplitude × time × spectral index */
    double amps[]={0.10,0.20,0.30};
    double alphas[]={0.0,1.0,2.0};
    int steps_list[]={500,2000};
    double times[]={0.05,0.20};
    double nu=0.01;

    printf("  A      α     t       r(1)       r(2)       r(3)       r(4)       r(5)       r(6)       r(7)       r(8)       β (fitted)\n");
    printf("  -----  ----  ------  ---------  ---------  ---------  ---------  ---------  ---------  ---------  ---------  ----------\n");
    fflush(stdout);

    for(int ai=0;ai<3;ai++)
    for(int si=0;si<3;si++)
    for(int ti=0;ti<2;ti++){
        ic_spectral(n_base,amps[ai],alphas[si]);
        apply_ic(N);
        nm_g=(int)c3d_get_num_modes();
        buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<steps_list[ti];s++) c3d_do_step();
        read_state();

        double ratio[MSH],absv[MSH],signv[MSH];
        measure_cancel_by_k(N,ratio,absv,signv);

        /* Fit β from log(r) vs log(K) at interior shells K=2..7 */
        double sx=0,sy=0,sxx=0,sxy=0;
        int npts=0;
        for(int K=2;K<=7;K++){
            if(ratio[K]>1e-30){
                double lk=log((double)K),lr=log(ratio[K]);
                sx+=lk;sy+=lr;sxx+=lk*lk;sxy+=lk*lr;
                npts++;
            }
        }
        double beta=0;
        if(npts>=2) beta=-(npts*sxy-sx*sy)/(npts*sxx-sx*sx); /* negative slope = positive β */

        printf("  %.2f   %.1f   %.4f",amps[ai],alphas[si],times[ti]);
        for(int K=1;K<=N;K++) printf("  %9.2e",ratio[K]);
        printf("  %+10.4f\n",beta);
        fflush(stdout);
    }

    printf("\n");

    /* Detailed view at one config with local vs distant decomposition */
    printf("  === Detailed: A=0.30, α=1.0, t=0.05 ===\n\n");
    ic_spectral(n_base,0.30,1.0);
    apply_ic(N);
    nm_g=(int)c3d_get_num_modes();
    buf_set(0,nu);buf_set(1,dt);
    for(int s=0;s<500;s++) c3d_do_step();
    read_state();

    int n_max_sq=N*N;

    printf("  K     |T_K|       Σ|c_i|      r(K)        #triads     log r    log K    |T_K|/E_K     Σ|c|/E_K\n");
    printf("  ----  ----------  ----------  ----------  ----------  ------   ------   ----------  ----------\n");

    double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
    for(int i=0;i<nm_g;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){
            double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];
            E_sh[sh]+=0.5*e;
        }
    }

    for(int K=1;K<=N;K++){
        double T_signed=0,T_abs=0;
        long nt=0;
        for(int k_idx=0;k_idx<nm_g;k_idx++){
            int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
            int k2=kx*kx+ky*ky+kz*kz;
            if((int)(sqrt((double)k2)+0.5)!=K)continue;
            for(int p_idx=0;p_idx<nm_g;p_idx++){
                int qx=kx-mkx[p_idx],qy=ky-mky[p_idx],qz=kz-mkz[p_idx];
                int q2=qx*qx+qy*qy+qz*qz;
                if(q2<=0||q2>n_max_sq)continue;
                int q_idx=find_mode(qx,qy,qz);
                if(q_idx<0)continue;
                double c=triad_contrib(k_idx,p_idx,q_idx);
                T_signed+=c;T_abs+=fabs(c);nt++;
            }
        }
        double r=(T_abs>1e-30)?fabs(T_signed)/T_abs:0;
        double TK_EK=(E_sh[K]>1e-30)?fabs(T_signed)/E_sh[K]:0;
        double abs_EK=(E_sh[K]>1e-30)?T_abs/E_sh[K]:0;
        printf("  %-4d  %10.3e  %10.3e  %10.4e  %10ld  %+6.2f   %+6.3f   %10.3e  %10.3e\n",
               K,fabs(T_signed),T_abs,r,nt,
               (r>1e-30)?log10(r):-99.0,log10((double)K),
               TK_EK,abs_EK);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  If β > 0 consistently:                                      #\n");
    printf("#    r(K) ~ K^{-β} → |T_K| ~ Σ|c| · K^{-β}                 #\n");
    printf("#    This reduces effective γ by β.                           #\n");
    printf("#    Need β large enough that γ_eff < 2.                     #\n");
    printf("#                                                              #\n");
    printf("#  If r(K) correlates with E_K (spectral decay):              #\n");
    printf("#    The cancellation tracks the energy spectrum.              #\n");
    printf("#    This is WHY Sobolev decay works — it's not               #\n");
    printf("#    just an analytical convenience, it's the                  #\n");
    printf("#    physical mechanism of the cancellation.                   #\n");
    printf("################################################################\n");

    return 0;
}
