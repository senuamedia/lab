/*
 * experiment_triad_geometry.c — Separate geometry from dynamics
 *
 * Compute:
 *   n(S,K): number of triads with source mode in shell S, target in shell K
 *           This is PURELY GEOMETRIC — depends only on Z³ and N, not on û.
 *
 *   c̄(S,K) = T_{S→K} / n(S,K): average per-triad contribution
 *           This depends on the flow state.
 *
 *   Test: does c̄(S,K) = E_S · g(K-S) for some function g?
 *         If so, g(d) is the "transfer kernel" — the fundamental function.
 *         And Σ_K n(S,K) · g(K-S) = 0 constrains g.
 *
 * Also compute n(S,K) at N=6 and N=8 to check if the geometric
 * structure is N-independent (it should be for interior shells).
 *
 * BUILD:
 *   clang -O3 experiments/experiment_triad_geometry.c \
 *         src/triad_kernel_v3_accessible.c -o build/triad_geom -lm
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
static int bkx_s[MAX_BASE], bky_s[MAX_BASE], bkz_s[MAX_BASE];
static double bux_s[MAX_BASE], buy_s[MAX_BASE], buz_s[MAX_BASE];
static int nbm = 0;

static void ic_distributed(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx_s[i]=(int)c3d_get_kx(i);bky_s[i]=(int)c3d_get_ky(i);bkz_s[i]=(int)c3d_get_kz(i);
        double k2=(double)(bkx_s[i]*bkx_s[i]+bky_s[i]*bky_s[i]+bkz_s[i]*bkz_s[i]);
        double km=sqrt(k2);if(km<0.001)km=1.0;
        double va=amp/km, phase=(double)i*0.7+0.3;
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
        double pr=updq_re*pq_re-updq_im*pq_im,pi=updq_re*pq_im+updq_im*pq_re;
        c+=ur[k_idx][cc]*pi+ui[k_idx][cc]*(-pr);
    }
    return c;
}

int main(void){
    int n_base=3; double amp=0.30,nu=0.01,dt=0.0001;

    printf("################################################################\n");
    printf("#  TRIAD GEOMETRY: Separate n(S,K) from c̄(S,K)                #\n");
    printf("#                                                              #\n");
    printf("#  n(S,K): purely geometric (lattice + constraints)            #\n");
    printf("#  c̄(S,K) = T_{S→K}/n(S,K): flow-dependent average           #\n");
    printf("#  g(d) = c̄(S,K)/E_S: the transfer kernel (if universal)     #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Part 1: Compute n(S,K) at N=8 — pure geometry, no flow state needed */
    int Ns[] = {6, 8};
    for (int ni = 0; ni < 2; ni++) {
        int N = Ns[ni];
        int nm = (int)c3d_enumerate_modes(N);
        c3d_precompute_triads(N);
        int n_max_sq = N*N;

        int lkx[MAX_MODES],lky[MAX_MODES],lkz[MAX_MODES];
        for(int i=0;i<nm&&i<MAX_MODES;i++){
            lkx[i]=(int)c3d_get_kx(i);lky[i]=(int)c3d_get_ky(i);lkz[i]=(int)c3d_get_kz(i);
        }

        long n_SK[MSH][MSH]; memset(n_SK,0,sizeof(n_SK));

        for(int p_idx=0;p_idx<nm;p_idx++){
            int px=lkx[p_idx],py=lky[p_idx],pz=lkz[p_idx];
            int p2=px*px+py*py+pz*pz;
            int ps=(int)(sqrt((double)p2)+0.5);
            if(ps>=MSH) continue;

            for(int k_idx=0;k_idx<nm;k_idx++){
                int kx=lkx[k_idx],ky=lky[k_idx],kz=lkz[k_idx];
                int k2=kx*kx+ky*ky+kz*kz;
                int ks=(int)(sqrt((double)k2)+0.5);
                if(ks>=MSH) continue;

                int qx=kx-px,qy=ky-py,qz=kz-pz;
                int q2=qx*qx+qy*qy+qz*qz;
                if(q2<=0||q2>n_max_sq) continue;

                /* Check q is in mode set */
                int found=0;
                for(int qi=0;qi<nm;qi++){
                    if(lkx[qi]==qx&&lky[qi]==qy&&lkz[qi]==qz){found=1;break;}
                }
                if(found) n_SK[ks][ps]++;
            }
        }

        printf("  === Geometric triad count n(S,K) at N=%d ===\n\n", N);
        printf("  K\\S   ");
        for(int S=1;S<=N&&S<MSH;S++) printf("  S=%-6d",S);
        printf("\n  ------");
        for(int S=1;S<=N&&S<MSH;S++) printf("  --------");
        printf("\n");
        for(int K=1;K<=N&&K<MSH;K++){
            printf("  K=%-4d",K);
            for(int S=1;S<=N&&S<MSH;S++) printf("  %-8ld",n_SK[K][S]);
            printf("\n");
        }
        printf("\n");
    }

    /* Part 2: Compute T_{S→K}, c̄(S,K), and g(d) at N=8 with flow */
    {
        int N=8;
        ic_distributed(n_base,amp); apply_ic(N);
        nm_g=(int)c3d_get_num_modes();
        buf_set(0,nu);buf_set(1,dt);
        for(int s=0;s<500;s++) c3d_do_step();

        for(int i=0;i<nm_g&&i<MAX_MODES;i++){
            mkx[i]=(int)c3d_get_kx(i);mky[i]=(int)c3d_get_ky(i);mkz[i]=(int)c3d_get_kz(i);
            ur[i][0]=bits_to_dbl(c3d_get_state_ux(i));ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
            ur[i][1]=bits_to_dbl(c3d_get_state_uy(i));ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
            ur[i][2]=bits_to_dbl(c3d_get_state_uz(i));ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
        }

        int n_max_sq=N*N;

        double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
        for(int i=0;i<nm_g;i++){
            int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
            int sh=(int)(sqrt((double)k2)+0.5);
            if(sh<MSH){double e=0;for(int c=0;c<3;c++)e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];E_sh[sh]+=0.5*e;}
        }

        double T_SK[MSH][MSH]; memset(T_SK,0,sizeof(T_SK));
        long n_SK[MSH][MSH]; memset(n_SK,0,sizeof(n_SK));

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
                n_SK[ks][ps]++;
            }
        }

        /* c̄(S,K) = T_{S→K}/n(S,K) */
        printf("  === Average per-triad contribution c̄(S,K) = T_{S→K}/n(S,K) ===\n\n");
        printf("  K\\S   ");
        for(int S=1;S<=N&&S<MSH;S++) printf("    S=%-6d  ",S);
        printf("\n  ------");
        for(int S=1;S<=N&&S<MSH;S++) printf("  -----------");
        printf("\n");
        for(int K=1;K<=N&&K<MSH;K++){
            printf("  K=%-4d",K);
            for(int S=1;S<=N&&S<MSH;S++){
                double cbar=(n_SK[K][S]>0)?T_SK[K][S]/n_SK[K][S]:0;
                printf("  %+11.3e",cbar);
            }
            printf("\n");
        }
        printf("\n");

        /* g(d) = c̄(S,K)/E_S — the transfer kernel normalised by source energy */
        printf("  === Transfer kernel g(d) = c̄(S,K)/E_S ===\n");
        printf("  (Should be universal if c̄ = E_S · g(K-S))\n\n");
        printf("  d=K-S  S=1         S=2         S=3         S=4         S=5         mean g(d)\n");
        printf("  ------  ----------  ----------  ----------  ----------  ----------  ----------\n");

        for(int d=-4;d<=4;d++){
            printf("  %+3d    ",d);
            double sum_g=0; int ng=0;
            for(int S=1;S<=5&&S<MSH;S++){
                int K=S+d;
                if(K<1||K>N||K>=MSH){printf("  ----------");continue;}
                double cbar=(n_SK[K][S]>0)?T_SK[K][S]/n_SK[K][S]:0;
                double g=(E_sh[S]>1e-30)?cbar/E_sh[S]:0;
                printf("  %+10.3e",g);
                sum_g+=g; ng++;
            }
            double mean_g=(ng>0)?sum_g/ng:0;
            printf("  %+10.3e\n",mean_g);
        }
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  If g(d) is approximately constant across S for each d:      #\n");
    printf("#    → c̄(S,K) = E_S · g(K-S) is the transfer kernel.        #\n");
    printf("#    → T_{S→K} = n(S,K) · E_S · g(K-S).                     #\n");
    printf("#    → T_K = Σ_S n(S,K) · E_S · g(K-S).                     #\n");
    printf("#    → With Σ_K n(S,K)·g(K-S) = 0 (energy conservation):    #\n");
    printf("#      the transfer is a CONVOLUTION of g with n·E.           #\n");
    printf("#    → This is analytically tractable.                         #\n");
    printf("################################################################\n");

    return 0;
}
