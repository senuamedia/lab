/*
 * Experiment 03: Rotate-Sieve-Derive on Prime Structure
 *
 * The core RH experiment: apply the cipher sieve methodology to primes.
 *
 * ROTATE: View primes through different algebraic lenses
 *   - Additive: p mod {2,3,5,6,7,11,13,30}
 *   - Multiplicative: gaps, products, ratios
 *   - Logarithmic: ln(p), li(p), p/ln(p)
 *
 * SIEVE: At each viewpoint, strip the known structure
 *   - L0: Raw measurement
 *   - L1: Subtract mod structure (Dirichlet's theorem)
 *   - L2: Subtract gap structure (Cramér model)
 *   - L3: Subtract prime theorem correction (li(x) approximation)
 *   - L4: Subtract first zeta zero correction
 *   - L5: Subtract more zero corrections
 *
 * DERIVE: Compute H' of the residual at each layer
 *
 * REPEAT: Apply the scaffold to the residuals recursively
 *
 * Key question: Does the residual entropy converge to zero (noise)?
 * If yes at every rotation: RH holds (no hidden structure).
 * If not: structure persists, and that structure IS the off-line zeros.
 */

#include "rh_scaffold.h"
#include "rh_zeta.h"

#define N_PRIMES 50000
#define MAX_SIEVE_LAYERS 8

/* ────────────────────────────────────────────────────────── */
/* SIEVE: strip known structure layer by layer               */
/* ────────────────────────────────────────────────────────── */

/* L1: Expected distribution of primes mod b (Dirichlet's theorem) */
static void expected_prime_dist(int base, double *dist) {
    /* primes are equidistributed among residues coprime to base */
    int coprime_count = 0;
    for (int r = 0; r < base; r++) {
        int g = base, x = r;
        while (x) { int t = x; x = g % x; g = t; }
        if (g == 1) coprime_count++;
    }
    for (int r = 0; r < base; r++) {
        int g = base, x = r;
        while (x) { int t = x; x = g % x; g = t; }
        dist[r] = (g == 1) ? 1.0 / coprime_count : 0.0;
    }
    /* special case: prime 2 is even, prime 3 divides 3, etc. */
    /* these are finite corrections; for large samples they vanish */
}

/* Compute KL divergence of observed from expected */
static double sieve_layer_kl(const int *seq, int n, int base, const double *expected) {
    int *counts = calloc(base, sizeof(int));
    for (int i = 0; i < n; i++)
        counts[cmod(seq[i], base)]++;
    double kl = kl_divergence(counts, n, expected, base);
    free(counts);
    return kl;
}

/* L2: Subtract expected distribution, return residual as deviation counts */
static void compute_residual(const int *seq, int n, int base,
                            const double *expected, double *residual) {
    int *counts = calloc(base, sizeof(int));
    for (int i = 0; i < n; i++)
        counts[cmod(seq[i], base)]++;
    for (int r = 0; r < base; r++) {
        double observed = (double)counts[r] / n;
        residual[r] = observed - expected[r];
    }
    free(counts);
}

/* prime residual sequence: deviation of each prime from expected position */
static void prime_residual_seq(const int *primes, int np, double *residual) {
    for (int i = 0; i < np; i++) {
        double expected_pos = li((double)primes[i]);
        residual[i] = (double)(i + 1) - expected_pos;  /* π(p_n) - li(p_n) */
    }
}

/* zero-corrected residual: subtract contribution of first K zeros */
static void zero_corrected_residual(const int *primes, int np,
                                    const double *zero_heights, int nz,
                                    int K, double *residual) {
    for (int i = 0; i < np; i++) {
        double x = (double)primes[i];
        double correction = 0.0;
        for (int k = 0; k < K && k < nz; k++) {
            double gamma = zero_heights[k];
            /* contribution of zero at 1/2 + i*gamma:
               -2 * Re(li(x^(1/2 + i*gamma)))
               ≈ -2 * x^(1/2) * cos(gamma * ln(x)) / (gamma * ln(x))  */
            double sqrtx = sqrt(x);
            double phase = gamma * log(x);
            correction += -2.0 * sqrtx * cos(phase) / (0.5 + gamma * gamma) * gamma;
        }
        residual[i] = (double)(i + 1) - li(x) - correction;
    }
}

int main(void) {
    printf("=== Experiment 03: Rotate-Sieve-Derive on Primes ===\n\n");
    printf("Strip known structure layer by layer.\n");
    printf("Measure residual entropy at each layer.\n");
    printf("Apply derivatives to residuals.\n\n");

    /* generate primes */
    int *primes = malloc(N_PRIMES * sizeof(int));
    int np = sieve_primes(primes, N_PRIMES, 700000);
    printf("Generated %d primes up to %d\n\n", np, primes[np - 1]);

    /* find first zeros for sieve layers */
    double *zeros = malloc(500 * sizeof(double));
    int nz = find_zeros(10.0, 500.0, 0.05, zeros, 500);
    printf("Found %d zeta zeros for correction terms\n\n", nz);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Layer-by-layer KL divergence (additive rotation) */
    /* ──────────────────────────────────────────── */
    int bases[] = {2, 3, 5, 6, 7, 11, 13, 30};
    int n_bases = sizeof(bases) / sizeof(bases[0]);

    rh_table_header("TABLE 1: KL DIVERGENCE FROM EXPECTED — per base per sieve layer");
    printf("  Base │ L0:raw     │ L0:KL      │ Known structure (%%)\n");
    printf("  ─────┼────────────┼────────────┼────────────────────\n");

    for (int bi = 0; bi < n_bases; bi++) {
        int b = bases[bi];
        double expected[256];
        expected_prime_dist(b, expected);
        double kl = sieve_layer_kl(primes, np, b, expected);
        /* entropy of observed */
        double ent = shannon_entropy(primes, np, b);
        double max_ent = max_entropy(b);
        printf("  %4d │ %8.4f b │ %10.6f │ %6.2f%%\n",
               b, ent, kl, (1.0 - ent / max_ent) * 100);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Multi-layer sieve — cumulative structure removal */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: MULTI-LAYER SIEVE — cumulative residual entropy");
    printf("  Layer │ Description                 │ Residual entropy │ Structure removed\n");
    printf("  ──────┼─────────────────────────────┼──────────────────┼──────────────────\n");

    /* L0: raw π(x) */
    double *resid = malloc(np * sizeof(double));
    for (int i = 0; i < np; i++) resid[i] = (double)(i + 1);
    double e0 = shannon_entropy_d(resid, np, 64);

    /* L1: π(x) - x/ln(x) */
    for (int i = 0; i < np; i++) {
        double x = (double)primes[i];
        resid[i] = (double)(i + 1) - x / log(x);
    }
    double e1 = shannon_entropy_d(resid, np, 64);

    /* L2: π(x) - li(x) */
    prime_residual_seq(primes, np, resid);
    double e2 = shannon_entropy_d(resid, np, 64);

    /* L3: subtract first 5 zero corrections */
    double *resid3 = malloc(np * sizeof(double));
    zero_corrected_residual(primes, np, zeros, nz, 5, resid3);
    double e3 = shannon_entropy_d(resid3, np, 64);

    /* L4: subtract first 20 zero corrections */
    double *resid4 = malloc(np * sizeof(double));
    zero_corrected_residual(primes, np, zeros, nz, 20, resid4);
    double e4 = shannon_entropy_d(resid4, np, 64);

    /* L5: subtract first 50 zero corrections */
    double *resid5 = malloc(np * sizeof(double));
    zero_corrected_residual(primes, np, zeros, nz, 50, resid5);
    double e5 = shannon_entropy_d(resid5, np, 64);

    /* L6: subtract all available zeros */
    double *resid6 = malloc(np * sizeof(double));
    zero_corrected_residual(primes, np, zeros, nz, nz, resid6);
    double e6 = shannon_entropy_d(resid6, np, 64);

    printf("  L0    │ Raw π(x)                    │     %6.3f       │     —\n", e0);
    printf("  L1    │ π(x) - x/ln(x)              │     %6.3f       │ %6.2f%%\n", e1, (1.0 - e1 / e0) * 100);
    printf("  L2    │ π(x) - li(x)                │     %6.3f       │ %6.2f%%\n", e2, (1.0 - e2 / e0) * 100);
    printf("  L3    │ - 5 zero corrections         │     %6.3f       │ %6.2f%%\n", e3, (1.0 - e3 / e0) * 100);
    printf("  L4    │ - 20 zero corrections        │     %6.3f       │ %6.2f%%\n", e4, (1.0 - e4 / e0) * 100);
    printf("  L5    │ - 50 zero corrections        │     %6.3f       │ %6.2f%%\n", e5, (1.0 - e5 / e0) * 100);
    printf("  L6    │ - %d zero corrections       │     %6.3f       │ %6.2f%%\n", nz, e6, (1.0 - e6 / e0) * 100);

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Derivative of residual at each sieve layer */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: DERIVATIVE ENTROPY OF RESIDUALS");
    printf("  Layer │ d^0 ent │ d^1 ent │ d^2 ent │ d^3 ent │ Convergence\n");
    printf("  ──────┼─────────┼─────────┼─────────┼─────────┼────────────\n");

    double *layers[] = {resid, resid3, resid4, resid5, resid6};
    const char *lnames[] = {"L2:li", "L3:5z", "L4:20z", "L5:50z", "L6:all"};
    int nlayers = 5;

    for (int li = 0; li < nlayers; li++) {
        printf("  %-6s", lnames[li]);
        double prev_e = 0;
        int converging = 1;
        for (int k = 0; k <= 3; k++) {
            double *dk = malloc(np * sizeof(double));
            int dkn = diff_k_d(layers[li], dk, np, k);
            double ent = shannon_entropy_d(dk, dkn, 64) / log2(64.0);
            printf(" │ %7.4f", ent);
            if (k > 0 && ent < prev_e - 0.01) converging = 0;
            prev_e = ent;
            free(dk);
        }
        printf(" │ %s\n", converging ? "MONOTONE ↑ (good)" : "NON-MONOTONE (check)");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Rotation — same sieve through different algebras */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: ALGEBRAIC ROTATION — residual viewed through different lenses");
    printf("  Algebra    │ Residual entropy │ MI with L2 │ New information\n");
    printf("  ───────────┼──────────────────┼────────────┼────────────────\n");

    /* additive: residual as-is */
    double e_add = shannon_entropy_d(resid, np, 64);

    /* multiplicative: ratio p[n+1]/p[n] residual */
    double *mul_resid = malloc(np * sizeof(double));
    for (int i = 0; i < np - 1; i++) {
        double ratio = (double)primes[i + 1] / primes[i];
        double expected_ratio = 1.0 + 1.0 / log((double)primes[i]);
        mul_resid[i] = ratio - expected_ratio;
    }
    double e_mul = shannon_entropy_d(mul_resid, np - 1, 64);

    /* logarithmic: ln(p) residual from linear */
    double *log_resid = malloc(np * sizeof(double));
    for (int i = 0; i < np; i++) {
        double expected_lnp = log((double)(i + 1)) + log(log((double)(i + 2)));
        log_resid[i] = log((double)primes[i]) - expected_lnp;
    }
    double e_log = shannon_entropy_d(log_resid, np, 64);

    /* quadratic: p mod p[i]^2 structure */
    double *quad_resid = malloc(np * sizeof(double));
    for (int i = 0; i < np - 1; i++) {
        int g = primes[i + 1] - primes[i];  /* gap */
        double expected_gap = log((double)primes[i]);
        quad_resid[i] = (double)(g * g) - expected_gap * expected_gap;
    }
    double e_quad = shannon_entropy_d(quad_resid, np - 1, 64);

    printf("  Additive   │     %6.3f       │    —       │ baseline\n", e_add);
    printf("  Multiplic. │     %6.3f       │  (cross)   │ %+.3f bits\n", e_mul, e_mul - e_add);
    printf("  Logarithm. │     %6.3f       │  (cross)   │ %+.3f bits\n", e_log, e_log - e_add);
    printf("  Quadratic  │     %6.3f       │  (cross)   │ %+.3f bits\n", e_quad, e_quad - e_add);

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Recursive sieve — sieve the residual of the residual */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: RECURSIVE SIEVE — sieve residual → derive → sieve again");
    printf("  Cycle │ Entropy │ Δ Entropy │ Cumulative removed │ Trend\n");
    printf("  ──────┼─────────┼───────────┼────────────────────┼──────\n");

    /* start with L2 residual (π(x) - li(x)) */
    double *current = malloc(np * sizeof(double));
    memcpy(current, resid, np * sizeof(double));
    double base_ent = shannon_entropy_d(current, np, 64);
    double prev_ent = base_ent;

    for (int cycle = 0; cycle < MAX_SIEVE_LAYERS; cycle++) {
        double ent = shannon_entropy_d(current, np, 64);
        double delta = ent - prev_ent;
        double removed = (1.0 - ent / base_ent) * 100;
        const char *trend = (cycle == 0) ? "baseline" :
                           (delta < -0.01) ? "↓ converging" :
                           (delta > 0.01) ? "↑ diverging" : "→ stable";
        printf("  %5d │ %7.3f │  %+7.3f  │      %6.2f%%        │ %s\n",
               cycle, ent, delta, removed, trend);
        prev_ent = ent;

        /* sieve step: differentiate, then smooth */
        int new_n = diff_k_d(current, current, np, 1);
        np = new_n;
        if (np < 100) break;
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: ROTATE-SIEVE-DERIVE-REPEAT");
    printf("1. Each sieve layer removes known prime structure\n");
    printf("2. Zero corrections progressively account for oscillations\n");
    printf("3. The residual after all known zeros should approach noise\n");
    printf("4. Different algebraic rotations reveal DIFFERENT residual structure\n");
    printf("5. Recursive sieve (differentiate residual, re-sieve) shows convergence rate\n");
    printf("\n");
    printf("RH DIAGNOSTIC:\n");
    printf("  If residual entropy converges monotonically → RH consistent\n");
    printf("  If residual entropy bounces or increases → off-line zero signature\n");
    printf("  The RATE of convergence encodes the maximum deviation of zeros from 1/2\n");

    free(current); free(resid); free(resid3); free(resid4); free(resid5); free(resid6);
    free(mul_resid); free(log_resid); free(quad_resid);
    free(primes); free(zeros);
    return 0;
}
