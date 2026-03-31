/*
 * Experiment 19: The Matched Algebraic Sieve
 *
 * From the cipher helix: match each sieve layer to its best algebra.
 * Extract maximum information per step. Measure residual.
 *
 * Exp18 showed the divergence map:
 *   QR (Legendre):  gap = 0.1389  ← most structure
 *   Z[√-5]:         gap = 0.1331  ← broken ring, most ambiguity
 *   XOR:            gap = 0.1292
 *   λ(n):           gap = 0.1290
 *   Z[√2]:          gap = 0.1235
 *   Z[i]:           gap = 0.1216
 *   Z[ω]:           gap = 0.1184  ← least structure
 *
 * Strategy:
 *   1. Start with the MOST structured algebra (QR)
 *   2. Sieve: strip what QR explains
 *   3. Rotate to next algebra (Z[√-5])
 *   4. Sieve: strip what Z[√-5] explains from the residual
 *   5. Continue through all algebras in order of divergence
 *   6. Measure what's left after the full rotation
 *
 * This is the helix from cipher exp60 applied to RH.
 * Each algebra-sieve pair extracts its matched information.
 * The residual after all pairs is the TRUE unexplained structure.
 */

#include "rh_scaffold.h"

#define MAX_N 1000000
#define MAX_PRIMES 80000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

/* Legendre symbol */
static int legendre(int a, int p) {
    if (a % p == 0) return 0;
    long long result = 1;
    long long base = ((long long)(a % p) + p) % p;
    long long exp = (p - 1) / 2;
    while (exp > 0) {
        if (exp & 1) result = (result * base) % p;
        base = (base * base) % p;
        exp >>= 1;
    }
    return result == 1 ? 1 : (result == (long long)p - 1 ? -1 : 0);
}

/* project a sequence onto an algebra's classification
 * returns the component of seq that correlates with the algebra */
static void project_and_strip(double *seq, const double *algebra, int n,
                               double *stripped, double *residual) {
    /* compute correlation: how much of seq is explained by algebra */
    double dot = 0, alg_norm = 0;
    for (int i = 0; i < n; i++) {
        dot += seq[i] * algebra[i];
        alg_norm += algebra[i] * algebra[i];
    }
    double coeff = alg_norm > 1e-30 ? dot / alg_norm : 0;

    /* stripped = the part explained by this algebra */
    /* residual = seq minus the explained part */
    for (int i = 0; i < n; i++) {
        stripped[i] = coeff * algebra[i];
        residual[i] = seq[i] - stripped[i];
    }
}

int main(void) {
    printf("=== Experiment 19: The Matched Algebraic Sieve ===\n\n");
    printf("Helix from cipher work applied to primes.\n");
    printf("Each algebra strips its matched structure. Residual is the signal.\n\n");

    /* sieve and primes */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    int *primes = malloc(MAX_PRIMES * sizeof(int));
    int np = 0;
    for (int i = 2; i <= MAX_N && np < MAX_PRIMES; i++)
        if (!sieve[i]) primes[np++] = i;
    printf("Primes: %d\n", np);

    int N = np - 1;  /* work with prime-indexed sequences of length N */

    /* ──────────────────────────────────────────── */
    /* Build the target: Ω shade of prime gaps      */
    /* ──────────────────────────────────────────── */

    /* target sequence: prime gaps normalised by expected */
    double *target = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        double gap = (double)(primes[i + 1] - primes[i]);
        double expected = log((double)primes[i]);
        target[i] = gap / expected - 1.0;  /* relative deviation */
    }
    printf("Target: normalised prime gap deviation (gap/ln(p) - 1)\n\n");

    /* ──────────────────────────────────────────── */
    /* Build algebra sequences (ordered by divergence from exp18) */
    /* ──────────────────────────────────────────── */

    typedef struct {
        const char *name;
        double *seq;
    } AlgView;

    int nalg = 0;
    AlgView algs[12];

    /* QR: Legendre(p[n], p[n+1]) — most structure */
    algs[nalg].name = "QR";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        algs[nalg].seq[i] = (double)legendre(primes[i], primes[i + 1]);
    nalg++;

    /* Z[√-5]: split pattern — broken ring */
    algs[nalg].name = "Z[√-5]";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        int p = primes[i];
        if (p == 2 || p == 5) algs[nalg].seq[i] = 0;
        else {
            int neg1 = (p % 4 == 1) ? 1 : -1;
            int p5 = p % 5;
            int five_p = (p5 == 1 || p5 == 4) ? 1 : -1;
            algs[nalg].seq[i] = (double)(neg1 * five_p);
        }
    }
    nalg++;

    /* XOR parity: p[n] XOR p[n+1] high bit */
    algs[nalg].name = "XOR";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        int x = primes[i] ^ primes[i + 1];
        /* count leading bit position */
        int bits = 0;
        while (x > 0) { bits++; x >>= 1; }
        algs[nalg].seq[i] = (bits % 2 == 0) ? 1.0 : -1.0;
    }
    nalg++;

    /* Liouville: λ(gap) = (-1)^Ω(gap) */
    algs[nalg].name = "λ(gap)";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        int gap = primes[i + 1] - primes[i];
        algs[nalg].seq[i] = (big_omega(gap) % 2 == 0) ? 1.0 : -1.0;
    }
    nalg++;

    /* Z[√2]: p ≡ ±1 mod 8 */
    algs[nalg].name = "Z[√2]";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        int r = primes[i] % 8;
        algs[nalg].seq[i] = (r == 1 || r == 7) ? 1.0 : -1.0;
    }
    nalg++;

    /* Z[i]: p ≡ 1 mod 4 */
    algs[nalg].name = "Z[i]";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        algs[nalg].seq[i] = (primes[i] % 4 == 1) ? 1.0 : -1.0;
    nalg++;

    /* Z[ω]: p ≡ 1 mod 3 */
    algs[nalg].name = "Z[ω]";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        algs[nalg].seq[i] = (primes[i] % 3 == 1) ? 1.0 : -1.0;
    nalg++;

    /* Z[√3]: p ≡ ±1 mod 12 */
    algs[nalg].name = "Z[√3]";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        int r = primes[i] % 12;
        algs[nalg].seq[i] = (r == 1 || r == 11) ? 1.0 : -1.0;
    }
    nalg++;

    /* Ω(p-1) parity */
    algs[nalg].name = "Ω(p-1)";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        algs[nalg].seq[i] = (big_omega(primes[i] - 1) % 2 == 0) ? 1.0 : -1.0;
    nalg++;

    /* mod 30 class */
    algs[nalg].name = "mod30";
    algs[nalg].seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        int r = primes[i] % 30;
        /* 8 residue classes: 1,7,11,13,17,19,23,29 → map to [-1,1] */
        algs[nalg].seq[i] = (double)(r - 15) / 15.0;
    }
    nalg++;

    printf("Algebras: %d (ordered by divergence)\n\n", nalg);

    /* ──────────────────────────────────────────── */
    /* THE HELIX SIEVE: strip layer by layer        */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: THE HELIX SIEVE — layer by layer stripping");
    printf("  Layer │ Algebra  │ Correlation │ RMS before │ RMS after  │ Extracted │ Cumulative\n");
    printf("  ──────┼──────────┼─────────────┼────────────┼────────────┼───────────┼───────────\n");

    double *current = malloc(N * sizeof(double));
    double *stripped = malloc(N * sizeof(double));
    double *residual = malloc(N * sizeof(double));
    memcpy(current, target, N * sizeof(double));

    double initial_rms = rms_d(current, N);
    double initial_ent = shannon_entropy_d(current, N, 64) / log2(64.0);
    double initial_var = 0;
    for (int i = 0; i < N; i++) initial_var += current[i] * current[i];
    initial_var /= N;

    for (int layer = 0; layer < nalg; layer++) {
        double rms_before = rms_d(current, N);

        /* project and strip */
        double dot = 0, alg_norm = 0;
        for (int i = 0; i < N; i++) {
            dot += current[i] * algs[layer].seq[i];
            alg_norm += algs[layer].seq[i] * algs[layer].seq[i];
        }
        double corr = alg_norm > 1e-30 ? dot / sqrt(alg_norm * N * (rms_before * rms_before + 1e-30)) : 0;

        project_and_strip(current, algs[layer].seq, N, stripped, residual);

        double rms_after = rms_d(residual, N);
        double extracted_pct = (1.0 - (rms_after * rms_after) / (rms_before * rms_before)) * 100;
        double cumulative_pct = (1.0 - (rms_after * rms_after) / (initial_rms * initial_rms)) * 100;

        printf("  L%-5d│ %-8s │  %+9.6f  │  %9.6f │  %9.6f │  %6.2f%%  │  %6.2f%%\n",
               layer, algs[layer].name, corr,
               rms_before, rms_after, extracted_pct, cumulative_pct);

        memcpy(current, residual, N * sizeof(double));
    }

    double final_rms = rms_d(current, N);
    double final_ent = shannon_entropy_d(current, N, 64) / log2(64.0);

    printf("\n  Initial RMS: %.6f   Final RMS: %.6f   Reduction: %.2f%%\n",
           initial_rms, final_rms, (1.0 - final_rms / initial_rms) * 100);
    printf("  Initial entropy: %.4f   Final entropy: %.4f\n", initial_ent, final_ent);

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Scaffold on the RESIDUAL */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: H-SCAFFOLD ON THE RESIDUAL (after all algebras stripped)");
    printf("  Order │ RMS       │ Entropy  │ Norm  │ Ratio │ Interpretation\n");
    printf("  ──────┼───────────┼──────────┼───────┼───────┼──────────────\n");

    double *rseq = malloc(N * sizeof(double));
    memcpy(rseq, current, N * sizeof(double));
    int rn = N;
    double prev_rms = 0;
    double resid_ratios[15];

    for (int k = 0; k <= 10 && rn > 100; k++) {
        if (k > 0) rn = diff_k_d(rseq, rseq, rn, 1);
        double r = rms_d(rseq, rn);
        double ent = shannon_entropy_d(rseq, rn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        resid_ratios[k] = ratio;
        printf("  d^%-4d│ %9.6f │ %8.4f │ %5.3f │ %5.3f │ %s\n",
               k, r, ent * log2(64.0), ent, ratio,
               k == 0 ? "residual after helix" :
               ent > 0.95 ? "near-random ←" :
               ent > 0.8 ? "weak structure" :
               ent > 0.5 ? "moderate" : "STRONG structure");
        prev_rms = r;
    }

    printf("\n  Residual H''''/H''' ratio: %.4f\n", resid_ratios[4]);
    printf("  Original H''''/H''' ratio: 1.8730\n");
    printf("  Difference: %+.4f\n", resid_ratios[4] - 1.873);

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Second pass — helix again on residual */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: SECOND HELIX PASS — sieve the residual again");
    printf("Apply the same algebras to the residual. Does more come out?\n\n");

    printf("  Layer │ Algebra  │ Correlation │ Extracted │ Cumulative (total)\n");
    printf("  ──────┼──────────┼─────────────┼───────────┼───────────────────\n");

    double pass2_initial_rms = rms_d(current, N);

    for (int layer = 0; layer < nalg; layer++) {
        double rms_before = rms_d(current, N);
        project_and_strip(current, algs[layer].seq, N, stripped, residual);
        double rms_after = rms_d(residual, N);
        double extracted_pct = (1.0 - (rms_after * rms_after) / (rms_before * rms_before)) * 100;
        double total_pct = (1.0 - (rms_after * rms_after) / (initial_rms * initial_rms)) * 100;

        double dot = 0, alg_norm = 0;
        for (int i = 0; i < N; i++) {
            dot += current[i] * algs[layer].seq[i];
            alg_norm += algs[layer].seq[i] * algs[layer].seq[i];
        }
        double corr = alg_norm > 1e-30 ? dot / sqrt(alg_norm * N * (rms_before * rms_before + 1e-30)) : 0;

        printf("  L%-5d│ %-8s │  %+9.6f  │  %6.3f%%  │    %6.2f%%\n",
               layer, algs[layer].name, corr, extracted_pct, total_pct);

        memcpy(current, residual, N * sizeof(double));
    }

    double pass2_final_rms = rms_d(current, N);
    printf("\n  Pass 2 extraction: %.6f → %.6f (%.3f%% additional)\n",
           pass2_initial_rms, pass2_final_rms,
           (1.0 - pass2_final_rms / pass2_initial_rms) * 100);

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Recursive helix — how many passes until dry? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: RECURSIVE HELIX — passes until dry");
    printf("  Pass │ RMS before │ RMS after  │ Extracted │ Total from raw\n");
    printf("  ─────┼────────────┼────────────┼───────────┼───────────────\n");

    /* reset to target */
    memcpy(current, target, N * sizeof(double));
    for (int pass = 0; pass < 10; pass++) {
        double rms_before = rms_d(current, N);

        /* full helix pass */
        for (int layer = 0; layer < nalg; layer++) {
            project_and_strip(current, algs[layer].seq, N, stripped, residual);
            memcpy(current, residual, N * sizeof(double));
        }

        double rms_after = rms_d(current, N);
        double pass_pct = (1.0 - rms_after / rms_before) * 100;
        double total_pct = (1.0 - rms_after / initial_rms) * 100;

        printf("  %4d │  %9.6f │  %9.6f │  %6.3f%%  │   %6.2f%%\n",
               pass + 1, rms_before, rms_after, pass_pct, total_pct);

        if (pass_pct < 0.001) {
            printf("  ↑ DRY — no more structure to extract.\n");
            break;
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: What's left? Characterise the true residual */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: THE TRUE RESIDUAL — what no algebra can explain");

    double true_rms = rms_d(current, N);
    double true_ent = shannon_entropy_d(current, N, 64) / log2(64.0);
    printf("  RMS:     %.6f (%.2f%% of original)\n", true_rms, true_rms / initial_rms * 100);
    printf("  Entropy: %.4f (norm)\n", true_ent);

    /* is the residual random? check autocorrelation */
    printf("\n  Autocorrelation of true residual:\n");
    printf("  Lag │ ACF       │ Random?\n");
    printf("  ────┼───────────┼────────\n");

    /* convert to int for autocorrelation */
    int *iresid = malloc(N * sizeof(int));
    for (int i = 0; i < N; i++) iresid[i] = (int)(current[i] * 10000);
    for (int lag = 1; lag <= 15; lag++) {
        double acf = autocorrelation(iresid, N, lag);
        double threshold = 2.0 / sqrt(N);
        printf("  %3d │ %+8.5f │ %s\n", lag, acf,
               fabs(acf) < threshold ? "YES (noise)" : "NO — STRUCTURE REMAINS");
    }

    /* frequency analysis of residual */
    printf("\n  Top DFT frequencies of residual:\n");
    printf("  Freq │ Magnitude │ Interpretation\n");
    printf("  ─────┼───────────┼──────────────\n");

    int dft_n = N > 20000 ? 20000 : N;
    double *mags = malloc(200 * sizeof(double));
    for (int f = 1; f <= 200; f++) {
        double re = 0, im = 0;
        double omega = 2.0 * M_PI * f / dft_n;
        for (int i = 0; i < dft_n; i++) {
            re += current[i] * cos(omega * i);
            im += current[i] * sin(omega * i);
        }
        mags[f - 1] = sqrt(re * re + im * im) / dft_n;
    }

    /* top 10 */
    for (int t = 0; t < 10; t++) {
        int best = 0;
        for (int f = 1; f < 200; f++)
            if (mags[f] > mags[best]) best = f;
        printf("  %4d │ %9.6f │ %s\n", best + 1, mags[best],
               mags[best] > 0.01 ? "*** SIGNIFICANT" :
               mags[best] > 0.001 ? "**  moderate" : "*   weak");
        mags[best] = 0;  /* remove so we find next */
    }
    free(mags);

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Compare residual ratio to ALL previous */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: RESIDUAL vs EVERYTHING — the final comparison");
    printf("  Measurement              │ H''''/H''' │ Gap from 2\n");
    printf("  ─────────────────────────┼────────────┼──────────\n");
    printf("  Binary (P/C)             │   2.0000   │  0.0000\n");
    printf("  Prime gaps (raw)         │   1.8730   │  0.1270\n");
    printf("  Ω(n) shade               │   1.9160   │  0.0840\n");
    printf("  8-algebra combined       │   1.8672   │  0.1328\n");
    printf("  After helix sieve        │   %.4f   │  %.4f\n",
           resid_ratios[4], 2.0 - resid_ratios[4]);
    printf("\n");

    if (fabs(resid_ratios[4] - 1.873) < 0.01) {
        printf("  RESIDUAL RATIO ≈ ORIGINAL — algebras didn't change the scaffold.\n");
        printf("  The structure is ORTHOGONAL to all algebraic classifications.\n");
        printf("  It exists in the gaps BETWEEN algebras, not within any one.\n");
    } else if (resid_ratios[4] > 1.95) {
        printf("  RESIDUAL RATIO → 2.0 — algebras stripped the structure.\n");
        printf("  The residual is approaching noise.\n");
        printf("  All prime structure is EXPLAINED by the algebraic decomposition.\n");
    } else {
        printf("  RESIDUAL RATIO SHIFTED — algebras changed something.\n");
        printf("  From %.4f to %.4f: shift of %+.4f\n",
               1.873, resid_ratios[4], resid_ratios[4] - 1.873);
        printf("  This shift is the algebraic contribution to prime structure.\n");
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE MATCHED SIEVE");
    printf("The cipher helix applied to primes:\n\n");
    printf("1. Each algebra extracts its matched structure from the gap sequence\n");
    printf("2. After %d algebras: %.2f%% of RMS extracted\n",
           nalg, (1.0 - final_rms / initial_rms) * 100);
    printf("3. Recursive passes: diminishing returns → the sieve runs dry\n");
    printf("4. The TRUE RESIDUAL is what NO algebra can explain\n");
    printf("5. If residual is noise: all structure accounted for → RH holds\n");
    printf("6. If residual has structure: THAT is the discordant note\n");
    printf("   — the part of prime distribution that no L-function captures\n");

    for (int a = 0; a < nalg; a++) free(algs[a].seq);
    free(sieve); free(primes); free(target);
    free(current); free(stripped); free(residual); free(rseq); free(iresid);
    return 0;
}
