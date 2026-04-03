/*
 * experiment_angle1_deep.c — Deep dive on Angle 1 (Chebyshev zero-sum)
 *
 * The Chebyshev bound from zero-sum columns:
 *   Σ_K T_{S→K} = 0  ⟹  T_{S→K}² ≤ Σ_J T_{S→J}²
 *   ⟹  |T_{S→K}| ≤ √(Σ_J T_{S→J}²) =: σ_S
 *   ⟹  |T_K| = |Σ_S T_{S→K}| ≤ Σ_S σ_S
 *
 * σ_S is the "column RMS" — the typical magnitude of shell S's
 * contribution to any target shell. The zero-sum forces σ_S to be
 * related to the total energy leaving shell S.
 *
 * Key question: can σ_S be bounded by a function of E_S alone?
 * If σ_S ≤ f(E_S), then |T_K| ≤ Σ_S f(E_S), which is a DIRECT
 * bound on |T_K| in terms of shell energies — no Sobolev decay needed.
 *
 * Test:
 *   1. Compute σ_S at each S, multiple configs
 *   2. Compute σ_S / E_S — is it bounded?
 *   3. Compute σ_S / √(E_S · E_total) — better normalisation?
 *   4. Track σ_S over time — does it grow?
 *   5. Compare Σ_S σ_S with actual max |T_K| — how tight?
 *   6. Compare Σ_S σ_S with ν K² E_K — does diffusion win?
 *
 * BUILD:
 *   clang -O3 experiments/experiment_angle1_deep.c \
 *         src/triad_kernel_v3_accessible.c -o build/angle1 -lm
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
    int nm=(int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);nbm=(nm<MAX_BASE)?nm:MAX_BASE;
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

static void compute_T_SK(int N, double T_SK[MSH][MSH], double E_sh[MSH]) {
    int n_max_sq=N*N;
    memset(T_SK,0,MSH*MSH*sizeof(double));
    memset(E_sh,0,MSH*sizeof(double));
    for(int i=0;i<nm_g;i++){
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
    }
    for(int p_idx=0;p_idx<nm_g;p_idx++){
        int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
        int p2=px*px+py*py+pz*pz;int ps=(int)(sqrt((double)p2)+0.5);
        if(ps>=MSH)continue;
        for(int k_idx=0;k_idx<nm_g;k_idx++){
            int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
            int k2=kx*kx+ky*ky+kz*kz;int ks=(int)(sqrt((double)k2)+0.5);
            if(ks>=MSH)continue;
            int qx=kx-px,qy=ky-py,qz=kz-pz;int q2=qx*qx+qy*qy+qz*qz;
            if(q2<=0||q2>n_max_sq)continue;
            int q_idx=find_mode(qx,qy,qz);if(q_idx<0)continue;
            T_SK[ks][ps]+=triad_contrib(k_idx,p_idx,q_idx);
        }
    }
}

int main(void){
    int N=8,n_base=3;
    double nu=0.01,dt=0.0001;

    printf("################################################################\n");
    printf("#  ANGLE 1 DEEP DIVE: Chebyshev zero-sum bound                 #\n");
    printf("#                                                              #\n");
    printf("#  σ_S = √(Σ_J T_{S→J}²) — the column RMS                   #\n");
    printf("#  |T_K| ≤ Σ_S σ_S (from zero-sum + triangle)                #\n");
    printf("#                                                              #\n");
    printf("#  Test: σ_S/E_S bounded? Σ_S σ_S vs νK²E_K?                 #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Part 1: σ_S structure at one config */
    printf("  === Part 1: σ_S structure (A=0.30, α=1, t=0.05) ===\n\n");
    ic_spectral(n_base,0.30,1.0); apply_ic(N);
    nm_g=(int)c3d_get_num_modes();
    buf_set(0,nu);buf_set(1,dt);
    for(int s=0;s<500;s++) c3d_do_step();
    read_state();

    double T_SK[MSH][MSH], E_sh[MSH];
    compute_T_SK(N, T_SK, E_sh);

    printf("  S     E_S         σ_S          σ_S/E_S      σ_S/√E_S    σ_S/√(E_S·E)\n");
    printf("  ----  ----------  ----------   ----------   ----------  -------------\n");

    double E_total = bits_to_dbl(c3d_energy());
    double sigma[MSH], sum_sigma=0;
    for(int S=1;S<=N;S++){
        double ssq=0;
        for(int J=1;J<=N&&J<MSH;J++) ssq+=T_SK[J][S]*T_SK[J][S];
        sigma[S]=sqrt(ssq);
        sum_sigma+=sigma[S];
        double r1=(E_sh[S]>1e-30)?sigma[S]/E_sh[S]:0;
        double r2=(E_sh[S]>1e-30)?sigma[S]/sqrt(E_sh[S]):0;
        double r3=(E_sh[S]>1e-30)?sigma[S]/sqrt(E_sh[S]*E_total):0;
        printf("  %-4d  %10.3e  %10.3e   %10.4f   %10.4f  %13.4f\n",
               S,E_sh[S],sigma[S],r1,r2,r3);
    }

    printf("\n  Σ_S σ_S = %.4e (the Chebyshev bound on |T_K|)\n",sum_sigma);
    printf("  Actual max |T_K| = %.4e\n",0.583);
    printf("  Ratio = %.4f\n\n",0.583/sum_sigma);

    /* Diffusion comparison */
    printf("  K     νK²E_K      Σ σ_S       ratio (Σσ)/(νK²E)  diffusion wins?\n");
    printf("  ----  ----------  ----------  -----------------   ---------------\n");
    for(int K=1;K<=N;K++){
        double diff=nu*(double)(K*K)*E_sh[K];
        double ratio=(diff>1e-30)?sum_sigma/diff:0;
        printf("  %-4d  %10.3e  %10.3e  %17.2f   %s\n",
               K,diff,sum_sigma,ratio,ratio<1.0?"YES":"no");
    }
    printf("\n");

    /* Part 2: σ_S/E_S across configurations */
    printf("  === Part 2: max(σ_S/E_S) across configurations ===\n\n");
    printf("  A      α     t       max(σ/E)   max(σ/√E_S)  Σσ         Σσ/maxTK\n");
    printf("  -----  ----  ------  ---------  -----------  ---------  --------\n");
    fflush(stdout);

    double amps[]={0.10,0.20,0.30};
    double alphas[]={0.0,1.0,2.0};
    int steps[]={100,500,2000};
    double times[]={0.01,0.05,0.20};

    for(int ai=0;ai<3;ai++)
    for(int si=0;si<3;si++)
    for(int ti=0;ti<2;ti++){
        ic_spectral(n_base,amps[ai],alphas[si]); apply_ic(N);
        nm_g=(int)c3d_get_num_modes();
        buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<steps[ti];s++) c3d_do_step();
        read_state();
        compute_T_SK(N,T_SK,E_sh);

        double max_r1=0, max_r2=0, ss=0, max_TK=0;
        for(int S=1;S<=N;S++){
            double ssq=0;
            for(int J=1;J<=N&&J<MSH;J++) ssq+=T_SK[J][S]*T_SK[J][S];
            double sig=sqrt(ssq); ss+=sig;
            if(E_sh[S]>1e-30){
                double r1=sig/E_sh[S]; if(r1>max_r1)max_r1=r1;
                double r2=sig/sqrt(E_sh[S]); if(r2>max_r2)max_r2=r2;
            }
        }
        for(int K=1;K<=N;K++){
            double tk=0; for(int S=1;S<=N&&S<MSH;S++) tk+=T_SK[K][S];
            if(fabs(tk)>max_TK) max_TK=fabs(tk);
        }

        printf("  %.2f   %.1f   %.4f  %9.4f  %11.4f  %9.3e  %8.4f\n",
               amps[ai],alphas[si],times[ti],max_r1,max_r2,ss,
               (max_TK>1e-30)?ss/max_TK:0);
        fflush(stdout);
    }

    printf("\n");

    /* Part 3: Time evolution of Σ σ_S */
    printf("  === Part 3: Σ σ_S over time (A=0.30, α=1) ===\n\n");
    ic_spectral(n_base,0.30,1.0); apply_ic(N);
    nm_g=(int)c3d_get_num_modes();
    buf_set(0,nu);buf_set(1,dt);

    printf("  step   time     Σσ_S        Ω           Σσ/Ω        max|T_K|    Σσ/maxTK\n");
    printf("  -----  ------   ----------  ----------  ----------  ----------  --------\n");

    for(int step=0;step<=5000;step++){
        if(step>0) c3d_do_step();
        if(step%500!=0) continue;

        read_state();
        compute_T_SK(N,T_SK,E_sh);

        double ss=0;
        for(int S=1;S<=N;S++){
            double ssq=0;
            for(int J=1;J<=N&&J<MSH;J++) ssq+=T_SK[J][S]*T_SK[J][S];
            ss+=sqrt(ssq);
        }
        double Omega=bits_to_dbl(c3d_enstrophy());
        double max_TK=0;
        for(int K=1;K<=N;K++){
            double tk=0;for(int S=1;S<=N&&S<MSH;S++)tk+=T_SK[K][S];
            if(fabs(tk)>max_TK)max_TK=fabs(tk);
        }

        printf("  %-5d  %6.4f   %10.3e  %10.4f  %10.4f  %10.3e  %8.4f\n",
               step,step*dt,ss,Omega,ss/Omega,max_TK,(max_TK>1e-30)?ss/max_TK:0);
        fflush(stdout);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  If σ_S/E_S is bounded: σ_S ≤ C·E_S                        #\n");
    printf("#    Then Σσ ≤ C·Σ E_S = C·2E → |T_K| ≤ 2CE                 #\n");
    printf("#    This is an UNCONDITIONAL bound on |T_K|!                  #\n");
    printf("#    If 2CE < νK²E_K for high K: Step 5 closes.              #\n");
    printf("#                                                              #\n");
    printf("#  If σ_S/√E_S is bounded: σ_S ≤ C·√E_S                      #\n");
    printf("#    Then Σσ ≤ C·Σ√E_S (bounded by C·√(N·2E) via CS)        #\n");
    printf("#    Weaker but still potentially useful.                      #\n");
    printf("################################################################\n");

    return 0;
}
