/*
 * experiment_spectral.c — A* with spectral participation ratio H'''
 *
 * Instead of measuring A* from t=0, this experiment:
 *   1. Initialises with the given IC
 *   2. Runs a "warm-up" phase until H''' exceeds a threshold
 *      (cascade has established)
 *   3. THEN measures A* from the post-cascade state
 *
 * This separates the transient (cascade build-up) from the
 * steady-state dynamics. If the concentrated IC's low α is
 * purely a transient effect, the post-cascade A* should match
 * the distributed IC's α ≈ 2.4.
 *
 * H''' = (Σ |û_k|²)² / (Σ |û_k|⁴) = spectral participation ratio
 *   H''' = 1: all energy in one mode
 *   H''' = N_active: energy spread across N_active modes
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
#ifndef PARAM_THRESHOLD
#define PARAM_THRESHOLD 10000.0
#endif
#ifndef PARAM_IC_TYPE
#define PARAM_IC_TYPE 0
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 8
#endif
#ifndef PARAM_WARMUP_HPPP
#define PARAM_WARMUP_HPPP 0.5  /* H''' threshold as fraction of num_modes */
#endif
#ifndef PARAM_WARMUP_STEPS
#define PARAM_WARMUP_STEPS 2000
#endif

/* External from triad_kernel_v2.c */
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

/* State access — returns i64 bits */
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);
extern int64_t c3d_energy(void);
extern int64_t c3d_enstrophy(void);

static void buf_set(int idx, double val) {
    int64_t bits;
    memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx);
    c3d_buf_val(bits);
}

static double bits_to_dbl(int64_t bits) {
    double val;
    memcpy(&val, &bits, sizeof(double));
    return val;
}

static double get_energy(void) { return bits_to_dbl(c3d_energy()); }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }

static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }

/* Compute H''' = (Σ |û|²)² / (Σ |û|⁴) */
static double compute_hppp(int num_modes) {
    double sum2 = 0.0, sum4 = 0.0;
    for (int i = 0; i < num_modes; i++) {
        double ux = get_ux(i), uy = get_uy(i), uz = get_uz(i);
        double e = ux*ux + uy*uy + uz*uz;
        sum2 += e;
        sum4 += e * e;
    }
    if (sum4 < 1e-30) return 1.0;
    return (sum2 * sum2) / sum4;
}

/* Setup ICs — same as experiment_parametric.c */
static void setup_ic_distributed(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i);
        int ky = (int)c3d_get_ky(i);
        int kz = (int)c3d_get_kz(i);
        double k2 = (double)(kx*kx + ky*ky + kz*kz);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else { ux = 0.0; }
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
}

static void setup_ic_taylor_green(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    double a8 = amp / 8.0;
    int signs[8][3] = {{1,1,1},{1,1,-1},{1,-1,1},{1,-1,-1},{-1,1,1},{-1,1,-1},{-1,-1,1},{-1,-1,-1}};
    double uxv[8] = {a8,a8,a8,a8,-a8,-a8,-a8,-a8};
    double uyv[8] = {-a8,-a8,a8,a8,-a8,-a8,a8,a8};
    for (int m = 0; m < 8; m++) {
        for (int i = 0; i < num_modes; i++) {
            if (c3d_get_kx(i)==signs[m][0] && c3d_get_ky(i)==signs[m][1] && c3d_get_kz(i)==signs[m][2]) {
                buf_set(0,(double)i); buf_set(1,uxv[m]); buf_set(2,uyv[m]); buf_set(3,0.0);
                c3d_apply_state(); break;
            }
        }
    }
}

static void setup_ic_concentrated(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 != 1) continue;
        double phase = (double)i * 1.3;
        double ux = amp * sin(M_PI * phase);
        double uy = amp * sin(M_PI * (phase + 0.5));
        double uz = 0.0;
        if (kz != 0) uz = -((double)kx*ux + (double)ky*uy)/(double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0.0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
}

static void setup_ic(int num_modes, double amp, int ic_type) {
    switch(ic_type) {
        case 0: setup_ic_distributed(num_modes, amp); break;
        case 1: setup_ic_taylor_green(num_modes, amp); break;
        case 2: setup_ic_concentrated(num_modes, amp); break;
        default: setup_ic_distributed(num_modes, amp); break;
    }
}

/* Run with warm-up: let cascade establish before measuring blow-up */
static int run_with_warmup(int num_modes, double amp, double nu, double dt,
                           int warmup_steps, double hppp_threshold,
                           int measure_steps, double enstrophy_threshold,
                           int ic_type) {
    setup_ic(num_modes, amp, ic_type);
    buf_set(0, nu); buf_set(1, dt);

    /* Warm-up phase: run until H''' reaches threshold or warmup_steps exhausted */
    for (int step = 0; step < warmup_steps; step++) {
        c3d_do_step();
        if (step % 50 == 49) {
            double omega = get_enstrophy();
            if (omega > enstrophy_threshold || omega != omega) return 1;
            double hppp = compute_hppp(num_modes);
            if (hppp >= hppp_threshold) break; /* cascade established */
        }
    }

    /* Measurement phase: check for blow-up from the post-cascade state */
    for (int step = 0; step < measure_steps; step++) {
        c3d_do_step();
        if (step % 50 == 49) {
            double omega = get_enstrophy();
            if (omega > enstrophy_threshold || omega != omega) return 1;
        }
    }
    return 0;
}

/* Binary search for A* with warm-up */
static double find_astar_warmup(int num_modes, double nu, double dt,
                                int warmup_steps, double hppp_threshold,
                                int measure_steps, double enstrophy_threshold,
                                int ic_type) {
    double a_lo = 0.01, a_hi = 0.02;
    if (run_with_warmup(num_modes, a_lo, nu, dt, warmup_steps, hppp_threshold,
                        measure_steps, enstrophy_threshold, ic_type))
        return 0.0;

    for (int i = 0; i < 30; i++) {
        if (run_with_warmup(num_modes, a_hi, nu, dt, warmup_steps, hppp_threshold,
                            measure_steps, enstrophy_threshold, ic_type))
            break;
        a_lo = a_hi; a_hi *= 2.0;
        if (i == 29) return a_hi;
    }

    for (int i = 0; i < 14; i++) {
        double mid = 0.5 * (a_lo + a_hi);
        if (run_with_warmup(num_modes, mid, nu, dt, warmup_steps, hppp_threshold,
                            measure_steps, enstrophy_threshold, ic_type))
            a_hi = mid;
        else a_lo = mid;
    }
    return 0.5 * (a_lo + a_hi);
}

/* Also measure A* WITHOUT warm-up for comparison */
static int run_no_warmup(int num_modes, double amp, double nu, double dt,
                         int n_steps, double threshold, int ic_type) {
    setup_ic(num_modes, amp, ic_type);
    buf_set(0, nu); buf_set(1, dt);
    for (int step = 0; step < n_steps; step++) {
        c3d_do_step();
        if (step % 50 == 49) {
            double omega = get_enstrophy();
            if (omega > threshold || omega != omega) return 1;
        }
    }
    return 0;
}

static double find_astar_no_warmup(int num_modes, double nu, double dt,
                                   int n_steps, double threshold, int ic_type) {
    double a_lo = 0.01, a_hi = 0.02;
    if (run_no_warmup(num_modes, a_lo, nu, dt, n_steps, threshold, ic_type)) return 0.0;
    for (int i = 0; i < 30; i++) {
        if (run_no_warmup(num_modes, a_hi, nu, dt, n_steps, threshold, ic_type)) break;
        a_lo = a_hi; a_hi *= 2.0;
        if (i == 29) return a_hi;
    }
    for (int i = 0; i < 14; i++) {
        double mid = 0.5 * (a_lo + a_hi);
        if (run_no_warmup(num_modes, mid, nu, dt, n_steps, threshold, ic_type)) a_hi = mid;
        else a_lo = mid;
    }
    return 0.5 * (a_lo + a_hi);
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int total_steps = PARAM_STEPS;
    double threshold = PARAM_THRESHOLD;
    int ic_type = PARAM_IC_TYPE;
    int n_max_limit = PARAM_N_MAX;
    int warmup_steps = PARAM_WARMUP_STEPS;

    printf("############################################################\n");
    printf("#  3D NS A* — Spectral Participation (H''') Experiment     #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, threshold=%.0f\n", nu, dt, total_steps, threshold);
    printf("  IC type=%d, N_max=%d, warmup=%d steps\n\n", ic_type, n_max_limit, warmup_steps);

    /* Phase 1: Measure H''' evolution for each IC type at a fixed amplitude */
    printf("  === Phase 1: H''' evolution (A=0.5, N_max=4) ===\n\n");
    printf("  Step    H'''(dist)   H'''(TG)     H'''(conc)   Modes\n");
    printf("  ------  ----------   ----------   ----------   -----\n");

    int nm4 = (int)c3d_enumerate_modes(4);
    c3d_precompute_triads(4);

    for (int ic = 0; ic < 3; ic++) {
        setup_ic(nm4, 0.5, ic);
        buf_set(0, nu); buf_set(1, dt);
    }

    /* Run each IC type and track H''' */
    double hppp_vals[3][11]; /* 3 IC types, 11 time points */
    for (int ic = 0; ic < 3; ic++) {
        c3d_enumerate_modes(4);
        c3d_precompute_triads(4);
        setup_ic(nm4, 0.5, ic);
        buf_set(0, nu); buf_set(1, dt);

        for (int t = 0; t <= 10; t++) {
            hppp_vals[ic][t] = compute_hppp(nm4);
            for (int s = 0; s < 200; s++) c3d_do_step();
        }
    }

    for (int t = 0; t <= 10; t++) {
        printf("  %-6d  %-12.2f %-12.2f %-12.2f %d\n",
               t * 200, hppp_vals[0][t], hppp_vals[1][t], hppp_vals[2][t], nm4);
    }

    printf("\n  Key: H'''=1 means all energy in 1 mode, H'''=%d means fully spread\n\n", nm4);

    /* Phase 2: A* WITHOUT warm-up (baseline, matches previous experiments) */
    printf("  === Phase 2: A* WITHOUT warm-up (all IC types) ===\n\n");

    for (int ic = 0; ic < 3; ic++) {
        const char* ic_names[] = {"Distributed", "Taylor-Green", "Concentrated"};
        printf("  IC: %s\n", ic_names[ic]);
        printf("  N_max  A*(no warmup)  Time(s)\n");
        printf("  -----  ------------   -------\n");

        for (int n = 2; n <= n_max_limit; n++) {
            clock_t start = clock();
            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);
            double astar = find_astar_no_warmup(nm, nu, dt, total_steps, threshold, ic);
            double elapsed = (double)(clock() - start) / CLOCKS_PER_SEC;
            printf("  %-5d  %-14.6f %.1f\n", n, astar, elapsed);
            fflush(stdout);
        }
        printf("\n");
    }

    /* Phase 3: A* WITH warm-up (cascade established first) */
    printf("  === Phase 3: A* WITH warm-up (all IC types) ===\n");
    printf("  Warm-up: %d steps or until H''' > 0.3 * num_modes\n\n", warmup_steps);

    int measure_steps = total_steps - warmup_steps;
    if (measure_steps < 1000) measure_steps = 1000;

    for (int ic = 0; ic < 3; ic++) {
        const char* ic_names[] = {"Distributed", "Taylor-Green", "Concentrated"};
        printf("  IC: %s\n", ic_names[ic]);
        printf("  N_max  A*(warmup)     Time(s)\n");
        printf("  -----  ------------   -------\n");

        for (int n = 2; n <= n_max_limit; n++) {
            clock_t start = clock();
            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);
            double hppp_thr = 0.3 * (double)nm;
            double astar = find_astar_warmup(nm, nu, dt, warmup_steps, hppp_thr,
                                            measure_steps, threshold, ic);
            double elapsed = (double)(clock() - start) / CLOCKS_PER_SEC;
            printf("  %-5d  %-14.6f %.1f\n", n, astar, elapsed);
            fflush(stdout);
        }
        printf("\n");
    }

    /* Phase 4: Compute α for each combination */
    printf("  === Phase 4: Summary ===\n\n");
    printf("  If α(warmup) ≈ α(no_warmup) for distributed IC:\n");
    printf("    Warm-up doesn't change distributed results (expected)\n");
    printf("  If α(warmup) >> α(no_warmup) for concentrated IC:\n");
    printf("    The low α was a transient effect — cascade fixes it\n");
    printf("  If α(warmup) ≈ α(no_warmup) for concentrated IC:\n");
    printf("    The low α is fundamental, not transient\n\n");

    printf("############################################################\n");
    return 0;
}
