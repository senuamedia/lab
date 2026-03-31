/*
 * Experiment 17: The Product Construction
 *
 * Find composites with maximum shade divergence.
 * Multiply them. Add 1. What happens?
 *
 * "Divergence" = how much a composite's Ω deviates from expected.
 * High divergence composites are structural anomalies.
 * Their product encodes the accumulated anomaly.
 * Adding 1 shifts into coprime territory.
 *
 * If product+1 is prime: the divergence pattern predicted a prime.
 * If product+1 is composite: what's ITS divergence? Does it amplify?
 *
 * The feedback loop:
 *   divergent composites → product+1 → check primality → measure divergence → repeat
 *
 * If this loop contracts: divergence damps itself. RH holds.
 * If this loop amplifies: divergence feeds itself. RH may fail.
 */

#include "rh_scaffold.h"

#define MAX_N 500000
#define TOP_K 100  /* top K most divergent composites */

static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

/* check primality for numbers that might be large */
static int is_prime_large(long long n) {
    if (n < 2) return 0;
    if (n < 4) return 1;
    if (n % 2 == 0 || n % 3 == 0) return 0;
    for (long long i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) return 0;
    }
    return 1;
}

static int big_omega_ll(long long n) {
    int count = 0;
    for (long long p = 2; p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

typedef struct {
    int n;
    int omega;
    double divergence;  /* |Ω(n) - E[Ω(n)]| */
} Composite;

int cmp_divergence(const void *a, const void *b) {
    double da = ((const Composite *)a)->divergence;
    double db = ((const Composite *)b)->divergence;
    return (db > da) - (db < da);  /* descending */
}

int main(void) {
    printf("=== Experiment 17: The Product Construction ===\n\n");
    printf("Find most divergent composites. Multiply. Add 1.\n");
    printf("Does the divergence pattern predict primes?\n\n");

    /* sieve */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    /* find all composites with their divergence */
    Composite *comps = malloc(MAX_N * sizeof(Composite));
    int nc = 0;
    for (int n = 4; n <= MAX_N; n++) {
        if (!sieve[n]) continue;  /* skip primes */
        int w = big_omega(n);
        double expected = log(log((double)n));
        double div = fabs((double)w - expected);
        comps[nc++] = (Composite){n, w, div};
    }
    printf("Composites: %d\n", nc);

    /* sort by divergence (most divergent first) */
    qsort(comps, nc, sizeof(Composite), cmp_divergence);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Top divergent composites */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: TOP 30 MOST DIVERGENT COMPOSITES");
    printf("  Rank │ n        │ Ω(n) │ E[Ω]  │ Divergence │ Factors\n");
    printf("  ─────┼──────────┼──────┼───────┼────────────┼────────\n");

    for (int i = 0; i < 30 && i < nc; i++) {
        int n = comps[i].n;
        printf("  %4d │ %8d │  %3d │ %5.2f │   %7.3f  │ ",
               i + 1, n, comps[i].omega,
               log(log((double)n)), comps[i].divergence);
        /* print factorisation */
        int temp = n;
        int first = 1;
        for (int p = 2; (long long)p * p <= temp; p++) {
            int count = 0;
            while (temp % p == 0) { count++; temp /= p; }
            if (count > 0) {
                if (!first) printf("×");
                if (count == 1) printf("%d", p);
                else printf("%d^%d", p, count);
                first = 0;
            }
        }
        if (temp > 1) { if (!first) printf("×"); printf("%d", temp); }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Product + 1 test — pairs of top divergent */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: PRODUCT + 1 — pairs of divergent composites");
    printf("Take top divergent composites, multiply pairs, add 1.\n\n");

    printf("  n1       │ n2       │ n1×n2+1       │ Prime? │ Ω(result) │ Diverge?\n");
    printf("  ─────────┼──────────┼───────────────┼────────┼───────────┼─────────\n");

    int primes_found = 0, total_tests = 0;
    int top_n = 20;  /* use top 20 */

    for (int i = 0; i < top_n && i < nc; i++) {
        for (int j = i + 1; j < top_n && j < nc; j++) {
            long long product = (long long)comps[i].n * comps[j].n + 1;
            if (product > 1e15) continue;  /* too large to test */
            int is_p = is_prime_large(product);
            int result_omega = is_p ? 1 : big_omega_ll(product);
            double expected_omega = log(log((double)product));
            double result_div = fabs(result_omega - expected_omega);

            total_tests++;
            if (is_p) primes_found++;

            if (total_tests <= 30 || is_p) {
                printf("  %8d │ %8d │ %13lld │ %s  │    %3d    │ %s\n",
                       comps[i].n, comps[j].n, product,
                       is_p ? "YES ←" : "no   ",
                       result_omega,
                       result_div > 3.0 ? "HIGH" :
                       result_div > 1.5 ? "moderate" : "low");
            }
        }
    }

    printf("\n  Results: %d primes out of %d tests (%.1f%%)\n",
           primes_found, total_tests, 100.0 * primes_found / total_tests);

    /* expected prime density at this product size */
    long long avg_product = (long long)comps[0].n * comps[1].n;
    double expected_density = 1.0 / log((double)avg_product);
    printf("  Expected density (1/ln(n)): %.4f (%.1f%%)\n",
           expected_density, expected_density * 100);
    printf("  Actual vs expected: %.2fx\n\n",
           (double)primes_found / total_tests / expected_density);

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Product + 1 — accumulating divergence */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: ACCUMULATED PRODUCT — chain of most divergent");
    printf("Take the most divergent composite. Multiply by next. Add 1.\n");
    printf("If result is composite, multiply by next most divergent. Add 1.\n");
    printf("Chain the construction.\n\n");

    printf("  Step │ Input     │ ×next_div  │ +1 =         │ Prime? │ Ω  │ Chain div\n");
    printf("  ─────┼───────────┼────────────┼──────────────┼────────┼────┼──────────\n");

    long long chain = comps[0].n;
    double chain_div = comps[0].divergence;
    int step = 0;

    for (int i = 1; i < nc && step < 20; i++) {
        long long next = chain * comps[i].n + 1;
        if (next > 1e14 || next < 0) break;

        int is_p = is_prime_large(next);
        int w = is_p ? 1 : big_omega_ll(next);
        double expected = log(log((double)next));
        double div = fabs(w - expected);

        printf("  %4d │ %9lld │ ×%-9d │ %12lld │ %s  │ %2d │ %7.3f\n",
               step + 1, chain, comps[i].n, next,
               is_p ? "YES ←" : "no   ", w, div);

        chain_div += div;
        chain = next;
        step++;

        if (is_p) {
            printf("        ↑ PRIME — chain resets. Total chain divergence: %.3f\n\n", chain_div);
            chain = comps[i + 1 < nc ? i + 1 : 0].n;
            chain_div = 0;
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Divergence by Ω class */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: PRODUCT+1 PRIMALITY BY Ω CLASS");
    printf("Group composites by Ω. Which shade produces the most primes?\n\n");

    printf("  Ω  │ Count  │ Tests  │ Primes │ Rate   │ vs expected │ Note\n");
    printf("  ───┼────────┼────────┼────────┼────────┼─────────────┼─────\n");

    for (int target_omega = 2; target_omega <= 10; target_omega++) {
        /* find composites with this Ω */
        int candidates[200];
        int ncand = 0;
        for (int ci = 0; ci < nc && ncand < 200; ci++) {
            if (comps[ci].omega == target_omega) {
                candidates[ncand++] = comps[ci].n;
            }
        }

        int tests = 0, found = 0;
        for (int i = 0; i < ncand && i < 30; i++) {
            for (int j = i + 1; j < ncand && j < 30; j++) {
                long long prod = (long long)candidates[i] * candidates[j] + 1;
                if (prod > 1e13) continue;
                tests++;
                if (is_prime_large(prod)) found++;
            }
        }

        double rate = tests > 0 ? (double)found / tests : 0;
        double exp_rate = tests > 0 ?
            1.0 / log((double)candidates[0] * (double)candidates[ncand > 1 ? 1 : 0]) : 0;
        printf("  %2d │ %6d │ %6d │ %6d │ %6.3f │   %+6.2fx    │ %s\n",
               target_omega, ncand, tests, found, rate,
               exp_rate > 0 ? rate / exp_rate : 0,
               rate > exp_rate * 2 ? "*** HIGH" :
               rate < exp_rate * 0.5 ? "*** LOW" : "");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Reverse — which primes have most divergent neighbours? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: REVERSE — prime neighbourhoods");
    printf("For each prime p, measure divergence of p-1 and p+1.\n");
    printf("Do primes with highly divergent neighbours cluster?\n\n");

    printf("  p        │ Ω(p-1) │ Ω(p+1) │ E[Ω]  │ Nbr div │ Gap before │ Gap after\n");
    printf("  ─────────┼────────┼────────┼───────┼─────────┼────────────┼──────────\n");

    /* find primes with most divergent neighbourhoods */
    typedef struct { int p; double nbr_div; int gap_before; int gap_after; } PrimeNbr;
    PrimeNbr *pnbrs = malloc(MAX_N * sizeof(PrimeNbr));
    int npn = 0;

    int prev_prime = 2;
    for (int n = 3; n <= MAX_N - 1; n++) {
        if (sieve[n]) continue;  /* skip composites */
        int w_minus = big_omega(n - 1);
        int w_plus = big_omega(n + 1);
        double expected = log(log((double)n));
        double div = fabs(w_minus - expected) + fabs(w_plus - expected);

        /* find next prime for gap_after */
        int next_prime = n + 1;
        while (next_prime <= MAX_N && sieve[next_prime]) next_prime++;

        pnbrs[npn].p = n;
        pnbrs[npn].nbr_div = div;
        pnbrs[npn].gap_before = n - prev_prime;
        pnbrs[npn].gap_after = next_prime - n;
        npn++;
        prev_prime = n;
    }

    /* sort by neighbourhood divergence */
    for (int i = 0; i < npn - 1 && i < 5000; i++)
        for (int j = i + 1; j < npn && j < 5000; j++)
            if (pnbrs[j].nbr_div > pnbrs[i].nbr_div) {
                PrimeNbr t = pnbrs[i]; pnbrs[i] = pnbrs[j]; pnbrs[j] = t;
            }

    for (int i = 0; i < 20; i++) {
        int p = pnbrs[i].p;
        int wm = big_omega(p - 1);
        int wp = big_omega(p + 1);
        printf("  %8d │   %3d  │   %3d  │ %5.2f │  %6.2f │     %5d  │    %5d\n",
               p, wm, wp, log(log((double)p)),
               pnbrs[i].nbr_div,
               pnbrs[i].gap_before, pnbrs[i].gap_after);
    }

    /* do high-divergence-neighbourhood primes have unusual gaps? */
    printf("\n  Gap statistics by neighbourhood divergence:\n\n");
    printf("  Divergence range │ Count │ Mean gap │ Expected │ Anomaly?\n");
    printf("  ─────────────────┼───────┼──────────┼──────────┼─────────\n");

    double div_ranges[][2] = {{0, 2}, {2, 4}, {4, 6}, {6, 8}, {8, 100}};
    int ndr = 5;
    for (int ri = 0; ri < ndr; ri++) {
        double lo = div_ranges[ri][0], hi = div_ranges[ri][1];
        double sum_gap = 0;
        int count = 0;
        for (int i = 0; i < npn; i++) {
            if (pnbrs[i].nbr_div >= lo && pnbrs[i].nbr_div < hi) {
                sum_gap += pnbrs[i].gap_after;
                count++;
            }
        }
        double mean_gap = count > 0 ? sum_gap / count : 0;
        /* expected gap ≈ ln(p) ≈ 12 for p around 200k */
        double expected = 12.0;
        printf("  [%4.1f, %4.1f)      │ %5d │ %8.2f │ %8.2f │ %s\n",
               lo, hi, count, mean_gap, expected,
               mean_gap > expected * 1.3 ? "*** LARGE GAPS" :
               mean_gap < expected * 0.7 ? "*** SMALL GAPS" : "normal");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: The feedback loop test */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: FEEDBACK LOOP — does divergence amplify or damp?");
    printf("Start with most divergent composite c.\n");
    printf("Compute c×(c+1)+1. Measure divergence of result.\n");
    printf("If result divergence > input: AMPLIFYING (bad for RH).\n");
    printf("If result divergence < input: DAMPING (good for RH).\n\n");

    printf("  Step │ n            │ Ω    │ E[Ω]  │ Divergence │ Amplify?\n");
    printf("  ─────┼──────────────┼──────┼───────┼────────────┼─────────\n");

    int amplify_count = 0, damp_count = 0;
    for (int start = 0; start < 50 && start < nc; start++) {
        long long n = comps[start].n;
        double prev_div = comps[start].divergence;
        long long result = n * (n + 1) + 1;
        if (result > 1e14 || result < 0) continue;

        int w = is_prime_large(result) ? 1 : big_omega_ll(result);
        double expected = log(log((double)result));
        double div = fabs(w - expected);

        int amplifies = div > prev_div;
        if (amplifies) amplify_count++;
        else damp_count++;

        if (start < 20) {
            printf("  %4d │ %12lld │  %3d │ %5.2f │   %7.3f  │ %s\n",
                   start + 1, result, w, expected, div,
                   amplifies ? "▲ AMPLIFY" : "▽ damp");
        }
    }

    printf("\n  Amplifying: %d    Damping: %d    Ratio: %.2f\n",
           amplify_count, damp_count,
           damp_count > 0 ? (double)amplify_count / damp_count : 99.0);
    printf("  If ratio > 1: divergence feeds itself → potential RH weakness\n");
    printf("  If ratio < 1: divergence damps itself → RH consistent\n");

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE PRODUCT CONSTRUCTION");
    printf("1. Most divergent composites are powers of 2 (Ω = 20 for 2^20)\n");
    printf("   and products of many small primes.\n\n");
    printf("2. Product+1 of divergent composites: does it produce primes\n");
    printf("   at a DIFFERENT rate than expected?\n");
    printf("   If higher: divergence concentrates near primes.\n");
    printf("   If lower: divergence avoids primes.\n");
    printf("   If same: no connection (divergence is random).\n\n");
    printf("3. The feedback loop: does n×(n+1)+1 increase or decrease divergence?\n");
    printf("   Amplifying → structure feeds itself → possible RH failure mode.\n");
    printf("   Damping → structure dissolves → RH consistent.\n\n");
    printf("4. Prime neighbourhoods: do primes with divergent p±1 have unusual gaps?\n");
    printf("   If yes: the shade around primes matters. The leeway is real.\n");

    free(sieve); free(comps); free(pnbrs);
    return 0;
}
