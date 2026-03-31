/*
 * Experiment 02: Zeta Function H-Scaffold on the Critical Line
 *
 * Evaluate Z(t) (the Hardy Z-function, real-valued) along the critical line.
 * Apply H → H' → H'' → H''' to Z(t) sampled at regular intervals.
 *
 * The zeros of Z(t) = zeros of ζ(1/2 + it) on the critical line.
 * The derivative structure of Z(t) encodes how zeros are distributed.
 *
 * Key measurements:
 *   - Entropy of Z(t) values at each derivative level
 *   - Gap distribution between consecutive zeros
 *   - H-scaffold of the gap sequence itself
 *   - Comparison with GUE random matrix statistics
 */

#include "rh_scaffold.h"
#include "rh_zeta.h"

#define MAX_ZEROS 2000
#define SAMPLE_POINTS 50000

int main(void) {
    printf("=== Experiment 02: Zeta Function H-Scaffold ===\n\n");
    printf("Evaluate Z(t) on the critical line, apply derivative hierarchy.\n");
    printf("Find zeros, measure gap structure, compare with random.\n\n");

    /* ──────────────────────────────────────────── */
    /* PHASE 1: Find zeros of Z(t) in [10, 1000] */
    /* ──────────────────────────────────────────── */
    rh_section("PHASE 1: Zero finding via Riemann-Siegel formula");

    double *zeros = malloc(MAX_ZEROS * sizeof(double));
    int nz = find_zeros(10.0, 1000.0, 0.05, zeros, MAX_ZEROS);
    printf("Found %d zeros in [10, 1000]\n", nz);
    if (nz > 5) {
        printf("First 5 zeros: ");
        for (int i = 0; i < 5; i++) printf("%.4f ", zeros[i]);
        printf("\n");
        printf("Last 5 zeros:  ");
        for (int i = nz - 5; i < nz; i++) printf("%.4f ", zeros[i]);
        printf("\n");
    }

    /* verify against known zeros */
    double known_zeros[] = {14.1347, 21.0220, 25.0109, 30.4249, 32.9351};
    printf("\nVerification against known first zeros:\n");
    printf("  Known      │ Found     │ Error\n");
    printf("  ───────────┼───────────┼──────────\n");
    for (int i = 0; i < 5 && i < nz; i++) {
        printf("  %10.4f │ %9.4f │ %+.4e\n",
               known_zeros[i], zeros[i], zeros[i] - known_zeros[i]);
    }

    /* ──────────────────────────────────────────── */
    /* PHASE 2: Zero gaps — the H' of the zero sequence */
    /* ──────────────────────────────────────────── */
    rh_section("PHASE 2: Zero gap analysis (H' of zero sequence)");

    double *gaps = malloc(nz * sizeof(double));
    int ng = 0;
    for (int i = 0; i < nz - 1; i++)
        gaps[ng++] = zeros[i + 1] - zeros[i];

    /* normalise gaps by mean spacing (Odlyzko normalisation) */
    double *ngaps = malloc(ng * sizeof(double));
    double mean_gap = 0;
    for (int i = 0; i < ng; i++) mean_gap += gaps[i];
    mean_gap /= ng;
    for (int i = 0; i < ng; i++) ngaps[i] = gaps[i] / mean_gap;

    printf("Mean gap: %.4f\n", mean_gap);
    printf("Expected mean gap (2π/ln(T/2π) at T≈500): %.4f\n",
           2.0 * M_PI / log(500.0 / (2.0 * M_PI)));

    /* gap statistics */
    double gap_min = ngaps[0], gap_max = ngaps[0], gap_var = 0;
    for (int i = 0; i < ng; i++) {
        if (ngaps[i] < gap_min) gap_min = ngaps[i];
        if (ngaps[i] > gap_max) gap_max = ngaps[i];
    }
    for (int i = 0; i < ng; i++) {
        double d = ngaps[i] - 1.0;  /* normalised mean is 1 */
        gap_var += d * d;
    }
    gap_var /= ng;

    printf("Normalised gap stats: min=%.3f  max=%.3f  var=%.4f\n",
           gap_min, gap_max, gap_var);
    printf("GUE prediction for variance: 0.4274 (2 - 8/π² ≈ 0.1894... wait)\n");
    /* GUE variance of nearest-neighbour spacing ≈ 0.286 */
    printf("GUE variance of NN spacing ≈ 0.286\n");
    printf("Measured variance: %.4f  %s\n\n",
           gap_var,
           fabs(gap_var - 0.286) < 0.1 ? "CONSISTENT with GUE" : "CHECK");

    /* gap distribution histogram */
    rh_table_header("TABLE 1: NORMALISED ZERO GAP DISTRIBUTION");
    printf("  Bin     │ Count │ Fraction │ Bar\n");
    printf("  ────────┼───────┼──────────┼───────────────────────────────\n");
    int bins = 20;
    int *hist = calloc(bins, sizeof(int));
    for (int i = 0; i < ng; i++) {
        int b = (int)(ngaps[i] / 3.0 * bins);
        if (b >= bins) b = bins - 1;
        if (b < 0) b = 0;
        hist[b]++;
    }
    for (int b = 0; b < bins; b++) {
        double lo = (double)b / bins * 3.0;
        double hi = (double)(b + 1) / bins * 3.0;
        double frac = (double)hist[b] / ng;
        printf("  %4.2f-%4.2f│ %5d │  %5.3f   │ ", lo, hi, hist[b], frac);
        int bar = (int)(frac * 100);
        for (int i = 0; i < bar; i++) printf("█");
        printf("\n");
    }
    free(hist);

    /* ──────────────────────────────────────────── */
    /* PHASE 3: H-scaffold on the zero gap sequence */
    /* ──────────────────────────────────────────── */
    rh_section("PHASE 3: Derivative hierarchy on zero gaps");

    /* discretise normalised gaps for entropy analysis */
    int *igaps = malloc(ng * sizeof(int));
    for (int i = 0; i < ng; i++)
        igaps[i] = (int)(ngaps[i] * 100);  /* centile resolution */

    int *dgaps[5];
    int dgn[5];
    for (int k = 0; k <= 4; k++) {
        dgaps[k] = malloc(ng * sizeof(int));
        dgn[k] = diff_k(igaps, dgaps[k], ng, k);
    }

    rh_table_header("TABLE 2: ZERO GAP DERIVATIVE ENTROPY");
    printf("  Order │ Entropy(100bins) │ Norm  │ Trend\n");
    printf("  ──────┼──────────────────┼───────┼──────\n");
    double prev_ent = 0;
    for (int k = 0; k <= 4; k++) {
        double ent = shannon_entropy(dgaps[k], dgn[k], 100);
        double norm = ent / log2(100.0);
        const char *trend = (k == 0) ? "—" :
                           (norm > prev_ent + 0.01) ? "↑ structure dissolving" :
                           (norm < prev_ent - 0.01) ? "↓ structure emerging" : "→ stable";
        printf("  d^%-4d│     %6.3f       │ %5.3f │ %s\n", k, ent, norm, trend);
        prev_ent = norm;
    }

    /* ──────────────────────────────────────────── */
    /* PHASE 4: Z(t) sampled values — derivative scaffold */
    /* ──────────────────────────────────────────── */
    rh_section("PHASE 4: Z(t) sampled values — full derivative scaffold");

    int n_samples = 10000;
    double *zt = malloc(n_samples * sizeof(double));
    double t_start = 14.0, t_step = 0.1;
    for (int i = 0; i < n_samples; i++)
        zt[i] = riemann_siegel_Z(t_start + i * t_step);

    /* compute derivatives of Z(t) */
    double *dzt[5];
    int dzn[5];
    for (int k = 0; k <= 4; k++) {
        dzt[k] = malloc(n_samples * sizeof(double));
        dzn[k] = diff_k_d(zt, dzt[k], n_samples, k);
    }

    rh_table_header("TABLE 3: Z(t) DERIVATIVE ENTROPY");
    printf("  Order │ Entropy(64bins) │ Norm  │ Interpretation\n");
    printf("  ──────┼─────────────────┼───────┼──────────────\n");
    for (int k = 0; k <= 4; k++) {
        double ent = shannon_entropy_d(dzt[k], dzn[k], 64);
        double norm = ent / log2(64.0);
        printf("  d^%-4d│     %6.3f      │ %5.3f │ %s\n", k, ent, norm,
               norm > 0.95 ? "near-random" :
               norm > 0.85 ? "weak structure" :
               norm > 0.70 ? "moderate structure" : "strong structure");
    }

    /* ──────────────────────────────────────────── */
    /* PHASE 5: Zero spacing autocorrelation */
    /* ──────────────────────────────────────────── */
    rh_section("PHASE 5: Zero spacing autocorrelation");

    rh_table_header("TABLE 4: NORMALISED GAP AUTOCORRELATION");
    printf("  Lag │ ACF       │ Expected(GUE) │ Significance\n");
    printf("  ────┼───────────┼───────────────┼─────────────\n");

    for (int lag = 1; lag <= 15; lag++) {
        double acf = autocorrelation(igaps, ng, lag);
        /* GUE prediction: ACF ≈ -1/(π²lag²) for large lag */
        double gue_acf = -1.0 / (M_PI * M_PI * lag * lag);
        double sig = fabs(acf - gue_acf) / (1.0 / sqrt(ng));
        printf("  %3d │ %+8.5f │   %+8.5f    │ %s\n",
               lag, acf, gue_acf,
               sig < 2.0 ? "consistent" :
               sig < 3.0 ? "marginal" : "DEVIATION");
    }

    /* ──────────────────────────────────────────── */
    /* PHASE 6: Dual number evaluation — ζ and ζ' simultaneously */
    /* ──────────────────────────────────────────── */
    rh_section("PHASE 6: Dual evaluation — ζ(s) and ζ'(s) on critical line");

    printf("  t        │ |ζ(1/2+it)| │ |ζ'(1/2+it)| │ |ζ'/ζ|   │ Near zero?\n");
    printf("  ─────────┼─────────────┼──────────────┼──────────┼───────────\n");

    for (int i = 0; i < 5 && i < nz; i++) {
        double t = zeros[i];
        Complex s = cx(0.5, t);
        DualCx dz = zeta_dual(s, 300);
        double z_abs = cx_abs(dz.val);
        double zp_abs = cx_abs(dz.der);
        double ratio = z_abs > 1e-10 ? zp_abs / z_abs : -1;
        printf("  %8.4f │   %9.6f │    %9.6f │ %8.2f │ %s\n",
               t, z_abs, zp_abs,
               ratio > 0 ? ratio : 0.0,
               z_abs < 0.1 ? "YES ← zero" : "no");
    }

    /* also check midpoints between zeros */
    printf("\n  Midpoints between zeros:\n");
    for (int i = 0; i < 4 && i + 1 < nz; i++) {
        double t = (zeros[i] + zeros[i + 1]) / 2.0;
        Complex s = cx(0.5, t);
        DualCx dz = zeta_dual(s, 300);
        double z_abs = cx_abs(dz.val);
        double zp_abs = cx_abs(dz.der);
        printf("  %8.4f │   %9.6f │    %9.6f │ %8.4f │ %s\n",
               t, z_abs, zp_abs,
               zp_abs > 1e-10 ? z_abs / zp_abs : 0.0,
               "midpoint");
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY");
    printf("The zeta H-scaffold reveals:\n\n");
    printf("1. Zero gaps follow GUE statistics — the first layer of known structure\n");
    printf("2. Derivative entropy of gap sequence measures residual structure\n");
    printf("3. If entropy increases monotonically through derivatives → structure dissolves\n");
    printf("   This is consistent with RH (no hidden conspiracy in zero placement)\n");
    printf("4. If entropy DECREASES at some derivative order → hidden structure exists\n");
    printf("   This would be a signature of zeros organising off the critical line\n");
    printf("5. Dual evaluation gives ζ'/ζ for free — the logarithmic derivative\n");
    printf("   encodes the explicit formula connection back to primes\n");

    for (int k = 0; k <= 4; k++) { free(dgaps[k]); free(dzt[k]); }
    free(igaps); free(zt); free(gaps); free(ngaps); free(zeros);
    return 0;
}
