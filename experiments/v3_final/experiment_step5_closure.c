/*
 * experiment_step5_closure.c — Test whether Step 5 closes unconditionally
 *
 * The bound from Steps 1-4: |T_K| ≤ C_geom · √E₀ · √E_K · F(K)
 * where F(K) = Σ_S n(S,K) · √E_S
 *
 * For diffusion to win at shell K:
 *   C_geom · √E₀ · √E_K · F(K) < ν K² E_K
 *   → F(K) / (K² √E_K) < ν / (C_geom · √E₀)
 *
 * Define: G(K) = F(K) / (K² √E_K)
 *   = [Σ_S n(S,K) · √E_S] / (K² √E_K)
 *
 * If G(K) is bounded (or decreasing) with K: diffusion wins at high K.
 * If G(K) grows with K: the bound doesn't close.
 *
 * Also compute the ACTUAL ratio |T_K| / (ν K² E_K) from finite differences
 * to see what the real transfer-to-diffusion ratio is.
 *
 * Run at multiple time points to track whether G(K) stays bounded
 * throughout the evolution.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_step5_closure.c \
 *         src/triad_kernel_v3_accessible.c -o build/step5 -lm
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

static void ic_distributed(int n_base, double amp) {
    int nm=(int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm=(nm<MAX_BASE)?nm:MAX_BASE;
    for(int i=0;i<nbm;i++){
        bkx_s[i]=(int)c3d_get_kx(i);bky_s[i]=(int)c3d_get_ky(i);bkz_s[i]=(int)c3d_get_kz(i);
        double k2=(double)(bkx_s[i]*bkx_s[i]+bky_s[i]*bky_s[i]+bkz_s[i]*bkz_s[i]);
        double km=sqrt(k2);if(km<0.001)km=1.0;
        double va=amp/km,phase=(double)i*0.7+0.3;
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

int main(void) {
    int N=8, n_base=3;
    double amp=0.30, nu=0.01, dt=0.0001;
    int n_steps=5000, sample_every=500;

    printf("################################################################\n");
    printf("#  STEP 5 CLOSURE TEST                                         #\n");
    printf("#                                                              #\n");
    printf("#  G(K) = F(K) / (K² √E_K)  where F(K) = Σ_S n(S,K)·√E_S   #\n");
    printf("#                                                              #\n");
    printf("#  If G(K) bounded: diffusion wins → Step 5 closes.          #\n");
    printf("#  If G(K) grows: the bound doesn't close unconditionally.    #\n");
    printf("#                                                              #\n");
    printf("#  Also: actual |T_K|/(νK²E_K) from finite differences.       #\n");
    printf("#  Threshold: ν/(C_geom·√E₀) = %.4f/(0.157·√%.1f) = %.4f    #\n",
           nu, amp*amp*nbm*0.1, nu/(0.157*sqrt(2.4)));
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f, ν=%.4f                                      #\n", N, amp, nu);
    printf("################################################################\n\n");
    fflush(stdout);

    /* Precompute geometric triad counts n(S,K) */
    ic_distributed(n_base, amp);
    apply_ic(N);
    int nm=(int)c3d_get_num_modes();

    int mkx[MAX_MODES],mky[MAX_MODES],mkz[MAX_MODES];
    for(int i=0;i<nm&&i<MAX_MODES;i++){
        mkx[i]=(int)c3d_get_kx(i);mky[i]=(int)c3d_get_ky(i);mkz[i]=(int)c3d_get_kz(i);
    }

    long n_SK[MSH][MSH]; memset(n_SK,0,sizeof(n_SK));
    int n_max_sq=N*N;
    for(int p=0;p<nm;p++){
        int px=mkx[p],py=mky[p],pz=mkz[p];
        int p2=px*px+py*py+pz*pz;
        int ps=(int)(sqrt((double)p2)+0.5);
        if(ps>=MSH)continue;
        for(int k=0;k<nm;k++){
            int kx=mkx[k],ky=mky[k],kz=mkz[k];
            int k2=kx*kx+ky*ky+kz*kz;
            int ks=(int)(sqrt((double)k2)+0.5);
            if(ks>=MSH)continue;
            int qx=kx-px,qy=ky-py,qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if(q2<=0||q2>n_max_sq)continue;
            int found=0;
            for(int qi=0;qi<nm;qi++){
                if(mkx[qi]==qx&&mky[qi]==qy&&mkz[qi]==qz){found=1;break;}
            }
            if(found) n_SK[ks][ps]++;
        }
    }

    /* Re-apply IC and evolve */
    apply_ic(N);
    buf_set(0,nu); buf_set(1,dt);

    double threshold = nu / (0.157 * sqrt(2.4));

    printf("  step   time     ");
    for(int K=1;K<=N;K++) printf("  G(%d)     ",K);
    printf("  max_G    bounded?\n");
    printf("  -----  ------   ");
    for(int K=1;K<=N;K++) printf("  ---------");
    printf("  ---------  --------\n");
    fflush(stdout);

    for(int step=0;step<=n_steps;step++){
        if(step>0) c3d_do_step();
        if(step%sample_every!=0) continue;

        /* Compute shell energies */
        double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
        for(int i=0;i<nm;i++){
            int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
            int sh=(int)(sqrt((double)k2)+0.5);
            if(sh<MSH){
                double ux=bits_to_dbl(c3d_get_state_ux(i));
                double uy=bits_to_dbl(c3d_get_state_uy(i));
                double uz=bits_to_dbl(c3d_get_state_uz(i));
                double uxi=bits_to_dbl(c3d_get_state_ux_im(i));
                double uyi=bits_to_dbl(c3d_get_state_uy_im(i));
                double uzi=bits_to_dbl(c3d_get_state_uz_im(i));
                E_sh[sh]+=0.5*(ux*ux+uxi*uxi+uy*uy+uyi*uyi+uz*uz+uzi*uzi);
            }
        }

        /* Compute G(K) = F(K)/(K²√E_K) where F(K) = Σ_S n(S,K)·√E_S */
        double max_G=0;
        printf("  %-5d  %6.4f   ",step,step*dt);
        for(int K=1;K<=N;K++){
            double F_K=0;
            for(int S=1;S<=N&&S<MSH;S++){
                if(E_sh[S]>1e-30)
                    F_K += (double)n_SK[K][S] * sqrt(E_sh[S]);
            }
            double G_K=0;
            if(E_sh[K]>1e-30)
                G_K = F_K / ((double)(K*K) * sqrt(E_sh[K]));
            if(G_K>max_G) max_G=G_K;
            printf("  %9.2e",G_K);
        }
        int bounded = (max_G < threshold) ? 1 : 0;
        printf("  %9.2e  %s\n", max_G, bounded ? "YES" : "no");
        fflush(stdout);
    }

    printf("\n  Threshold ν/(C_geom·√E₀) = %.4e\n", threshold);
    printf("\n");

    /* Also measure actual T_K from finite differences and compare */
    printf("  === Actual |T_K|/(νK²E_K) at final state ===\n\n");

    /* Record shell energies, step at ν=0, measure T_K */
    double se0[MSH]; memset(se0,0,sizeof(se0));
    for(int i=0;i<nm;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){
            double ux=bits_to_dbl(c3d_get_state_ux(i));
            double uy=bits_to_dbl(c3d_get_state_uy(i));
            double uz=bits_to_dbl(c3d_get_state_uz(i));
            se0[sh]+=0.5*(ux*ux+uy*uy+uz*uz);
        }
    }

    buf_set(0,0.0);buf_set(1,dt);
    for(int s=0;s<100;s++) c3d_do_step();

    double se1[MSH]; memset(se1,0,sizeof(se1));
    for(int i=0;i<nm;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){
            double ux=bits_to_dbl(c3d_get_state_ux(i));
            double uy=bits_to_dbl(c3d_get_state_uy(i));
            double uz=bits_to_dbl(c3d_get_state_uz(i));
            se1[sh]+=0.5*(ux*ux+uy*uy+uz*uz);
        }
    }

    printf("  K     |T_K|       νK²E_K      ratio       G(K)_bound   actual < bound?\n");
    printf("  ----  ----------  ----------  ----------  -----------  ---------------\n");
    for(int K=1;K<=N;K++){
        double T_K=fabs(se1[K]-se0[K])/(100*dt);
        double diff=nu*(double)(K*K)*se0[K];
        double ratio=(diff>1e-30)?T_K/diff:0;

        double F_K=0;
        for(int S=1;S<=N&&S<MSH;S++)
            if(se0[S]>1e-30) F_K+=(double)n_SK[K][S]*sqrt(se0[S]);
        double bound=0.157*sqrt(2.4)*sqrt(se0[K])*F_K;
        double bound_ratio=(diff>1e-30)?bound/diff:0;

        printf("  %-4d  %10.3e  %10.3e  %10.4f  %11.4f  %s\n",
               K,T_K,diff,ratio,bound_ratio,
               (ratio<bound_ratio)?"YES":"no");
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  G(K) bounded and < threshold at all K, all times:           #\n");
    printf("#    → Steps 1-4 bound suffices. Diffusion wins.             #\n");
    printf("#    → Step 5 closes without assuming regularity.             #\n");
    printf("#                                                              #\n");
    printf("#  G(K) grows with K or exceeds threshold:                     #\n");
    printf("#    → The bound needs Sobolev decay (Step 5 as written).     #\n");
    printf("#    → The bootstrap is needed.                                #\n");
    printf("################################################################\n");

    return 0;
}
