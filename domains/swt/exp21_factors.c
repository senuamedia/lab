/*
 * Experiment 21: Factor Sequences — The Self-Reference
 *
 * Every composite is built from primes: n = p1^a1 × p2^a2 × ...
 * The factors ARE primes. So the factorisation of composites
 * is a MAP from composites back into the prime sequence.
 *
 * Questions:
 *   1. For each composite n, its factors form a sequence.
 *      What is the derivative structure of those factor sequences?
 *
 *   2. Across ALL composites, the aggregate factor pattern
 *      (which primes appear most, in what combinations)
 *      has its own H-scaffold. Does it match the prime scaffold?
 *
 *   3. The "factor index" sequence: for composite n = p_i × p_j × ...,
 *      record (i, j, ...) — the POSITIONS of the factors in the prime list.
 *      The derivative of this index sequence encodes how factor selection
 *      changes as composites grow. Does this derivative OVERLAY the
 *      prime gap sequence at any point?
 *
 *   4. If overlay exists: the system is a FIXED POINT.
 *      Primes → composites → factor indices → prime gaps → primes.
 *      A fixed point in a contracting map = the critical line.
 */

#include "rh_scaffold.h"

#define MAX_N 500000
#define MAX_PRIMES 50000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* full factorisation: store factor indices */
typedef struct {
    int indices[20];  /* prime indices (position in prime list) */
    int count;
} Factorisation;

static int prime_index_cache[MAX_N + 1];  /* n → index in prime list, or -1 */

static void factorise(int n, Factorisation *f) {
    f->count = 0;
    for (int p = 2; (long long)p * p <= n && f->count < 20; p++) {
        while (n % p == 0 && f->count < 20) {
            f->indices[f->count++] = prime_index_cache[p];
            n /= p;
        }
    }
    if (n > 1 && f->count < 20) {
        f->indices[f->count++] = (n <= MAX_N) ? prime_index_cache[n] : -1;
    }
}

int main(void) {
    printf("=== Experiment 21: Factor Sequences ===\n\n");
    printf("Primes build composites. Do the factor patterns\n");
    printf("overlay the prime pattern? Is it a fixed point?\n\n");

    /* sieve and primes */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    int *primes = malloc(MAX_PRIMES * sizeof(int));
    int np = 0;
    memset(prime_index_cache, -1, sizeof(prime_index_cache));
    for (int i = 2; i <= MAX_N && np < MAX_PRIMES; i++) {
        if (!sieve[i]) {
            prime_index_cache[i] = np;
            primes[np++] = i;
        }
    }
    printf("Primes: %d (up to %d)\n\n", np, primes[np - 1]);

    /* ──────────────────────────────────────────── */
    /* Build factor-derived sequences for composites */
    /* ──────────────────────────────────────────── */

    /* For each composite, record:
     *   smallest_factor_index: position of smallest prime factor
     *   largest_factor_index: position of largest prime factor
     *   mean_factor_index: average position of all factors
     *   factor_span: largest - smallest index
     *   factor_sum: sum of all factor indices
     */
    int max_comp = 200000;
    double *smallest_idx = malloc(max_comp * sizeof(double));
    double *largest_idx = malloc(max_comp * sizeof(double));
    double *mean_idx = malloc(max_comp * sizeof(double));
    double *span_idx = malloc(max_comp * sizeof(double));
    double *sum_idx = malloc(max_comp * sizeof(double));
    double *product_idx = malloc(max_comp * sizeof(double));  /* product of indices */
    int *comp_values = malloc(max_comp * sizeof(int));
    int nc = 0;

    for (int n = 4; n <= MAX_N && nc < max_comp; n++) {
        if (!sieve[n]) continue;
        Factorisation f;
        factorise(n, &f);
        if (f.count == 0) continue;

        int sml = f.indices[0], lrg = f.indices[0];
        double sum = 0, prod = 1;
        for (int k = 0; k < f.count; k++) {
            if (f.indices[k] < sml) sml = f.indices[k];
            if (f.indices[k] > lrg) lrg = f.indices[k];
            sum += f.indices[k];
            prod *= (f.indices[k] + 1);  /* +1 to avoid zero */
        }
        smallest_idx[nc] = (double)sml;
        largest_idx[nc] = (double)lrg;
        mean_idx[nc] = sum / f.count;
        span_idx[nc] = (double)(lrg - sml);
        sum_idx[nc] = sum;
        product_idx[nc] = log(prod);  /* log to keep manageable */
        comp_values[nc] = n;
        nc++;
    }
    printf("Composites analysed: %d\n\n", nc);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Factor index distributions */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: FACTOR INDEX STATISTICS");
    printf("  Sequence       │ Mean     │ Std dev  │ Entropy │ Norm\n");
    printf("  ───────────────┼──────────┼──────────┼─────────┼─────\n");

    typedef struct { const char *name; double *data; int len; } Seq;
    Seq factor_seqs[] = {
        {"smallest_idx", smallest_idx, nc},
        {"largest_idx",  largest_idx,  nc},
        {"mean_idx",     mean_idx,     nc},
        {"span",         span_idx,     nc},
        {"sum_idx",      sum_idx,      nc},
        {"log(prod_idx)",product_idx,  nc},
    };
    int nfs = sizeof(factor_seqs) / sizeof(factor_seqs[0]);

    for (int s = 0; s < nfs; s++) {
        double mean = 0, var = 0;
        for (int i = 0; i < nc; i++) mean += factor_seqs[s].data[i];
        mean /= nc;
        for (int i = 0; i < nc; i++) {
            double d = factor_seqs[s].data[i] - mean;
            var += d * d;
        }
        var = sqrt(var / nc);
        double ent = shannon_entropy_d(factor_seqs[s].data, nc, 64) / log2(64.0);
        printf("  %-15s │ %8.2f │ %8.2f │ %7.4f │ %5.3f\n",
               factor_seqs[s].name, mean, var, ent * log2(64.0), ent);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: H-scaffold on each factor sequence */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: H''''/H''' FOR FACTOR SEQUENCES");
    printf("Compare to prime gap ratio of 1.873.\n\n");

    printf("  Sequence       │ d1/d0 │ d2/d1 │ d3/d2 │ d4/d3 │ vs 1.873\n");
    printf("  ───────────────┼───────┼───────┼───────┼───────┼─────────\n");

    double factor_ratios[6][5];
    for (int s = 0; s < nfs; s++) {
        double *seq = malloc(nc * sizeof(double));
        memcpy(seq, factor_seqs[s].data, nc * sizeof(double));
        int sn = nc;
        double prev_rms = 0;
        printf("  %-15s│", factor_seqs[s].name);
        for (int k = 0; k <= 4 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
            double r = rms_d(seq, sn);
            double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
            factor_ratios[s][k] = ratio;
            if (k >= 1) printf(" %5.3f │", ratio);
            prev_rms = r;
        }
        printf(" %+6.3f\n", factor_ratios[s][4] - 1.873);
        free(seq);
    }

    /* also compute for prime gaps for direct comparison */
    printf("  %-15s│", "PRIME GAPS");
    {
        double *pgaps = malloc(np * sizeof(double));
        for (int i = 0; i < np - 1; i++) pgaps[i] = (double)(primes[i + 1] - primes[i]);
        int sn = np - 1;
        double prev_rms = 0;
        for (int k = 0; k <= 4 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(pgaps, pgaps, sn, 1);
            double r = rms_d(pgaps, sn);
            double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
            if (k >= 1) printf(" %5.3f │", ratio);
            prev_rms = r;
        }
        printf("  REF\n");
        free(pgaps);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Cross-correlation — factor sequences vs prime gaps */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: DO FACTOR SEQUENCES OVERLAY PRIME GAPS?");
    printf("Cross-correlate each factor sequence with the prime gap sequence.\n");
    printf("Overlay = the factor pattern echoes the prime pattern.\n\n");

    /* we need to align: factor sequences are indexed by composite,
     * prime gaps are indexed by prime. Build a common index. */

    /* approach: for each prime p[i], compute average factor index
     * of composites in [p[i], p[i+1]]. This maps factor data onto
     * the prime-indexed axis. */
    int npg = np - 1;
    double *pgap_norm = malloc(npg * sizeof(double));
    double *factor_at_prime[6];
    for (int s = 0; s < nfs; s++) factor_at_prime[s] = malloc(npg * sizeof(double));

    int ci = 0;
    for (int pi = 0; pi < npg; pi++) {
        pgap_norm[pi] = (double)(primes[pi + 1] - primes[pi]) / log((double)primes[pi]) - 1.0;

        /* average factor sequence values for composites between p[pi] and p[pi+1] */
        double sums[6] = {0};
        int count = 0;
        while (ci < nc && comp_values[ci] < primes[pi + 1]) {
            if (comp_values[ci] > primes[pi]) {
                sums[0] += smallest_idx[ci];
                sums[1] += largest_idx[ci];
                sums[2] += mean_idx[ci];
                sums[3] += span_idx[ci];
                sums[4] += sum_idx[ci];
                sums[5] += product_idx[ci];
                count++;
            }
            ci++;
        }
        for (int s = 0; s < nfs; s++)
            factor_at_prime[s][pi] = count > 0 ? sums[s] / count : 0;
    }

    printf("  Factor seq     │ Corr w/ gaps │ |Corr| │ R²     │ Overlay?\n");
    printf("  ───────────────┼──────────────┼────────┼────────┼─────────\n");

    for (int s = 0; s < nfs; s++) {
        /* subtract means */
        double mg = 0, mf = 0;
        for (int i = 0; i < npg; i++) { mg += pgap_norm[i]; mf += factor_at_prime[s][i]; }
        mg /= npg; mf /= npg;

        double dot = 0, gn = 0, fn = 0;
        for (int i = 0; i < npg; i++) {
            double g = pgap_norm[i] - mg;
            double f = factor_at_prime[s][i] - mf;
            dot += g * f;
            gn += g * g;
            fn += f * f;
        }
        double corr = (gn > 1e-30 && fn > 1e-30) ? dot / sqrt(gn * fn) : 0;
        double r2 = corr * corr;
        printf("  %-15s │  %+10.6f  │ %6.4f │ %6.4f │ %s\n",
               factor_seqs[s].name, corr, fabs(corr), r2,
               r2 > 0.1 ? "*** STRONG OVERLAY" :
               r2 > 0.01 ? "**  moderate" :
               r2 > 0.001 ? "*   weak" : "    none");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Factor derivative vs prime derivative */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: DERIVATIVES — do they converge at H'''?");
    printf("Compute H''' of factor sequences and prime gaps.\n");
    printf("Correlate the H''' sequences. Convergence = overlay at jerk.\n\n");

    printf("  Factor seq     │ d0 corr │ d1 corr │ d2 corr │ d3 corr │ Converging?\n");
    printf("  ───────────────┼─────────┼─────────┼─────────┼─────────┼───────────\n");

    for (int s = 0; s < nfs; s++) {
        printf("  %-15s│", factor_seqs[s].name);

        double *fseq = malloc(npg * sizeof(double));
        double *gseq = malloc(npg * sizeof(double));
        memcpy(fseq, factor_at_prime[s], npg * sizeof(double));
        memcpy(gseq, pgap_norm, npg * sizeof(double));
        int n = npg;
        double prev_corr = 0;
        int converging = 1;

        for (int k = 0; k <= 3; k++) {
            if (k > 0) {
                n = diff_k_d(fseq, fseq, n, 1);
                diff_k_d(gseq, gseq, npg, 1);  /* note: this modifies gseq in place */
            }
            /* don't re-derive gseq from npg each time, use same n */
            /* correlate */
            double dot = 0, gn = 0, fn = 0;
            int cn = n < npg ? n : npg;
            for (int i = 0; i < cn; i++) {
                dot += fseq[i] * gseq[i];
                gn += gseq[i] * gseq[i];
                fn += fseq[i] * fseq[i];
            }
            double corr = (gn > 1e-30 && fn > 1e-30) ? dot / sqrt(gn * fn) : 0;
            printf(" %+6.4f │", corr);
            if (k > 0 && fabs(corr) < fabs(prev_corr) - 0.01) converging = 0;
            prev_corr = corr;
        }
        printf(" %s\n", converging ? "YES — converging" : "no");
        free(fseq); free(gseq);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: The feedback loop — factors of factors */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: FACTOR FEEDBACK LOOP");
    printf("Take a composite's factor indices. Sum them. Is the sum prime?\n");
    printf("If yes: factors → sum → prime. The loop closes.\n\n");

    int loop_closes = 0, loop_total = 0;
    int loop_closes_by_omega[10] = {0};
    int loop_total_by_omega[10] = {0};

    for (int ci2 = 0; ci2 < nc && ci2 < 100000; ci2++) {
        int n = comp_values[ci2];
        Factorisation f;
        factorise(n, &f);
        if (f.count == 0) continue;

        /* sum of factor indices */
        int fidx_sum = 0;
        for (int k = 0; k < f.count; k++) fidx_sum += f.indices[k];

        /* is the sum prime? */
        int is_p = (fidx_sum >= 2 && fidx_sum <= MAX_N && !sieve[fidx_sum]);
        loop_total++;
        if (is_p) loop_closes++;

        int omega = f.count < 10 ? f.count : 9;
        loop_total_by_omega[omega]++;
        if (is_p) loop_closes_by_omega[omega]++;
    }

    printf("  Overall: %d / %d composites have prime factor-index-sum (%.2f%%)\n",
           loop_closes, loop_total, 100.0 * loop_closes / loop_total);
    printf("  Expected (random): ~%.2f%%\n\n",
           100.0 / log(50.0));  /* rough: average index sum ~50 */

    printf("  By Ω (number of factors):\n");
    printf("  Ω │ Closes │ Total  │ Rate   │ vs expected\n");
    printf("  ──┼────────┼────────┼────────┼────────────\n");
    for (int w = 2; w <= 9; w++) {
        if (loop_total_by_omega[w] == 0) continue;
        double rate = (double)loop_closes_by_omega[w] / loop_total_by_omega[w];
        printf("  %d │ %6d │ %6d │ %6.3f │ %s\n",
               w, loop_closes_by_omega[w], loop_total_by_omega[w], rate,
               rate > 0.2 ? "*** HIGH" :
               rate > 0.1 ? "**  above" : "    normal");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: The overlay test — MI between factor and prime sequences */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: MUTUAL INFORMATION — factor structure vs prime structure");

    /* discretise for MI */
    int *disc_gap = malloc(npg * sizeof(int));
    for (int i = 0; i < npg; i++)
        disc_gap[i] = (int)((pgap_norm[i] + 2.0) * 10);  /* shift to positive */

    for (int s = 0; s < nfs; s++) {
        int *disc_f = malloc(npg * sizeof(int));
        double fmin = factor_at_prime[s][0], fmax = factor_at_prime[s][0];
        for (int i = 1; i < npg; i++) {
            if (factor_at_prime[s][i] < fmin) fmin = factor_at_prime[s][i];
            if (factor_at_prime[s][i] > fmax) fmax = factor_at_prime[s][i];
        }
        double frange = fmax - fmin;
        if (frange < 1e-10) frange = 1;
        for (int i = 0; i < npg; i++)
            disc_f[i] = (int)((factor_at_prime[s][i] - fmin) / frange * 29);

        double mi = mutual_info_pair(disc_gap, disc_f, npg, 40, 30);
        printf("  MI(gaps, %-15s) = %.6f bits  %s\n",
               factor_seqs[s].name, mi,
               mi > 0.1 ? "*** STRONG" :
               mi > 0.01 ? "**  moderate" :
               mi > 0.001 ? "*   weak" : "    none");
        free(disc_f);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: Fixed point test */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: FIXED POINT TEST");
    printf("The loop: primes → gaps → composites → factor indices → ???\n");
    printf("Does the factor index sequence reproduce the gap sequence?\n\n");

    /* compute the derivative of mean_factor_index along composites */
    /* and compare to prime gap derivative */
    double *factor_deriv = malloc(nc * sizeof(double));
    for (int i = 0; i < nc - 1; i++)
        factor_deriv[i] = mean_idx[i + 1] - mean_idx[i];
    int nfd = nc - 1;

    /* H''''/H''' of factor derivative */
    double *fd3 = malloc(nfd * sizeof(double));
    double *fd4 = malloc(nfd * sizeof(double));
    int fd3n = diff_k_d(factor_deriv, fd3, nfd, 3);
    int fd4n = diff_k_d(factor_deriv, fd4, nfd, 4);
    double fr3 = rms_d(fd3, fd3n);
    double fr4 = rms_d(fd4, fd4n);
    double factor_ratio = fr3 > 1e-30 ? fr4 / fr3 : 0;

    printf("  Factor derivative H''''/H''': %.4f\n", factor_ratio);
    printf("  Prime gap H''''/H''':         1.8730\n");
    printf("  Difference:                   %+.4f\n\n", factor_ratio - 1.873);

    if (fabs(factor_ratio - 1.873) < 0.02) {
        printf("  *** FIXED POINT DETECTED ***\n");
        printf("  The factor index derivative has the SAME ratio as prime gaps.\n");
        printf("  The loop closes: primes → composites → factors → primes.\n");
        printf("  This is the self-referential structure of the number line.\n");
    } else {
        printf("  Factor ratio differs from prime gap ratio by %.4f\n", fabs(factor_ratio - 1.873));
        printf("  The loop does NOT close exactly.\n");
        printf("  The gap between %.4f and 1.873 is the residual.\n", factor_ratio);
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE SELF-REFERENCE");
    printf("Primes build composites. Composites are made of primes.\n");
    printf("The factor structure either mirrors the prime structure (fixed point)\n");
    printf("or it doesn't (residual exists).\n\n");
    printf("The H''''/H''' ratio of the factor derivative tells us:\n");
    printf("  If = 1.873: the system IS a fixed point. Self-referential. Closed.\n");
    printf("              RH holds because the loop contracts to this ratio.\n");
    printf("  If ≠ 1.873: the gap IS the unexplained structure.\n");
    printf("              That gap is where an off-line zero could hide.\n");

    free(sieve); free(primes); free(comp_values);
    free(smallest_idx); free(largest_idx); free(mean_idx);
    free(span_idx); free(sum_idx); free(product_idx);
    free(pgap_norm); free(disc_gap); free(factor_deriv);
    free(fd3); free(fd4);
    for (int s = 0; s < nfs; s++) free(factor_at_prime[s]);
    return 0;
}
