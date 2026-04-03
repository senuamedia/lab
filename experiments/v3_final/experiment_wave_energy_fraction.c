/*
 * experiment_wave_energy_fraction.c — Is the wave a fixed fraction of shell energy?
 *
 * For each source shell S, measure:
 *   1. The shell energy E_S
 *   2. The total outgoing wave amplitude: |T(d=0)| + |T(d=-1)| + |T(d=-2)|
 *      (the negative lobe — energy leaving shell S)
 *   3. The total incoming wave amplitude: T(d=+1) + T(d=+2) + T(d=+3)
 *      (the positive lobe — energy arriving from S to higher shells)
 *   4. The ratio: outgoing/E_S and incoming/E_S
 *
 * If the ratio is constant: the wave carries a FIXED FRACTION of shell energy.
 * If the ratio depends on K: the fraction is scale-dependent.
 *
 * Also measure:
 *   - The ratio of reflected (negative lobe) to transmitted (positive lobe)
 *     This is the "reflection coefficient" of the shell barrier.
 *   - How does the reflection coefficient depend on K?
 *
 * BUILD:
 *   clang -O3 experiments/experiment_wave_energy_fraction.c \
 *         src/triad_kernel_v3_accessible.c -o build/wave_frac -lm
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
        bkx_s[i] = (int)c3d_get_kx(i); bky_s[i] = (int)c3d_get_ky(i); bkz_s[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx_s[i]*bkx_s[i]+bky_s[i]*bky_s[i]+bkz_s[i]*bkz_s[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (bkz_s[i] != 0) uz = -((double)bkx_s[i]*ux+(double)bky_s[i]*uy)/(double)bkz_s[i];
        else if (bky_s[i] != 0) uy = -(double)bkx_s[i]*ux/(double)bky_s[i];
        else ux = 0.0;
        bux_s[i] = ux; buy_s[i] = uy; buz_s[i] = uz;
    }
}

static void apply_ic(int N) {
    int nm = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        for (int j = 0; j < nbm; j++) {
            if (bkx_s[j]==kx && bky_s[j]==ky && bkz_s[j]==kz) {
                buf_set(0,(double)i); buf_set(1,bux_s[j]); buf_set(2,buy_s[j]); buf_set(3,buz_s[j]);
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

#define MAX_MODES 3000
#define MSH 12

static int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
static double ur[MAX_MODES][3], ui[MAX_MODES][3];
static int nm_g;

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < nm_g; i++)
        if (mkx[i]==kx && mky[i]==ky && mkz[i]==kz) return i;
    return -1;
}

static double triad_contrib(int k_idx, int p_idx, int q_idx) {
    int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
    int k2=kx*kx+ky*ky+kz*kz;
    double updq_re=ur[p_idx][0]*(double)mkx[q_idx]+ur[p_idx][1]*(double)mky[q_idx]+ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im=ui[p_idx][0]*(double)mkx[q_idx]+ui[p_idx][1]*(double)mky[q_idx]+ui[p_idx][2]*(double)mkz[q_idx];
    double kduq_re=(double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
    double kduq_im=(double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
    double sc_re=kduq_re/(double)k2, sc_im=kduq_im/(double)k2;
    double contrib=0;
    for (int c=0;c<3;c++) {
        double kc=(c==0)?(double)kx:(c==1)?(double)ky:(double)kz;
        double pq_re=ur[q_idx][c]-sc_re*kc, pq_im=ui[q_idx][c]-sc_im*kc;
        double prod_re=updq_re*pq_re-updq_im*pq_im;
        double prod_im=updq_re*pq_im+updq_im*pq_re;
        contrib += ur[k_idx][c]*prod_im + ui[k_idx][c]*(-prod_re);
    }
    return contrib;
}

static void read_state(void) {
    for (int i=0;i<nm_g&&i<MAX_MODES;i++) {
        mkx[i]=(int)c3d_get_kx(i);mky[i]=(int)c3d_get_ky(i);mkz[i]=(int)c3d_get_kz(i);
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i));ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i));ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i));ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

int main(void) {
    int N = 8;
    double amp = 0.30;
    double nu = 0.01;
    double dt = 0.0001;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  WAVE ENERGY FRACTION & REFLECTION COEFFICIENT               #\n");
    printf("#                                                              #\n");
    printf("#  Per source shell S:                                        #\n");
    printf("#    - Shell energy E_S                                       #\n");
    printf("#    - Outgoing (reflected) amplitude: Σ T(d≤0)              #\n");
    printf("#    - Forward (transmitted) amplitude: Σ T(d>0)             #\n");
    printf("#    - Reflection coeff R = |reflected|/(|refl|+|trans|)      #\n");
    printf("#    - Wave/energy ratio = (|refl|+|trans|) / E_S            #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f                                      #\n", N, amp, nu);
    printf("################################################################\n\n");
    fflush(stdout);

    /* Run at two time points */
    double times[] = {0.05, 0.20};
    int steps_list[] = {500, 2000};

    for (int ti = 0; ti < 2; ti++) {
        ic_distributed(n_base, amp);
        apply_ic(N);
        nm_g = (int)c3d_get_num_modes();
        buf_set(0, nu); buf_set(1, dt);
        for (int s = 0; s < steps_list[ti]; s++) c3d_do_step();
        read_state();

        /* Compute shell energies */
        double E_shell[MSH];
        memset(E_shell, 0, sizeof(E_shell));
        for (int i = 0; i < nm_g; i++) {
            int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
            int sh=(int)(sqrt((double)k2)+0.5);
            if (sh<MSH) {
                double e = 0;
                for (int c=0;c<3;c++) e += ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];
                E_shell[sh] += 0.5*e;
            }
        }

        int n_max_sq = N*N;

        printf("  t = %.4f\n\n", times[ti]);
        printf("  Src_S  E_S        reflected    transmitted   net         R_coeff    wave/E_S     diffusion(νK²E)\n");
        printf("  -----  ---------  ----------   ----------   ----------  ---------  ---------    ---------------\n");

        for (int S = 1; S <= N; S++) {
            double reflected = 0; /* sum of |T(d)| for d ≤ 0 (negative contributions) */
            double transmitted = 0; /* sum of T(d) for d > 0 (positive contributions) */

            /* Gather contributions from modes in shell S to all target shells */
            for (int p_idx = 0; p_idx < nm_g; p_idx++) {
                int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
                int p2=px*px+py*py+pz*pz;
                int ps=(int)(sqrt((double)p2)+0.5);
                if (ps != S) continue;

                for (int k_idx = 0; k_idx < nm_g; k_idx++) {
                    int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
                    int k2=kx*kx+ky*ky+kz*kz;
                    int ks=(int)(sqrt((double)k2)+0.5);
                    int d = ks - ps;

                    int qx=kx-px,qy=ky-py,qz=kz-pz;
                    int q2=qx*qx+qy*qy+qz*qz;
                    if (q2<=0||q2>n_max_sq) continue;
                    int q_idx=find_mode(qx,qy,qz);
                    if (q_idx<0) continue;

                    double c = triad_contrib(k_idx, p_idx, q_idx);

                    if (d <= 0) reflected += c; /* This will be net negative */
                    else transmitted += c;       /* This will be net positive */
                }
            }

            double total_wave = fabs(reflected) + fabs(transmitted);
            double net = reflected + transmitted;
            double R_coeff = (total_wave > 1e-30) ? fabs(reflected) / total_wave : 0;
            double wave_frac = (E_shell[S] > 1e-30) ? total_wave / E_shell[S] : 0;
            double diffusion = nu * (double)(S*S) * E_shell[S];

            printf("  %-5d  %9.2e  %+10.3e   %+10.3e   %+10.3e  %9.4f  %9.4f    %9.2e\n",
                   S, E_shell[S], reflected, transmitted, net, R_coeff, wave_frac, diffusion);
        }
        printf("\n");
        fflush(stdout);
    }

    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  R_coeff = reflection coefficient of the shell barrier.      #\n");
    printf("#  R ≈ 0.5: equal reflection and transmission (50/50 balance). #\n");
    printf("#  R → 1: mostly reflected (energy bounces back).             #\n");
    printf("#  R → 0: mostly transmitted (energy passes through).         #\n");
    printf("#                                                              #\n");
    printf("#  wave/E_S = fraction of shell energy carried by the wave.   #\n");
    printf("#  If constant: the wave is a fixed fraction of the energy.   #\n");
    printf("#  If decreasing with S: the wave weakens at high K.          #\n");
    printf("#                                                              #\n");
    printf("#  Compare wave amplitude with diffusion νK²E_S:             #\n");
    printf("#  If wave < diffusion: diffusion dominates at that shell.    #\n");
    printf("#  The shell where wave ≈ diffusion is the critical scale.    #\n");
    printf("################################################################\n");

    return 0;
}
