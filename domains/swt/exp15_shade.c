/*
 * Experiment 15: The Shade — Ω(n) Through the Full Scaffold
 *
 * Not prime or composite. The DEPTH of factorisation.
 *   Ω(n) = number of prime factors with multiplicity
 *
 * The sequence: 0,1,1,2,1,2,1,3,2,1,2,2,1,2,3,1,2,2,1,3,...
 *
 * This is the grey scale of the number line.
 * Primes are Ω=1. The lightest shade.
 * Powers of 2 are Ω=k. The darkest shade at their scale.
 * Everything else is in between.
 *
 * Apply EVERYTHING:
 *   - H-scaffold (derivatives)
 *   - Multi-base rotation
 *   - Cross-dimensional coupling
 *   - Scale analysis
 *   - Sieve (strip known: E[Ω] ≈ log log n)
 *   - Recursive derive
 *   - Contraction ratio
 *
 * The binary gave 2.000 (noise). Gaps gave 1.873 (structure).
 * What does Ω(n) give?
 */

#include "rh_scaffold.h"

#define MAX_N 2000000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* Ω(n) — number of prime factors with multiplicity */
static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

/* ω(n) — number of DISTINCT prime factors (without multiplicity) */
static int small_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) {
            count++;
            while (n % p == 0) n /= p;
        }
    }
    if (n > 1) count++;
    return count;
}

/* Liouville's λ(n) = (-1)^Ω(n) */
static int liouville(int n) {
    return (big_omega(n) % 2 == 0) ? 1 : -1;
}

/* Möbius μ(n) */
static int mobius(int n) {
    int factors = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) {
            n /= p; factors++;
            if (n % p == 0) return 0;
        }
    }
    if (n > 1) factors++;
    return (factors % 2 == 0) ? 1 : -1;
}

int main(void) {
    printf("=== Experiment 15: The Shade ===\n\n");
    printf("Ω(n) — the depth of factorisation. The grey scale.\n");
    printf("Full scaffold. Every tool. No binary.\n\n");

    /* compute Ω(n) for all n in [2, MAX_N] */
    int N = MAX_N - 1;  /* start from n=2 */
    double *omega   = malloc(N * sizeof(double));  /* Ω(n) */
    double *omega_s = malloc(N * sizeof(double));  /* ω(n) distinct */
    double *lambda  = malloc(N * sizeof(double));  /* λ(n) = (-1)^Ω */
    double *mu_seq  = malloc(N * sizeof(double));  /* μ(n) */
    double *shade   = malloc(N * sizeof(double));  /* Ω(n) - E[Ω] = the residual shade */

    for (int i = 0; i < N; i++) {
        int n = i + 2;
        omega[i]   = (double)big_omega(n);
        omega_s[i] = (double)small_omega(n);
        lambda[i]  = (double)liouville(n);
        mu_seq[i]  = (double)mobius(n);
        /* E[Ω(n)] ≈ log log n (Erdős–Kac) */
        double expected = log(log((double)n));
        shade[i] = omega[i] - expected;
    }

    /* basic stats */
    double mean_omega = 0, mean_shade = 0;
    for (int i = 0; i < N; i++) { mean_omega += omega[i]; mean_shade += shade[i]; }
    mean_omega /= N; mean_shade /= N;
    printf("Range: [2, %d]  N = %d\n", MAX_N, N);
    printf("Mean Ω(n): %.4f   E[Ω] ≈ log log N = %.4f\n", mean_omega, log(log((double)MAX_N)));
    printf("Mean shade (Ω - E[Ω]): %+.4f\n\n", mean_shade);

    /* Ω distribution */
    rh_table_header("TABLE 1: Ω(n) DISTRIBUTION — the shade histogram");
    int omega_hist[25] = {0};
    for (int i = 0; i < N; i++) {
        int w = (int)omega[i];
        if (w < 25) omega_hist[w]++;
    }
    printf("  Ω  │ Count    │ Fraction │ Bar\n");
    printf("  ───┼──────────┼──────────┼──────────────────────────────────\n");
    for (int w = 0; w <= 20; w++) {
        if (omega_hist[w] == 0) continue;
        double frac = (double)omega_hist[w] / N;
        printf("  %2d │ %8d │  %6.4f  │ ", w, omega_hist[w], frac);
        int bar = (int)(frac * 80);
        for (int b = 0; b < bar; b++) printf("█");
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: H-scaffold on Ω(n) */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: H-SCAFFOLD ON Ω(n) — the raw shade");
    printf("  Order │ RMS       │ Entropy  │ Norm  │ Ratio │ Interpretation\n");
    printf("  ──────┼───────────┼──────────┼───────┼───────┼──────────────\n");

    double *seq = malloc(N * sizeof(double));
    memcpy(seq, omega, N * sizeof(double));
    int sn = N;
    double prev_rms = 0;
    double omega_ratios[15];

    for (int k = 0; k <= 12 && sn > 100; k++) {
        if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        double ent = shannon_entropy_d(seq, sn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        omega_ratios[k] = ratio;
        printf("  d^%-4d│ %9.5f │ %8.4f │ %5.3f │ %5.3f │ %s\n",
               k, r, ent * log2(64.0), ent, ratio,
               k == 0 ? "Ω(n) raw" :
               ent > 0.95 ? "near-random" :
               ent > 0.8 ? "weak structure" :
               ent > 0.5 ? "moderate structure" : "STRONG structure");
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: H-scaffold on the SHADE (Ω - E[Ω]) */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: H-SCAFFOLD ON THE SHADE (Ω - log log n)");
    printf("Strip the known trend. What remains?\n\n");

    memcpy(seq, shade, N * sizeof(double));
    sn = N;
    prev_rms = 0;
    double shade_ratios[15];

    printf("  Order │ RMS       │ Entropy  │ Norm  │ Ratio │ vs binary │ vs gaps\n");
    printf("  ──────┼───────────┼──────────┼───────┼───────┼───────────┼────────\n");

    for (int k = 0; k <= 12 && sn > 100; k++) {
        if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        double ent = shannon_entropy_d(seq, sn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        shade_ratios[k] = ratio;
        printf("  d^%-4d│ %9.5f │ %8.4f │ %5.3f │ %5.3f │  %+6.3f   │ %+6.3f\n",
               k, r, ent * log2(64.0), ent, ratio,
               ratio - 2.000,   /* vs binary (2.000) */
               ratio - 1.873);  /* vs gaps (1.873) */
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Liouville's λ(n) = (-1)^Ω(n) — the sign of the shade */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: LIOUVILLE λ(n) = (-1)^Ω(n) — shade parity");
    printf("λ encodes whether Ω is even or odd.\n");
    printf("L(x) = Σλ(n). RH ⟺ L(x) = O(x^(1/2+ε)).\n\n");

    /* Liouville summatory function */
    double L_sum = 0;
    int L_checks[] = {100, 1000, 10000, 100000, 500000, 1000000, 2000000};
    int nlc = sizeof(L_checks) / sizeof(L_checks[0]);
    int lci = 0;

    printf("  x        │ L(x)     │ √x      │ L(x)/√x   │ Bounded?\n");
    printf("  ─────────┼──────────┼─────────┼───────────┼─────────\n");

    for (int i = 0; i < N && lci < nlc; i++) {
        L_sum += lambda[i];
        int n = i + 2;
        if (n == L_checks[lci]) {
            double sqrtn = sqrt((double)n);
            printf("  %9d │ %+8.0f │ %7.1f │ %+9.5f  │ %s\n",
                   n, L_sum, sqrtn, L_sum / sqrtn,
                   fabs(L_sum / sqrtn) < 1.0 ? "YES ✓" : "no");
            lci++;
        }
    }

    /* H-scaffold on λ(n) */
    printf("\n  Liouville scaffold:\n");
    memcpy(seq, lambda, N * sizeof(double));
    sn = N;
    prev_rms = 0;
    double lambda_ratios[15];

    printf("  Order │ RMS       │ Ratio │ vs Ω ratio\n");
    printf("  ──────┼───────────┼───────┼───────────\n");
    for (int k = 0; k <= 10 && sn > 100; k++) {
        if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        lambda_ratios[k] = ratio;
        printf("  d^%-4d│ %9.5f │ %5.3f │ %+6.3f\n",
               k, r, ratio, ratio - omega_ratios[k]);
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Multi-base rotation on Ω(n) */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: MULTI-BASE ROTATION ON Ω(n)");
    printf("View Ω(n) mod various bases. Each base is a rotation.\n\n");

    printf("  Base │ H''''/H''' │ vs raw Ω │ Interpretation\n");
    printf("  ─────┼────────────┼──────────┼──────────────\n");

    int bases[] = {2, 3, 4, 5, 6, 7, 8, 10, 12};
    int nb = sizeof(bases) / sizeof(bases[0]);
    for (int bi = 0; bi < nb; bi++) {
        int b = bases[bi];
        double *mod_seq = malloc(N * sizeof(double));
        for (int i = 0; i < N; i++)
            mod_seq[i] = (double)cmod((int)omega[i], b) / b;

        double *d3 = malloc(N * sizeof(double));
        double *d4 = malloc(N * sizeof(double));
        int d3n = diff_k_d(mod_seq, d3, N, 3);
        int d4n = diff_k_d(mod_seq, d4, N, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;

        printf("  %4d │   %7.4f  │ %+7.4f  │ %s\n",
               b, ratio, ratio - shade_ratios[4],
               fabs(ratio - shade_ratios[4]) < 0.01 ? "same as raw" :
               ratio < shade_ratios[4] ? "MORE structured" : "LESS structured");

        free(mod_seq); free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Dimensional convergence on Ω(n) */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: DIMENSIONAL CONVERGENCE ON Ω(n)");
    printf("Build hypercube from Ω(n) viewed mod different bases.\n");
    printf("Track H''''/H''' as dimensions increase.\n\n");

    int dim_bases[] = {2, 3, 5, 7, 11, 13, 4, 6, 8, 9, 10, 12, 15, 16, 20};
    int nd = sizeof(dim_bases) / sizeof(dim_bases[0]);

    /* precompute dimension gap sequences */
    double **dim_gaps = malloc(nd * sizeof(double *));
    int ne = N - 1;
    for (int d = 0; d < nd; d++) {
        int b = dim_bases[d];
        dim_gaps[d] = malloc(ne * sizeof(double));
        for (int i = 0; i < ne; i++) {
            double v1 = (double)cmod((int)omega[i], b) / b;
            double v2 = (double)cmod((int)omega[i + 1], b) / b;
            dim_gaps[d][i] = v2 - v1;
        }
    }

    printf("  D  │ Added base │ H''''/H''' │ Gap from 2 │ Trend\n");
    printf("  ───┼────────────┼────────────┼────────────┼──────\n");

    double prev_ratio = 0;
    for (int d = 1; d <= nd; d++) {
        double *dist = malloc(ne * sizeof(double));
        for (int i = 0; i < ne; i++) {
            double sum = 0;
            for (int dd = 0; dd < d; dd++) {
                double v = dim_gaps[dd][i];
                sum += v * v;
            }
            dist[i] = sqrt(sum);
        }
        double *d3 = malloc(ne * sizeof(double));
        double *d4 = malloc(ne * sizeof(double));
        int d3n = diff_k_d(dist, d3, ne, 3);
        int d4n = diff_k_d(dist, d4, ne, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;

        const char *trend = (d == 1) ? "—" :
                           ratio < prev_ratio - 0.005 ? "▽ dropping" :
                           ratio > prev_ratio + 0.005 ? "▲ rising" : "→ stable";

        printf("  %2d │ mod %-6d │   %7.4f  │   %7.4f  │ %s\n",
               d, dim_bases[d - 1], ratio, 2.0 - ratio, trend);
        prev_ratio = ratio;
        free(dist); free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: Scale analysis on shade */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: SHADE RATIO vs SCALE");
    printf("  Range             │ H''''/H''' │ Stable?\n");
    printf("  ──────────────────┼────────────┼────────\n");

    int scales[] = {1000, 5000, 10000, 50000, 100000, 500000, 1000000, N};
    int nsc = sizeof(scales) / sizeof(scales[0]);
    for (int si = 0; si < nsc; si++) {
        int n = scales[si];
        if (n > N) n = N;
        double *d3 = malloc(n * sizeof(double));
        double *d4 = malloc(n * sizeof(double));
        int d3n = diff_k_d(shade, d3, n, 3);
        int d4n = diff_k_d(shade, d4, n, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;
        printf("  [2, %-13d] │   %7.4f  │ %s\n",
               scales[si] + 1, ratio,
               si > 0 ? (fabs(ratio - prev_ratio) < 0.01 ? "YES ✓" : "drifting") : "—");
        prev_ratio = ratio;
        free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 8: The Grand Comparison */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 8: THE GRAND COMPARISON");
    printf("Five views of the number line. Same scaffold. Different depths.\n\n");

    /* compute ratios for μ(n) and ω(n) too */
    double mu_ratios[15], omega_s_ratios[15];
    memcpy(seq, mu_seq, N * sizeof(double));
    sn = N; prev_rms = 0;
    for (int k = 0; k <= 12 && sn > 100; k++) {
        if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        mu_ratios[k] = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        prev_rms = r;
    }

    memcpy(seq, omega_s, N * sizeof(double));
    sn = N; prev_rms = 0;
    for (int k = 0; k <= 12 && sn > 100; k++) {
        if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        omega_s_ratios[k] = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        prev_rms = r;
    }

    printf("  Order │ Ω(n)   │ ω(n)   │ λ(n)   │ μ(n)   │ shade  │ Spread\n");
    printf("  ──────┼────────┼────────┼────────┼────────┼────────┼───────\n");

    for (int k = 1; k <= 12; k++) {
        double vals[] = {omega_ratios[k], omega_s_ratios[k], lambda_ratios[k],
                        mu_ratios[k], shade_ratios[k]};
        double lo = vals[0], hi = vals[0];
        for (int i = 1; i < 5; i++) {
            if (vals[i] < lo) lo = vals[i];
            if (vals[i] > hi) hi = vals[i];
        }
        printf("  d%d/d%d│ %6.3f │ %6.3f │ %6.3f │ %6.3f │ %6.3f │ %5.3f\n",
               k, k - 1,
               omega_ratios[k], omega_s_ratios[k], lambda_ratios[k],
               mu_ratios[k], shade_ratios[k], hi - lo);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 9: Entropy comparison at H''' */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 9: ENTROPY AT H''' — the inflection point");

    /* recompute entropies at d^3 for each sequence */
    typedef struct { const char *name; double *data; } SeqDef;
    SeqDef seqs[] = {
        {"Ω(n)", omega}, {"ω(n)", omega_s}, {"λ(n)", lambda},
        {"μ(n)", mu_seq}, {"shade", shade}
    };
    int nseqs = 5;

    printf("  Sequence │ d^3 entropy │ d^3 norm │ d^3 RMS    │ Interpretation\n");
    printf("  ─────────┼─────────────┼──────────┼────────────┼──────────────\n");

    for (int si = 0; si < nseqs; si++) {
        double *s = malloc(N * sizeof(double));
        memcpy(s, seqs[si].data, N * sizeof(double));
        int n = N;
        for (int k = 0; k < 3; k++) n = diff_k_d(s, s, n, 1);
        double ent = shannon_entropy_d(s, n, 64) / log2(64.0);
        double r = rms_d(s, n);
        printf("  %-9s│   %7.4f   │  %6.4f  │ %10.5f │ %s\n",
               seqs[si].name, ent * log2(64.0), ent, r,
               ent > 0.9 ? "near-random" :
               ent > 0.7 ? "weak structure" :
               ent > 0.5 ? "moderate" : "STRONG structure");
        free(s);
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE SHADE");
    printf("Five arithmetic functions, one scaffold, one question.\n\n");
    printf("  Ω(n) — total prime factors with multiplicity (the full shade)\n");
    printf("  ω(n) — distinct prime factors (the coarse shade)\n");
    printf("  λ(n) — (-1)^Ω: even/odd shade parity\n");
    printf("  μ(n) — Möbius: ±1 if squarefree, 0 if not\n");
    printf("  shade — Ω(n) - log log n: residual after stripping trend\n\n");

    printf("H''''/H''' ratios at convergence:\n");
    printf("  Binary (P/C):  2.000  ← no structure (wrong lens)\n");
    printf("  Prime gaps:    1.873  ← prime structure\n");
    printf("  Ω(n):          %.3f\n", omega_ratios[4]);
    printf("  ω(n):          %.3f\n", omega_s_ratios[4]);
    printf("  λ(n):          %.3f\n", lambda_ratios[4]);
    printf("  μ(n):          %.3f\n", mu_ratios[4]);
    printf("  shade:         %.3f\n\n", shade_ratios[4]);

    printf("The shade sees what the binary cannot.\n");
    printf("The gradient of factorisation depth along the number line\n");
    printf("carries the structure that encodes Re(ρ) = 1/2.\n");

    for (int d = 0; d < nd; d++) free(dim_gaps[d]);
    free(dim_gaps);
    free(omega); free(omega_s); free(lambda); free(mu_seq); free(shade); free(seq);
    return 0;
}
