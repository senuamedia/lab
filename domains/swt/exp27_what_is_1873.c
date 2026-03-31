/*
 * Experiment 27: What IS 1.873?
 *
 * The ratio appears in primes, Collatz, Fibonacci, palindromes.
 * It's not specific to any sequence. It's a property of... what?
 *
 * Approach: transform the value through every mathematical operation.
 * Look for a clean expression. Then derive WHY.
 *
 * Mathematically: the ratio R(k) = RMS(d^k x) / RMS(d^(k-1) x)
 * For white noise (flat spectrum): R → 2.0
 * For structured sequences: R < 2.0
 * The gap (2 - R) encodes the spectral shape.
 *
 * The discrete difference operator has transfer function:
 *   |H(ω)| = 2|sin(ω/2)|
 *
 * So R(k) = sqrt(∫ (2sin(ω/2))^(2k) S(ω) dω / ∫ (2sin(ω/2))^(2(k-1)) S(ω) dω)
 *
 * where S(ω) is the power spectrum of the sequence.
 *
 * For S(ω) ∝ ω^(-α):  R depends on α.
 *   α = 0 → white noise → R = 2.0
 *   α > 0 → smoother → R < 2.0
 *
 * Find the α that gives R = 1.873 at k=4.
 * Then find what α means for ALL the sequences in the cluster.
 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

#define PI 3.14159265358979323846

/* ────────────────────────────────────────────────── */
/* Compute the theoretical ratio for spectral exponent α */
/* ────────────────────────────────────────────────── */

/* integral of (2sin(ω/2))^(2k) * ω^(-α) from ε to π */
static double spectral_moment(int k, double alpha, int n_points) {
    double sum = 0;
    double dw = PI / n_points;
    for (int i = 1; i <= n_points; i++) {  /* skip ω=0 to avoid singularity */
        double w = i * dw;
        double sinterm = 2.0 * sin(w / 2.0);
        double power = pow(fabs(sinterm), 2.0 * k);
        double weight = pow(w, -alpha);
        sum += power * weight;
    }
    return sum * dw;
}

static double theoretical_ratio(int k, double alpha, int n_points) {
    double num = spectral_moment(k, alpha, n_points);
    double den = spectral_moment(k - 1, alpha, n_points);
    return den > 1e-30 ? sqrt(num / den) : 0;
}

/* ────────────────────────────────────────────────── */
/* Search for α that gives target ratio at order k    */
/* ────────────────────────────────────────────────── */
static double find_alpha(double target_ratio, int k, int n_points) {
    double lo = -1.0, hi = 3.0;
    for (int iter = 0; iter < 100; iter++) {
        double mid = (lo + hi) / 2.0;
        double r = theoretical_ratio(k, mid, n_points);
        if (r > target_ratio) lo = mid;
        else hi = mid;
    }
    return (lo + hi) / 2.0;
}

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

static int diff_k_d(const double *v, double *out, int n, int k) {
    if (k == 0) { memcpy(out, v, n * sizeof(double)); return n; }
    memcpy(out, v, n * sizeof(double));
    for (int order = 0; order < k && n > 1; order++) {
        for (int i = 0; i < n - 1; i++)
            out[i] = out[i + 1] - out[i];
        n--;
    }
    return n;
}

int main(void) {
    printf("=== Experiment 27: What IS 1.873? ===\n\n");
    printf("Transform the value. Derive it from spectral theory.\n");
    printf("Find the clean expression.\n\n");

    double R = 1.8731;  /* our measured ratio at d4/d3 */

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Mathematical transforms of 1.873 */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 1: MATHEMATICAL TRANSFORMS OF %.4f\n", R);
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Transform         │ Value        │ Close to?\n");
    printf("  ──────────────────┼──────────────┼──────────────────────────\n");
    printf("  R                 │ %12.8f │\n", R);
    printf("  2 - R             │ %12.8f │ gap from white noise\n", 2 - R);
    printf("  R/2               │ %12.8f │\n", R / 2);
    printf("  R²               │ %12.8f │ ≈ 3.508\n", R * R);
    printf("  √R               │ %12.8f │\n", sqrt(R));
    printf("  1/R               │ %12.8f │\n", 1.0 / R);
    printf("  R - 1             │ %12.8f │ excess over 1\n", R - 1);
    printf("  ln(R)             │ %12.8f │\n", log(R));
    printf("  R/π              │ %12.8f │\n", R / PI);
    printf("  π/R              │ %12.8f │\n", PI / R);
    printf("  R/e               │ %12.8f │\n", R / M_E);
    printf("  R/√2             │ %12.8f │\n", R / sqrt(2));
    printf("  R/φ (golden)     │ %12.8f │ φ=(1+√5)/2\n", R / ((1 + sqrt(5)) / 2));
    printf("  R×ln(2)          │ %12.8f │\n", R * log(2));
    printf("  2cos(π/R)        │ %12.8f │\n", 2 * cos(PI / R));
    printf("  2sin(π/(2R))     │ %12.8f │\n", 2 * sin(PI / (2 * R)));
    printf("  (2-R)×2π        │ %12.8f │\n", (2 - R) * 2 * PI);
    printf("  1/(2-R)          │ %12.8f │ ≈ 1/0.127 ≈ 7.88\n", 1.0 / (2 - R));
    printf("  R³               │ %12.8f │\n", R * R * R);
    printf("  e^(R-2)           │ %12.8f │ ≈ e^(-0.127)\n", exp(R - 2));
    printf("  2-4/R²           │ %12.8f │\n", 2 - 4.0 / (R * R));

    /* check common mathematical constants */
    printf("\n  Closest known constants:\n");

    typedef struct { const char *name; double value; } Constant;
    Constant consts[] = {
        {"15/8",            15.0 / 8},
        {"√(7/2)",         sqrt(7.0 / 2)},
        {"2cos(π/9)",      2 * cos(PI / 9)},
        {"2cos(π/8.5)",    2 * cos(PI / 8.5)},
        {"2cos(10°)",       2 * cos(10 * PI / 180)},
        {"2cos(11°)",       2 * cos(11 * PI / 180)},
        {"2cos(π/17.3)",   2 * cos(PI / 17.3)},
        {"2-1/8",           2 - 1.0 / 8},
        {"2-1/2π",         2 - 1.0 / (2 * PI)},
        {"2-1/e²",         2 - 1.0 / (M_E * M_E)},
        {"(1+√(13))/2",    (1 + sqrt(13)) / 2},
        {"3-√(5)/2",       3 - sqrt(5) / 2},
        {"e/√(2)",         M_E / sqrt(2)},
        {"ln(6.5)",         log(6.5)},
        {"√(3.508)",       sqrt(3.508)},
        {"2-2/(4π)",       2 - 2.0 / (4 * PI)},
        {"28/15",           28.0 / 15},
        {"√(2)+√(2)-√(2)", sqrt(2) + sqrt(2) - sqrt(2)},  /* just √2 */
        {"2·sin(1)",        2 * sin(1)},
        {"γ_1/π × 2.3",   14.1347 / PI * 2.3 / 2},  /* from first zero */
    };
    int nc = sizeof(consts) / sizeof(consts[0]);

    printf("  %-20s│ Value        │ Δ from R     │ Match?\n", "Expression");
    printf("  ──────────────────┼──────────────┼──────────────┼───────\n");
    for (int i = 0; i < nc; i++) {
        double delta = fabs(consts[i].value - R);
        if (delta < 0.01)
            printf("  %-20s│ %12.8f │ %+12.8f │ %s\n",
                   consts[i].name, consts[i].value, consts[i].value - R,
                   delta < 0.001 ? "*** MATCH" :
                   delta < 0.005 ? "**  close" : "*   near");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Spectral exponent derivation */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 2: SPECTRAL EXPONENT α\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Power spectrum S(ω) ∝ ω^(-α). Find α for each ratio.\n\n");

    int n_pts = 10000;
    printf("  Order │ Measured R │ α for this R │ Consistent?\n");
    printf("  ──────┼────────────┼──────────────┼────────────\n");

    /* measured ratios from exp01 */
    double measured[] = {0, 0.907, 1.741, 1.830, 1.873, 1.899, 1.916, 1.928, 1.937};
    double alphas[9];

    for (int k = 2; k <= 8; k++) {
        double alpha = find_alpha(measured[k], k, n_pts);
        alphas[k] = alpha;
        printf("  d%d/d%d│    %6.4f  │   %8.5f    │ %s\n",
               k, k - 1, measured[k], alpha,
               k >= 3 ? (fabs(alpha - alphas[3]) < 0.05 ? "YES ✓" : "no — varies") : "—");
    }

    printf("\n  If α is constant across orders → single spectral exponent.\n");
    printf("  If α varies → spectrum is not a simple power law.\n");

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Theoretical ratio curves for various α */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 3: THEORETICAL RATIO CURVES\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  α     │ d2/d1  │ d3/d2  │ d4/d3  │ d5/d4  │ d6/d5  │ Matches data?\n");
    printf("  ──────┼────────┼────────┼────────┼────────┼────────┼──────────────\n");

    double test_alphas[] = {0, 0.2, 0.4, 0.5, 0.6, 0.8, 1.0, 1.2, 1.5, 2.0};
    int nta = sizeof(test_alphas) / sizeof(test_alphas[0]);

    for (int ai = 0; ai < nta; ai++) {
        double a = test_alphas[ai];
        printf("  %5.2f │", a);
        double max_err = 0;
        for (int k = 2; k <= 6; k++) {
            double r = theoretical_ratio(k, a, n_pts);
            printf(" %6.4f │", r);
            double err = fabs(r - measured[k]);
            if (err > max_err) max_err = err;
        }
        printf(" %s\n", max_err < 0.01 ? "*** YES" :
                        max_err < 0.03 ? "**  close" :
                        max_err < 0.1 ? "*   partial" : "    no");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: What kind of spectrum gives 1.873?  */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 4: THE SPECTRAL IDENTITY OF 1.873\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* find best single α */
    double best_alpha = 0, best_err = 1e30;
    for (int ai = 0; ai < 2000; ai++) {
        double a = ai * 0.001;
        double total_err = 0;
        for (int k = 2; k <= 6; k++) {
            double r = theoretical_ratio(k, a, n_pts);
            double err = (r - measured[k]) * (r - measured[k]);
            total_err += err;
        }
        if (total_err < best_err) { best_err = total_err; best_alpha = a; }
    }

    printf("  Best-fit spectral exponent: α = %.4f\n", best_alpha);
    printf("  Fit error (RMS): %.6f\n\n", sqrt(best_err / 5));

    printf("  Verification — theoretical vs measured:\n");
    printf("  Order │ Measured │ Theory(α=%.3f) │ Error\n", best_alpha);
    printf("  ──────┼──────────┼─────────────────┼──────\n");
    for (int k = 2; k <= 8; k++) {
        double r = theoretical_ratio(k, best_alpha, n_pts);
        printf("  d%d/d%d│  %6.4f  │     %6.4f      │ %+.4f\n",
               k, k - 1, measured[k], r, r - measured[k]);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: What does α mean? */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 5: WHAT DOES α = %.3f MEAN?\n", best_alpha);
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  S(ω) ∝ ω^(-%.3f) means:\n\n", best_alpha);
    printf("  α = 0:   white noise (flat spectrum) → ratio = 2.0\n");
    printf("  α = 0.5: flicker noise (1/√f)       → ratio ≈ ?\n");
    printf("  α = 1:   pink noise (1/f)            → ratio ≈ ?\n");
    printf("  α = 2:   brown noise (1/f²)          → ratio ≈ ?\n\n");

    /* compute these reference values */
    for (int ai = 0; ai <= 20; ai++) {
        double a = ai * 0.1;
        double r = theoretical_ratio(4, a, n_pts);
        const char *name = "";
        if (ai == 0) name = "← WHITE";
        else if (ai == 5) name = "← 1/√f (flicker)";
        else if (ai == 10) name = "← 1/f (pink)";
        else if (ai == 20) name = "← 1/f² (brown)";
        if (fabs(a - best_alpha) < 0.05) name = "← *** OUR VALUE";
        printf("  α = %4.1f:  d4/d3 = %6.4f  %s\n", a, r, name);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Verify — generate synthetic sequences with α */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 6: SYNTHETIC VERIFICATION\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Generate random sequences with S(ω) ∝ ω^(-α). Measure ratio.\n\n");

    /* generate colored noise with spectral exponent α */
    int synth_n = 100000;
    double *synth = malloc(synth_n * sizeof(double));

    double test_as[] = {0.0, 0.5, best_alpha, 1.0, 1.5, 2.0};
    int ntest = sizeof(test_as) / sizeof(test_as[0]);

    printf("  α      │ d2/d1  │ d3/d2  │ d4/d3  │ d5/d4  │ Theory d4/d3\n");
    printf("  ───────┼────────┼────────┼────────┼────────┼─────────────\n");

    unsigned int rng = 0x12345678;
    for (int ti = 0; ti < ntest; ti++) {
        double a = test_as[ti];

        /* generate spectrum then IFFT (simplified: sum of sinusoids) */
        memset(synth, 0, synth_n * sizeof(double));
        for (int f = 1; f < synth_n / 2; f++) {
            double amplitude = pow((double)f, -a / 2.0);
            /* random phase */
            rng ^= rng << 13; rng ^= rng >> 17; rng ^= rng << 5;
            double phase = (double)rng / 4294967296.0 * 2 * PI;
            double omega = 2 * PI * f / synth_n;
            for (int i = 0; i < synth_n; i++)
                synth[i] += amplitude * cos(omega * i + phase);
        }

        /* measure ratios */
        double *s = malloc(synth_n * sizeof(double));
        memcpy(s, synth, synth_n * sizeof(double));
        int sn = synth_n;
        double prev_rms = 0;
        printf("  %6.3f │", a);
        for (int k = 0; k <= 4 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(s, s, sn, 1);
            double r = rms_d(s, sn);
            double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
            if (k >= 2) printf(" %6.4f │", ratio);
            prev_rms = r;
        }
        printf(" %6.4f %s\n", theoretical_ratio(4, a, n_pts),
               fabs(a - best_alpha) < 0.01 ? "← OUR α" : "");
        free(s);
    }
    free(synth);

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: WHAT IS 1.873?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  1.873 is the d4/d3 ratio of ANY sequence whose power spectrum\n");
    printf("  falls as ω^(-%.3f).\n\n", best_alpha);
    printf("  This is between:\n");
    printf("    white noise (α=0, ratio=2.0)  — completely random\n");
    printf("    pink noise  (α=1, ratio≈?)    — equal energy per octave\n\n");
    printf("  α ≈ %.3f means: the sequences in the 1.873 cluster have\n", best_alpha);
    printf("  SLIGHTLY more low-frequency content than white noise.\n");
    printf("  They're almost random, but with a gentle bias toward slow variation.\n\n");
    printf("  WHY do primes, Collatz, Fibonacci, and palindromes share this?\n");
    printf("  Because they all have the same spectral shape: ω^(-%.3f).\n", best_alpha);
    printf("  Different phases (independent melodies), same spectrum (same timbre).\n\n");
    printf("  The orchestra plays different tunes, but every instrument has\n");
    printf("  the same frequency response. The concert hall IS the integers.\n");
    printf("  And %.3f is the resonance frequency of the hall.\n", best_alpha);

    return 0;
}
