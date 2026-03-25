/*
 * experiment_multi_array.c — Multi-perspective scaffold arrays
 *
 * Four independent scaffold arrays, each measuring a different aspect
 * of the SAME dynamics at each truncation N:
 *
 *   Array 1 (ENERGY):    H = E(t),   H' = dE/dt
 *   Array 2 (ENSTROPHY): H = Ω(t),   H' = dΩ/dt
 *   Array 3 (SHELL):     H = max_k η_k(t), H' = d(max_η)/dt
 *   Array 4 (SPECTRAL):  H = H'''(t) participation ratio
 *
 * For each array, compute the UAT contraction ratio ρ across N.
 * Then compare: do all arrays agree on convergence?
 *
 * If arrays AGREE (all ρ < 1 or all ρ > 1): consistent picture.
 * If arrays DISAGREE: the divergence between arrays is itself
 *   a diagnostic — it reveals which perspective sees trouble first.
 *
 * Uses FIXED PROJECTION for correctness.
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
#define PARAM_N_MAX 8
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

/* Fixed u₀ storage */
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

static int setup_and_get_modes(int n_target) {
    int nm = (int)c3d_enumerate_modes(n_target);
    c3d_precompute_triads(n_target);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        for (int j = 0; j < num_base_modes; j++) {
            if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                buf_set(0,(double)i); buf_set(1,base_ux[j]); buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                c3d_apply_state(); break;
            }
        }
    }
    return nm;
}

/* Compute shell energy for shell k */
static double shell_energy(int num_modes, int k_shell) {
    double e = 0.0;
    int k2_lo = k_shell * k_shell;
    int k2_hi = (k_shell + 1) * (k_shell + 1);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 >= k2_lo && k2 < k2_hi) {
            double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
            e += ux*ux + uy*uy + uz*uz;
        }
    }
    return 0.5 * e;
}

/* Compute spectral participation ratio H''' */
static double participation_ratio(int num_modes) {
    double sum2 = 0, sum4 = 0;
    for (int i = 0; i < num_modes; i++) {
        double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
        double e = ux*ux + uy*uy + uz*uz;
        sum2 += e;
        sum4 += e * e;
    }
    return (sum4 > 1e-30) ? (sum2 * sum2) / sum4 : 0;
}

/* Storage for all 4 arrays × N levels × time samples */
#define MAX_SAMPLES 100
#define MAX_N_LEVELS 10
#define NUM_ARRAYS 4

static double arr[NUM_ARRAYS][MAX_N_LEVELS][MAX_SAMPLES];
static int n_samples_global = 0;

/*
 * Run one truncation level and record all 4 array measurements simultaneously.
 */
static int run_all_arrays(int n_level, int n_trunc, double nu, double dt,
                          int n_steps, int sample_interval) {
    int nm = setup_and_get_modes(n_trunc);
    buf_set(0, nu); buf_set(1, dt);

    double prev_shell_e[20];
    memset(prev_shell_e, 0, sizeof(prev_shell_e));
    for (int k = 1; k <= n_trunc; k++)
        prev_shell_e[k] = shell_energy(nm, k);

    int s = 0;

    for (int step = 0; step < n_steps; step++) {
        c3d_do_step();

        if (step % sample_interval == (sample_interval - 1) && s < MAX_SAMPLES) {
            /* Array 0: ENERGY */
            double E = get_energy();
            arr[0][n_level][s] = E;

            /* Array 1: ENSTROPHY */
            double Omega = get_enstrophy();
            arr[1][n_level][s] = Omega;

            /* Array 2: SHELL max_η */
            double max_eta = 0;
            for (int k = 1; k <= n_trunc; k++) {
                double e_k = shell_energy(nm, k);
                double k_mid = (double)k + 0.5;
                double D_k = 2.0 * nu * k_mid * k_mid * e_k;
                double dE_dt = (e_k - prev_shell_e[k]) / (sample_interval * dt);
                double T_k = dE_dt + D_k;
                double eta_k = (D_k > 1e-20) ? T_k / D_k : 0;
                if (eta_k > max_eta) max_eta = eta_k;
                prev_shell_e[k] = e_k;
            }
            arr[2][n_level][s] = max_eta;

            /* Array 3: SPECTRAL participation ratio */
            arr[3][n_level][s] = participation_ratio(nm);

            s++;
        }
    }
    return s;
}

/* Compute pairwise L² distance between two trajectories */
static double l2_dist(double *a, double *b, int n) {
    double sum = 0;
    for (int i = 0; i < n; i++) {
        double d = a[i] - b[i];
        sum += d * d;
    }
    return sqrt(sum);
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max = PARAM_N_MAX;
    int n_base = 2;
    int sample_interval = 100;

    const char *array_names[] = {"ENERGY", "ENSTROPHY", "SHELL_η", "SPECTRAL"};

    printf("############################################################\n");
    printf("#  MULTI-ARRAY SCAFFOLD: 4 perspectives × N truncations    #\n");
    printf("#                                                          #\n");
    printf("#  Array 1: ENERGY     — E(t) at each N                    #\n");
    printf("#  Array 2: ENSTROPHY  — Ω(t) at each N                    #\n");
    printf("#  Array 3: SHELL η    — max_k η_k(t) at each N           #\n");
    printf("#  Array 4: SPECTRAL   — H'''(t) participation ratio       #\n");
    printf("#                                                          #\n");
    printf("#  If ALL arrays contract: robust convergence              #\n");
    printf("#  If arrays DISAGREE: divergence identifies weak spot     #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, N_max=%d\n\n", nu, dt, n_steps, n_max);

    double amplitudes[] = {0.1, 0.2, 0.25, 0.28, 0.30, 0.35, 0.5};
    int n_amps = 7;

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];
        generate_fixed_u0(n_base, amp);

        int n_values[MAX_N_LEVELS];
        int n_count = 0;
        for (int n = n_base; n <= n_max && n_count < MAX_N_LEVELS; n++)
            n_values[n_count++] = n;

        printf("  ================================================================\n");
        printf("  === amp=%.2f ===\n", amp);
        printf("  ================================================================\n\n");

        /* Run all scaffolds — each run records all 4 arrays simultaneously */
        for (int ni = 0; ni < n_count; ni++) {
            clock_t start = clock();
            n_samples_global = run_all_arrays(ni, n_values[ni], nu, dt, n_steps, sample_interval);
            double elapsed = (double)(clock() - start) / CLOCKS_PER_SEC;
            printf("  N=%d: E(T)=%.6f  Ω(T)=%.6f  maxη(T)=%.4f  H'''(T)=%.4f  (%.0fs)\n",
                   n_values[ni],
                   arr[0][ni][n_samples_global-1],
                   arr[1][ni][n_samples_global-1],
                   arr[2][ni][n_samples_global-1],
                   arr[3][ni][n_samples_global-1],
                   elapsed);
        }
        printf("\n");

        /* Compute contraction ratios for each array */
        printf("  --- UAT contraction ratios per array ---\n\n");
        printf("  %-12s", "Pair");
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            printf("  ρ_%-9s", array_names[ar]);
        printf("  AllContract?\n");

        printf("  %-12s", "----------");
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            printf("  ----------");
        printf("  ----------\n");

        /* First compute pairwise distances */
        double pw[NUM_ARRAYS][MAX_N_LEVELS]; /* pairwise distances */
        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            for (int ni = 0; ni < n_count - 1; ni++) {
                pw[ar][ni] = l2_dist(arr[ar][ni], arr[ar][ni+1], n_samples_global);
            }
        }

        int array_contracts[NUM_ARRAYS];
        double array_max_rho[NUM_ARRAYS];
        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            array_contracts[ar] = 1;
            array_max_rho[ar] = 0;
        }

        for (int ni = 0; ni < n_count - 2; ni++) {
            char label[32];
            snprintf(label, sizeof(label), "d(%d,%d)/d(%d,%d)",
                     n_values[ni+1], n_values[ni+2], n_values[ni], n_values[ni+1]);
            printf("  %-12s", label);

            int all_ok = 1;
            for (int ar = 0; ar < NUM_ARRAYS; ar++) {
                double rho = (pw[ar][ni] > 1e-30) ? pw[ar][ni+1] / pw[ar][ni] : 0;
                printf("  %10.6f", rho);
                if (rho >= 1.0) { array_contracts[ar] = 0; all_ok = 0; }
                if (rho > array_max_rho[ar]) array_max_rho[ar] = rho;
            }
            printf("  %s\n", all_ok ? "YES" : "NO");
        }
        printf("\n");

        /* Cross-array agreement summary */
        printf("  --- Per-array summary ---\n\n");
        printf("  %-12s  MaxRho      Contracts?  Final_Value\n", "Array");
        printf("  %-12s  ----------  ----------  -----------\n", "----------");

        int all_agree = 1;
        int any_contracts = 0;
        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            printf("  %-12s  %10.6f  %-10s  %.6f\n",
                   array_names[ar], array_max_rho[ar],
                   array_contracts[ar] ? "YES" : "NO",
                   arr[ar][n_count-1][n_samples_global-1]);
            if (ar > 0 && array_contracts[ar] != array_contracts[ar-1]) all_agree = 0;
            if (array_contracts[ar]) any_contracts = 1;
        }
        printf("\n");

        printf("  >>> VERDICT for amp=%.2f:\n", amp);
        if (all_agree && array_contracts[0]) {
            printf("      ALL 4 arrays contract (ρ < 1)\n");
            printf("      → Robust convergence from every perspective\n");
            printf("      → Uniform bound HOLDS\n");
        } else if (all_agree && !array_contracts[0]) {
            printf("      ALL 4 arrays diverge (ρ ≥ 1)\n");
            printf("      → Consistent divergence — uniform bound FAILS\n");
        } else {
            printf("      Arrays DISAGREE:\n");
            for (int ar = 0; ar < NUM_ARRAYS; ar++) {
                printf("        %-12s: %s (ρ_max = %.4f)\n",
                       array_names[ar],
                       array_contracts[ar] ? "CONTRACTS" : "DIVERGES",
                       array_max_rho[ar]);
            }
            printf("      → Cross-array variance reveals which perspective fails first\n");
        }
        printf("\n");
    }

    printf("############################################################\n");
    printf("#  KEY INSIGHT:                                            #\n");
    printf("#                                                          #\n");
    printf("#  When all 4 arrays agree: the convergence is robust.     #\n");
    printf("#  The answer doesn't depend on which question you ask.    #\n");
    printf("#                                                          #\n");
    printf("#  When arrays disagree: the DISAGREEMENT is the signal.   #\n");
    printf("#  It tells you which physical mechanism breaks first.     #\n");
    printf("#                                                          #\n");
    printf("#  This is not more measurements — it's the same           #\n");
    printf("#  measurements from more angles, with the variance        #\n");
    printf("#  between angles as the diagnostic.                       #\n");
    printf("############################################################\n");

    return 0;
}
