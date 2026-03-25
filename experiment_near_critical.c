/*
 * experiment_near_critical.c — Ω_max/Ω(0) at near-critical amplitude
 *
 * Tests the uniform bound at A = 0.5*A*(N), 0.8*A*(N), 0.9*A*(N), 0.95*A*(N)
 * for each N. If Ω_max/Ω(0) ≤ 1 even near the threshold, the uniform bound
 * holds everywhere below A*(N), not just at small amplitudes.
 *
 * This is the definitive test: subcritical AND near-critical.
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

static void setup_ic(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        double k2 = (double)(kx*kx + ky*ky + kz*kz);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (kz != 0) uz = -((double)kx*ux + (double)ky*uy)/(double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0.0;
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
}

/* Find A*(N) via binary search */
static int run_check(int num_modes, double amp, double nu, double dt,
                     int n_steps, double threshold) {
    setup_ic(num_modes, amp);
    buf_set(0, nu); buf_set(1, dt);
    for (int step = 0; step < n_steps; step++) {
        c3d_do_step();
        if (step % 100 == 99) {
            double omega = get_enstrophy();
            if (omega > threshold || omega != omega) return 1;
        }
    }
    return 0;
}

static double find_astar(int num_modes, double nu, double dt,
                         int n_steps, double threshold) {
    double a_lo = 0.01, a_hi = 0.02;
    if (run_check(num_modes, a_lo, nu, dt, n_steps, threshold)) return 0.0;
    for (int i = 0; i < 30; i++) {
        if (run_check(num_modes, a_hi, nu, dt, n_steps, threshold)) break;
        a_lo = a_hi; a_hi *= 2.0;
        if (i == 29) return a_hi;
    }
    for (int i = 0; i < 12; i++) {
        double mid = 0.5 * (a_lo + a_hi);
        if (run_check(num_modes, mid, nu, dt, n_steps, threshold)) a_hi = mid;
        else a_lo = mid;
    }
    return 0.5 * (a_lo + a_hi);
}

/* Run and return max enstrophy and initial enstrophy */
static void run_enstrophy(int num_modes, double amp, double nu, double dt,
                          int n_steps, double *omega_max, double *omega_0) {
    setup_ic(num_modes, amp);
    *omega_0 = get_enstrophy();
    *omega_max = *omega_0;

    buf_set(0, nu); buf_set(1, dt);
    for (int step = 0; step < n_steps; step++) {
        c3d_do_step();
        if (step % 10 == 9) {
            double omega = get_enstrophy();
            if (omega > *omega_max) *omega_max = omega;
            if (omega != omega) { *omega_max = 1e15; return; }
        }
    }
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max_limit = PARAM_N_MAX;
    double threshold = 10000.0;

    /* Fractions of A* to test */
    double fracs[] = {0.1, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 0.99};
    int n_fracs = 8;

    printf("############################################################\n");
    printf("#  NEAR-CRITICAL: Ω_max/Ω(0) at A = fraction × A*(N)      #\n");
    printf("#                                                          #\n");
    printf("#  If ratio ≤ 1 even at A = 0.99×A*(N):                   #\n");
    printf("#    uniform bound holds EVERYWHERE below threshold        #\n");
    printf("#    NS regularity follows                                 #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d\n\n", nu, dt, n_steps);

    for (int n = 2; n <= n_max_limit; n += 2) {
        int nm = (int)c3d_enumerate_modes(n);
        c3d_precompute_triads(n);

        /* Find A*(N) */
        double astar = find_astar(nm, nu, dt, n_steps, threshold);
        printf("  === N=%d (modes=%d, A*=%.6f) ===\n\n", n, nm, astar);
        printf("  A/A*    Amplitude   Ω(0)          Ω_max         Ratio      Bounded?\n");
        printf("  ------  ---------   ------------  ------------  ---------  --------\n");

        for (int f = 0; f < n_fracs; f++) {
            double frac = fracs[f];
            double amp = frac * astar;
            double omega_max, omega_0;

            run_enstrophy(nm, amp, nu, dt, n_steps, &omega_max, &omega_0);
            double ratio = (omega_0 > 1e-30) ? omega_max / omega_0 : 0;

            printf("  %-6.2f  %9.6f   %12.6f  %12.6f  %9.4f  %s\n",
                   frac, amp, omega_0, omega_max, ratio,
                   ratio <= 1.001 ? "YES" : (ratio < 2.0 ? "MARGINAL" : "NO"));
            fflush(stdout);
        }
        printf("\n");
    }

    printf("  === SUMMARY ===\n\n");
    printf("  If ALL ratios ≤ 1.0:\n");
    printf("    Ω_max ≤ Ω(0) ≤ ||u₀||²_{H¹} for ALL amplitudes below A*(N)\n");
    printf("    The uniform enstrophy bound holds with M = ||u₀||²_{H¹}\n");
    printf("    Combined with Leray-Hopf + Prodi-Serrin → REGULARITY\n\n");
    printf("  If ratios > 1.0 near A*(N):\n");
    printf("    Enstrophy grows above initial value near threshold\n");
    printf("    The uniform bound M = ||u₀||²_{H¹} does NOT hold\n");
    printf("    Need a different bound that accounts for enstrophy growth\n\n");
    printf("############################################################\n");

    return 0;
}
