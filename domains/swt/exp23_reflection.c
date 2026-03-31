/*
 * Experiment 23: Reflection — Large Scale Through the Mirror
 *
 * The functional equation: ζ(s) relates to ζ(1-s).
 * This REFLECTS the critical strip across Re(s) = 1/2.
 * Behavior at scale x mirrors behavior at scale 1/x.
 *
 * The explicit formula: π(x) = li(x) - Σ_ρ li(x^ρ) + ...
 * Each zero ρ = 1/2 + iγ contributes cos(γ ln(x)).
 * At scale x: frequency = γ ln(x).
 * At scale 1/x: frequency = -γ ln(x) = SAME frequency, flipped.
 *
 * So: the prime structure at x and at 1/x have the SAME
 * oscillation content. The small primes know what the large primes do.
 *
 * Strategy: apply MULTIPLE inversions/reflections to the prime sequence.
 * Each reflection maps large-scale behavior to small-scale.
 * If the scaffold is invariant under ALL reflections:
 *   the structure is fully captured at any finite scale.
 *   We don't need 10^1000 — we need 10^6 with the right mirror.
 *
 * Reflections:
 *   R1: p → N/p (scale inversion)
 *   R2: p → N - p (complement)
 *   R3: p → 1/p (reciprocal — maps to [0,1])
 *   R4: p → ln(N)/ln(p) (logarithmic reflection)
 *   R5: p → p^(-1) mod N (multiplicative inverse)
 *   R6: The functional equation itself applied to gap frequencies
 *
 * For each: apply the scaffold. Compare ratios.
 * If all ratios match: reflection preserves structure.
 * We've collapsed infinity to a finite mirror.
 */

#include "rh_scaffold.h"

#define MAX_N 1000000
#define MAX_PRIMES 80000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* modular inverse: a^(-1) mod m via extended Euclidean */
static long long mod_inverse(long long a, long long m) {
    long long m0 = m, y = 0, x = 1;
    if (m == 1) return 0;
    while (a > 1) {
        long long q = a / m;
        long long t = m;
        m = a % m; a = t; t = y;
        y = x - q * y; x = t;
    }
    if (x < 0) x += m0;
    return x;
}

int main(void) {
    printf("=== Experiment 23: Reflection ===\n\n");
    printf("Map large-scale behavior to small-scale through reflection.\n");
    printf("If the scaffold is reflection-invariant, infinity collapses.\n\n");

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
    printf("Primes: %d\n\n", np);
    int ng = np - 1;

    /* raw gap sequence (normalised) */
    double *raw_gaps = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++)
        raw_gaps[i] = (double)(primes[i + 1] - primes[i]);

    /* ──────────────────────────────────────────── */
    /* Build reflected sequences                    */
    /* ──────────────────────────────────────────── */

    typedef struct { const char *name; double *gaps; int len; } Reflected;
    Reflected refs[10];
    int nref = 0;

    /* R0: Original (forward) */
    refs[nref].name = "Original";
    refs[nref].gaps = malloc(ng * sizeof(double));
    memcpy(refs[nref].gaps, raw_gaps, ng * sizeof(double));
    refs[nref].len = ng;
    nref++;

    /* R1: Reversed sequence (read primes backward) */
    refs[nref].name = "Reversed";
    refs[nref].gaps = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++)
        refs[nref].gaps[i] = raw_gaps[ng - 1 - i];
    refs[nref].len = ng;
    nref++;

    /* R2: Scale inversion p → N/p (maps large primes to small values) */
    refs[nref].name = "N/p inversion";
    refs[nref].gaps = malloc(ng * sizeof(double));
    {
        double *inv = malloc(np * sizeof(double));
        for (int i = 0; i < np; i++)
            inv[i] = (double)MAX_N / primes[i];
        /* sort (inversion reverses order) — already reversed since primes increase */
        /* gaps of inverted sequence */
        for (int i = 0; i < ng; i++)
            refs[nref].gaps[i] = fabs(inv[i] - inv[i + 1]);  /* positive gaps */
        free(inv);
    }
    refs[nref].len = ng;
    nref++;

    /* R3: Logarithmic reflection: ln(N)/ln(p) */
    refs[nref].name = "ln(N)/ln(p)";
    refs[nref].gaps = malloc(ng * sizeof(double));
    {
        double lnN = log((double)MAX_N);
        double *lr = malloc(np * sizeof(double));
        for (int i = 0; i < np; i++)
            lr[i] = lnN / log((double)primes[i]);
        for (int i = 0; i < ng; i++)
            refs[nref].gaps[i] = fabs(lr[i + 1] - lr[i]);
        free(lr);
    }
    refs[nref].len = ng;
    nref++;

    /* R4: Reciprocal gaps: 1/gap */
    refs[nref].name = "1/gap";
    refs[nref].gaps = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++)
        refs[nref].gaps[i] = 1.0 / raw_gaps[i];
    refs[nref].len = ng;
    nref++;

    /* R5: Multiplicative inverse: p^(-1) mod (next prime) */
    refs[nref].name = "p^-1 mod q";
    refs[nref].gaps = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++) {
        long long inv = mod_inverse(primes[i], primes[i + 1]);
        refs[nref].gaps[i] = (double)inv / primes[i + 1];  /* normalise to [0,1) */
    }
    refs[nref].len = ng;
    nref++;

    /* R6: Complement gaps: (N - p[n+1]) - (N - p[n]) = p[n] - p[n+1] = -gap */
    /* same as reversed, but we take the sequence N-p instead */
    refs[nref].name = "N-p gaps";
    refs[nref].gaps = malloc(ng * sizeof(double));
    {
        double *comp = malloc(np * sizeof(double));
        for (int i = 0; i < np; i++)
            comp[i] = (double)(MAX_N - primes[np - 1 - i]);  /* reverse and complement */
        for (int i = 0; i < ng; i++)
            refs[nref].gaps[i] = fabs(comp[i + 1] - comp[i]);
        free(comp);
    }
    refs[nref].len = ng;
    nref++;

    /* R7: Functional equation reflection on DFT frequencies */
    /* Apply DFT, negate frequencies (complex conjugate), inverse DFT */
    refs[nref].name = "Freq reflect";
    refs[nref].gaps = malloc(ng * sizeof(double));
    {
        /* simplified: reverse every other sample (frequency reflection) */
        for (int i = 0; i < ng; i++) {
            if (i % 2 == 0)
                refs[nref].gaps[i] = raw_gaps[i];
            else
                refs[nref].gaps[i] = raw_gaps[ng - 1 - i];
        }
    }
    refs[nref].len = ng;
    nref++;

    /* R8: Sigmoid compression then expansion */
    refs[nref].name = "Sigmoid";
    refs[nref].gaps = malloc(ng * sizeof(double));
    {
        double mean = 0;
        for (int i = 0; i < ng; i++) mean += raw_gaps[i];
        mean /= ng;
        /* compress through sigmoid, then take gaps of compressed */
        double *sig = malloc(np * sizeof(double));
        for (int i = 0; i < np; i++) {
            double x = ((double)primes[i] - (double)MAX_N / 2) / ((double)MAX_N / 8);
            sig[i] = 1.0 / (1.0 + exp(-x));
        }
        for (int i = 0; i < ng; i++)
            refs[nref].gaps[i] = fabs(sig[i + 1] - sig[i]);
        free(sig);
    }
    refs[nref].len = ng;
    nref++;

    printf("Reflections built: %d\n\n", nref);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: H''''/H''' ratio for each reflection */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: H''''/H''' RATIO PER REFLECTION");
    printf("  Reflection    │ d1/d0 │ d2/d1 │ d3/d2 │ d4/d3 │ d5/d4 │ vs 1.873\n");
    printf("  ──────────────┼───────┼───────┼───────┼───────┼───────┼─────────\n");

    double ref_ratios[10][8];
    for (int r = 0; r < nref; r++) {
        double *seq = malloc(refs[r].len * sizeof(double));
        memcpy(seq, refs[r].gaps, refs[r].len * sizeof(double));
        int sn = refs[r].len;
        double prev_rms = 0;
        printf("  %-14s│", refs[r].name);
        for (int k = 0; k <= 5 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
            double rm = rms_d(seq, sn);
            double ratio = (k > 0 && prev_rms > 1e-30) ? rm / prev_rms : 0;
            ref_ratios[r][k] = ratio;
            if (k >= 1) printf(" %5.3f │", ratio);
            prev_rms = rm;
        }
        printf(" %+6.3f\n", ref_ratios[r][4] - 1.873);
        free(seq);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Which reflections preserve the ratio? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: REFLECTION INVARIANCE");
    printf("  Reflection    │ d4/d3  │ |Δ from original| │ Invariant?\n");
    printf("  ──────────────┼────────┼───────────────────┼───────────\n");

    double original_ratio = ref_ratios[0][4];
    for (int r = 0; r < nref; r++) {
        double delta = fabs(ref_ratios[r][4] - original_ratio);
        printf("  %-14s│ %6.4f │      %8.4f      │ %s\n",
               refs[r].name, ref_ratios[r][4], delta,
               delta < 0.005 ? "YES ✓ exact" :
               delta < 0.02 ? "YES ~ close" :
               delta < 0.1 ? "PARTIAL" : "NO — different structure");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Cross-correlation between original and reflections */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: CORRELATION — original vs reflected gaps");
    printf("  Reflection    │ Raw corr │ d1 corr │ d2 corr │ d3 corr │ Converging?\n");
    printf("  ──────────────┼──────────┼─────────┼─────────┼─────────┼───────────\n");

    for (int r = 1; r < nref; r++) {
        printf("  %-14s│", refs[r].name);

        double *oseq = malloc(ng * sizeof(double));
        double *rseq = malloc(ng * sizeof(double));
        memcpy(oseq, refs[0].gaps, ng * sizeof(double));
        memcpy(rseq, refs[r].gaps, ng * sizeof(double));
        int n = ng < refs[r].len ? ng : refs[r].len;
        double prev_corr = 0;

        for (int k = 0; k <= 3; k++) {
            if (k > 0) {
                int n1 = diff_k_d(oseq, oseq, n, 1);
                n = diff_k_d(rseq, rseq, n, 1);
                if (n1 < n) n = n1;
            }
            double dot = 0, on = 0, rn = 0;
            for (int i = 0; i < n; i++) {
                dot += oseq[i] * rseq[i];
                on += oseq[i] * oseq[i];
                rn += rseq[i] * rseq[i];
            }
            double corr = (on > 1e-30 && rn > 1e-30) ? dot / sqrt(on * rn) : 0;
            printf(" %+7.4f │", corr);
            prev_corr = corr;
        }
        printf(" %s\n", fabs(prev_corr) > 0.9 ? "CONVERGED" :
                        fabs(prev_corr) > 0.5 ? "partial" : "independent");
        free(oseq); free(rseq);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: The collapse test — can reflections substitute for scale? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: COLLAPSE TEST — do reflections encode scale?");
    printf("Compare: scaffold of first half vs scaffold of reflection of second half.\n");
    printf("If they match: reflection maps large to small successfully.\n\n");

    int half = ng / 2;
    /* first half: small primes */
    double *first_half = malloc(half * sizeof(double));
    memcpy(first_half, raw_gaps, half * sizeof(double));

    /* second half reflected via N/p inversion */
    double *second_inv = malloc(half * sizeof(double));
    for (int i = 0; i < half; i++)
        second_inv[i] = refs[2].gaps[ng - half + i];  /* N/p gaps of large primes */

    /* scaffold both */
    printf("  Order │ First half │ Reflected 2nd │ Difference │ Match?\n");
    printf("  ──────┼────────────┼───────────────┼────────────┼───────\n");

    double *fh = malloc(half * sizeof(double));
    double *sh = malloc(half * sizeof(double));
    memcpy(fh, first_half, half * sizeof(double));
    memcpy(sh, second_inv, half * sizeof(double));
    int fn = half, sn = half;
    double fp = 0, sp = 0;

    for (int k = 0; k <= 6 && fn > 100 && sn > 100; k++) {
        if (k > 0) {
            fn = diff_k_d(fh, fh, fn, 1);
            sn = diff_k_d(sh, sh, sn, 1);
        }
        double fr = rms_d(fh, fn);
        double sr = rms_d(sh, sn);
        double f_ratio = (k > 0 && fp > 1e-30) ? fr / fp : 0;
        double s_ratio = (k > 0 && sp > 1e-30) ? sr / sp : 0;
        double diff = fabs(f_ratio - s_ratio);
        printf("  d^%-4d│   %7.4f  │     %7.4f   │   %7.4f  │ %s\n",
               k, f_ratio, s_ratio, diff,
               k == 0 ? "—" :
               diff < 0.01 ? "YES ✓" :
               diff < 0.05 ? "close" : "NO");
        fp = fr; sp = sr;
    }
    free(fh); free(sh); free(first_half); free(second_inv);

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Entropy under reflection */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: ENTROPY INVARIANCE UNDER REFLECTION");
    printf("  Reflection    │ d0 ent │ d1 ent │ d2 ent │ d3 ent │ vs original\n");
    printf("  ──────────────┼────────┼────────┼────────┼────────┼────────────\n");

    for (int r = 0; r < nref; r++) {
        double *seq = malloc(refs[r].len * sizeof(double));
        memcpy(seq, refs[r].gaps, refs[r].len * sizeof(double));
        int sn = refs[r].len;
        printf("  %-14s│", refs[r].name);
        for (int k = 0; k <= 3 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
            double ent = shannon_entropy_d(seq, sn, 64) / log2(64.0);
            printf(" %6.4f │", ent);
        }
        printf("\n");
        free(seq);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: The precision question */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: PRECISION vs SCALE — the tradeoff");
    printf("At each scale, how many primes do we need for stable ratio?\n\n");

    printf("  N primes │ Ratio  │ Stable? │ Scale reached\n");
    printf("  ─────────┼────────┼─────────┼──────────────\n");

    int test_sizes[] = {50, 100, 200, 500, 1000, 2000, 5000, 10000, 30000, 78000};
    int nts = sizeof(test_sizes) / sizeof(test_sizes[0]);
    for (int ti = 0; ti < nts; ti++) {
        int n = test_sizes[ti];
        if (n > ng) n = ng;
        double *d3 = malloc(n * sizeof(double));
        double *d4 = malloc(n * sizeof(double));
        int d3n = diff_k_d(raw_gaps, d3, n, 3);
        int d4n = diff_k_d(raw_gaps, d4, n, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;
        printf("  %8d │ %6.4f │ %s   │ p ≤ %d\n",
               n, ratio,
               fabs(ratio - 1.873) < 0.01 ? "YES ✓" :
               fabs(ratio - 1.873) < 0.05 ? "close" : "no   ",
               n < ng ? primes[n] : primes[ng]);
        free(d3); free(d4);
    }

    printf("\n  Minimum primes for stable ratio: ");
    for (int ti = 0; ti < nts; ti++) {
        int n = test_sizes[ti];
        if (n > ng) n = ng;
        double *d3 = malloc(n * sizeof(double));
        double *d4 = malloc(n * sizeof(double));
        int d3n = diff_k_d(raw_gaps, d3, n, 3);
        int d4n = diff_k_d(raw_gaps, d4, n, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;
        if (fabs(ratio - 1.873) < 0.01) {
            printf("~%d primes (p ≤ %d)\n", n, primes[n < np ? n : np - 1]);
            break;
        }
        free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: REFLECTION AND COLLAPSE");
    printf("The functional equation reflects ζ(s) across Re(s) = 1/2.\n");
    printf("This means large-scale prime behavior mirrors small-scale.\n\n");
    printf("Reflections tested:\n");
    for (int r = 0; r < nref; r++) {
        double delta = fabs(ref_ratios[r][4] - original_ratio);
        printf("  %-14s : ratio = %.4f  %s\n", refs[r].name, ref_ratios[r][4],
               delta < 0.01 ? "✓ INVARIANT" :
               delta < 0.05 ? "~ close" : "different");
    }
    printf("\nIf a reflection preserves the ratio exactly:\n");
    printf("  → It maps large-scale to small-scale faithfully\n");
    printf("  → We don't need 10^1000 integers\n");
    printf("  → We need 10^6 integers with the RIGHT mirror\n");
    printf("  → The mirror IS the functional equation\n");
    printf("  → And the ratio 1.873 is the fixed point of the mirror\n");

    for (int r = 0; r < nref; r++) free(refs[r].gaps);
    free(sieve); free(primes); free(raw_gaps);
    return 0;
}
