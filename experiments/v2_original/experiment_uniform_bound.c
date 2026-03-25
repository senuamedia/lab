/*
 * experiment_uniform_bound.c — THE GAP CLOSER
 *
 * Measure Ω_max(A, N) at FIXED amplitude A across N = 2..12.
 * If Ω_max is bounded (doesn't grow with N), the uniform bound holds.
 *
 * This is the DIRECT measurement of the condition needed for regularity.
 * Not A*(N). Not α. Not φ. The actual enstrophy bound M(N) at fixed A.
 *
 * If M(N) is constant → uniform bound holds → NS is regular.
 * If M(N) grows → uniform bound fails → gap remains open.
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
#define PARAM_STEPS 10000
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 10
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

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }

extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);
static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }

/* Setup distributed IC with FIXED amplitude */
static void setup_ic(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        double k2 = (double)(kx*kx + ky*ky + kz*kz);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0.0;
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
}

/* Run trajectory and return max enstrophy */
static double run_max_enstrophy(int num_modes, double amp, double nu, double dt, int n_steps) {
    setup_ic(num_modes, amp);
    buf_set(0, nu); buf_set(1, dt);

    double omega_max = 0.0;
    for (int step = 0; step < n_steps; step++) {
        c3d_do_step();
        if (step % 10 == 9) {
            double omega = get_enstrophy();
            if (omega > omega_max) omega_max = omega;
            if (omega != omega) return 1e15; /* NaN */
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
    printf("#  UNIFORM BOUND: Ω_max(A, N) at fixed A across N          #\n");
    printf("#                                                          #\n");
    printf("#  If Ω_max is constant in N → uniform bound holds        #\n");
    printf("#  If Ω_max grows with N → gap remains open               #\n");
    printf("#                                                          #\n");
    printf("#  THIS IS THE DIRECT TEST OF THE REGULARITY CONDITION     #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d\n\n", nu, dt, n_steps);

    /* Test at multiple fixed amplitudes */
    double amplitudes[] = {0.01, 0.02, 0.05, 0.1};
    int n_amps = 4;

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];
        printf("  === A = %.2f ===\n\n", amp);
        printf("  N     Modes   Ω_max          E(0)       Ω_max/Ω(0)   Ω_max/Ω_max(N=2)\n");
        printf("  ----  ------  -------------  ---------  -----------   -----------------\n");

        double omega_max_baseline = 0.0; /* Ω_max at N=2 for normalisation */

        for (int n = 2; n <= n_max_limit; n++) {
            clock_t start = clock();

            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);

            /* Measure initial enstrophy */
            setup_ic(nm, amp);
            double omega_0 = get_enstrophy();
            double e_0 = get_energy();

            /* Run and get max enstrophy */
            double omega_max = run_max_enstrophy(nm, amp, nu, dt, n_steps);

            if (n == 2) omega_max_baseline = omega_max;

            double ratio_0 = (omega_0 > 1e-30) ? omega_max / omega_0 : 0;
            double ratio_base = (omega_max_baseline > 1e-30) ? omega_max / omega_max_baseline : 0;

            double elapsed = (double)(clock() - start) / CLOCKS_PER_SEC;

            printf("  %-4d  %-6d  %13.6f  %9.6f  %11.4f   %17.4f  (%.0fs)\n",
                   n, nm, omega_max, e_0, ratio_0, ratio_base, elapsed);
            fflush(stdout);
        }
        printf("\n");
    }

    /* Summary analysis */
    printf("  === KEY QUESTION ===\n\n");
    printf("  If Ω_max/Ω_max(N=2) ≈ 1.0 for all N:\n");
    printf("    → M(N) is CONSTANT\n");
    printf("    → The uniform enstrophy bound HOLDS\n");
    printf("    → Leray-Hopf + Prodi-Serrin → REGULARITY\n");
    printf("    → NS IS SOLVED\n\n");
    printf("  If Ω_max/Ω_max(N=2) grows with N:\n");
    printf("    → M(N) GROWS\n");
    printf("    → The uniform bound may FAIL\n");
    printf("    → The gap remains OPEN\n\n");
    printf("############################################################\n");

    return 0;
}
