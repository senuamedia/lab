/*
 * experiment_parametric.c — Self-contained 3D NS A* computation
 *
 * Pure C — no Simplex runtime needed. Links with triad_kernel_v2.c only.
 * Parameters set via -D flags or params.h at compile time.
 *
 * Compile: clang -O3 -c experiment_parametric.c -o exp.o -DPARAM_NU=0.01 ...
 * Link:    clang -O2 exp.o triad_kernel_v2.o -o run -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>

/* Parameters — set via -D or params.h */
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
#define PARAM_IC_TYPE 0  /* 0=distributed, 1=taylor_green, 2=concentrated */
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 8
#endif

/* External functions from triad_kernel_v2.c */
extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_zero_state(int64_t num_modes);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);

/* Direct access to kernel state — we'll add these to the kernel */
extern double* c3d_get_state_ptr(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);

/* Helper: set shared buffer value */
static void buf_set(int idx, double val) {
    int64_t bits;
    memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx);
    c3d_buf_val(bits);
}

/* Direct state access for pure-C usage */
static double state_data_local[300000]; /* max 100K modes × 3 */
static int num_modes_local = 0;

/* Copy from kernel state to local */
static void sync_from_kernel(void) {
    /* We'll compute enstrophy directly in the kernel */
}

/* Setup IC: distributed energy, amplitude decaying as 1/|k| */
static void setup_ic_distributed(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i);
        int ky = (int)c3d_get_ky(i);
        int kz = (int)c3d_get_kz(i);
        double k2 = (double)(kx*kx + ky*ky + kz*kz);
        double km = sqrt(k2);
        if (km < 0.001) km = 1.0;

        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;

        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;

        /* Enforce divergence-free */
        if (kz != 0) {
            uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        } else if (ky != 0) {
            uy = -(double)kx * ux / (double)ky;
        } else {
            ux = 0.0; /* only uy, uz allowed */
        }

        /* Set state via buffer (single-param interface) */
        buf_set(0, (double)i);
        buf_set(1, ux);
        buf_set(2, uy);
        buf_set(3, uz);
        /* Apply state reads from buf[0..3] */
        extern int64_t c3d_apply_state(void);
        c3d_apply_state();
    }
}

/* Setup IC: Taylor-Green vortex on diagonal modes */
static void setup_ic_taylor_green(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    double a8 = amp / 8.0;

    /* Find and set the 8 diagonal modes (±1,±1,±1) */
    int signs[8][3] = {
        {1,1,1}, {1,1,-1}, {1,-1,1}, {1,-1,-1},
        {-1,1,1}, {-1,1,-1}, {-1,-1,1}, {-1,-1,-1}
    };
    double ux_vals[8] = {a8, a8, a8, a8, -a8, -a8, -a8, -a8};
    double uy_vals[8] = {-a8, -a8, a8, a8, -a8, -a8, a8, a8};

    for (int m = 0; m < 8; m++) {
        for (int i = 0; i < num_modes; i++) {
            if (c3d_get_kx(i) == signs[m][0] &&
                c3d_get_ky(i) == signs[m][1] &&
                c3d_get_kz(i) == signs[m][2]) {
                buf_set(0, (double)i);
                buf_set(1, ux_vals[m]);
                buf_set(2, uy_vals[m]);
                buf_set(3, 0.0);
                extern int64_t c3d_apply_state(void);
                c3d_apply_state();
                break;
            }
        }
    }
}

/* Setup IC: concentrated energy at |k|=1 shell only */
static void setup_ic_concentrated(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i);
        int ky = (int)c3d_get_ky(i);
        int kz = (int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 != 1) continue; /* only |k|=1 modes */

        double phase = (double)i * 1.3;
        double ux = amp * sin(M_PI * phase);
        double uy = amp * sin(M_PI * (phase + 0.5));
        double uz = 0.0;

        if (kz != 0) {
            uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        } else if (ky != 0) {
            uy = -(double)kx * ux / (double)ky;
        } else {
            ux = 0.0;
        }

        buf_set(0, (double)i);
        buf_set(1, ux);
        buf_set(2, uy);
        buf_set(3, uz);
        extern int64_t c3d_apply_state(void);
        c3d_apply_state();
    }
}

static void setup_ic(int num_modes, double amp, int ic_type) {
    switch (ic_type) {
        case 0: setup_ic_distributed(num_modes, amp); break;
        case 1: setup_ic_taylor_green(num_modes, amp); break;
        case 2: setup_ic_concentrated(num_modes, amp); break;
        default: setup_ic_distributed(num_modes, amp); break;
    }
}

/* Get enstrophy from kernel (returns i64 bits) */
static double get_enstrophy(void) {
    extern int64_t c3d_enstrophy(void);
    int64_t bits = c3d_enstrophy();
    double val;
    memcpy(&val, &bits, sizeof(double));
    return val;
}

/* Run trajectory, return 1 if blows up */
static int run_check(int num_modes, double amp, double nu, double dt,
                     int n_steps, double threshold, int ic_type) {
    setup_ic(num_modes, amp, ic_type);

    /* Set step params: buf[0]=nu, buf[1]=dt */
    buf_set(0, nu);
    buf_set(1, dt);

    for (int step = 0; step < n_steps; step++) {
        c3d_do_step();
        if (step % 100 == 99) {
            double omega = get_enstrophy();
            if (omega > threshold || omega != omega) return 1;
        }
    }
    return 0;
}

/* Binary search for A* */
static double find_astar(int num_modes, double nu, double dt,
                         int n_steps, double threshold, int ic_type) {
    double a_lo = 0.01, a_hi = 0.02;

    if (run_check(num_modes, a_lo, nu, dt, n_steps, threshold, ic_type))
        return 0.0;

    /* Bracket */
    for (int i = 0; i < 30; i++) {
        if (run_check(num_modes, a_hi, nu, dt, n_steps, threshold, ic_type))
            break;
        a_lo = a_hi;
        a_hi *= 2.0;
        if (i == 29) return a_hi; /* never blew up */
    }

    /* Bisect */
    for (int i = 0; i < 14; i++) {
        double mid = 0.5 * (a_lo + a_hi);
        if (run_check(num_modes, mid, nu, dt, n_steps, threshold, ic_type))
            a_hi = mid;
        else
            a_lo = mid;
    }
    return 0.5 * (a_lo + a_hi);
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    double threshold = PARAM_THRESHOLD;
    int ic_type = PARAM_IC_TYPE;
    int n_max_limit = PARAM_N_MAX;

    printf("############################################################\n");
    printf("#  3D NS A* — Parametric Experiment (Pure C)               #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, threshold=%.0f\n", nu, dt, n_steps, threshold);
    printf("  IC type=%d, N_max limit=%d\n\n", ic_type, n_max_limit);

    printf("  N_max  Modes   Triads       A*           Delta_A*     Time(s)\n");
    printf("  -----  ------  ----------   ----------   ----------   -------\n");

    double prev_astar = 0.0;

    for (int n_max = 2; n_max <= n_max_limit; n_max++) {
        clock_t start = clock();

        int64_t num_modes = c3d_enumerate_modes(n_max);
        int64_t num_triads = c3d_precompute_triads(n_max);

        double astar = find_astar((int)num_modes, nu, dt, n_steps, threshold, ic_type);

        clock_t end = clock();
        double elapsed = (double)(end - start) / CLOCKS_PER_SEC;

        printf("  %-5d  %-6lld  %-10lld   %-12.6f ", n_max,
               (long long)num_modes, (long long)num_triads, astar);

        if (n_max > 2)
            printf("%-12.6f ", astar - prev_astar);
        else
            printf("---          ");

        printf("%.1f\n", elapsed);
        fflush(stdout);

        prev_astar = astar;
    }

    /* Log-log fit */
    printf("\n  === Power-law fit: A*(N) = C * N^(-alpha) ===\n\n");

    /* Collect log-log data */
    double sum_x = 0, sum_y = 0, sum_xy = 0, sum_x2 = 0;
    int n_pts = 0;

    /* Re-run to collect (or store above — but this is simpler) */
    double a_vals[20];
    for (int n_max = 2; n_max <= n_max_limit; n_max++) {
        c3d_enumerate_modes(n_max);
        c3d_precompute_triads(n_max);
        int64_t nm = c3d_enumerate_modes(n_max);
        c3d_precompute_triads(n_max);
        a_vals[n_max] = find_astar((int)nm, nu, dt, n_steps, threshold, ic_type);
    }

    for (int n = 2; n <= n_max_limit; n++) {
        if (a_vals[n] > 0) {
            double lx = log((double)n);
            double ly = log(a_vals[n]);
            sum_x += lx;
            sum_y += ly;
            sum_xy += lx * ly;
            sum_x2 += lx * lx;
            n_pts++;
        }
    }

    double alpha = -(n_pts * sum_xy - sum_x * sum_y) / (n_pts * sum_x2 - sum_x * sum_x);
    double log_C = (sum_y + alpha * sum_x) / n_pts;
    double C = exp(log_C);

    printf("  alpha = %.4f\n", alpha);
    printf("  C     = %.4f\n", C);
    printf("  Regularity: H^s with s > %.2f\n", alpha);
    printf("  Margin above s_c=0.5: %.2f\n\n", alpha - 0.5);

    printf("############################################################\n");
    printf("#  RESULT: alpha = %.4f (needs alpha > 0.5 for regularity) #\n", alpha);
    printf("############################################################\n");

    return 0;
}
