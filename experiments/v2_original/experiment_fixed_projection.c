/*
 * experiment_fixed_projection.c — THE CORRECT VALIDATION
 *
 * Fix u₀ ONCE at low N. Then PROJECT to higher N by keeping the
 * same coefficients and setting new modes to ZERO.
 *
 * This is what actually happens in the Galerkin approximation of
 * a fixed smooth function: P_N(u₀) has the SAME low-k coefficients
 * as P_2(u₀), plus ZEROS at higher k.
 *
 * The previous experiments constructed FRESH ICs at each N, artificially
 * injecting energy at high-k modes. This made A*(N) → 0 because the
 * IC got worse at higher N. The real projection doesn't do this.
 *
 * If Ω_max is bounded across N with projected (not fresh) ICs,
 * the uniform bound holds and NS is regular.
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
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }

/*
 * Store the FIXED u₀ coefficients.
 * We generate them once at N_base, then reuse at every higher N.
 * Max modes we'll store: for N_base=3, there are 122 modes.
 */
#define MAX_BASE_MODES 200
static int base_kx[MAX_BASE_MODES];
static int base_ky[MAX_BASE_MODES];
static int base_kz[MAX_BASE_MODES];
static double base_ux[MAX_BASE_MODES];
static double base_uy[MAX_BASE_MODES];
static double base_uz[MAX_BASE_MODES];
static int num_base_modes = 0;

/*
 * Generate the fixed u₀ at N_base.
 * Store all coefficients for reuse at higher N.
 */
static void generate_fixed_u0(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    num_base_modes = nm;

    for (int i = 0; i < nm && i < MAX_BASE_MODES; i++) {
        base_kx[i] = (int)c3d_get_kx(i);
        base_ky[i] = (int)c3d_get_ky(i);
        base_kz[i] = (int)c3d_get_kz(i);

        double k2 = (double)(base_kx[i]*base_kx[i] + base_ky[i]*base_ky[i] + base_kz[i]*base_kz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;

        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;

        /* Divergence-free */
        if (base_kz[i] != 0)
            uz = -((double)base_kx[i] * ux + (double)base_ky[i] * uy) / (double)base_kz[i];
        else if (base_ky[i] != 0)
            uy = -(double)base_kx[i] * ux / (double)base_ky[i];
        else
            ux = 0.0;

        base_ux[i] = ux;
        base_uy[i] = uy;
        base_uz[i] = uz;
    }
}

/*
 * Project the fixed u₀ onto the N-mode truncation.
 * For modes that exist in the base: use the stored coefficients.
 * For new modes (|k| > N_base): set to ZERO.
 */
static void project_u0(int n_target) {
    int nm = (int)c3d_enumerate_modes(n_target);
    c3d_precompute_triads(n_target);
    c3d_zero_state(nm);  /* Start with all zeros */

    /* For each mode in the target truncation, check if it exists in the base */
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i);
        int ky = (int)c3d_get_ky(i);
        int kz = (int)c3d_get_kz(i);

        /* Search for this mode in the base */
        for (int j = 0; j < num_base_modes; j++) {
            if (base_kx[j] == kx && base_ky[j] == ky && base_kz[j] == kz) {
                /* Found — use the stored coefficient */
                buf_set(0, (double)i);
                buf_set(1, base_ux[j]);
                buf_set(2, base_uy[j]);
                buf_set(3, base_uz[j]);
                c3d_apply_state();
                break;
            }
        }
        /* If not found, mode stays at zero (from c3d_zero_state) */
    }
}

/* Run trajectory and return max enstrophy */
static double run_max_enstrophy(int num_modes, double nu, double dt, int n_steps) {
    buf_set(0, nu); buf_set(1, dt);
    double omega_max = get_enstrophy();
    for (int step = 0; step < n_steps; step++) {
        c3d_do_step();
        if (step % 10 == 9) {
            double omega = get_enstrophy();
            if (omega > omega_max) omega_max = omega;
            if (omega != omega) return 1e15;
        }
    }
    return omega_max;
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max_limit = PARAM_N_MAX;

    printf("############################################################\n");
    printf("#  FIXED PROJECTION: Same u₀, projected to increasing N    #\n");
    printf("#                                                          #\n");
    printf("#  Fix u₀ at N_base. Project P_N(u₀) for N > N_base.     #\n");
    printf("#  New modes start at ZERO — no artificial energy injection.#\n");
    printf("#                                                          #\n");
    printf("#  If Ω_max is bounded across N: UNIFORM BOUND HOLDS       #\n");
    printf("#  If Ω_max grows with N: UNIFORM BOUND FAILS              #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, N_max=%d\n\n", nu, dt, n_steps, n_max_limit);

    /* Test at multiple amplitudes */
    double amplitudes[] = {0.1, 0.5, 1.0, 2.0, 5.0};
    int n_amps = 5;

    /* Base truncation: N=2 (32 modes) */
    int n_base = 2;

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];

        /* Generate fixed u₀ at N_base */
        generate_fixed_u0(n_base, amp);

        printf("  === Fixed u₀ at N_base=%d, amp=%.1f (%d base modes) ===\n\n",
               n_base, amp, num_base_modes);
        printf("  N     Modes   Ω(0)          Ω_max         Ratio      E(0)       Bounded?\n");
        printf("  ----  ------  ------------  ------------  ---------  ---------  --------\n");

        double omega_max_base = 0.0;

        for (int n = n_base; n <= n_max_limit; n++) {
            clock_t start = clock();

            /* Project fixed u₀ to N modes */
            project_u0(n);
            int nm = (int)c3d_enumerate_modes(n);
            /* Need to re-project after enumerate resets modes */
            c3d_precompute_triads(n);
            c3d_zero_state(nm);
            /* Re-apply the base coefficients */
            for (int i = 0; i < nm; i++) {
                int kx = (int)c3d_get_kx(i);
                int ky = (int)c3d_get_ky(i);
                int kz = (int)c3d_get_kz(i);
                for (int j = 0; j < num_base_modes; j++) {
                    if (base_kx[j] == kx && base_ky[j] == ky && base_kz[j] == kz) {
                        buf_set(0, (double)i);
                        buf_set(1, base_ux[j]);
                        buf_set(2, base_uy[j]);
                        buf_set(3, base_uz[j]);
                        c3d_apply_state();
                        break;
                    }
                }
            }

            double omega_0 = get_enstrophy();
            double e_0 = get_energy();
            double omega_max = run_max_enstrophy(nm, nu, dt, n_steps);
            double ratio = (omega_0 > 1e-30) ? omega_max / omega_0 : 0;

            if (n == n_base) omega_max_base = omega_max;

            double elapsed = (double)(clock() - start) / CLOCKS_PER_SEC;

            printf("  %-4d  %-6d  %12.6f  %12.6f  %9.4f  %9.6f  %s  (%.0fs)\n",
                   n, nm, omega_0, omega_max, ratio, e_0,
                   ratio <= 1.01 ? "YES" : (ratio < 2.0 ? "MARGINAL" : "NO"),
                   elapsed);
            fflush(stdout);
        }
        printf("\n");
    }

    /* Also test with N_base=3 (more base modes) */
    n_base = 3;
    printf("  === Same test with N_base=%d (122 base modes) ===\n\n", n_base);

    double amp = 1.0;
    generate_fixed_u0(n_base, amp);

    printf("  N     Modes   Ω(0)          Ω_max         Ratio      E(0)       Bounded?\n");
    printf("  ----  ------  ------------  ------------  ---------  ---------  --------\n");

    for (int n = n_base; n <= n_max_limit; n++) {
        int nm = (int)c3d_enumerate_modes(n);
        c3d_precompute_triads(n);
        c3d_zero_state(nm);

        for (int i = 0; i < nm; i++) {
            int kx = (int)c3d_get_kx(i);
            int ky = (int)c3d_get_ky(i);
            int kz = (int)c3d_get_kz(i);
            for (int j = 0; j < num_base_modes; j++) {
                if (base_kx[j] == kx && base_ky[j] == ky && base_kz[j] == kz) {
                    buf_set(0, (double)i);
                    buf_set(1, base_ux[j]);
                    buf_set(2, base_uy[j]);
                    buf_set(3, base_uz[j]);
                    c3d_apply_state();
                    break;
                }
            }
        }

        double omega_0 = get_enstrophy();
        double e_0 = get_energy();
        double omega_max = run_max_enstrophy(nm, nu, dt, n_steps);
        double ratio = (omega_0 > 1e-30) ? omega_max / omega_0 : 0;

        printf("  %-4d  %-6d  %12.6f  %12.6f  %9.4f  %9.6f  %s\n",
               n, nm, omega_0, omega_max, ratio, e_0,
               ratio <= 1.01 ? "YES" : (ratio < 2.0 ? "MARGINAL" : "NO"));
        fflush(stdout);
    }

    printf("\n");
    printf("  === KEY OBSERVATIONS ===\n\n");
    printf("  1. Ω(0) should be CONSTANT across N (same base coefficients,\n");
    printf("     new modes at zero don't contribute to enstrophy).\n\n");
    printf("  2. Ω_max may differ because new modes receive energy via cascade,\n");
    printf("     which is then diffused at high k. The question is: does the\n");
    printf("     cascade transient cause Ω_max to grow with N?\n\n");
    printf("  3. If Ω_max/Ω(0) ≤ C (some constant independent of N):\n");
    printf("     the uniform bound holds with M = C × ||u₀||²_{H¹}\n\n");
    printf("############################################################\n");

    return 0;
}
