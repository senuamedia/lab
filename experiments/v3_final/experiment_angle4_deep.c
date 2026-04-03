/*
 * experiment_angle4_deep.c — Deep dive on Angle 4 (Wave convolution)
 *
 * T_K ≈ Σ_S W(K-S) · E_S  where W(d) is the "wave kernel"
 *
 * Young's inequality: |T_K| ≤ ||W||₁ · ||E||_∞ = ||W||₁ · max E_S
 *
 * This gave |T_K| ≤ 1.165 (within 2× of actual 0.583).
 *
 * But we can do better. The convolution structure means:
 *   |T_K| ≤ ||W||_p · ||E||_q  for 1/p + 1/q = 1 + 1/r (Young)
 *
 * Also: since W sums to zero (it's the derivative of the balanced transfer),
 * the convolution T_K = W * E is actually W * (E - E_mean), which may help.
 *
 * Deep dive:
 *   1. Is W(d) = T_{S→K}/E_S truly S-independent? (universality of kernel)
 *   2. ||W||₁ across configurations — is it bounded?
 *   3. Can we PROVE ||W||₁ ≤ some constant from the per-triad bound?
 *   4. The zero-mean property: W sums to zero ⟹ T_K = W * (E - Ē)
 *   5. Compare |T_K| ≤ ||W||₁ · max E_S with νK²E_K — when does diffusion win?
 *   6. Is there a K-dependent improvement from the convolution structure?
 *
 * BUILD:
 *   clang -O3 experiments/experiment_angle4_deep.c \
 *         src/triad_kernel_v3_accessible.c -o build/angle4 -lm
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

static void compute_T_SK(int N,double T_SK[MSH][MSH],double E_sh[MSH]){
    int n_max_sq=N*N;
    memset(T_SK,0,MSH*MSH*sizeof(double));memset(E_sh,0,MSH*sizeof(double));
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
}

int main(void){
    int N=8,n_base=3;
    double nu=0.01,dt=0.0001;

    printf("################################################################\n");
    printf("#  ANGLE 4 DEEP DIVE: Wave kernel convolution                  #\n");
    printf("#                                                              #\n");
    printf("#  T_K ≈ Σ_S W(K-S)·E_S, Young: |T_K| ≤ ||W||₁·max E_S    #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Part 1: W(d) universality — is W(d) = T_{S→K}/E_S S-independent? */
    printf("  === Part 1: W(d) = T_{S→K}/E_S at each (S,K) ===\n\n");

    ic_spectral(n_base,0.30,1.0);apply_ic(N);
    nm_g=(int)c3d_get_num_modes();
    buf_set(0,nu);buf_set(1,dt);
    for(int s=0;s<500;s++)c3d_do_step();
    read_state();

    double T_SK[MSH][MSH],E_sh[MSH];
    compute_T_SK(N,T_SK,E_sh);

    printf("  d\\S   ");
    for(int S=1;S<=5;S++) printf("    S=%-4d ",S);
    printf("    mean       std        CV\n  ------");
    for(int S=1;S<=5;S++) printf("  ---------");
    printf("  ---------  ---------  ------\n");

    for(int d=-4;d<=4;d++){
        printf("  %+3d   ",d);
        double vals[10]; int nv=0;
        for(int S=1;S<=5;S++){
            int K=S+d;
            if(K<1||K>N||K>=MSH){printf("  ---------");continue;}
            double w=(E_sh[S]>1e-30)?T_SK[K][S]/E_sh[S]:0;
            vals[nv++]=w;
            printf("  %+9.3e",w);
        }
        /* Mean and std */
        double mean=0,std=0;
        for(int i=0;i<nv;i++) mean+=vals[i]; mean/=nv;
        for(int i=0;i<nv;i++) std+=(vals[i]-mean)*(vals[i]-mean); std=sqrt(std/nv);
        double cv=(fabs(mean)>1e-30)?std/fabs(mean):0;
        printf("  %+9.3e  %9.3e  %6.2f\n",mean,std,cv);
    }
    printf("\n  CV < 0.5: kernel is approximately S-independent at that d.\n");
    printf("  CV > 1.0: kernel varies strongly with S.\n\n");

    /* Part 2: ||W||₁ across configurations */
    printf("  === Part 2: ||W||₁ across configurations ===\n\n");
    printf("  A      α     t       ||W||₁     max_E_S     Young bd   max|T_K|   tightness\n");
    printf("  -----  ----  ------  ---------  ----------  ---------  ---------  ---------\n");
    fflush(stdout);

    double amps[]={0.10,0.20,0.30};
    double alphas[]={0.0,1.0,2.0};
    int steps[]={500,2000};
    double times[]={0.05,0.20};

    for(int ai=0;ai<3;ai++)
    for(int si=0;si<3;si++)
    for(int ti=0;ti<2;ti++){
        ic_spectral(n_base,amps[ai],alphas[si]);apply_ic(N);
        nm_g=(int)c3d_get_num_modes();buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<steps[ti];s++)c3d_do_step();
        read_state();compute_T_SK(N,T_SK,E_sh);

        /* Compute mean W(d) and ||W||₁ */
        double W_l1=0;
        for(int d=-4;d<=4;d++){
            double sum=0;int cnt=0;
            for(int S=1;S<=N&&S<MSH;S++){
                int K=S+d;if(K<1||K>N||K>=MSH)continue;
                if(E_sh[S]>1e-30){sum+=T_SK[K][S]/E_sh[S];cnt++;}
            }
            if(cnt>0) W_l1+=fabs(sum/cnt);
        }

        double max_ES=0,max_TK=0;
        for(int S=1;S<=N;S++)if(E_sh[S]>max_ES)max_ES=E_sh[S];
        for(int K=1;K<=N;K++){
            double tk=0;for(int S=1;S<=N&&S<MSH;S++)tk+=T_SK[K][S];
            if(fabs(tk)>max_TK)max_TK=fabs(tk);
        }

        double young_bd=W_l1*max_ES;
        double tightness=(young_bd>1e-30)?max_TK/young_bd:0;
        printf("  %.2f   %.1f   %.4f  %9.4f  %10.3e  %9.3e  %9.3e  %9.4f\n",
               amps[ai],alphas[si],times[ti],W_l1,max_ES,young_bd,max_TK,tightness);
        fflush(stdout);
    }

    printf("\n");

    /* Part 3: Diffusion comparison via Young's bound */
    printf("  === Part 3: Young's bound vs diffusion at each K ===\n");
    printf("  (A=0.30, α=1, t=0.05)\n\n");

    ic_spectral(n_base,0.30,1.0);apply_ic(N);
    nm_g=(int)c3d_get_num_modes();buf_set(0,nu);buf_set(1,dt);
    for(int s=0;s<500;s++)c3d_do_step();
    read_state();compute_T_SK(N,T_SK,E_sh);

    /* Per-K convolution bound: T_K = Σ_S W_S(K-S)·E_S where W_S is S-specific */
    /* Tighter than global ||W||: use per-K sum */
    printf("  K     |T_K|       Σ|W(K-S)·E_S|  Young global  νK²E_K      |T|/νK²E   Young/νK²E\n");
    printf("  ----  ----------  --------------  ------------  ----------  ---------  ----------\n");
    for(int K=1;K<=N;K++){
        double tk=0,tk_abs=0;
        for(int S=1;S<=N&&S<MSH;S++){
            tk+=T_SK[K][S];
            tk_abs+=fabs(T_SK[K][S]);
        }
        /* Per-K Young: Σ |W(K-S)|·E_S directly */
        double per_k_young=0;
        for(int S=1;S<=N&&S<MSH;S++){
            if(E_sh[S]>1e-30)
                per_k_young+=fabs(T_SK[K][S]/E_sh[S])*E_sh[S];
        }
        /* This is just tk_abs — same thing! */

        double global_young=0.95*1.22; /* ||W||₁ · max E_S from earlier */
        double diff=nu*(double)(K*K)*E_sh[K];
        printf("  %-4d  %10.3e  %14.3e  %12.3e  %10.3e  %9.4f  %10.4f\n",
               K,fabs(tk),tk_abs,global_young,diff,
               (diff>1e-30)?fabs(tk)/diff:0,
               (diff>1e-30)?global_young/diff:0);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  KEY QUESTION: Does ||W||₁ · max E_S < νK²E_K at high K?   #\n");
    printf("#                                                              #\n");
    printf("#  If YES at some K*: diffusion wins above K* via Young.     #\n");
    printf("#  Below K*: the Chebyshev bound (Angle 1) may suffice.      #\n");
    printf("#  Together: Angle 1 at low K + Angle 4 at high K.           #\n");
    printf("################################################################\n");

    return 0;
}
