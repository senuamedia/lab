/*
 * Experiment 20: Rotate the Numbers, Then Sieve
 *
 * Exp19 failed because we sieved the RAW gaps with algebraic masks.
 * The algebras classify individual primes. Gaps encode PAIRS.
 * The two are orthogonal.
 *
 * Fix: TRANSFORM the gap sequence first, THEN sieve.
 * Each transform rotates the numbers into a space where
 * a different algebra can grip.
 *
 * Transforms (rotations of the number sequence):
 *   T1: gaps (raw)
 *   T2: gaps inverted (1/gap)
 *   T3: gaps squared (gap²)
 *   T4: gap ratios (gap[n+1]/gap[n])
 *   T5: gap XOR (gap[n] XOR gap[n+1])
 *   T6: log gaps (ln(gap))
 *   T7: gap products (gap[n] × gap[n+1])
 *   T8: cumulative sum (running total of gaps)
 *   T9: pair sums (p[n] + p[n+1] mapped)
 *   T10: pair products mod small base
 *
 * For EACH transform: apply ALL algebras as sieves.
 * The BEST algebra for each transform extracts the most.
 * The matched (transform, algebra) pair is the cipher helix viewpoint.
 *
 * Then: the residual after ALL matched pairs is the true signal.
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

static int legendre(int a, int p) {
    if (a % p == 0) return 0;
    long long result = 1, base = ((long long)(a % p) + p) % p, exp = (p - 1) / 2;
    while (exp > 0) {
        if (exp & 1) result = (result * base) % p;
        base = (base * base) % p; exp >>= 1;
    }
    return result == 1 ? 1 : (result == (long long)p - 1 ? -1 : 0);
}

/* project seq onto algebra, return correlation and residual RMS */
static double project(const double *seq, const double *alg, int n,
                      double *residual) {
    double dot = 0, alg_norm = 0, seq_norm = 0;
    for (int i = 0; i < n; i++) {
        dot += seq[i] * alg[i];
        alg_norm += alg[i] * alg[i];
        seq_norm += seq[i] * seq[i];
    }
    double coeff = alg_norm > 1e-30 ? dot / alg_norm : 0;
    for (int i = 0; i < n; i++)
        residual[i] = seq[i] - coeff * alg[i];
    double denom = sqrt(alg_norm * seq_norm);
    return denom > 1e-30 ? dot / denom : 0;
}

int main(void) {
    printf("=== Experiment 20: Rotate the Numbers, Then Sieve ===\n\n");
    printf("Transform the sequence FIRST. Then match algebras.\n");
    printf("Find the (transform, algebra) pair that extracts the most.\n\n");

    /* sieve and primes */
    char *sieve_arr = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve_arr[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve_arr[j] = 1;

    int *primes = malloc(MAX_PRIMES * sizeof(int));
    int np = 0;
    for (int i = 2; i <= MAX_N && np < MAX_PRIMES; i++)
        if (!sieve_arr[i]) primes[np++] = i;

    int ng = np - 1;
    int *gaps = malloc(ng * sizeof(int));
    for (int i = 0; i < ng; i++) gaps[i] = primes[i + 1] - primes[i];

    printf("Primes: %d   Gaps: %d\n\n", np, ng);

    /* ──────────────────────────────────────────── */
    /* Build TRANSFORMS of the gap sequence         */
    /* ──────────────────────────────────────────── */
    typedef struct { const char *name; double *data; int len; } Transform;
    Transform transforms[16];
    int nt = 0;
    int N = ng - 1;  /* common length for pair-based transforms */

    /* T1: raw gaps (normalised) */
    transforms[nt].name = "raw gaps";
    transforms[nt].data = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++)
        transforms[nt].data[i] = (double)gaps[i] / log((double)primes[i]) - 1.0;
    transforms[nt].len = ng;
    nt++;

    /* T2: inverted gaps */
    transforms[nt].name = "1/gap";
    transforms[nt].data = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++)
        transforms[nt].data[i] = 1.0 / gaps[i] - 1.0 / log((double)primes[i]);
    transforms[nt].len = ng;
    nt++;

    /* T3: gap squared */
    transforms[nt].name = "gap²";
    transforms[nt].data = malloc(ng * sizeof(double));
    { double mean = 0; for (int i = 0; i < ng; i++) mean += (double)gaps[i] * gaps[i]; mean /= ng;
      for (int i = 0; i < ng; i++) transforms[nt].data[i] = (double)gaps[i] * gaps[i] - mean; }
    transforms[nt].len = ng;
    nt++;

    /* T4: gap ratios */
    transforms[nt].name = "gap[n+1]/gap[n]";
    transforms[nt].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        transforms[nt].data[i] = (double)gaps[i + 1] / gaps[i] - 1.0;
    transforms[nt].len = N;
    nt++;

    /* T5: gap XOR */
    transforms[nt].name = "gap XOR";
    transforms[nt].data = malloc(N * sizeof(double));
    { double mean = 0; for (int i = 0; i < N; i++) mean += (double)(gaps[i] ^ gaps[i + 1]); mean /= N;
      for (int i = 0; i < N; i++) transforms[nt].data[i] = (double)(gaps[i] ^ gaps[i + 1]) - mean; }
    transforms[nt].len = N;
    nt++;

    /* T6: log gaps */
    transforms[nt].name = "ln(gap)";
    transforms[nt].data = malloc(ng * sizeof(double));
    { double mean = 0; for (int i = 0; i < ng; i++) mean += log((double)gaps[i]); mean /= ng;
      for (int i = 0; i < ng; i++) transforms[nt].data[i] = log((double)gaps[i]) - mean; }
    transforms[nt].len = ng;
    nt++;

    /* T7: gap products */
    transforms[nt].name = "gap×gap";
    transforms[nt].data = malloc(N * sizeof(double));
    { double mean = 0; for (int i = 0; i < N; i++) mean += (double)gaps[i] * gaps[i + 1]; mean /= N;
      for (int i = 0; i < N; i++) transforms[nt].data[i] = (double)gaps[i] * gaps[i + 1] - mean; }
    transforms[nt].len = N;
    nt++;

    /* T8: cumulative deviation */
    transforms[nt].name = "cumulative";
    transforms[nt].data = malloc(ng * sizeof(double));
    { double sum = 0;
      for (int i = 0; i < ng; i++) {
          sum += (double)gaps[i] - log((double)primes[i]);
          transforms[nt].data[i] = sum;
      }}
    transforms[nt].len = ng;
    nt++;

    /* T9: pair sum mod 30 */
    transforms[nt].name = "pair mod30";
    transforms[nt].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        transforms[nt].data[i] = (double)((primes[i] + primes[i + 1]) % 30) / 30.0 - 0.5;
    transforms[nt].len = N;
    nt++;

    /* T10: pair product mod 7 */
    transforms[nt].name = "pair mod7";
    transforms[nt].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        transforms[nt].data[i] = (double)((primes[i] % 7) * (primes[i + 1] % 7) % 7) / 7.0 - 0.5;
    transforms[nt].len = N;
    nt++;

    /* T11: gap difference (second derivative of primes) */
    transforms[nt].name = "Δgap";
    transforms[nt].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++)
        transforms[nt].data[i] = (double)(gaps[i + 1] - gaps[i]);
    transforms[nt].len = N;
    nt++;

    printf("Transforms: %d\n\n", nt);

    /* ──────────────────────────────────────────── */
    /* Build ALGEBRA masks (same as exp19)          */
    /* ──────────────────────────────────────────── */
    typedef struct { const char *name; double *seq; } Algebra;
    Algebra algs[12];
    int nalg = 0;

    /* build algebra at prime-pair level (length N or ng) */
    #define MAKE_ALG(NAME, CODE) do { \
        algs[nalg].name = NAME; \
        algs[nalg].seq = malloc(ng * sizeof(double)); \
        for (int i = 0; i < ng; i++) { CODE; } \
        nalg++; \
    } while(0)

    MAKE_ALG("p%4",    algs[nalg].seq[i] = (primes[i] % 4 == 1) ? 1.0 : -1.0);
    MAKE_ALG("p%3",    algs[nalg].seq[i] = (primes[i] % 3 == 1) ? 1.0 : -1.0);
    MAKE_ALG("p%8",    { int r = primes[i] % 8; algs[nalg].seq[i] = (r == 1 || r == 7) ? 1.0 : -1.0; });
    MAKE_ALG("p%5",    { int r = primes[i] % 5; algs[nalg].seq[i] = (r == 1 || r == 4) ? 1.0 : -1.0; });
    MAKE_ALG("p%12",   { int r = primes[i] % 12; algs[nalg].seq[i] = (r == 1 || r == 11) ? 1.0 : -1.0; });
    MAKE_ALG("p%7",    { int r = primes[i] % 7; algs[nalg].seq[i] = (r == 1 || r == 6) ? 1.0 : -1.0; });
    MAKE_ALG("QR",     algs[nalg].seq[i] = (i < ng - 1) ? (double)legendre(primes[i], primes[i + 1]) : 0);
    MAKE_ALG("Ω%2",   algs[nalg].seq[i] = (big_omega(primes[i] - 1) % 2 == 0) ? 1.0 : -1.0);
    MAKE_ALG("g%6",    algs[nalg].seq[i] = (double)(gaps[i] % 6) / 6.0 - 0.5);
    MAKE_ALG("g%4",    algs[nalg].seq[i] = (gaps[i] % 4 == 0) ? 1.0 : -1.0);
    MAKE_ALG("pair",   algs[nalg].seq[i] = (i < ng - 1) ? (double)(primes[i] % 4) * (primes[i+1] % 4) / 9.0 - 0.5 : 0);

    printf("Algebras: %d\n\n", nalg);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: The full rotation matrix            */
    /* (transform × algebra) → correlation          */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: ROTATION × SIEVE MATRIX — |correlation|");
    printf("Each cell: how much does this algebra explain this transform?\n\n");

    /* header */
    printf("%-16s", "Transform");
    for (int a = 0; a < nalg; a++) printf("│ %-6s", algs[a].name);
    printf("│ BEST\n");
    printf("────────────────");
    for (int a = 0; a < nalg; a++) printf("┼───────");
    printf("┼──────\n");

    double best_corr_overall = 0;
    int best_t = -1, best_a = -1;
    double extraction_matrix[16][12];

    for (int t = 0; t < nt; t++) {
        printf("%-16s", transforms[t].name);
        int len = transforms[t].len;
        double best_c = 0;
        int best_ai = 0;

        for (int a = 0; a < nalg; a++) {
            /* align lengths */
            int common = len < ng ? len : ng;
            double *resid = malloc(common * sizeof(double));
            double corr = fabs(project(transforms[t].data, algs[a].seq, common, resid));
            extraction_matrix[t][a] = corr;
            printf("│ %5.3f ", corr);
            if (corr > best_c) { best_c = corr; best_ai = a; }
            if (corr > best_corr_overall) { best_corr_overall = corr; best_t = t; best_a = a; }
            free(resid);
        }
        printf("│ %s\n", algs[best_ai].name);
    }

    printf("\n  BEST MATCH: Transform '%s' × Algebra '%s' = %.4f\n",
           transforms[best_t].name, algs[best_a].name, best_corr_overall);

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Top 15 (transform, algebra) pairs   */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: TOP 15 MATCHED PAIRS (sorted by |correlation|)");
    printf("  Rank │ Transform       │ Algebra │ |Corr|  │ Extraction\n");
    printf("  ─────┼─────────────────┼─────────┼─────────┼──────────\n");

    /* flatten and sort */
    typedef struct { int t, a; double corr; } Pair;
    Pair *pairs = malloc(nt * nalg * sizeof(Pair));
    int npairs = 0;
    for (int t = 0; t < nt; t++)
        for (int a = 0; a < nalg; a++)
            pairs[npairs++] = (Pair){t, a, extraction_matrix[t][a]};

    for (int i = 0; i < npairs - 1; i++)
        for (int j = i + 1; j < npairs; j++)
            if (pairs[j].corr > pairs[i].corr) {
                Pair tmp = pairs[i]; pairs[i] = pairs[j]; pairs[j] = tmp;
            }

    for (int i = 0; i < 15 && i < npairs; i++) {
        double extr = pairs[i].corr * pairs[i].corr * 100;  /* R² as % */
        printf("  %4d │ %-15s │ %-7s │ %7.4f │ %6.2f%%\n",
               i + 1, transforms[pairs[i].t].name, algs[pairs[i].a].name,
               pairs[i].corr, extr);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Greedy matched sieve                */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: GREEDY MATCHED HELIX — best pair first");
    printf("Pick the highest-extraction (transform, algebra) pair.\n");
    printf("Strip it from the target. Find the next best. Repeat.\n\n");

    printf("  Step │ Transform       │ Algebra │ |Corr| │ Extracted │ Cumulative\n");
    printf("  ─────┼─────────────────┼─────────┼────────┼───────────┼──────────\n");

    /* work on raw gaps */
    double *greedy_target = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++)
        greedy_target[i] = (double)gaps[i] / log((double)primes[i]) - 1.0;
    double greedy_initial_var = 0;
    for (int i = 0; i < ng; i++) greedy_initial_var += greedy_target[i] * greedy_target[i];
    greedy_initial_var /= ng;

    int used_t[16] = {0}, used_a[12] = {0};
    double *greedy_resid = malloc(ng * sizeof(double));

    for (int step = 0; step < 10; step++) {
        /* find best unused (transform applied to current residual, algebra) pair */
        double best = 0;
        int bt = -1, ba = -1;

        for (int t = 0; t < nt; t++) {
            int len = transforms[t].len < ng ? transforms[t].len : ng;
            /* recompute transform on current greedy_target */
            double *transformed = malloc(len * sizeof(double));

            if (t == 0) { /* raw */
                memcpy(transformed, greedy_target, len * sizeof(double));
            } else if (t == 3) { /* ratio */
                for (int i = 0; i < len && i < ng - 1; i++)
                    transformed[i] = (fabs(greedy_target[i + 1]) > 1e-10) ?
                                     greedy_target[i] / greedy_target[i + 1] : 0;
            } else if (t == 5) { /* log */
                for (int i = 0; i < len; i++)
                    transformed[i] = (greedy_target[i] > -0.99) ?
                                     log(fabs(greedy_target[i]) + 0.001) : -7;
            } else {
                memcpy(transformed, greedy_target, len * sizeof(double));
            }

            for (int a = 0; a < nalg; a++) {
                int common = len < ng ? len : ng;
                double *r = malloc(common * sizeof(double));
                double corr = fabs(project(transformed, algs[a].seq, common, r));
                if (corr > best) { best = corr; bt = t; ba = a; }
                free(r);
            }
            free(transformed);
        }

        if (bt < 0 || best < 0.0001) break;

        /* apply best pair */
        int len = transforms[bt].len < ng ? transforms[bt].len : ng;
        project(greedy_target, algs[ba].seq, len, greedy_resid);

        double var_before = 0, var_after = 0;
        for (int i = 0; i < len; i++) var_before += greedy_target[i] * greedy_target[i];
        for (int i = 0; i < len; i++) var_after += greedy_resid[i] * greedy_resid[i];
        var_before /= len; var_after /= len;
        double extr = (1.0 - var_after / var_before) * 100;
        double cumul = (1.0 - var_after / greedy_initial_var) * 100;

        printf("  %4d │ %-15s │ %-7s │ %6.4f │  %6.3f%%  │  %6.2f%%\n",
               step + 1, transforms[bt].name, algs[ba].name, best, extr, cumul);

        memcpy(greedy_target, greedy_resid, len * sizeof(double));
        used_t[bt] = 1; used_a[ba] = 1;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: H-scaffold on greedy residual       */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: SCAFFOLD ON GREEDY RESIDUAL");

    double *gseq = malloc(ng * sizeof(double));
    memcpy(gseq, greedy_target, ng * sizeof(double));
    int gn = ng;
    double prev_rms = 0;

    printf("  Order │ RMS       │ Ratio │ Entropy │ vs original\n");
    printf("  ──────┼───────────┼───────┼─────────┼────────────\n");
    for (int k = 0; k <= 8 && gn > 100; k++) {
        if (k > 0) gn = diff_k_d(gseq, gseq, gn, 1);
        double r = rms_d(gseq, gn);
        double ent = shannon_entropy_d(gseq, gn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        printf("  d^%-4d│ %9.5f │ %5.3f │  %5.3f  │ %s\n",
               k, r, ratio, ent,
               k == 4 ? (fabs(ratio - 1.873) < 0.01 ? "≈1.873 UNCHANGED" :
                         ratio > 1.9 ? "→ 2.0 (dissolving)" : "SHIFTED") : "");
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: ROTATE, THEN SIEVE");
    printf("1. %d transforms × %d algebras = %d viewpoints tested\n", nt, nalg, nt * nalg);
    printf("2. Best matched pair: '%s' × '%s' (|corr| = %.4f)\n",
           transforms[best_t].name, algs[best_a].name, best_corr_overall);
    printf("3. Greedy extraction: how much can all matched pairs explain?\n");
    printf("4. Residual ratio vs original 1.873: did it shift?\n\n");
    printf("The question: does rotating the numbers before sieving\n");
    printf("expose structure that was hidden in the raw sequence?\n");
    printf("Or is 99.4%% of prime gap structure truly orthogonal\n");
    printf("to ALL algebraic classifications in ALL transforms?\n");

    for (int t = 0; t < nt; t++) free(transforms[t].data);
    for (int a = 0; a < nalg; a++) free(algs[a].seq);
    free(sieve_arr); free(primes); free(gaps); free(pairs);
    free(greedy_target); free(greedy_resid); free(gseq);
    return 0;
}
