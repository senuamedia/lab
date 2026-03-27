/*
 * experiment_gate_scaffold.c — Scaffold array diagnostics for neural gates
 *
 * Applies the multi-perspective scaffold framework to a neural gate's
 * learning trajectory. Scaffold levels are learning rates (η).
 *
 * Measures:
 *   - Loss trajectory contraction across η levels
 *   - Weight magnitude contraction
 *   - Per-weight gradient contraction
 *   - Activation distribution contraction
 *   - Gradient cascade exponent γ (gradient magnitude vs iteration)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* Gate solver API */
extern void gate_init_seeded(void *g, int dim, double eta, double temp, int seed);
extern void gate_train(void *g, void *d, int steps, void *traj);
extern void generate_linear_2d(void *d, int n, double separation);
extern void generate_xor_2d(void *d, int n);
extern double gate_loss(void *g, void *d);

/* Include gate_solver types directly for simplicity */
#define MAX_DIM 16
#define MAX_DATA 1024
#define MAX_STEPS 100000

typedef struct {
    int dim;
    double w[MAX_DIM];
    double b;
    double eta;
    double temperature;
} Gate;

typedef struct {
    int n;
    int dim;
    double x[MAX_DATA][MAX_DIM];
    double y[MAX_DATA];
} Dataset;

typedef struct {
    int num_steps;
    double loss[MAX_STEPS];
    double w_norm[MAX_STEPS];
    double grad_norm[MAX_STEPS];
    double grad_per_w[MAX_STEPS][MAX_DIM];
    double activation_mean[MAX_STEPS];
    double activation_var[MAX_STEPS];
    double w_trajectory[MAX_STEPS][MAX_DIM];
    double b_trajectory[MAX_STEPS];
} Trajectory;

/* ── Contraction ratio ── */

static double contraction_ratio(double *a, double *b, double *c, int n) {
    double num = 0, den = 0;
    for (int i = 0; i < n; i++) {
        double d1 = b[i] - a[i];
        double d2 = c[i] - b[i];
        den += d1 * d1;
        num += d2 * d2;
    }
    return (den > 1e-30) ? sqrt(num / den) : 0;
}

/* ── Main ── */

int main(void) {
    setbuf(stdout, NULL);

    printf("################################################################\n");
    printf("#  NEURAL GATE — SCAFFOLD ARRAY DIAGNOSTICS                   #\n");
    printf("#  Learning Rate Perspective Sweep                            #\n");
    printf("################################################################\n\n");

    /* Learning rate scaffold levels */
    double etas[] = {0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1.0};
    int num_levels = 7;
    int train_steps = 5000;
    int data_size = 200;

    /* Generate data */
    Dataset data;
    generate_linear_2d(&data, data_size, 0.0);
    printf("  Data: %d points, dim=%d, linearly separable\n", data.n, data.dim);
    printf("  Training steps: %d\n", train_steps);
    printf("  Scaffold levels: %d (η = 0.001 to 1.0)\n\n", num_levels);

    /* ============================================================
     * PHASE 1: Run scaffold — one trajectory per learning rate
     * ============================================================ */
    printf("============================================================\n");
    printf("  PHASE 1: TRAINING TRAJECTORIES\n");
    printf("============================================================\n\n");

    Trajectory *trajs = calloc(num_levels, sizeof(Trajectory));
    int min_steps = train_steps;

    for (int li = 0; li < num_levels; li++) {
        Gate g;
        gate_init_seeded(&g, 2, etas[li], 1.0, 42);

        printf("  η = %.4f: ", etas[li]);
        gate_train(&g, &data, train_steps, &trajs[li]);

        int s = trajs[li].num_steps - 1;
        printf("L(0)=%.4f → L(T)=%.4f, ||w||=%.4f, ||∇||=%.6f",
               trajs[li].loss[0], trajs[li].loss[s],
               trajs[li].w_norm[s], trajs[li].grad_norm[s]);

        /* Check for NaN/divergence */
        if (isnan(trajs[li].loss[s]) || trajs[li].loss[s] > 1e6) {
            printf("  DIVERGED\n");
        } else {
            printf("  OK\n");
        }

        if (trajs[li].num_steps < min_steps)
            min_steps = trajs[li].num_steps;
    }

    /* ============================================================
     * PHASE 2: Contraction ratios
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 2: CONTRACTION RATIOS\n");
    printf("============================================================\n\n");

    printf("  %-20s", "Array");
    for (int i = 0; i < num_levels - 2; i++)
        printf("  ρ(%.3f→%.3f→%.3f)", etas[i], etas[i+1], etas[i+2]);
    printf("  max_ρ   Status\n");

    #define PRINT_ARRAY(name, field) do { \
        printf("  %-20s", name); \
        double max_rho = 0; \
        for (int i = 0; i < num_levels - 2; i++) { \
            double rho = contraction_ratio( \
                trajs[i].field, trajs[i+1].field, trajs[i+2].field, min_steps); \
            if (rho > max_rho) max_rho = rho; \
            printf("  %18.4f", rho); \
        } \
        printf("  %6.4f  %s\n", max_rho, max_rho < 1.0 ? "PASS" : "FAIL"); \
    } while(0)

    PRINT_ARRAY("Loss",            loss);
    PRINT_ARRAY("Weight norm",     w_norm);
    PRINT_ARRAY("Gradient norm",   grad_norm);
    PRINT_ARRAY("Activation mean", activation_mean);
    PRINT_ARRAY("Activation var",  activation_var);

    #undef PRINT_ARRAY

    /* ============================================================
     * PHASE 3: Gradient cascade exponent
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 3: GRADIENT CASCADE EXPONENT\n");
    printf("============================================================\n\n");

    printf("  Fit |∇L(t)| ~ t^γ for each learning rate:\n\n");
    printf("  %-10s  %-10s  %-10s\n", "η", "γ", "Status");
    printf("  ──────────────────────────────\n");

    for (int li = 0; li < num_levels; li++) {
        /* Fit log(grad_norm) vs log(step) */
        double sx = 0, sy = 0, sxy = 0, sx2 = 0;
        int valid = 0;

        for (int s = 10; s < trajs[li].num_steps; s += 10) {
            if (trajs[li].grad_norm[s] > 1e-20 && !isnan(trajs[li].grad_norm[s])) {
                double lx = log((double)s);
                double ly = log(trajs[li].grad_norm[s]);
                sx += lx; sy += ly; sxy += lx * ly; sx2 += lx * lx;
                valid++;
            }
        }

        double gamma = 0;
        if (valid >= 2) {
            double d = valid * sx2 - sx * sx;
            if (fabs(d) > 1e-10)
                gamma = (valid * sxy - sx * sy) / d;
        }

        printf("  %-10.4f  %-10.4f  %s\n", etas[li], gamma,
               gamma < 0 ? "DECAYING (self-regularising)" :
               gamma < 2 ? "GROWING (subquadratic)" : "EXPLODING");
    }

    /* ============================================================
     * PHASE 4: Final state comparison
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 4: CONVERGENCE — DO ALL η REACH THE SAME SOLUTION?\n");
    printf("============================================================\n\n");

    printf("  %-10s  %-12s  %-12s  %-12s  %-10s\n",
           "η", "w[0]", "w[1]", "bias", "Final loss");
    printf("  ──────────────────────────────────────────────────────\n");

    for (int li = 0; li < num_levels; li++) {
        int s = trajs[li].num_steps - 1;
        if (s < 0 || isnan(trajs[li].loss[s])) {
            printf("  %-10.4f  DIVERGED\n", etas[li]);
            continue;
        }
        printf("  %-10.4f  %-12.6f  %-12.6f  %-12.6f  %-10.6f\n",
               etas[li],
               trajs[li].w_trajectory[s][0],
               trajs[li].w_trajectory[s][1],
               trajs[li].b_trajectory[s],
               trajs[li].loss[s]);
    }

    /* ============================================================
     * SUMMARY
     * ============================================================ */
    printf("\n################################################################\n");
    printf("#  NEURAL GATE SCAFFOLD SUMMARY                               #\n");
    printf("################################################################\n\n");

    /* Check if all non-diverged gates converged to same w* */
    double ref_w0 = 0, ref_w1 = 0;
    int ref_set = 0;
    double max_deviation = 0;

    for (int li = 0; li < num_levels; li++) {
        int s = trajs[li].num_steps - 1;
        if (s < 0 || isnan(trajs[li].loss[s]) || trajs[li].loss[s] > 1.0) continue;

        if (!ref_set) {
            ref_w0 = trajs[li].w_trajectory[s][0];
            ref_w1 = trajs[li].w_trajectory[s][1];
            ref_set = 1;
        } else {
            double dev = fabs(trajs[li].w_trajectory[s][0] - ref_w0)
                       + fabs(trajs[li].w_trajectory[s][1] - ref_w1);
            if (dev > max_deviation) max_deviation = dev;
        }
    }

    printf("  Max weight deviation across converged gates: %.6f\n", max_deviation);
    printf("  All converge to same w*? %s\n",
           max_deviation < 0.1 ? "YES (within tolerance)" : "NO (different fixed points)");
    printf("\n");

    free(trajs);
    return 0;
}
