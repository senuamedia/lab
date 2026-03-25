/*
 * experiment_crossshell_transfer.c — Cross-shell accumulation diagnostic
 *
 * We know:
 *   - Per-shell η_k converges across N (ρ ≈ 0.53, never fails)
 *   - Integrated enstrophy diverges across N (ρ crosses 1.0 at A≈0.33)
 *   - The gap: cross-shell energy ACCUMULATION
 *
 * This experiment measures:
 *   1. Net transfer INTO each shell: T_net(k) = dE_k/dt + D_k
 *   2. Cross-shell flow: sum of |T_net(k)| across shells (total redistribution)
 *   3. Accumulation ratio: (Σ|T_net|) / (Σ D_k)  — how much energy is
 *      being shuffled relative to how much is being dissipated
 *
 * If the accumulation ratio converges across N: the transfer pattern is stable.
 * If it diverges: the cascade overwhelms diffusion through accumulation.
 *
 * This sits BETWEEN per-shell η (which converges) and total enstrophy
 * (which diverges), identifying exactly where the gap opens.
 *
 * Fixed projection, sequential per-N, fine amplitude sweep.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>

#ifndef PARAM_NU
#define PARAM_NU 0.01
#endif
#ifndef PARAM_DT
#define PARAM_DT 0.0001
#endif
#ifndef PARAM_STEPS
#define PARAM_STEPS 5000
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 6
#endif

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_zero_state(int64_t num_modes);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_apply_state(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);
extern int64_t c3d_enstrophy(void);
extern int64_t c3d_energy(void);
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }

#define MAX_BASE_MODES 200
static int base_kx[MAX_BASE_MODES], base_ky[MAX_BASE_MODES], base_kz[MAX_BASE_MODES];
static double base_ux[MAX_BASE_MODES], base_uy[MAX_BASE_MODES], base_uz[MAX_BASE_MODES];
static int num_base_modes = 0;

static void generate_fixed_u0(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    num_base_modes = (nm < MAX_BASE_MODES) ? nm : MAX_BASE_MODES;
    for (int i = 0; i < num_base_modes; i++) {
        base_kx[i] = (int)c3d_get_kx(i);
        base_ky[i] = (int)c3d_get_ky(i);
        base_kz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(base_kx[i]*base_kx[i]+base_ky[i]*base_ky[i]+base_kz[i]*base_kz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (base_kz[i] != 0) uz = -((double)base_kx[i]*ux+(double)base_ky[i]*uy)/(double)base_kz[i];
        else if (base_ky[i] != 0) uy = -(double)base_kx[i]*ux/(double)base_ky[i];
        else ux = 0.0;
        base_ux[i] = ux; base_uy[i] = uy; base_uz[i] = uz;
    }
}

static double shell_energy(int num_modes, int k_shell) {
    double e = 0.0;
    int k2_lo = k_shell*k_shell, k2_hi = (k_shell+1)*(k_shell+1);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        if (k2 >= k2_lo && k2 < k2_hi) {
            double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
            e += ux*ux+uy*uy+uz*uz;
        }
    }
    return 0.5*e;
}

#define MAX_SAMPLES 100
#define MAX_N_LEVELS 8
#define NUM_ARRAYS 6  /* expanded array set */

/*
 * Arrays:
 *   0: ENERGY         — E(t)
 *   1: ENSTROPHY      — Ω(t)
 *   2: SHELL_η_max   — max_k η_k(t)
 *   3: TRANSFER_ABS   — Σ_k |T_net(k)|  (total absolute redistribution)
 *   4: DIFFUSION_TOT  — Σ_k D_k         (total diffusion rate)
 *   5: ACCUM_RATIO    — (Σ|T_net|)/(Σ D_k)  (accumulation vs dissipation)
 */
static double traj[NUM_ARRAYS][MAX_N_LEVELS][MAX_SAMPLES];

static double l2_dist(double *a, double *b, int n) {
    double sum = 0;
    for (int i = 0; i < n; i++) { double d = a[i]-b[i]; sum += d*d; }
    return sqrt(sum);
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max = PARAM_N_MAX;
    int n_base = 2;
    int sample_interval = 50;
    int n_samples = n_steps / sample_interval;
    if (n_samples > MAX_SAMPLES) n_samples = MAX_SAMPLES;

    const char *arr_names[] = {
        "ENERGY", "ENSTROPHY", "SHELL_η",
        "XFER_ABS", "DIFF_TOT", "ACCUM_R"
    };

    printf("############################################################\n");
    printf("#  CROSS-SHELL TRANSFER: Accumulation diagnostic           #\n");
    printf("#                                                          #\n");
    printf("#  New arrays between per-shell η and total enstrophy:     #\n");
    printf("#    XFER_ABS  = Σ_k |T_net(k)|  (total redistribution)   #\n");
    printf("#    DIFF_TOT  = Σ_k D_k          (total dissipation)     #\n");
    printf("#    ACCUM_R   = XFER_ABS/DIFF_TOT (accumulation ratio)   #\n");
    printf("#                                                          #\n");
    printf("#  If ACCUM_R converges across N: transfer is bounded      #\n");
    printf("#  If ACCUM_R diverges: cascade overwhelms via accumulation#\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, N_max=%d\n\n", nu, dt, n_steps, n_max);

    double amplitudes[] = {0.20, 0.25, 0.28, 0.30, 0.32, 0.35, 0.40, 0.50};
    int n_amps = 8;

    /* Summary header */
    printf("  %-5s  ", "Amp");
    for (int ar = 0; ar < NUM_ARRAYS; ar++)
        printf("ρ_%-8s ", arr_names[ar]);
    printf(" First_fail\n");
    printf("  %-5s  ", "-----");
    for (int ar = 0; ar < NUM_ARRAYS; ar++)
        printf("---------- ");
    printf(" ----------\n");

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];
        generate_fixed_u0(n_base, amp);

        int n_values[MAX_N_LEVELS];
        int n_count = 0;
        for (int n = n_base; n <= n_max && n_count < MAX_N_LEVELS; n++)
            n_values[n_count++] = n;

        for (int ni = 0; ni < n_count; ni++) {
            int n = n_values[ni];
            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);
            c3d_zero_state(nm);
            for (int i = 0; i < nm; i++) {
                int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
                for (int j = 0; j < num_base_modes; j++) {
                    if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                        buf_set(0,(double)i); buf_set(1,base_ux[j]);
                        buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                        c3d_apply_state(); break;
                    }
                }
            }
            buf_set(0, nu); buf_set(1, dt);

            double prev_shell_e[20];
            memset(prev_shell_e, 0, sizeof(prev_shell_e));
            for (int k = 1; k <= n; k++)
                prev_shell_e[k] = shell_energy(nm, k);

            int s = 0;
            for (int step = 0; step < n_steps; step++) {
                c3d_do_step();
                if (step % sample_interval == (sample_interval-1) && s < n_samples) {
                    traj[0][ni][s] = get_energy();
                    traj[1][ni][s] = get_enstrophy();

                    double max_eta = 0;
                    double sum_abs_T = 0;
                    double sum_D = 0;

                    for (int k = 1; k <= n; k++) {
                        double e_k = shell_energy(nm, k);
                        double k_mid = (double)k + 0.5;
                        double D_k = 2.0*nu*k_mid*k_mid*e_k;
                        double dE = (e_k - prev_shell_e[k])/(sample_interval*dt);
                        double T_net = dE + D_k;  /* net transfer into shell */
                        double eta = (D_k > 1e-20) ? T_net/D_k : 0;

                        if (eta > max_eta) max_eta = eta;
                        sum_abs_T += fabs(T_net);
                        sum_D += D_k;

                        prev_shell_e[k] = e_k;
                    }

                    traj[2][ni][s] = max_eta;
                    traj[3][ni][s] = sum_abs_T;
                    traj[4][ni][s] = sum_D;
                    traj[5][ni][s] = (sum_D > 1e-20) ? sum_abs_T / sum_D : 0;

                    s++;
                }
            }
        }

        /* Compute contraction ratios */
        double pw[NUM_ARRAYS][MAX_N_LEVELS];
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            for (int ni = 0; ni < n_count-1; ni++)
                pw[ar][ni] = l2_dist(traj[ar][ni], traj[ar][ni+1], n_samples);

        double max_rho[NUM_ARRAYS];
        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            max_rho[ar] = 0;
            for (int ni = 0; ni < n_count-2; ni++) {
                double rho = (pw[ar][ni] > 1e-30) ? pw[ar][ni+1]/pw[ar][ni] : 0;
                if (rho > max_rho[ar]) max_rho[ar] = rho;
            }
        }

        /* Find first to fail */
        int first = -1;
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            if (max_rho[ar] >= 1.0 && first < 0) first = ar;

        printf("  %-5.2f  ", amp);
        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            if (max_rho[ar] >= 1.0)
                printf("*%9.6f ", max_rho[ar]);
            else
                printf(" %9.6f ", max_rho[ar]);
        }
        printf(" %s\n", first >= 0 ? arr_names[first] : "NONE");
        fflush(stdout);
    }

    /* Detailed output for the critical amplitude */
    printf("\n  === Detailed contraction ratios at A=0.32 ===\n\n");
    {
        double amp = 0.32;
        generate_fixed_u0(n_base, amp);
        int n_count = 0;
        int n_values[MAX_N_LEVELS];
        for (int n = n_base; n <= n_max && n_count < MAX_N_LEVELS; n++)
            n_values[n_count++] = n;

        for (int ni = 0; ni < n_count; ni++) {
            int n = n_values[ni];
            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);
            c3d_zero_state(nm);
            for (int i = 0; i < nm; i++) {
                int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
                for (int j = 0; j < num_base_modes; j++) {
                    if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                        buf_set(0,(double)i); buf_set(1,base_ux[j]);
                        buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                        c3d_apply_state(); break;
                    }
                }
            }
            buf_set(0, nu); buf_set(1, dt);

            double prev_shell_e[20];
            memset(prev_shell_e, 0, sizeof(prev_shell_e));
            for (int k = 1; k <= n; k++)
                prev_shell_e[k] = shell_energy(nm, k);

            int s = 0;
            for (int step = 0; step < n_steps; step++) {
                c3d_do_step();
                if (step % sample_interval == (sample_interval-1) && s < n_samples) {
                    traj[0][ni][s] = get_energy();
                    traj[1][ni][s] = get_enstrophy();
                    double max_eta=0, sum_abs_T=0, sum_D=0;
                    for (int k = 1; k <= n; k++) {
                        double e_k = shell_energy(nm, k);
                        double k_mid = (double)k+0.5;
                        double D_k = 2.0*nu*k_mid*k_mid*e_k;
                        double dE = (e_k-prev_shell_e[k])/(sample_interval*dt);
                        double T_net = dE+D_k;
                        double eta = (D_k>1e-20)?T_net/D_k:0;
                        if (eta>max_eta) max_eta=eta;
                        sum_abs_T += fabs(T_net);
                        sum_D += D_k;
                        prev_shell_e[k] = e_k;
                    }
                    traj[2][ni][s] = max_eta;
                    traj[3][ni][s] = sum_abs_T;
                    traj[4][ni][s] = sum_D;
                    traj[5][ni][s] = (sum_D>1e-20)?sum_abs_T/sum_D:0;
                    s++;
                }
            }

            /* Print final values */
            printf("  N=%d: E=%.6f Ω=%.6f maxη=%.4f |Xfer|=%.6f Diff=%.6f Accum=%.4f\n",
                   n, traj[0][ni][n_samples-1], traj[1][ni][n_samples-1],
                   traj[2][ni][n_samples-1], traj[3][ni][n_samples-1],
                   traj[4][ni][n_samples-1], traj[5][ni][n_samples-1]);
        }

        printf("\n  Pairwise distances:\n");
        printf("  %-11s  ", "Pair");
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            printf("%-10s ", arr_names[ar]);
        printf("\n");

        double pw[NUM_ARRAYS][MAX_N_LEVELS];
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            for (int ni = 0; ni < n_count-1; ni++)
                pw[ar][ni] = l2_dist(traj[ar][ni], traj[ar][ni+1], n_samples);

        for (int ni = 0; ni < n_count-1; ni++) {
            char label[32];
            snprintf(label, sizeof(label), "S_%d vs S_%d", n_values[ni], n_values[ni+1]);
            printf("  %-11s  ", label);
            for (int ar = 0; ar < NUM_ARRAYS; ar++)
                printf("%10.2e ", pw[ar][ni]);
            printf("\n");
        }

        printf("\n  Contraction ratios:\n");
        printf("  %-15s  ", "Ratio");
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            printf("%-10s ", arr_names[ar]);
        printf("\n");

        for (int ni = 0; ni < n_count-2; ni++) {
            char label[32];
            snprintf(label, sizeof(label), "d(%d,%d)/d(%d,%d)",
                     n_values[ni+1], n_values[ni+2], n_values[ni], n_values[ni+1]);
            printf("  %-15s  ", label);
            for (int ar = 0; ar < NUM_ARRAYS; ar++) {
                double rho = (pw[ar][ni]>1e-30)?pw[ar][ni+1]/pw[ar][ni]:0;
                printf("%10.6f ", rho);
            }
            printf("\n");
        }
    }

    printf("\n############################################################\n");
    printf("#  KEY QUESTION:                                           #\n");
    printf("#                                                          #\n");
    printf("#  Does ACCUM_R (accumulation ratio) fail BEFORE or AFTER  #\n");
    printf("#  ENSTROPHY?                                              #\n");
    printf("#                                                          #\n");
    printf("#  If BEFORE: accumulation causes enstrophy divergence.    #\n");
    printf("#  If AFTER: enstrophy diverges for a different reason.    #\n");
    printf("#  If SAME: accumulation IS the enstrophy divergence.      #\n");
    printf("#                                                          #\n");
    printf("#  If ACCUM_R converges where ENSTROPHY diverges:          #\n");
    printf("#    The transfer PATTERN is stable — the problem is       #\n");
    printf("#    the k² weighting in enstrophy, not the physics.       #\n");
    printf("############################################################\n");

    return 0;
}
