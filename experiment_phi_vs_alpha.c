/*
 * experiment_phi_vs_alpha.c — Does φ predict α?
 *
 * Compute A*(N) at N=2-8 for MANY different ICs with varying φ,
 * then fit α for each and plot φ vs α.
 *
 * If φ predicts α → φ is the missing diagnostic
 * If φ doesn't correlate → something else is going on
 *
 * IC types with different φ values:
 *   0: Concentrated (φ ≈ 0, all energy at |k|=1)
 *   1: Slightly spread (φ ≈ 0.3, energy at |k|=1,2)
 *   2: Half spread (φ ≈ 0.5, energy at |k|=1,2,3)
 *   3: Mostly spread (φ ≈ 0.7, energy decaying as 1/|k|^2)
 *   4: Distributed (φ ≈ 0.95, energy decaying as 1/|k|)
 *   5: Flat (φ ≈ 0.99, equal energy all modes)
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
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);
extern int64_t c3d_enstrophy(void);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }

/* Compute φ = E_high / E_total where E_high = energy at |k|>1 */
static double compute_phi(int num_modes) {
    double e_low = 0.0, e_high = 0.0;
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
        double e = ux*ux + uy*uy + uz*uz;
        if (k2 <= 1) e_low += e; else e_high += e;
    }
    double e_total = e_low + e_high;
    return (e_total > 1e-30) ? e_high / e_total : 0.0;
}

/*
 * Setup IC with controlled spectral decay:
 *   |û_k| = amp / |k|^decay_exp
 *
 * decay_exp = 0: flat (all modes equal) → φ ≈ 1
 * decay_exp = 0.5: slow decay → φ high
 * decay_exp = 1: standard distributed → φ ≈ 0.95
 * decay_exp = 2: steep decay → φ ≈ 0.5
 * decay_exp = 5: very steep → φ ≈ 0.1
 * decay_exp = 100: essentially concentrated → φ ≈ 0
 */
static void setup_ic_decay(int num_modes, double amp, double decay_exp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        double k2 = (double)(kx*kx + ky*ky + kz*kz);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;

        /* Amplitude decays as 1/|k|^decay_exp */
        double va = amp / pow(km, decay_exp);

        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;

        /* Divergence-free */
        if (kz != 0) uz = -((double)kx*ux + (double)ky*uy)/(double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0.0;

        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
}

/* Binary search for A* */
static int run_check(int num_modes, double amp, double decay_exp,
                     double nu, double dt, int n_steps, double threshold) {
    setup_ic_decay(num_modes, amp, decay_exp);
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

static double find_astar(int num_modes, double decay_exp,
                         double nu, double dt, int n_steps, double threshold) {
    double a_lo = 0.01, a_hi = 0.02;
    if (run_check(num_modes, a_lo, decay_exp, nu, dt, n_steps, threshold)) return 0.0;
    for (int i = 0; i < 30; i++) {
        if (run_check(num_modes, a_hi, decay_exp, nu, dt, n_steps, threshold)) break;
        a_lo = a_hi; a_hi *= 2.0;
        if (i == 29) return a_hi;
    }
    for (int i = 0; i < 12; i++) {
        double mid = 0.5 * (a_lo + a_hi);
        if (run_check(num_modes, mid, decay_exp, nu, dt, n_steps, threshold)) a_hi = mid;
        else a_lo = mid;
    }
    return 0.5 * (a_lo + a_hi);
}

/* Log-log fit for α */
static double fit_alpha(double* n_vals, double* a_vals, int count) {
    double sx=0, sy=0, sxy=0, sx2=0;
    int valid = 0;
    for (int i = 0; i < count; i++) {
        if (a_vals[i] > 0 && n_vals[i] > 0) {
            double lx = log(n_vals[i]), ly = log(a_vals[i]);
            sx += lx; sy += ly; sxy += lx*ly; sx2 += lx*lx;
            valid++;
        }
    }
    double denom = valid*sx2 - sx*sx;
    if (fabs(denom) < 1e-10) return 0;
    return -(valid*sxy - sx*sy) / denom;
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max_limit = PARAM_N_MAX;
    double threshold = 10000.0;

    /* Decay exponents to test: from flat (0) to concentrated (100) */
    double decay_exps[] = {0.0, 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0, 5.0, 10.0, 100.0};
    int n_decays = 11;

    printf("############################################################\n");
    printf("#  φ vs α: Does spectral energy fraction predict α?        #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, N_max=%d\n\n", nu, dt, n_steps, n_max_limit);

    printf("  decay_exp  φ(t=0,N=4)  α          A*(2)      A*(4)      A*(6)      A*(8)\n");
    printf("  ---------  ----------  ---------  ---------  ---------  ---------  ---------\n");

    /* For each decay exponent, compute φ and α */
    for (int d = 0; d < n_decays; d++) {
        double decay = decay_exps[d];
        clock_t start = clock();

        /* Compute φ at N=4 with small amplitude */
        int nm4 = (int)c3d_enumerate_modes(4);
        c3d_precompute_triads(4);
        setup_ic_decay(nm4, 0.1, decay);
        double phi = compute_phi(nm4);

        /* Compute A*(N) at N=2,4,6,8 */
        double n_vals[4], a_vals[4];
        int n_points = 0;

        int test_ns[] = {2, 4, 6, 8};
        for (int t = 0; t < 4; t++) {
            int n = test_ns[t];
            if (n > n_max_limit) break;
            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);
            double astar = find_astar(nm, decay, nu, dt, n_steps, threshold);
            n_vals[n_points] = (double)n;
            a_vals[n_points] = astar;
            n_points++;
        }

        double alpha = fit_alpha(n_vals, a_vals, n_points);

        printf("  %-9.1f  %10.4f  %9.4f", decay, phi, alpha);
        for (int t = 0; t < n_points; t++) {
            printf("  %9.4f", a_vals[t]);
        }

        double elapsed = (double)(clock() - start) / CLOCKS_PER_SEC;
        printf("  (%.0fs)\n", elapsed);
        fflush(stdout);
    }

    printf("\n");
    printf("  === Correlation Analysis ===\n\n");
    printf("  If α increases monotonically with φ:\n");
    printf("    → φ PREDICTS α\n");
    printf("    → φ is the causal mechanism\n");
    printf("    → Smooth data has φ→1, so α≈2.4 always applies\n\n");
    printf("  If α is constant regardless of φ:\n");
    printf("    → φ is irrelevant\n");
    printf("    → Something else determines α\n\n");
    printf("  If α jumps at a threshold φ*:\n");
    printf("    → Phase transition at φ*\n");
    printf("    → Below φ*: different regime\n");
    printf("    → Above φ*: universal α≈2.4\n\n");
    printf("############################################################\n");

    return 0;
}
