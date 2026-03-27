/*
 * gate_solver.c — Minimal neural gate with full gradient tracking
 *
 * A neural gate: gate(x) = σ(w · x + b)
 * where σ is the sigmoid, w is a weight vector, b is bias.
 *
 * The gate is a dynamical system: w(t+1) = w(t) - η ∇L(w(t))
 * We track the full trajectory and compute diagnostics for the
 * scaffold array.
 *
 * Loss: binary cross-entropy
 *   L = -[y log(p) + (1-y) log(1-p)]
 * where p = gate(x) and y is the label.
 *
 * Gradient:
 *   ∂L/∂w = (p - y) · x
 *   ∂L/∂b = (p - y)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MAX_DIM 16
#define MAX_DATA 1024
#define MAX_STEPS 100000

/* ── Gate state ── */

typedef struct {
    int dim;
    double w[MAX_DIM];
    double b;
    double eta;        /* learning rate */
    double temperature; /* for annealing: gate(x) = σ(w·x/T) */
} Gate;

/* ── Training data ── */

typedef struct {
    int n;             /* number of samples */
    int dim;
    double x[MAX_DATA][MAX_DIM];
    double y[MAX_DATA]; /* labels: 0 or 1 */
} Dataset;

/* ── Trajectory recording ── */

typedef struct {
    int num_steps;
    double loss[MAX_STEPS];
    double w_norm[MAX_STEPS];
    double grad_norm[MAX_STEPS];
    double grad_per_w[MAX_STEPS][MAX_DIM]; /* per-weight gradient */
    double activation_mean[MAX_STEPS];
    double activation_var[MAX_STEPS];
    double w_trajectory[MAX_STEPS][MAX_DIM];
    double b_trajectory[MAX_STEPS];
} Trajectory;

/* ── Sigmoid ── */

static double sigmoid(double z) {
    if (z > 20) return 1.0;
    if (z < -20) return 0.0;
    return 1.0 / (1.0 + exp(-z));
}

/* ── Forward pass ── */

static double gate_forward(Gate *g, double *x) {
    double z = g->b;
    for (int i = 0; i < g->dim; i++) z += g->w[i] * x[i];
    return sigmoid(z / g->temperature);
}

/* ── Loss (binary cross-entropy, averaged over dataset) ── */

static double gate_loss(Gate *g, Dataset *d) {
    double loss = 0;
    for (int i = 0; i < d->n; i++) {
        double p = gate_forward(g, d->x[i]);
        /* Clamp to avoid log(0) */
        if (p < 1e-15) p = 1e-15;
        if (p > 1.0 - 1e-15) p = 1.0 - 1e-15;
        loss += -(d->y[i] * log(p) + (1.0 - d->y[i]) * log(1.0 - p));
    }
    return loss / d->n;
}

/* ── Gradient computation ── */

static void gate_gradient(Gate *g, Dataset *d, double *grad_w, double *grad_b) {
    memset(grad_w, 0, g->dim * sizeof(double));
    *grad_b = 0;

    for (int i = 0; i < d->n; i++) {
        double p = gate_forward(g, d->x[i]);
        double err = (p - d->y[i]) / g->temperature;
        for (int j = 0; j < g->dim; j++) {
            grad_w[j] += err * d->x[i][j];
        }
        *grad_b += err;
    }

    /* Average over dataset */
    for (int j = 0; j < g->dim; j++) grad_w[j] /= d->n;
    *grad_b /= d->n;
}

/* ── SGD step ── */

static void gate_step(Gate *g, double *grad_w, double grad_b) {
    for (int i = 0; i < g->dim; i++) {
        g->w[i] -= g->eta * grad_w[i];
    }
    g->b -= g->eta * grad_b;
}

/* ── Activation statistics ── */

static void gate_activation_stats(Gate *g, Dataset *d, double *mean, double *var) {
    double sum = 0, sum2 = 0;
    for (int i = 0; i < d->n; i++) {
        double p = gate_forward(g, d->x[i]);
        sum += p;
        sum2 += p * p;
    }
    *mean = sum / d->n;
    *var = sum2 / d->n - (*mean) * (*mean);
}

/* ── Data generation ── */

void generate_linear_2d(Dataset *d, int n, double separation) {
    d->n = n;
    d->dim = 2;
    srand(42);
    for (int i = 0; i < n; i++) {
        double x1 = ((double)rand() / RAND_MAX) * 2.0 - 1.0;
        double x2 = ((double)rand() / RAND_MAX) * 2.0 - 1.0;
        d->x[i][0] = x1;
        d->x[i][1] = x2;
        d->y[i] = (x1 + x2 > separation) ? 1.0 : 0.0;
    }
}

void generate_xor_2d(Dataset *d, int n) {
    d->n = n;
    d->dim = 2;
    srand(42);
    for (int i = 0; i < n; i++) {
        double x1 = ((double)rand() / RAND_MAX) * 2.0 - 1.0;
        double x2 = ((double)rand() / RAND_MAX) * 2.0 - 1.0;
        d->x[i][0] = x1;
        d->x[i][1] = x2;
        d->y[i] = ((x1 > 0) != (x2 > 0)) ? 1.0 : 0.0;
    }
}

void generate_concentric_2d(Dataset *d, int n) {
    d->n = n;
    d->dim = 2;
    srand(42);
    for (int i = 0; i < n; i++) {
        double x1 = ((double)rand() / RAND_MAX) * 2.0 - 1.0;
        double x2 = ((double)rand() / RAND_MAX) * 2.0 - 1.0;
        d->x[i][0] = x1;
        d->x[i][1] = x2;
        d->y[i] = (x1 * x1 + x2 * x2 < 0.5) ? 1.0 : 0.0;
    }
}

/* ── Training with trajectory recording ── */

void gate_train(Gate *g, Dataset *d, int steps, Trajectory *traj) {
    traj->num_steps = 0;

    double grad_w[MAX_DIM];
    double grad_b;

    for (int step = 0; step < steps; step++) {
        /* Record state */
        if (traj->num_steps < MAX_STEPS) {
            int s = traj->num_steps;
            traj->loss[s] = gate_loss(g, d);

            double wnorm = 0;
            for (int i = 0; i < g->dim; i++) {
                traj->w_trajectory[s][i] = g->w[i];
                wnorm += g->w[i] * g->w[i];
            }
            traj->w_norm[s] = sqrt(wnorm);
            traj->b_trajectory[s] = g->b;

            gate_gradient(g, d, grad_w, &grad_b);

            double gnorm = 0;
            for (int i = 0; i < g->dim; i++) {
                traj->grad_per_w[s][i] = grad_w[i];
                gnorm += grad_w[i] * grad_w[i];
            }
            gnorm += grad_b * grad_b;
            traj->grad_norm[s] = sqrt(gnorm);

            double mean, var;
            gate_activation_stats(g, d, &mean, &var);
            traj->activation_mean[s] = mean;
            traj->activation_var[s] = var;

            traj->num_steps++;
        }

        /* Compute gradient and step */
        gate_gradient(g, d, grad_w, &grad_b);
        gate_step(g, grad_w, grad_b);
    }
}

/* ── Gate initialisation ── */

void gate_init(Gate *g, int dim, double eta, double temperature) {
    g->dim = dim;
    g->eta = eta;
    g->temperature = temperature;
    /* Small random weights */
    srand(137);
    for (int i = 0; i < dim; i++) {
        g->w[i] = ((double)rand() / RAND_MAX - 0.5) * 0.1;
    }
    g->b = 0.0;
}

/* Re-initialise with same seed for reproducibility across scaffold levels */
void gate_init_seeded(Gate *g, int dim, double eta, double temperature, int seed) {
    g->dim = dim;
    g->eta = eta;
    g->temperature = temperature;
    srand(seed);
    for (int i = 0; i < dim; i++) {
        g->w[i] = ((double)rand() / RAND_MAX - 0.5) * 0.1;
    }
    g->b = 0.0;
}
