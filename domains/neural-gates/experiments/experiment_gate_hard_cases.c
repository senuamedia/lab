/*
 * experiment_gate_hard_cases.c — Test scaffold on failure cases
 *
 * Three experiments:
 *   1. XOR data (single gate CANNOT solve — should diagnose failure)
 *   2. Concentric circles (nonlinear boundary — gate fails differently)
 *   3. High learning rate (η = 10, 50, 100 — should show divergence)
 *
 * The scaffold should produce DIFFERENT failure patterns for each case.
 * If it does, it's a genuine diagnostic, not just a convergence checker.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MAX_DIM 16
#define MAX_DATA 1024
#define MAX_STEPS 100000

typedef struct { int dim; double w[MAX_DIM]; double b; double eta; double temperature; } Gate;
typedef struct { int n; int dim; double x[MAX_DATA][MAX_DIM]; double y[MAX_DATA]; } Dataset;
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

extern void gate_init_seeded(Gate *g, int dim, double eta, double temp, int seed);
extern void gate_train(Gate *g, Dataset *d, int steps, Trajectory *traj);
extern void generate_linear_2d(Dataset *d, int n, double separation);
extern void generate_xor_2d(Dataset *d, int n);
extern void generate_concentric_2d(Dataset *d, int n);

static double contraction_ratio(double *a, double *b, double *c, int n) {
    double num = 0, den = 0;
    for (int i = 0; i < n; i++) {
        double d1 = b[i] - a[i], d2 = c[i] - b[i];
        den += d1 * d1; num += d2 * d2;
    }
    return (den > 1e-30) ? sqrt(num / den) : 0;
}

static void run_scaffold(const char *name, Dataset *data, double *etas, int num_etas, int steps) {
    printf("\n============================================================\n");
    printf("  %s\n", name);
    printf("============================================================\n\n");

    Trajectory *trajs = calloc(num_etas, sizeof(Trajectory));
    int min_steps = steps;

    /* Train at each η */
    for (int li = 0; li < num_etas; li++) {
        Gate g;
        gate_init_seeded(&g, data->dim, etas[li], 1.0, 42);
        gate_train(&g, data, steps, &trajs[li]);
        int s = trajs[li].num_steps - 1;
        printf("  η=%-8.4f L(0)=%.4f → L(T)=%.4f  ||∇||=%.6f  %s\n",
               etas[li], trajs[li].loss[0], trajs[li].loss[s],
               trajs[li].grad_norm[s],
               (isnan(trajs[li].loss[s]) || trajs[li].loss[s] > 1e6) ? "DIVERGED" : "OK");
        if (trajs[li].num_steps < min_steps) min_steps = trajs[li].num_steps;
    }

    /* Contraction ratios */
    printf("\n  Contraction ratios:\n");

    if (num_etas >= 3) {
        printf("  %-16s  max_ρ   Status\n", "Array");

        #define DO_ARRAY(label, field) { \
            double max_rho = 0; \
            for (int i = 0; i < num_etas - 2; i++) { \
                double rho = contraction_ratio(trajs[i].field, trajs[i+1].field, trajs[i+2].field, min_steps); \
                if (rho > max_rho) max_rho = rho; \
            } \
            printf("  %-16s  %6.4f  %s\n", label, max_rho, max_rho < 1.0 ? "PASS" : "FAIL"); \
        }

        DO_ARRAY("Loss", loss);
        DO_ARRAY("Weight norm", w_norm);
        DO_ARRAY("Gradient norm", grad_norm);
        DO_ARRAY("Activ mean", activation_mean);
        DO_ARRAY("Activ var", activation_var);
        #undef DO_ARRAY
    }

    /* Gradient cascade exponent for middle η */
    int mid = num_etas / 2;
    double sx = 0, sy = 0, sxy = 0, sx2 = 0;
    int valid = 0;
    for (int s = 10; s < trajs[mid].num_steps; s += 10) {
        if (trajs[mid].grad_norm[s] > 1e-20 && !isnan(trajs[mid].grad_norm[s])) {
            double lx = log((double)s), ly = log(trajs[mid].grad_norm[s]);
            sx += lx; sy += ly; sxy += lx * ly; sx2 += lx * lx;
            valid++;
        }
    }
    double gamma = 0;
    if (valid >= 2) {
        double d = valid * sx2 - sx * sx;
        if (fabs(d) > 1e-10) gamma = (valid * sxy - sx * sy) / d;
    }
    printf("\n  γ (at η=%.4f) = %.4f  %s\n", etas[mid], gamma,
           gamma < 0 ? "DECAYING" : gamma < 2 ? "GROWING" : "EXPLODING");

    free(trajs);
}

int main(void) {
    setbuf(stdout, NULL);

    printf("################################################################\n");
    printf("#  NEURAL GATE — HARD CASE DIAGNOSTICS                        #\n");
    printf("################################################################\n");

    /* Standard learning rates */
    double etas_std[] = {0.001, 0.01, 0.1, 0.3, 1.0};
    int n_std = 5;

    /* Extreme learning rates */
    double etas_extreme[] = {1.0, 3.0, 10.0, 30.0, 100.0};
    int n_extreme = 5;

    /* ── Experiment 1: XOR (impossible for single gate) ── */
    Dataset xor_data;
    generate_xor_2d(&xor_data, 200);
    run_scaffold("EXP 1: XOR DATA (single gate cannot solve)", &xor_data, etas_std, n_std, 5000);

    /* ── Experiment 2: Concentric circles (nonlinear boundary) ── */
    Dataset circle_data;
    generate_concentric_2d(&circle_data, 200);
    run_scaffold("EXP 2: CONCENTRIC CIRCLES (nonlinear boundary)", &circle_data, etas_std, n_std, 5000);

    /* ── Experiment 3: Linear data with EXTREME learning rates ── */
    Dataset linear_data;
    generate_linear_2d(&linear_data, 200, 0.0);
    run_scaffold("EXP 3: LINEAR DATA, EXTREME η (should diverge at high η)", &linear_data, etas_extreme, n_extreme, 2000);

    /* ── Experiment 4: Linear data for comparison ── */
    run_scaffold("EXP 4: LINEAR DATA, STANDARD η (baseline — should pass)", &linear_data, etas_std, n_std, 5000);

    printf("\n################################################################\n");
    printf("#  COMPARISON: Does the scaffold produce different patterns?   #\n");
    printf("################################################################\n\n");
    printf("  If the scaffold gives the SAME pattern for all four cases,\n");
    printf("  it's not a useful diagnostic. If the patterns DIFFER,\n");
    printf("  the scaffold discriminates failure modes.\n\n");

    return 0;
}
