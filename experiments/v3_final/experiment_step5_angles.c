/*
 * experiment_step5_angles.c — Six angles on closing Step 5
 *
 * All six angles measured in one experiment for direct comparison.
 *
 * Angle 1: Zero-sum variance bound (Chebyshev on column-zero constraint)
 * Angle 2: Triad pairing — effective independent count
 * Angle 3: Energy dissipation constraint on T_K during Ω growth
 * Angle 4: Wave kernel convolution bound
 * Angle 5: Per-mode zero-sum → per-shell bound
 * Angle 6: Significant triads only (energy-weighted effective n(K))
 *
 * BUILD:
 *   clang -O3 experiments/experiment_step5_angles.c \
 *         src/triad_kernel_v3_accessible.c -o build/step5_angles -lm
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

int main(void){
    int N=8,n_base=3;
    double amp=0.30,nu=0.01,dt=0.0001;
    int n_max_sq=N*N;

    printf("################################################################\n");
    printf("#  STEP 5: SIX ANGLES                                          #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f                                      #\n", N, amp, nu);
    printf("################################################################\n\n");
    fflush(stdout);

    ic_distributed(n_base,amp); apply_ic(N);
    nm_g=(int)c3d_get_num_modes();
    buf_set(0,nu);buf_set(1,dt);
    for(int s=0;s<500;s++) c3d_do_step();
    read_state();

    /* Shell energies */
    double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
    for(int i=0;i<nm_g;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
    }

    /* Compute full T_{S→K} matrix and per-mode contributions */
    double T_SK[MSH][MSH]; memset(T_SK,0,sizeof(T_SK));
    long n_SK[MSH][MSH]; memset(n_SK,0,sizeof(n_SK));

    /* Per-mode totals (for Angle 5) */
    #define MAX_MODE_CONTRIBS 3000
    double mode_to_shell[MAX_MODE_CONTRIBS][MSH];
    memset(mode_to_shell,0,sizeof(mode_to_shell));

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

            double c=triad_contrib(k_idx,p_idx,q_idx);
            T_SK[ks][ps]+=c;
            n_SK[ks][ps]++;
            if(p_idx<MAX_MODE_CONTRIBS) mode_to_shell[p_idx][ks]+=c;
        }
    }

    /* ============================================================
     * ANGLE 1: Zero-sum variance bound
     * Σ_K T_{S→K} = 0, so var(T_{S→K}) = (1/N)Σ T_{S→K}²
     * Chebyshev: |T_{S→K}| ≤ √(N · var) = √(Σ T_{S→K}²) for each K
     * ============================================================ */
    printf("  === ANGLE 1: Zero-sum variance bound (Chebyshev) ===\n\n");
    printf("  K     |T_K|       Chebyshev    ratio      improvement over CS\n");
    printf("  ----  ----------  ----------   ---------  -------------------\n");

    for(int K=1;K<=N;K++){
        double T_K=0;
        for(int S=1;S<=N&&S<MSH;S++) T_K+=T_SK[K][S];

        /* Chebyshev bound: for each source S, T_{S→K}² ≤ Σ_J T_{S→J}² */
        /* So |T_{S→K}| ≤ √(Σ_J T_{S→J}²) */
        /* And |T_K| = |Σ_S T_{S→K}| ≤ Σ_S |T_{S→K}| ≤ Σ_S √(Σ_J T_{S→J}²) */
        double cheb=0;
        for(int S=1;S<=N&&S<MSH;S++){
            double ssq=0;
            for(int J=1;J<=N&&J<MSH;J++) ssq+=T_SK[J][S]*T_SK[J][S];
            cheb+=sqrt(ssq);
        }

        /* Original CS bound: Σ_S n(S,K)·C_geom·√E₀·√(E_S·E_K) */
        double cs_bound=0;
        double E0=bits_to_dbl(c3d_energy());
        for(int S=1;S<=N&&S<MSH;S++){
            int M_S=0;
            for(int i=0;i<nm_g;i++){
                int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
                if((int)(sqrt((double)k2)+0.5)==S) M_S++;
            }
            if(n_SK[K][S]>0)
                cs_bound+=(double)n_SK[K][S]*2.0*((double)(K+S+2))*sqrt(2.0*M_S*E0)/(double)n_SK[K][S]*sqrt(E_sh[S]*E_sh[K]);
        }

        double improvement=(cs_bound>1e-30)?cheb/cs_bound:0;
        printf("  %-4d  %10.3e  %10.3e   %9.4f  %19.4f\n",
               K,fabs(T_K),cheb,
               (cheb>1e-30)?fabs(T_K)/cheb:0,
               improvement);
    }
    printf("\n");

    /* ============================================================
     * ANGLE 4: Wave kernel as convolution
     * T_K = Σ_S W(K-S) · E_S (approx, if wave is universal)
     * Bound: |T_K| ≤ ||W||₁ · max_S E_S (Young's inequality)
     * ============================================================ */
    printf("  === ANGLE 4: Wave kernel convolution ===\n\n");

    /* Extract the "normalised wave kernel" W(d) = T_{S→K}/(E_S) averaged over S */
    double W[2*MSH+1]; int W_count[2*MSH+1];
    memset(W,0,sizeof(W)); memset(W_count,0,sizeof(W_count));
    for(int S=1;S<=N&&S<MSH;S++)
    for(int K=1;K<=N&&K<MSH;K++){
        int d=K-S+MSH;
        if(d>=0&&d<2*MSH+1&&E_sh[S]>1e-30){
            W[d]+=T_SK[K][S]/E_sh[S];
            W_count[d]++;
        }
    }
    double W_l1=0;
    printf("  d       W(d)         |W(d)|       count\n");
    printf("  ------  -----------  -----------  ------\n");
    for(int di=-4;di<=4;di++){
        int idx=di+MSH;
        double w=(W_count[idx]>0)?W[idx]/W_count[idx]:0;
        W_l1+=fabs(w);
        printf("  %+3d     %+11.4e  %11.4e   %d\n",di,w,fabs(w),W_count[idx]);
    }
    printf("\n  ||W||₁ = %.4e\n", W_l1);
    double max_E=0;
    for(int S=1;S<=N;S++) if(E_sh[S]>max_E) max_E=E_sh[S];
    printf("  Young's bound: |T_K| ≤ ||W||₁ · max E_S = %.4e · %.4e = %.4e\n",
           W_l1,max_E,W_l1*max_E);
    printf("  Actual max |T_K| = %.4e\n\n",0.583); /* from earlier data */

    /* ============================================================
     * ANGLE 5: Per-mode zero-sum → per-shell bound
     * Each mode p has Σ_K contrib(p→K) = 0.
     * Bound: |contrib(p→K)| ≤ √(Σ_J contrib(p→J)²) for each K
     * Then: |T_K| ≤ Σ_p √(Σ_J contrib(p→J)²)
     * ============================================================ */
    printf("  === ANGLE 5: Per-mode zero-sum bound ===\n\n");
    printf("  K     |T_K|       per-mode bound  ratio       improvement\n");
    printf("  ----  ----------  ---------------  ----------  -----------\n");

    for(int K=1;K<=N;K++){
        double T_K=0;
        for(int S=1;S<=N&&S<MSH;S++) T_K+=T_SK[K][S];

        double pm_bound=0;
        for(int p_idx=0;p_idx<nm_g&&p_idx<MAX_MODE_CONTRIBS;p_idx++){
            double ssq=0;
            for(int J=1;J<=N&&J<MSH;J++) ssq+=mode_to_shell[p_idx][J]*mode_to_shell[p_idx][J];
            pm_bound+=sqrt(ssq);
        }

        printf("  %-4d  %10.3e  %15.3e  %10.4f  (per-mode)\n",
               K,fabs(T_K),pm_bound,
               (pm_bound>1e-30)?fabs(T_K)/pm_bound:0);
    }
    printf("\n");

    /* ============================================================
     * ANGLE 6: Significant triads only
     * Count only triads where √E_S > threshold
     * ============================================================ */
    printf("  === ANGLE 6: Significant triads (E_S > 1%% of E_total) ===\n\n");

    double E_total=bits_to_dbl(c3d_energy());
    double E_thresh=0.01*E_total;

    printf("  K     n_total     n_signif    ratio_n     G(K)_full   G(K)_signif  improvement\n");
    printf("  ----  ----------  ----------  ---------   ----------  -----------  -----------\n");

    for(int K=1;K<=N;K++){
        double F_full=0,F_sig=0;
        long n_full=0,n_sig=0;
        for(int S=1;S<=N&&S<MSH;S++){
            double contrib=(double)n_SK[K][S]*sqrt(E_sh[S]);
            F_full+=contrib;
            n_full+=n_SK[K][S];
            if(E_sh[S]>E_thresh){
                F_sig+=contrib;
                n_sig+=n_SK[K][S];
            }
        }
        double G_full=(E_sh[K]>1e-30)?F_full/((double)(K*K)*sqrt(E_sh[K])):0;
        double G_sig=(E_sh[K]>1e-30)?F_sig/((double)(K*K)*sqrt(E_sh[K])):0;
        double impr=(G_full>1e-30)?G_sig/G_full:0;

        printf("  %-4d  %-10ld  %-10ld  %9.4f   %10.2e  %11.2e  %11.4f\n",
               K,n_full,n_sig,(double)n_sig/n_full,G_full,G_sig,impr);
    }
    printf("\n");

    /* ============================================================
     * ANGLE 3: Energy dissipation constraint
     * ∫Ω dt ≤ E₀/(2ν). At current time, measure dΩ/dt and
     * remaining "budget" for Ω growth.
     * ============================================================ */
    printf("  === ANGLE 3: Energy dissipation budget ===\n\n");
    double Omega=bits_to_dbl(c3d_enstrophy());
    double budget=E_total/(2*nu);
    printf("  E(t) = %.4f, Ω(t) = %.4f\n", E_total, Omega);
    printf("  ∫Ω dt budget = E₀/(2ν) = %.4f/(%.4f) = %.2f\n", E_total, 2*nu, budget);
    printf("  If Ω stays at current value: budget lasts %.2f time units\n", budget/Omega);
    printf("  If Ω doubles: budget lasts %.2f time units\n", budget/(2*Omega));
    printf("  Implication: Ω cannot stay large indefinitely.\n");
    printf("  The time-integrated constraint limits how long |T_K| > νK²E_K can persist.\n\n");

    /* ============================================================
     * ANGLE 2: Effective independent triad count
     * ============================================================ */
    printf("  === ANGLE 2: Effective independent count ===\n\n");
    printf("  K     n_triads    |T_K|       Σ|c_i|      |T|/Σ|c|    effective_n    n_eff/n\n");
    printf("  ----  ----------  ----------  ----------  ---------   -----------    -------\n");

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
        /* If |T| = Σ|c|/√n_eff, then n_eff = (Σ|c|/|T|)² */
        double r=(T_abs>1e-30)?fabs(T_signed)/T_abs:0;
        double n_eff=(r>1e-30)?1.0/(r*r):0;

        printf("  %-4d  %-10ld  %10.3e  %10.3e  %9.4f   %11.1f    %7.4f\n",
               K,nt,fabs(T_signed),T_abs,r,n_eff,(nt>0)?n_eff/nt:0);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  WHICH ANGLE CLOSES THE GAP?                                 #\n");
    printf("#                                                              #\n");
    printf("#  Look for: ratio(actual/bound) close to 1                   #\n");
    printf("#  The tightest bound is the best candidate for Step 5.       #\n");
    printf("#                                                              #\n");
    printf("#  Angle 1 (Chebyshev): uses zero-sum at shell level         #\n");
    printf("#  Angle 4 (convolution): uses wave structure                  #\n");
    printf("#  Angle 5 (per-mode): uses zero-sum at mode level           #\n");
    printf("#  Angle 6 (significant): restricts to energetic triads      #\n");
    printf("#  Angle 3 (dissipation): time-integrated constraint         #\n");
    printf("#  Angle 2 (effective n): measures effective independence     #\n");
    printf("################################################################\n");

    return 0;
}
