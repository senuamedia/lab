/*
 * Experiment 50: Find Chebyshev Bias Reversals
 *
 * For each modulus q and residue pair (a,b):
 *   π(x;q,a) > π(x;q,b) for all x we've checked (up to 1M).
 *   Rubinstein-Sarnak (1994) proved it reverses infinitely often.
 *   But WHERE is the first reversal?
 *
 * Strategy:
 *   1. Compute the bias to 10M (cheap, extends our data)
 *   2. If no reversal by 10M, use wave model to predict location
 *   3. If reversal found, report it — that's a concrete result
 *
 * Focus on moduli where first reversal is UNKNOWN in literature.
 * Known: mod 4 (Bays-Hudson found first at 26861),
 *        mod 3 (first at 608981813029).
 * Unknown for many larger moduli.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 50000000  /* 50M — push further to find reversals */

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== Experiment 50: Find Chebyshev Bias Reversals ===\n\n");
    printf("Search for first reversal of π(x;q,a) - π(x;q,b) for all small moduli.\n");
    printf("Computing to %dM.\n\n", MAX_N/1000000);

    time_t t0 = time(NULL);

    /* sieve to 50M */
    printf("Sieving to %dM...\n", MAX_N/1000000);
    char *sieve = calloc(MAX_N+1, 1);
    for (int i=2; (long long)i*i <= MAX_N; i++)
        if (!sieve[i]) for (long long j=(long long)i*i; j<=MAX_N; j+=i) sieve[j]=1;
    printf("Done (%.0fs).\n\n", difftime(time(NULL),t0));

    /* test many moduli and residue pairs */
    typedef struct {
        int q, a, b;           /* bias: π(x;q,a) vs π(x;q,b) */
        long long first_rev;   /* first x where π(q,b) ≥ π(q,a) — the reversal */
        long long count_a, count_b;  /* final counts */
        int n_reversals;       /* total reversals in range */
    } BiasResult;

    BiasResult results[200];
    int nr = 0;

    /* generate all valid pairs for q = 3,4,5,6,7,8,10,11,12,13,16,24 */
    int moduli[] = {3,4,5,6,7,8,10,11,12,13,16,17,19,23,24,29,31};
    int n_mod = 17;

    printf("  q  │ a vs b │ First reversal at x  │ Reversals │ Final bias │ Status\n");
    printf("  ───┼────────┼──────────────────────┼───────────┼────────────┼───────\n");

    for (int mi = 0; mi < n_mod; mi++) {
        int q = moduli[mi];

        /* find all residues coprime to q */
        int residues[50]; int nres = 0;
        for (int r = 1; r < q; r++) {
            /* check gcd(r,q) = 1 */
            int a2=r, b2=q;
            while(b2){int t=b2;b2=a2%b2;a2=t;}
            if (a2 == 1) residues[nres++] = r;
        }

        /* for each pair of coprime residues */
        for (int ri = 0; ri < nres; ri++) {
            for (int rj = ri+1; rj < nres; rj++) {
                int a = residues[ri], b = residues[rj];

                /* always put the "expected leader" first */
                /* quadratic non-residues tend to lead */

                long long ca = 0, cb = 0;
                long long first_rev = -1;
                int n_rev = 0;
                int a_leads = 0; /* track who's leading */

                for (int i = 2; i <= MAX_N; i++) {
                    if (!sieve[i]) {
                        if (i % q == a) ca++;
                        if (i % q == b) cb++;
                    }
                    /* check for reversal (change of leader) */
                    if (i > q + 1) {
                        int now_a_leads = (ca > cb) ? 1 : (cb > ca) ? -1 : 0;
                        if (now_a_leads != 0 && now_a_leads != a_leads && a_leads != 0) {
                            n_rev++;
                            if (first_rev < 0) first_rev = i;
                        }
                        if (now_a_leads != 0) a_leads = now_a_leads;
                    }
                }

                if (nr < 200) {
                    results[nr] = (BiasResult){q, a, b, first_rev, ca, cb, n_rev};
                    nr++;
                }

                /* only print interesting cases */
                if (first_rev > 0 || (ca != cb && n_rev == 0)) {
                    printf("  %2d │ %2d v %2d│", q, a, b);
                    if (first_rev > 0)
                        printf(" %20lld │  %8d │ %+9lld │ %s\n",
                               first_rev, n_rev, ca-cb,
                               first_rev > 1000000 ? "*** LARGE" :
                               first_rev > 10000 ? "** medium" : "small");
                    else
                        printf("         none ≤ %dM │         0 │ %+9lld │ NO REVERSAL\n",
                               MAX_N/1000000, ca-cb);
                }
            }
        }
        fflush(stdout);
    }

    /* ═══ SUMMARY: Most interesting reversals ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: REVERSALS FOUND\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    int found = 0, not_found = 0;
    long long largest_rev = 0;
    int largest_q = 0, largest_a = 0, largest_b = 0;

    for (int i = 0; i < nr; i++) {
        if (results[i].first_rev > 0) {
            found++;
            if (results[i].first_rev > largest_rev) {
                largest_rev = results[i].first_rev;
                largest_q = results[i].q;
                largest_a = results[i].a;
                largest_b = results[i].b;
            }
        } else if (results[i].n_reversals == 0 && results[i].count_a != results[i].count_b) {
            not_found++;
        }
    }

    printf("  Total pairs tested: %d\n", nr);
    printf("  Reversals found: %d\n", found);
    printf("  No reversal in range: %d\n\n", not_found);

    if (largest_rev > 0) {
        printf("  Largest first reversal: π(%d,%d) vs π(%d,%d) at x = %lld\n",
               largest_q, largest_a, largest_q, largest_b, largest_rev);
    }

    /* ═══ NO-REVERSAL cases — candidates for wave prediction ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("NO-REVERSAL CASES — wave prediction candidates\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  These biases did NOT reverse in [1, %dM].\n", MAX_N/1000000);
    printf("  Rubinstein-Sarnak guarantees they WILL reverse eventually.\n");
    printf("  Finding WHERE is the open problem.\n\n");

    printf("  q  │ a vs b │ Final bias │ Bias/√(π(x)/φ(q)) │ Candidate?\n");
    printf("  ───┼────────┼────────────┼────────────────────┼──────────\n");

    for (int i = 0; i < nr; i++) {
        if (results[i].n_reversals == 0 && results[i].count_a > results[i].count_b) {
            double total = results[i].count_a + results[i].count_b;
            /* normalised bias */
            double norm_bias = (double)(results[i].count_a - results[i].count_b) / sqrt(total);
            printf("  %2d │ %2d v %2d│ %+9lld │       %8.2f      │ %s\n",
                   results[i].q, results[i].a, results[i].b,
                   results[i].count_a - results[i].count_b,
                   norm_bias,
                   norm_bias < 3.0 ? "*** CLOSE — reversal likely near" :
                   norm_bias < 5.0 ? "** moderate" : "far");
        }
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL), t0));
    free(sieve);
    return 0;
}
