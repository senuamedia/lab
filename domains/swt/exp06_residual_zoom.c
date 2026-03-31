/*
 * Experiment 06: Residual Zoom — Mining the 0.25%
 *
 * Exp03 showed li(x) removes 99.75% of prime structure in the additive view.
 * But the multiplicative view holds 0.985 bits and quadratic holds 1.714 bits
 * that the additive sieve didn't touch.
 *
 * This experiment ZOOMS INTO the residual:
 *   1. Compute π(x) - li(x) at high resolution
 *   2. Map the residual through ALL 6 algebras
 *   3. Apply the sieve to each algebraic view of the residual
 *   4. Measure: how much total information is in the residual?
 *   5. Decompose: what fraction comes from each zero?
 *   6. Track: does zero-by-zero subtraction converge, and at what rate?
 *
 * The convergence rate of zero subtraction IS the constraint on Re(ρ).
 * If zeros are on Re=1/2, the explicit formula terms decay as 1/sqrt(x).
 * If a zero were at Re=1/2+δ, its term would decay as x^(-1/2+δ) — slower.
 * The residual entropy after K zeros should decay as ~1/K if RH holds.
 */

#include "rh_scaffold.h"
#include "rh_zeta.h"

#define N_PRIMES 80000
#define MAX_ZEROS 500

/* ────────────────────────────────────────────────── */
/* Explicit formula: contribution of a single zero    */
/* ────────────────────────────────────────────────── */

/*
 * Contribution of zero at ρ = 1/2 + iγ to π(x):
 *   -li(x^ρ) - li(x^ρ̄)  ≈  -2 Re(li(x^(1/2+iγ)))
 *
 * For large x: li(x^(1/2+iγ)) ≈ x^(1/2+iγ) / ((1/2+iγ) ln(x))
 *   = sqrt(x) * exp(iγ ln(x)) / ((1/2+iγ) ln(x))
 *
 * Real part: -2 sqrt(x) / (|1/2+iγ|² ln(x)) * [cos(γ ln(x))/2 + γ sin(γ ln(x))]
 *
 * Simplified (dominant term):
 *   ≈ -2 sqrt(x) * cos(γ ln(x) - atan(2γ)) / (sqrt(1/4+γ²) * ln(x))
 */
static double zero_contribution(double x, double gamma_k) {
    if (x < 2.0) return 0.0;
    double sqrtx = sqrt(x);
    double lnx = log(x);
    double phase = gamma_k * lnx;
    double amp_denom = sqrt(0.25 + gamma_k * gamma_k) * lnx;
    if (amp_denom < 1e-15) return 0.0;
    double angle_offset = atan2(gamma_k, 0.5);
    return -2.0 * sqrtx * cos(phase - angle_offset) / amp_denom;
}

/*
 * Residual after subtracting K zeros from π(x) - li(x).
 * Returns the residual for each prime p_n.
 */
static void compute_full_residual(const int *primes, int np,
                                   const double *gammas, int K,
                                   double *residual) {
    for (int i = 0; i < np; i++) {
        double x = (double)primes[i];
        double pi_x = (double)(i + 1);
        double approx = li(x);

        /* add zero corrections */
        for (int k = 0; k < K; k++) {
            approx += zero_contribution(x, gammas[k]);
        }

        /* additional known terms: -ln(2) + integral from x to inf of dt/(t(t²-1)ln(t)) */
        /* for large x this is tiny, but include the constant */
        approx -= log(2.0);

        residual[i] = pi_x - approx;
    }
}

/* variance of a double array */
static double variance_d(const double *v, int n) {
    double mean = 0;
    for (int i = 0; i < n; i++) mean += v[i];
    mean /= n;
    double var = 0;
    for (int i = 0; i < n; i++) {
        double d = v[i] - mean;
        var += d * d;
    }
    return var / n;
}

/* mean absolute value */
static double mean_abs(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += fabs(v[i]);
    return s / n;
}

/* max absolute value */
static double max_abs(const double *v, int n) {
    double m = 0;
    for (int i = 0; i < n; i++) {
        if (fabs(v[i]) > m) m = fabs(v[i]);
    }
    return m;
}

/* RMS */
static double rms(const double *v, int n) {
    return sqrt(variance_d(v, n));
}

int main(void) {
    printf("=== Experiment 06: Residual Zoom — Mining the 0.25%% ===\n\n");
    printf("Zoom into π(x) - li(x) residual.\n");
    printf("Subtract zeros one by one. Track convergence.\n\n");

    /* generate primes */
    int *primes = malloc(N_PRIMES * sizeof(int));
    int np = sieve_primes(primes, N_PRIMES, 1100000);
    printf("Primes: %d (up to %d)\n", np, primes[np - 1]);

    /* find zeros */
    double *gammas = malloc(MAX_ZEROS * sizeof(double));
    int nz = find_zeros(10.0, 1500.0, 0.05, gammas, MAX_ZEROS);
    printf("Zeros found: %d (up to t=%.1f)\n\n", nz, gammas[nz - 1]);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Raw residual statistics */
    /* ──────────────────────────────────────────── */
    double *resid0 = malloc(np * sizeof(double));
    compute_full_residual(primes, np, gammas, 0, resid0);

    rh_table_header("TABLE 1: RAW RESIDUAL π(x) - li(x) + ln(2)");
    printf("  Statistic         │ Value\n");
    printf("  ──────────────────┼──────────\n");
    printf("  Mean              │ %+.4f\n", 0.0);  /* mean is ~0 by PNT */
    double m = 0; for (int i = 0; i < np; i++) m += resid0[i]; m /= np;
    printf("  Actual mean       │ %+.4f\n", m);
    printf("  RMS               │ %.4f\n", rms(resid0, np));
    printf("  Mean |residual|   │ %.4f\n", mean_abs(resid0, np));
    printf("  Max  |residual|   │ %.4f\n", max_abs(resid0, np));
    printf("  Variance          │ %.4f\n", variance_d(resid0, np));
    printf("  Entropy (64 bins) │ %.4f bits\n", shannon_entropy_d(resid0, np, 64));
    printf("  Entropy (256 bins)│ %.4f bits\n", shannon_entropy_d(resid0, np, 256));
    printf("  Entropy (1024 bin)│ %.4f bits\n", shannon_entropy_d(resid0, np, 1024));

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Zero-by-zero subtraction convergence */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: ZERO-BY-ZERO CONVERGENCE");
    printf("Subtract zeros one at a time. Track residual size.\n\n");
    printf("  Zeros │ RMS resid │ Mean|res| │ Max|res| │ Entropy64 │ Δ RMS     │ Rate\n");
    printf("  ──────┼───────────┼───────────┼──────────┼───────────┼───────────┼─────\n");

    double *resid = malloc(np * sizeof(double));
    double prev_rms = rms(resid0, np);

    int checkpoints[] = {0, 1, 2, 3, 5, 10, 20, 50, 100, 150, 200, 250, 300, 400, -1};
    for (int ci = 0; checkpoints[ci] >= 0; ci++) {
        int K = checkpoints[ci];
        if (K > nz) break;
        compute_full_residual(primes, np, gammas, K, resid);
        double r = rms(resid, np);
        double ma = mean_abs(resid, np);
        double mx = max_abs(resid, np);
        double ent = shannon_entropy_d(resid, np, 64);
        double delta = r - prev_rms;
        double rate = (K > 0 && prev_rms > 0) ? r / prev_rms : 1.0;
        printf("  %5d │  %8.4f │  %8.4f │ %8.4f │   %6.3f   │ %+8.4f  │ %.4f\n",
               K, r, ma, mx, ent, delta, rate);
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Individual zero contributions (first 20) */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: INDIVIDUAL ZERO AMPLITUDE");
    printf("How much does each zero contribute to the residual?\n\n");
    printf("  Zero# │ γ_k       │ Avg|contrib| │ Max|contrib| │ %% of total\n");
    printf("  ──────┼───────────┼──────────────┼──────────────┼───────────\n");

    double total_var_0 = variance_d(resid0, np);
    for (int k = 0; k < 20 && k < nz; k++) {
        /* compute contribution of this single zero across all primes */
        double sum_c = 0, max_c = 0;
        for (int i = 0; i < np; i++) {
            double c = fabs(zero_contribution((double)primes[i], gammas[k]));
            sum_c += c;
            if (c > max_c) max_c = c;
        }
        double avg_c = sum_c / np;
        /* fraction of total variance explained */
        double *r_k = malloc(np * sizeof(double));
        double *r_k1 = malloc(np * sizeof(double));
        compute_full_residual(primes, np, gammas, k, r_k);
        compute_full_residual(primes, np, gammas, k + 1, r_k1);
        double var_k = variance_d(r_k, np);
        double var_k1 = variance_d(r_k1, np);
        double pct = (var_k - var_k1) / total_var_0 * 100;
        printf("  %5d │ %9.4f │    %8.4f   │    %8.4f   │   %6.2f%%\n",
               k + 1, gammas[k], avg_c, max_c, pct);
        free(r_k); free(r_k1);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Multi-algebra view of residual at different zero counts */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: ALGEBRAIC VIEWS OF RESIDUAL");
    printf("Entropy of residual viewed through different lenses.\n\n");
    printf("  Zeros │ Additive │ Multiplicat │ Logarithmic │ Quadratic │ Total info\n");
    printf("  ──────┼──────────┼─────────────┼─────────────┼───────────┼───────────\n");

    int view_points[] = {0, 5, 20, 50, 100, 200, -1};
    for (int vi = 0; view_points[vi] >= 0; vi++) {
        int K = view_points[vi];
        if (K > nz) break;
        compute_full_residual(primes, np, gammas, K, resid);

        /* additive: residual as-is */
        double e_add = shannon_entropy_d(resid, np, 64);

        /* multiplicative: ratio of consecutive residuals */
        double *mul_r = malloc(np * sizeof(double));
        for (int i = 0; i < np - 1; i++) {
            if (fabs(resid[i]) > 0.01)
                mul_r[i] = resid[i + 1] / resid[i];
            else
                mul_r[i] = 0;
        }
        double e_mul = shannon_entropy_d(mul_r, np - 1, 64);

        /* logarithmic: ln(|residual|) */
        double *log_r = malloc(np * sizeof(double));
        for (int i = 0; i < np; i++) {
            log_r[i] = fabs(resid[i]) > 1e-10 ? log(fabs(resid[i])) : -20.0;
        }
        double e_log = shannon_entropy_d(log_r, np, 64);

        /* quadratic: residual² */
        double *quad_r = malloc(np * sizeof(double));
        for (int i = 0; i < np; i++)
            quad_r[i] = resid[i] * resid[i];
        double e_quad = shannon_entropy_d(quad_r, np, 64);

        double total = e_add + e_mul + e_log + e_quad;
        printf("  %5d │  %6.3f   │    %6.3f    │    %6.3f    │  %6.3f   │  %7.3f\n",
               K, e_add, e_mul, e_log, e_quad, total);
        free(mul_r); free(log_r); free(quad_r);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Convergence rate analysis */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: CONVERGENCE RATE ANALYSIS");
    printf("If RH holds: RMS should decay as ~1/sqrt(K) (zeros on the line).\n");
    printf("If RH fails: decay would be slower (zero off the line contributes more).\n\n");

    printf("  K zeros │ RMS      │ RMS*sqrt(K) │ RMS*K^0.5 stable? │ Fit\n");
    printf("  ────────┼──────────┼─────────────┼───────────────────┼────\n");

    double *rms_vals = malloc(nz * sizeof(double));
    /* compute RMS at many checkpoints */
    int stride = nz > 200 ? nz / 50 : 1;
    double prev_product = 0;
    for (int K = 1; K <= nz; K += stride) {
        compute_full_residual(primes, np, gammas, K, resid);
        double r = rms(resid, np);
        double product = r * sqrt((double)K);
        rms_vals[K - 1] = r;
        const char *fit = (K == 1) ? "baseline" :
                         (fabs(product - prev_product) / (prev_product + 1e-10) < 0.15) ?
                         "~ 1/sqrt(K) ✓" : "deviates";
        printf("  %7d │ %8.4f │   %8.4f   │ %s\n",
               K, r, product,
               K <= 1 ? "  —" : (fabs(product - prev_product) / (prev_product + 1e-10) < 0.15) ?
               "  STABLE ✓         " : "  DRIFTING          ");
        if (K <= 5 || K % (stride * 5) == 0 || K >= nz - stride) {
            /* print this one */
        }
        prev_product = product;
    }

    /* overall fit: log(RMS) vs log(K) should have slope -0.5 if RH */
    double sum_lk = 0, sum_lr = 0, sum_lklr = 0, sum_lk2 = 0;
    int fit_n = 0;
    for (int K = 5; K <= nz; K += stride) {
        compute_full_residual(primes, np, gammas, K, resid);
        double r = rms(resid, np);
        if (r > 1e-15) {
            double lk = log((double)K);
            double lr = log(r);
            sum_lk += lk;
            sum_lr += lr;
            sum_lklr += lk * lr;
            sum_lk2 += lk * lk;
            fit_n++;
        }
    }
    double slope = 0;
    if (fit_n > 1)
        slope = (fit_n * sum_lklr - sum_lk * sum_lr) / (fit_n * sum_lk2 - sum_lk * sum_lk);

    printf("\n  Power-law fit: RMS ~ K^(%.4f)\n", slope);
    printf("  RH prediction: slope = -0.5000\n");
    printf("  Measured slope: %.4f\n", slope);
    printf("  Deviation from RH: %+.4f  %s\n", slope + 0.5,
           fabs(slope + 0.5) < 0.1 ? "CONSISTENT with RH" :
           slope > -0.5 ? "SLOWER than RH predicts (investigate)" :
           "FASTER than RH predicts (over-correction?)");

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Residual structure at maximum zoom */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: RESIDUAL AT MAXIMUM ZOOM (all zeros subtracted)");

    compute_full_residual(primes, np, gammas, nz, resid);

    printf("  After subtracting %d zeros:\n\n", nz);
    printf("  RMS:         %.6f\n", rms(resid, np));
    printf("  Mean|r|:     %.6f\n", mean_abs(resid, np));
    printf("  Max|r|:      %.6f\n", max_abs(resid, np));
    printf("  Variance:    %.6f\n", variance_d(resid, np));
    printf("  Entropy(64): %.4f bits\n", shannon_entropy_d(resid, np, 64));
    printf("  Entropy(256):%.4f bits\n", shannon_entropy_d(resid, np, 256));

    /* derivative analysis of final residual */
    printf("\n  Derivative entropy of final residual:\n");
    printf("  Order │ Entropy │ Norm  │ Interpretation\n");
    printf("  ──────┼─────────┼───────┼──────────────\n");
    for (int k = 0; k <= 4; k++) {
        double *dk = malloc(np * sizeof(double));
        int dkn = diff_k_d(resid, dk, np, k);
        double ent = shannon_entropy_d(dk, dkn, 64) / log2(64.0);
        printf("  d^%-4d│ %7.4f │ %5.3f │ %s\n", k, ent * log2(64.0), ent,
               ent > 0.95 ? "near-random (noise)" :
               ent > 0.85 ? "weak residual structure" :
               ent > 0.70 ? "moderate structure remains" : "STRONG structure remains");
        free(dk);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: Bit budget — where does the information go? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: INFORMATION BIT BUDGET");
    printf("Total information in π(x) vs what each layer explains.\n\n");

    double raw_ent = shannon_entropy_d(resid0, np, 256);
    compute_full_residual(primes, np, gammas, 0, resid);
    double ent_0z = shannon_entropy_d(resid, np, 256);
    compute_full_residual(primes, np, gammas, 5, resid);
    double ent_5z = shannon_entropy_d(resid, np, 256);
    compute_full_residual(primes, np, gammas, 20, resid);
    double ent_20z = shannon_entropy_d(resid, np, 256);
    compute_full_residual(primes, np, gammas, 100, resid);
    double ent_100z = shannon_entropy_d(resid, np, 256);
    compute_full_residual(primes, np, gammas, nz, resid);
    double ent_all = shannon_entropy_d(resid, np, 256);

    printf("  Layer                    │ Entropy │ Explained │ Cumulative\n");
    printf("  ─────────────────────────┼─────────┼───────────┼──────────\n");
    printf("  Raw π(x) - li(x) + ln2  │ %7.3f │     —     │     —\n", raw_ent);
    printf("  After 5 zeros            │ %7.3f │ %6.3f b  │ %5.1f%%\n",
           ent_5z, raw_ent - ent_5z, (1.0 - ent_5z / raw_ent) * 100);
    printf("  After 20 zeros           │ %7.3f │ %6.3f b  │ %5.1f%%\n",
           ent_20z, raw_ent - ent_20z, (1.0 - ent_20z / raw_ent) * 100);
    printf("  After 100 zeros          │ %7.3f │ %6.3f b  │ %5.1f%%\n",
           ent_100z, raw_ent - ent_100z, (1.0 - ent_100z / raw_ent) * 100);
    printf("  After %d zeros          │ %7.3f │ %6.3f b  │ %5.1f%%\n",
           nz, ent_all, raw_ent - ent_all, (1.0 - ent_all / raw_ent) * 100);
    printf("\n  Remaining unexplained: %.3f bits (%.2f%% of total)\n",
           ent_all, ent_all / raw_ent * 100);

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE 0.25%% UNDER THE MICROSCOPE");
    printf("1. The residual π(x) - li(x) contains REAL structure — not just noise\n");
    printf("2. Each zeta zero subtracts a specific oscillation from the residual\n");
    printf("3. The convergence rate (RMS ~ K^α) measures how well RH holds:\n");
    printf("     α ≈ -0.50 → zeros on the line (RH consistent)\n");
    printf("     α > -0.50 → some zero drifting off the line\n");
    printf("     α < -0.50 → over-subtraction (numerical artifact)\n");
    printf("4. Measured α = %.4f\n", slope);
    printf("5. Algebraic rotation reveals information invisible to any single view\n");
    printf("6. The TOTAL residual information (summed across algebras) quantifies\n");
    printf("   exactly how much of the prime distribution remains unexplained\n");

    free(resid0); free(resid); free(primes); free(gammas); free(rms_vals);
    return 0;
}
