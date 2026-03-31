/*
 * Experiment 14: The Binary Sequence — Prime Is 1, Composite Is 0
 *
 * Strip everything back to the definition.
 * A prime cannot be decomposed. A composite can.
 * The number line is: 0,0,1,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,...
 *
 * This binary string IS the Riemann Hypothesis.
 * RH says: the running average of this string approaches 1/ln(n),
 * and the ERROR in that average is bounded by sqrt(n).
 *
 * So: where is 1/2 in this pattern?
 *
 * Look at:
 *   1. The binary string itself: transitions P→C, C→P, C→C, P→P
 *   2. The running density: fraction of 1s in window
 *   3. The transition pattern: how the P/C boundary moves
 *   4. The gap between definition: what makes a number "almost prime"?
 *   5. The leeway: the boundary region where primality is decided
 */

#include "rh_scaffold.h"

#define MAX_N 2000000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

int main(void) {
    printf("=== Experiment 14: The Binary Sequence ===\n\n");
    printf("Prime = 1. Composite = 0. Nothing else.\n");
    printf("Where is 1/2 in this pattern?\n\n");

    /* sieve */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    /* the binary sequence: b[n] = 1 if n is prime, 0 if composite */
    double *binary = malloc(MAX_N * sizeof(double));
    int n_start = 2;
    int N = MAX_N - n_start;
    for (int i = 0; i < N; i++)
        binary[i] = sieve[i + n_start] ? 0.0 : 1.0;

    /* count */
    int n_primes = 0;
    for (int i = 0; i < N; i++) n_primes += (int)binary[i];
    printf("Sequence: %d integers [2, %d]\n", N, MAX_N);
    printf("Primes: %d  Composites: %d  Density: %.6f\n\n",
           n_primes, N - n_primes, (double)n_primes / N);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: The transition matrix */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: TRANSITION MATRIX");
    printf("What follows a prime? What follows a composite?\n\n");

    int pp = 0, pc = 0, cp = 0, cc = 0;
    for (int i = 0; i < N - 1; i++) {
        int a = (int)binary[i], b = (int)binary[i + 1];
        if (a && b) pp++;
        else if (a && !b) pc++;
        else if (!a && b) cp++;
        else cc++;
    }

    printf("              │ Next=P    │ Next=C    │ P(next=P)\n");
    printf("  ────────────┼───────────┼───────────┼──────────\n");
    printf("  Current=P   │ %9d │ %9d │ %.6f\n", pp, pc, (double)pp / (pp + pc));
    printf("  Current=C   │ %9d │ %9d │ %.6f\n", cp, cc, (double)cp / (cp + cc));
    printf("\n");
    printf("  P(P|P) = %.6f    (probability prime follows prime)\n", (double)pp / (pp + pc));
    printf("  P(P|C) = %.6f    (probability prime follows composite)\n", (double)cp / (cp + cc));
    printf("  Overall P(P) = %.6f\n\n", (double)n_primes / N);

    double p_given_p = (double)pp / (pp + pc);
    double p_given_c = (double)cp / (cp + cc);
    printf("  Ratio P(P|P) / P(P|C) = %.6f\n", p_given_p / p_given_c);
    printf("  If = 1.0: no memory. Primes don't care what came before.\n");
    printf("  If ≠ 1.0: primes have memory. The pattern matters.\n");

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Run lengths — consecutive P and C */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: RUN LENGTHS");
    printf("How many consecutive primes (P-runs) and composites (C-runs)?\n\n");

    int p_runs[100] = {0}, c_runs[100] = {0};
    int run = 1;
    int max_p_run = 0, max_c_run = 0;
    int n_p_runs = 0, n_c_runs = 0;
    for (int i = 1; i < N; i++) {
        if ((int)binary[i] == (int)binary[i - 1]) {
            run++;
        } else {
            int is_p = (int)binary[i - 1];
            if (is_p) {
                if (run < 100) p_runs[run]++;
                if (run > max_p_run) max_p_run = run;
                n_p_runs++;
            } else {
                if (run < 100) c_runs[run]++;
                if (run > max_c_run) max_c_run = run;
                n_c_runs++;
            }
            run = 1;
        }
    }

    printf("  P-run │ Count  │ Fraction ││ C-run │ Count  │ Fraction\n");
    printf("  ──────┼────────┼──────────┼┼───────┼────────┼─────────\n");
    int show = max_p_run > 10 ? 10 : max_p_run;
    int show_c = max_c_run > 30 ? 30 : max_c_run;
    for (int r = 1; r <= (show > show_c ? show : show_c); r++) {
        if (r <= show)
            printf("  %5d │ %6d │  %6.4f  │", r, p_runs[r], (double)p_runs[r] / n_p_runs);
        else
            printf("        │        │          │");
        if (r <= show_c)
            printf("│ %5d │ %6d │  %6.4f\n", r, c_runs[r], (double)c_runs[r] / n_c_runs);
        else
            printf("│\n");
    }
    printf("\n  Max P-run: %d (twin primes etc.)\n", max_p_run);
    printf("  Max C-run: %d (prime desert)\n", max_c_run);
    printf("  Mean P-run: %.3f\n", (double)n_primes / n_p_runs);
    printf("  Mean C-run: %.3f\n", (double)(N - n_primes) / n_c_runs);

    /* ──────────────────────────────────────────── */
    /* TABLE 3: H-scaffold on the binary string */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: H-SCAFFOLD ON THE BINARY STRING");
    printf("Apply derivatives to the sequence 1,1,0,1,0,1,0,0,0,1,...\n\n");

    printf("  Order │ RMS      │ Entropy  │ Norm  │ Ratio │ Interpretation\n");
    printf("  ──────┼──────────┼──────────┼───────┼───────┼──────────────\n");

    double *seq = malloc(N * sizeof(double));
    memcpy(seq, binary, N * sizeof(double));
    int sn = N;
    double prev_rms = 0;
    double bin_ratios[15];

    for (int k = 0; k <= 12 && sn > 100; k++) {
        if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        double ent = shannon_entropy_d(seq, sn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        bin_ratios[k] = ratio;
        printf("  d^%-4d│ %8.5f │ %8.4f │ %5.3f │ %5.3f │ %s\n",
               k, r, ent * log2(64.0), ent, ratio,
               k == 0 ? "binary P/C sequence" :
               ent > 0.95 ? "near-random" :
               ent > 0.8 ? "weak structure" :
               ent > 0.5 ? "moderate structure" : "STRONG structure");
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Running density and its deviation */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: RUNNING DENSITY — π(n)/n vs 1/ln(n)");
    printf("The deviation scaled by sqrt(n): should stay bounded if RH.\n\n");

    printf("  n        │ π(n)/n    │ 1/ln(n)   │ Error     │ Error×√n  │ |err√n|<1?\n");
    printf("  ─────────┼───────────┼───────────┼───────────┼───────────┼───────────\n");

    int count = 0;
    int checkpts[] = {100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 1000000, 2000000};
    int ncp = sizeof(checkpts) / sizeof(checkpts[0]);
    int ci = 0;
    for (int n = 2; n <= MAX_N && ci < ncp; n++) {
        if (!sieve[n]) count++;
        if (n == checkpts[ci]) {
            double density = (double)count / n;
            double expected = 1.0 / log((double)n);
            double error = density - expected;
            double scaled = error * sqrt((double)n);
            printf("  %9d │ %9.6f │ %9.6f │ %+9.6f │ %+9.4f  │ %s\n",
                   n, density, expected, error, scaled,
                   fabs(scaled) < 1.0 ? "YES ✓" : "no");
            ci++;
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: WHERE IS 1/2? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: WHERE IS 1/2 IN THE BINARY PATTERN?");
    printf("Looking for the number 0.5 in every measurement.\n\n");

    /* 1. Transition balance */
    double trans_balance = (double)(pp + cc) / (N - 1);  /* same-same fraction */
    double trans_change = (double)(pc + cp) / (N - 1);   /* change fraction */
    printf("  1. Transition balance:\n");
    printf("     P(same) = %.6f   P(change) = %.6f\n", trans_balance, trans_change);
    printf("     If random coin: P(same) = P(change) = 0.5\n");
    printf("     Deviation from 0.5: %+.6f\n\n", trans_change - 0.5);

    /* 2. Running density crosses 1/2 at what n? Never — but what fraction of
     * windows have density > 0.5? */
    int windows_above_half = 0;
    int total_windows = 0;
    int wsize = 10;
    int wcount = 0;
    for (int i = 0; i < N; i++) {
        wcount += (int)binary[i];
        if (i >= wsize) wcount -= (int)binary[i - wsize];
        if (i >= wsize - 1) {
            total_windows++;
            if ((double)wcount / wsize > 0.5) windows_above_half++;
        }
    }
    printf("  2. Windows (size %d) with density > 0.5: %.6f\n",
           wsize, (double)windows_above_half / total_windows);

    /* 3. Binary entropy of P/C decisions */
    double p_prob = (double)n_primes / N;
    double binary_entropy = -p_prob * log2(p_prob) - (1 - p_prob) * log2(1 - p_prob);
    printf("\n  3. Binary entropy of P/C: %.6f bits\n", binary_entropy);
    printf("     Maximum (at p=0.5):    1.000000 bits\n");
    printf("     Ratio: %.6f\n", binary_entropy);

    /* 4. The scaled error's distribution */
    printf("\n  4. Scaled error distribution:\n");
    /* compute error * sqrt(n) at many points, check distribution */
    double *scaled_err = malloc(N * sizeof(double));
    count = 0;
    int se_n = 0;
    int sample_stride = 100;
    for (int n = 2; n <= MAX_N; n++) {
        if (!sieve[n]) count++;
        if (n % sample_stride == 0 && n > 100) {
            double density = (double)count / n;
            double expected = 1.0 / log((double)n);
            scaled_err[se_n++] = (density - expected) * sqrt((double)n);
        }
    }
    /* what fraction are positive vs negative? */
    int pos = 0, neg = 0;
    for (int i = 0; i < se_n; i++) {
        if (scaled_err[i] > 0) pos++;
        else neg++;
    }
    printf("     Positive errors: %d (%.1f%%)\n", pos, 100.0 * pos / se_n);
    printf("     Negative errors: %d (%.1f%%)\n", neg, 100.0 * neg / se_n);
    printf("     Balance: %.4f  (0.5 = perfectly balanced)\n",
           (double)pos / se_n);

    /* median of absolute scaled error */
    double *abs_se = malloc(se_n * sizeof(double));
    for (int i = 0; i < se_n; i++) abs_se[i] = fabs(scaled_err[i]);
    /* simple sort for median */
    for (int i = 0; i < se_n - 1; i++)
        for (int j = i + 1; j < se_n; j++)
            if (abs_se[j] < abs_se[i]) {
                double t = abs_se[i]; abs_se[i] = abs_se[j]; abs_se[j] = t;
            }
    printf("     Median |error×√n|: %.4f\n", se_n > 0 ? abs_se[se_n / 2] : 0);
    printf("     90th percentile:   %.4f\n", se_n > 0 ? abs_se[se_n * 9 / 10] : 0);
    free(abs_se);

    /* ──────────────────────────────────────────── */
    /* TABLE 6: The definition boundary */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: THE DEFINITION BOUNDARY");
    printf("A prime has exactly 2 divisors (1 and itself).\n");
    printf("A composite has ≥ 3 divisors.\n");
    printf("The 'leeway' = how close is a composite to being prime?\n\n");

    /* for each composite: how many divisors does it have?
     * 3 divisors = semiprime p² (closest to prime)
     * more divisors = further from primality */
    printf("  Divisors │ Count    │ Fraction │ Cumulative │ Interpretation\n");
    printf("  ─────────┼──────────┼──────────┼────────────┼──────────────\n");

    int div_hist[30] = {0};
    int total_comp = 0;
    for (int n = 4; n <= MAX_N && n < 500000; n++) {
        if (!sieve[n]) continue;
        int ndiv = 0;
        for (int d = 1; (long long)d * d <= n; d++) {
            if (n % d == 0) {
                ndiv++;
                if (d != n / d) ndiv++;
            }
        }
        if (ndiv < 30) div_hist[ndiv]++;
        total_comp++;
    }
    double cum = 0;
    for (int d = 3; d < 25; d++) {
        if (div_hist[d] == 0) continue;
        double frac = (double)div_hist[d] / total_comp;
        cum += frac;
        printf("  %8d │ %8d │  %6.4f  │   %6.4f   │ %s\n",
               d, div_hist[d], frac, cum,
               d == 3 ? "← closest to prime (p²)" :
               d == 4 ? "← semiprimes (pq) or p³" :
               d <= 6 ? "← near-prime" : "");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: The boundary derivative */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: BOUNDARY — the P/C transition sequence");
    printf("Extract only the transitions: +1 for C→P, -1 for P→C, 0 for same.\n");
    printf("This sequence IS the boundary. Its structure encodes RH.\n\n");

    double *boundary = malloc(N * sizeof(double));
    int nb = 0;
    for (int i = 1; i < N; i++) {
        if (binary[i] != binary[i - 1]) {
            boundary[nb++] = binary[i] > binary[i - 1] ? 1.0 : -1.0;
        }
    }
    printf("  Total transitions: %d (out of %d steps = %.4f rate)\n\n",
           nb, N - 1, (double)nb / (N - 1));

    /* H-scaffold on boundary sequence */
    printf("  Order │ RMS      │ Entropy  │ Norm  │ Ratio\n");
    printf("  ──────┼──────────┼──────────┼───────┼──────\n");

    double *bseq = malloc(nb * sizeof(double));
    memcpy(bseq, boundary, nb * sizeof(double));
    int bn = nb;
    prev_rms = 0;

    for (int k = 0; k <= 10 && bn > 100; k++) {
        if (k > 0) bn = diff_k_d(bseq, bseq, bn, 1);
        double r = rms_d(bseq, bn);
        double ent = shannon_entropy_d(bseq, bn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        printf("  d^%-4d│ %8.5f │ %8.4f │ %5.3f │ %5.3f\n",
               k, r, ent * log2(64.0), ent, ratio);
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 8: The +1/-1 balance at the boundary */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 8: BOUNDARY BALANCE");
    printf("Every C→P transition is matched by a P→C transition.\n");
    printf("The running sum of the boundary sequence should hover near 0.\n");
    printf("Its fluctuation scaled by sqrt(transitions) tests RH.\n\n");

    double running = 0;
    double max_run = 0;
    double *running_seq = malloc(nb * sizeof(double));
    for (int i = 0; i < nb; i++) {
        running += boundary[i];
        running_seq[i] = running;
        if (fabs(running) > max_run) max_run = fabs(running);
    }

    printf("  Final balance: %.0f (should be near 0)\n", running);
    printf("  Max |balance|: %.0f\n", max_run);
    printf("  Max |balance| / sqrt(transitions): %.4f\n\n",
           max_run / sqrt((double)nb));

    /* the running sum of +1/-1 IS the Mertens-like function of the boundary.
     * its ratio to sqrt(n) should be bounded. */
    printf("  Checkpoints:\n");
    printf("  Trans │ Balance │ /sqrt(n) │ Bounded?\n");
    printf("  ──────┼─────────┼──────────┼─────────\n");
    running = 0;
    int stride = nb / 20;
    if (stride < 1) stride = 1;
    for (int i = 0; i < nb; i++) {
        running += boundary[i];
        if ((i + 1) % stride == 0 || i == nb - 1) {
            double scaled = running / sqrt((double)(i + 1));
            printf("  %6d│ %+7.0f │ %+8.4f │ %s\n",
                   i + 1, running, scaled,
                   fabs(scaled) < 2.0 ? "YES" : "NO");
        }
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE BINARY TRUTH");
    printf("The number line is a binary string: 1 = prime, 0 = composite.\n\n");
    printf("Where is 1/2?\n\n");
    printf("1. The transition rate (P→C or C→P) tells us how often the\n");
    printf("   boundary moves. Every transition is a decision.\n\n");
    printf("2. The running balance of +1/-1 at the boundary is the\n");
    printf("   Mertens function of primality transitions.\n");
    printf("   RH says its fluctuation is O(sqrt(n)).\n\n");
    printf("3. The H-scaffold on the binary string shows whether the\n");
    printf("   pattern has structure beyond what density predicts.\n\n");
    printf("4. The 'leeway' — how close composites are to being prime —\n");
    printf("   is measured by divisor count. Most composites have 3-4\n");
    printf("   divisors. They're CLOSE to the boundary.\n\n");
    printf("5. 1/2 appears in: the error scaling (sqrt(n) = n^(1/2)),\n");
    printf("   the boundary balance, the transition entropy.\n");
    printf("   It is the EXPONENT of the fluctuation, not a value.\n");

    free(sieve); free(binary); free(seq);
    free(scaled_err); free(boundary); free(bseq); free(running_seq);
    return 0;
}
