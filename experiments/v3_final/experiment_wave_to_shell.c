/*
 * experiment_wave_to_shell.c — From R=0.5 per mode to per-shell T_K
 *
 * We know: each mode's forward and backward transfer sums to zero (R=0.5).
 * The per-shell T_K is the SUM of contributions from all modes to shell K.
 *
 * T_K = Σ_{modes p} [contribution of p to shell K]
 *     = Σ_{modes p in lower shells} [their forward wave hitting K]
 *       + Σ_{modes p in shell K} [self-interaction at K]
 *       + Σ_{modes p in higher shells} [their backward wave hitting K]
 *
 * The first term is positive (forward cascade), the third is negative
 * (backscatter from above). The net T_K depends on the balance.
 *
 * This experiment measures:
 *   A. For each target shell K: decompose T_K by SOURCE shell S.
 *      T_K = Σ_S T_{S→K} where T_{S→K} is the total transfer from
 *      modes in shell S to shell K.
 *
 *   B. The "transfer matrix" M_{KS} = T_{S→K} / E_S
 *      (normalised by source shell energy)
 *      If this matrix has bounded entries, the per-shell T_K is bounded
 *      by a linear function of the shell energies.
 *
 *   C. Compare |T_K| with νK²E_K (the diffusion at shell K).
 *      This is the γ < 2 condition: if |T_K| < νK²E_K, diffusion wins.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_wave_to_shell.c \
 *         src/triad_kernel_v3_accessible.c -o build/wave_shell -lm
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
static int bkx_s[MAX_BASE], bky_s[MAX_BASE], bkz_s[MAX_BASE];
static double bux_s[MAX_BASE], buy_s[MAX_BASE], buz_s[MAX_BASE];
static int nbm = 0;

static void ic_distributed(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx_s[i]=(int)c3d_get_kx(i); bky_s[i]=(int)c3d_get_ky(i); bkz_s[i]=(int)c3d_get_kz(i);
        double k2=(double)(bkx_s[i]*bkx_s[i]+bky_s[i]*bky_s[i]+bkz_s[i]*bkz_s[i]);
        double km=sqrt(k2); if(km<0.001)km=1.0;
        double va=amp/km;
        double phase=(double)i*0.7+0.3;
        double ux=va*sin(M_PI*phase), uy=va*sin(M_PI*(phase+0.4)), uz=0.0;
        if(bkz_s[i]!=0) uz=-((double)bkx_s[i]*ux+(double)bky_s[i]*uy)/(double)bkz_s[i];
        else if(bky_s[i]!=0) uy=-(double)bkx_s[i]*ux/(double)bky_s[i];
        else ux=0.0;
        bux_s[i]=ux; buy_s[i]=uy; buz_s[i]=uz;
    }
}

static void apply_ic(int N) {
    int nm=(int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N); c3d_zero_state(nm);
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
    for(int i=0;i<nm_g;i++) if(mkx[i]==kx&&mky[i]==ky&&mkz[i]==kz) return i;
    return -1;
}

static double triad_contrib(int k_idx,int p_idx,int q_idx){
    int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
    int k2=kx*kx+ky*ky+kz*kz;
    double updq_re=ur[p_idx][0]*(double)mkx[q_idx]+ur[p_idx][1]*(double)mky[q_idx]+ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im=ui[p_idx][0]*(double)mkx[q_idx]+ui[p_idx][1]*(double)mky[q_idx]+ui[p_idx][2]*(double)mkz[q_idx];
    double kduq_re=(double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
    double kduq_im=(double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
    double sc_re=kduq_re/(double)k2,sc_im=kduq_im/(double)k2;
    double c=0;
    for(int cc=0;cc<3;cc++){
        double kc=(cc==0)?(double)kx:(cc==1)?(double)ky:(double)kz;
        double pq_re=ur[q_idx][cc]-sc_re*kc, pq_im=ui[q_idx][cc]-sc_im*kc;
        double prod_re=updq_re*pq_re-updq_im*pq_im;
        double prod_im=updq_re*pq_im+updq_im*pq_re;
        c+=ur[k_idx][cc]*prod_im+ui[k_idx][cc]*(-prod_re);
    }
    return c;
}

int main(void){
    int N=8; double amp=0.30,nu=0.01,dt=0.0001; int n_base=3;

    printf("################################################################\n");
    printf("#  SHELL-TO-SHELL TRANSFER MATRIX                              #\n");
    printf("#                                                              #\n");
    printf("#  T_{S→K}: energy transferred from source shell S to target K#\n");
    printf("#  M_{KS} = T_{S→K}/E_S: normalised transfer matrix          #\n");
    printf("#  Compare |T_K| with diffusion νK²E_K                       #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f                                      #\n", N, amp, nu);
    printf("################################################################\n\n");
    fflush(stdout);

    ic_distributed(n_base,amp); apply_ic(N);
    nm_g=(int)c3d_get_num_modes();
    buf_set(0,nu); buf_set(1,dt);
    for(int s=0;s<500;s++) c3d_do_step();

    for(int i=0;i<nm_g&&i<MAX_MODES;i++){
        mkx[i]=(int)c3d_get_kx(i);mky[i]=(int)c3d_get_ky(i);mkz[i]=(int)c3d_get_kz(i);
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i));ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i));ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i));ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }

    int n_max_sq=N*N;

    /* Shell energies */
    double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
    for(int i=0;i<nm_g;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
    }

    /* Transfer matrix T_{S→K} */
    double T_SK[MSH][MSH]; memset(T_SK,0,sizeof(T_SK));

    for(int p_idx=0;p_idx<nm_g;p_idx++){
        int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
        int p2=px*px+py*py+pz*pz;
        int ps=(int)(sqrt((double)p2)+0.5);
        if(ps>=MSH) continue;

        for(int k_idx=0;k_idx<nm_g;k_idx++){
            int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
            int k2=kx*kx+ky*ky+kz*kz;
            int ks=(int)(sqrt((double)k2)+0.5);
            if(ks>=MSH) continue;

            int qx=kx-px,qy=ky-py,qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if(q2<=0||q2>n_max_sq) continue;
            int q_idx=find_mode(qx,qy,qz);
            if(q_idx<0) continue;

            T_SK[ks][ps] += triad_contrib(k_idx,p_idx,q_idx);
        }
    }

    /* Print raw transfer matrix */
    printf("  === Raw transfer matrix T_{S→K} ===\n");
    printf("  (rows = target K, columns = source S)\n\n");
    printf("  K\\S   ");
    for(int S=1;S<=N;S++) printf("    S=%-4d ",S);
    printf("    T_K(sum)    νK²E_K      |T_K|/νK²E_K\n");
    printf("  ------");
    for(int S=1;S<=N;S++) printf("  ----------");
    printf("  ----------  ----------  ------------\n");

    for(int K=1;K<=N;K++){
        printf("  K=%-4d",K);
        double T_K_sum=0;
        for(int S=1;S<=N;S++){
            printf("  %+10.3e",T_SK[K][S]);
            T_K_sum+=T_SK[K][S];
        }
        double diffusion=nu*(double)(K*K)*E_sh[K];
        double ratio=(diffusion>1e-30)?fabs(T_K_sum)/diffusion:0;
        printf("  %+10.3e  %10.3e  %12.4f\n",T_K_sum,diffusion,ratio);
    }

    printf("\n");

    /* Normalised transfer matrix M_{KS} = T_{S→K}/E_S */
    printf("  === Normalised transfer matrix M_{KS} = T_{S→K}/E_S ===\n\n");
    printf("  K\\S   ");
    for(int S=1;S<=N;S++) printf("    S=%-4d ",S);
    printf("\n  ------");
    for(int S=1;S<=N;S++) printf("  ----------");
    printf("\n");

    double max_M=0;
    for(int K=1;K<=N;K++){
        printf("  K=%-4d",K);
        for(int S=1;S<=N;S++){
            double M=(E_sh[S]>1e-30)?T_SK[K][S]/E_sh[S]:0;
            printf("  %+10.3e",M);
            if(fabs(M)>max_M) max_M=fabs(M);
        }
        printf("\n");
    }

    printf("\n  Max |M_{KS}| = %.4e\n", max_M);

    /* Check column sums (should be zero — energy conservation per source) */
    printf("\n  === Column sums (Σ_K T_{S→K} — should be 0 per source S) ===\n\n  ");
    for(int S=1;S<=N;S++){
        double cs=0;
        for(int K=1;K<=N;K++) cs+=T_SK[K][S];
        printf("  S=%d: %+.2e",S,cs);
    }
    printf("\n");

    /* Check row sums (T_K — the actual per-shell transfer) */
    printf("\n  === Row sums (T_K = Σ_S T_{S→K} — the per-shell transfer) ===\n\n");
    printf("  K     T_K          νK²E_K      |T_K|/(νK²E_K)  diffusion wins?\n");
    printf("  ----  ----------   ----------   --------------  ---------------\n");
    for(int K=1;K<=N;K++){
        double T_K=0;
        for(int S=1;S<=N;S++) T_K+=T_SK[K][S];
        double diff=nu*(double)(K*K)*E_sh[K];
        double ratio=(diff>1e-30)?fabs(T_K)/diff:0;
        printf("  %-4d  %+10.3e   %10.3e   %14.4f  %s\n",
               K,T_K,diff,ratio,ratio<1.0?"YES":"no");
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  Column sums = 0: energy conservation per source (R=0.5).   #\n");
    printf("#  |T_K|/(νK²E_K) < 1 at high K: diffusion wins.            #\n");
    printf("#  This is the γ < 2 condition stated in terms of the         #\n");
    printf("#  transfer matrix.                                            #\n");
    printf("################################################################\n");

    return 0;
}
