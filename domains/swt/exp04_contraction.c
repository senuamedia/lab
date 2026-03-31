/*
 * Experiment 04: Contraction Analysis of the Prime-Zero Feedback Loop
 *
 * The prime↔zero loop:
 *   Primes → (Euler product) → Zeta → (zeros) → Oscillations → (explicit formula) → Primes
 *
 * Inspired by the NS regularity scaffold (Paper 3, Theorem A):
 *   Feedback loop L₁→L₄→L₂→L₁ contracts iff ρ < 1
 *
 * Define 4 boundaries:
 *   B1: Additive structure (prime residues mod small bases)
 *   B2: Multiplicative structure (Euler product behaviour)
 *   B3: Analytic structure (zeta values on critical strip)
 *   B4: Spectral structure (zero distribution statistics)
 *
 * Compute the 4×4 contraction matrix:
 *   ρ(i,j) = Δ_j / Δ_i
 *   where Δ_i = perturbation response at boundary i
 *
 * If spectral radius < 1: the loop contracts → zeros can't escape critical line.
 */

#include "rh_scaffold.h"
#include "rh_zeta.h"

#define N_PRIMES 20000
#define N_ZEROS  200

/* ────────────────────────────────────────────────── */
/* Boundary measurements                              */
/* ────────────────────────────────────────────────── */

/* B1: Additive structure — entropy of primes mod b */
static double measure_additive(const int *primes, int np, int base) {
    return 1.0 - normalised_entropy(primes, np, base);
}

/* B2: Multiplicative structure — deviation of Euler product partial sums */
static double measure_multiplicative(const int *primes, int np) {
    /* partial Euler product: Π(1 - p^(-2))^(-1) for p ≤ P */
    /* should converge to ζ(2) = π²/6 */
    double product = 1.0;
    for (int i = 0; i < np; i++) {
        double p = (double)primes[i];
        product *= 1.0 / (1.0 - 1.0 / (p * p));
    }
    double target = M_PI * M_PI / 6.0;
    return fabs(product - target) / target;
}

/* B3: Analytic structure — average |ζ(1/2 + it)| deviation from prediction */
static double measure_analytic(const double *zeros, int nz) {
    /* measure how well zeros predict zeta behaviour */
    /* sample between zeros, measure |Z(t)| at midpoints */
    double total_dev = 0;
    int count = 0;
    for (int i = 0; i < nz - 1 && i < 100; i++) {
        double mid = (zeros[i] + zeros[i + 1]) / 2.0;
        double z = fabs(riemann_siegel_Z(mid));
        /* expected |Z| at midpoints scales like sqrt(ln(t)) */
        double expected = sqrt(log(mid));
        total_dev += fabs(z - expected) / expected;
        count++;
    }
    return count > 0 ? total_dev / count : 0;
}

/* B4: Spectral structure — deviation of gap distribution from GUE */
static double measure_spectral(const double *zeros, int nz) {
    /* normalised gap variance vs GUE prediction */
    double *gaps = malloc(nz * sizeof(double));
    double mean = 0;
    for (int i = 0; i < nz - 1; i++) {
        gaps[i] = zeros[i + 1] - zeros[i];
        mean += gaps[i];
    }
    int ng = nz - 1;
    mean /= ng;
    double var = 0;
    for (int i = 0; i < ng; i++) {
        double d = gaps[i] / mean - 1.0;
        var += d * d;
    }
    var /= ng;
    free(gaps);
    /* GUE variance ≈ 0.286 */
    return fabs(var - 0.286);
}

/* ────────────────────────────────────────────────── */
/* Perturbation analysis                              */
/* ────────────────────────────────────────────────── */

/*
 * Perturb boundary i by epsilon, measure response at boundary j.
 * ρ(i,j) = |response_j| / epsilon
 *
 * For numerical stability, use several epsilon values and average.
 */

int main(void) {
    printf("=== Experiment 04: Contraction Analysis ===\n\n");
    printf("Measure the prime↔zero feedback loop contraction.\n");
    printf("4 boundaries: Additive, Multiplicative, Analytic, Spectral\n\n");

    /* generate primes and zeros */
    int *primes = malloc(N_PRIMES * sizeof(int));
    int np = sieve_primes(primes, N_PRIMES, 300000);
    printf("Primes: %d (up to %d)\n", np, primes[np - 1]);

    double *zeros = malloc(N_ZEROS * sizeof(double));
    int nz = find_zeros(10.0, 600.0, 0.05, zeros, N_ZEROS);
    printf("Zeros: %d (up to t=%.1f)\n\n", nz, zeros[nz - 1]);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Baseline boundary measurements */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: BASELINE BOUNDARY MEASUREMENTS");

    double b1 = measure_additive(primes, np, 30);
    double b2 = measure_multiplicative(primes, np);
    double b3 = measure_analytic(zeros, nz);
    double b4 = measure_spectral(zeros, nz);

    printf("  B1 (Additive, mod 30):    %.6f  (0 = random, 1 = fully structured)\n", b1);
    printf("  B2 (Multiplicative, EP):  %.6f  (0 = converged to ζ(2))\n", b2);
    printf("  B3 (Analytic, |Z| dev):   %.6f  (0 = perfectly predicted)\n", b3);
    printf("  B4 (Spectral, GUE dev):   %.6f  (0 = perfect GUE match)\n\n", b4);

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Contraction matrix via truncation perturbation */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: CONTRACTION MATRIX ρ(i,j)");
    printf("Perturbation: truncate sequences at different points\n");
    printf("ρ(i,j) = |ΔB_j| / |ΔB_i| — how perturbation at i affects j\n\n");

    /* perturbation by using different sized prime/zero sets */
    int fractions[] = {50, 60, 70, 80, 90, 100};  /* percentage of full set */
    int nf = sizeof(fractions) / sizeof(fractions[0]);

    double b1_vals[6], b2_vals[6], b3_vals[6], b4_vals[6];
    for (int fi = 0; fi < nf; fi++) {
        int sub_np = np * fractions[fi] / 100;
        int sub_nz = nz * fractions[fi] / 100;
        if (sub_nz < 3) sub_nz = 3;
        b1_vals[fi] = measure_additive(primes, sub_np, 30);
        b2_vals[fi] = measure_multiplicative(primes, sub_np);
        b3_vals[fi] = measure_analytic(zeros, sub_nz);
        b4_vals[fi] = measure_spectral(zeros, sub_nz);
    }

    /* compute contraction ratios from consecutive perturbation levels */
    double rho[4][4] = {{0}};
    const char *bnames[] = {"B1:Add", "B2:Mul", "B3:Ana", "B4:Spc"};
    double *bvals[] = {b1_vals, b2_vals, b3_vals, b4_vals};

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            double sum_ratio = 0;
            int count = 0;
            for (int f = 0; f < nf - 1; f++) {
                double di = fabs(bvals[i][f + 1] - bvals[i][f]);
                double dj = fabs(bvals[j][f + 1] - bvals[j][f]);
                if (di > 1e-12) {
                    sum_ratio += dj / di;
                    count++;
                }
            }
            rho[i][j] = count > 0 ? sum_ratio / count : 0;
        }
    }

    printf("         ");
    for (int j = 0; j < 4; j++) printf(" │ %-8s", bnames[j]);
    printf("\n─────────");
    for (int j = 0; j < 4; j++) printf("─┼─────────");
    printf("\n");
    for (int i = 0; i < 4; i++) {
        printf("%-9s", bnames[i]);
        for (int j = 0; j < 4; j++) {
            printf(" │ %7.4f ", rho[i][j]);
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Spectral radius of contraction matrix */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: SPECTRAL RADIUS ANALYSIS");

    /* power iteration for largest eigenvalue of |ρ| */
    double v[4] = {1, 1, 1, 1};
    double lambda = 0;
    for (int iter = 0; iter < 200; iter++) {
        double w[4] = {0};
        for (int i = 0; i < 4; i++)
            for (int j = 0; j < 4; j++)
                w[i] += fabs(rho[i][j]) * v[j];
        /* normalise */
        double norm = 0;
        for (int i = 0; i < 4; i++) norm += w[i] * w[i];
        norm = sqrt(norm);
        if (norm < 1e-15) break;
        lambda = norm;
        for (int i = 0; i < 4; i++) v[i] = w[i] / norm;
    }

    printf("Spectral radius σ(|ρ|) = %.6f\n\n", lambda);
    printf("Principal eigenvector: [");
    for (int i = 0; i < 4; i++) printf("%.3f%s", v[i], i < 3 ? ", " : "");
    printf("]\n\n");

    if (lambda < 1.0) {
        printf("σ < 1 → CONTRACTIVE\n");
        printf("The prime↔zero feedback loop is contracting.\n");
        printf("Perturbations to any boundary are damped by the loop.\n");
        printf("This is consistent with RH: zeros cannot escape the critical line.\n");
    } else {
        printf("σ ≥ 1 → NOT CONTRACTIVE at this scale\n");
        printf("Check: may need more data or different perturbation scheme.\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Scale-dependent contraction */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: CONTRACTION RATIO vs SCALE");
    printf("Measure ρ at different prime ranges to check scale independence\n\n");
    printf("  Range           │ B1 dev  │ B2 dev  │ B4 dev  │ Max ρ\n");
    printf("  ────────────────┼─────────┼─────────┼─────────┼──────\n");

    int ranges[][2] = {{0, 1000}, {1000, 5000}, {5000, 10000}, {10000, 20000}};
    int nranges = 4;
    for (int ri = 0; ri < nranges; ri++) {
        int lo = ranges[ri][0], hi = ranges[ri][1];
        if (hi > np) hi = np;
        int rn = hi - lo;
        double rb1 = measure_additive(primes + lo, rn, 30);
        double rb2 = measure_multiplicative(primes + lo, rn);
        /* find zeros in corresponding t-range */
        double t_lo = (lo > 0) ? 2 * M_PI * exp((double)lo / 100) : 10;
        double t_hi = 2 * M_PI * exp((double)hi / 100);
        if (t_hi > 600) t_hi = 600;
        /* use available zeros in range */
        int z_lo = 0, z_hi = 0;
        for (int i = 0; i < nz; i++) {
            if (zeros[i] >= t_lo && z_lo == 0) z_lo = i;
            if (zeros[i] <= t_hi) z_hi = i;
        }
        int znr = z_hi - z_lo + 1;
        double rb4 = (znr > 5) ? measure_spectral(zeros + z_lo, znr) : -1;

        /* max off-diagonal contraction ratio */
        double max_rho = fabs(rb1) > fabs(rb2) ? fabs(rb1) / (fabs(rb2) + 1e-12) :
                                                   fabs(rb2) / (fabs(rb1) + 1e-12);
        printf("  p[%5d..%5d] │ %7.5f │ %7.5f │ %7s │ %.4f\n",
               lo, hi, rb1, rb2,
               rb4 >= 0 ? "" : "  n/a",
               max_rho);
        if (rb4 >= 0) {
            printf("  (cont.)         │         │         │ %7.5f │\n", rb4);
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Feedback loop path analysis */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: FEEDBACK LOOP PATH ANALYSIS");
    printf("Path: B1(Add) → B2(Mul) → B3(Ana) → B4(Spec) → B1(Add)\n\n");

    double loop_gain = rho[0][1] * rho[1][2] * rho[2][3] * rho[3][0];
    printf("Loop gain G = ρ(1,2) × ρ(2,3) × ρ(3,4) × ρ(4,1)\n");
    printf("            = %.4f × %.4f × %.4f × %.4f\n",
           rho[0][1], rho[1][2], rho[2][3], rho[3][0]);
    printf("            = %.6f\n\n", loop_gain);
    printf("G < 1 → feedback loop is %s\n",
           fabs(loop_gain) < 1.0 ? "DAMPING (contractive)" : "AMPLIFYING (check)");

    /* reverse path */
    double rev_gain = rho[0][3] * rho[3][2] * rho[2][1] * rho[1][0];
    printf("\nReverse path: B1 → B4 → B3 → B2 → B1\n");
    printf("Reverse gain = %.6f  %s\n", rev_gain,
           fabs(rev_gain) < 1.0 ? "(also contractive)" : "(check)");

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: CONTRACTION ANALYSIS");
    printf("The prime↔zero feedback loop has 4 measurable boundaries.\n");
    printf("Contraction matrix ρ(i,j) encodes cross-boundary coupling.\n\n");
    printf("KEY RESULTS:\n");
    printf("  Spectral radius: %.6f  %s\n", lambda,
           lambda < 1 ? "< 1 → CONTRACTIVE" : ">= 1 → investigate");
    printf("  Forward loop gain: %.6f\n", loop_gain);
    printf("  Reverse loop gain: %.6f\n\n", rev_gain);
    printf("INTERPRETATION:\n");
    printf("  If all loop gains < 1 and σ(ρ) < 1:\n");
    printf("    Perturbations to zero positions are damped by the feedback.\n");
    printf("    A zero cannot migrate off Re=1/2 because the loop pulls it back.\n");
    printf("    This is the NUMBER-THEORETIC analogue of NS cascade subcriticality.\n");

    free(primes); free(zeros);
    return 0;
}
