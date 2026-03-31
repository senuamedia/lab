/*
 * rh_scaffold.h — Derivative scaffold for prime/zeta analysis
 *
 * H-level hierarchy applied to number-theoretic sequences:
 *   H   = sequence values (primes, zeros, counts)
 *   H'  = first differences (gaps, density changes)
 *   H'' = second differences (acceleration of structure)
 *   H'''= third differences (jerk — structure of structure change)
 *
 * Rotate-Sieve-Derive-Repeat framework for RH investigation.
 */

#ifndef RH_SCAFFOLD_H
#define RH_SCAFFOLD_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* ---------- limits ---------- */
#define RH_MAX_SEQ     100000
#define RH_MAX_PRIMES  100000
#define RH_MAX_BASE    256

/* ---------- safe modular arithmetic ---------- */
static int cmod(int x, int m) {
    int r = x % m;
    return r < 0 ? r + m : r;
}

/* ---------- primality and generation ---------- */

static int is_prime(int n) {
    if (n < 2) return 0;
    if (n < 4) return 1;
    if (n % 2 == 0 || n % 3 == 0) return 0;
    for (int i = 5; (long long)i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) return 0;
    }
    return 1;
}

static int generate_primes(int *primes, int max_count, int max_val) {
    int count = 0;
    for (int n = 2; n <= max_val && count < max_count; n++) {
        if (is_prime(n)) primes[count++] = n;
    }
    return count;
}

/* sieve of eratosthenes for larger ranges */
static int sieve_primes(int *primes, int max_count, int max_val) {
    char *sieve = calloc(max_val + 1, 1);
    if (!sieve) return 0;
    for (int i = 2; (long long)i * i <= max_val; i++) {
        if (!sieve[i]) {
            for (int j = i * i; j <= max_val; j += i)
                sieve[j] = 1;
        }
    }
    int count = 0;
    for (int i = 2; i <= max_val && count < max_count; i++) {
        if (!sieve[i]) primes[count++] = i;
    }
    free(sieve);
    return count;
}

/* ---------- difference operators (derivatives) ---------- */

/* first difference: out[i] = v[i+1] - v[i] */
static int diff_seq(const int *v, int *out, int n) {
    for (int i = 0; i < n - 1; i++)
        out[i] = v[i + 1] - v[i];
    return n - 1;
}

/* k-th order difference (in-place chain) */
static int diff_k(const int *v, int *out, int n, int k) {
    if (k == 0) { memcpy(out, v, n * sizeof(int)); return n; }
    memcpy(out, v, n * sizeof(int));
    for (int order = 0; order < k && n > 1; order++) {
        for (int i = 0; i < n - 1; i++)
            out[i] = out[i + 1] - out[i];
        n--;
    }
    return n;
}

/* ---------- double-precision difference operators ---------- */

static int diff_seq_d(const double *v, double *out, int n) {
    for (int i = 0; i < n - 1; i++)
        out[i] = v[i + 1] - v[i];
    return n - 1;
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

/* ---------- entropy measurement ---------- */

static double shannon_entropy(const int *v, int n, int base) {
    if (n == 0 || base < 2) return 0.0;
    int *counts = calloc(base, sizeof(int));
    if (!counts) return 0.0;
    for (int i = 0; i < n; i++)
        counts[cmod(v[i], base)]++;
    double ent = 0.0;
    for (int i = 0; i < base; i++) {
        if (counts[i] > 0) {
            double p = (double)counts[i] / n;
            ent -= p * log2(p);
        }
    }
    free(counts);
    return ent;
}

static double max_entropy(int base) {
    return log2((double)base);
}

static double normalised_entropy(const int *v, int n, int base) {
    double me = max_entropy(base);
    return me > 0 ? shannon_entropy(v, n, base) / me : 0.0;
}

/* entropy of double array (discretised into bins) */
static double shannon_entropy_d(const double *v, int n, int bins) {
    if (n == 0 || bins < 2) return 0.0;
    /* find range */
    double vmin = v[0], vmax = v[0];
    for (int i = 1; i < n; i++) {
        if (v[i] < vmin) vmin = v[i];
        if (v[i] > vmax) vmax = v[i];
    }
    double range = vmax - vmin;
    if (range < 1e-15) return 0.0;

    int *counts = calloc(bins, sizeof(int));
    if (!counts) return 0.0;
    for (int i = 0; i < n; i++) {
        int b = (int)((v[i] - vmin) / range * (bins - 1));
        if (b < 0) b = 0;
        if (b >= bins) b = bins - 1;
        counts[b]++;
    }
    double ent = 0.0;
    for (int i = 0; i < bins; i++) {
        if (counts[i] > 0) {
            double p = (double)counts[i] / n;
            ent -= p * log2(p);
        }
    }
    free(counts);
    return ent;
}

/* ---------- mutual information ---------- */

static double mutual_info_bases(const int *v, int n, int b1, int b2) {
    if (n == 0) return 0.0;
    int cells = b1 * b2;
    int *joint = calloc(cells, sizeof(int));
    int *marg1 = calloc(b1, sizeof(int));
    int *marg2 = calloc(b2, sizeof(int));
    if (!joint || !marg1 || !marg2) {
        free(joint); free(marg1); free(marg2);
        return 0.0;
    }
    for (int i = 0; i < n; i++) {
        int r1 = cmod(v[i], b1);
        int r2 = cmod(v[i], b2);
        joint[r1 * b2 + r2]++;
        marg1[r1]++;
        marg2[r2]++;
    }
    double mi = 0.0;
    for (int i = 0; i < b1; i++) {
        for (int j = 0; j < b2; j++) {
            int c = joint[i * b2 + j];
            if (c > 0) {
                double pxy = (double)c / n;
                double px = (double)marg1[i] / n;
                double py = (double)marg2[j] / n;
                mi += pxy * log2(pxy / (px * py));
            }
        }
    }
    free(joint); free(marg1); free(marg2);
    return mi;
}

/* MI between two separate integer arrays */
static double mutual_info_pair(const int *a, const int *b, int n, int ba, int bb) {
    if (n == 0) return 0.0;
    int cells = ba * bb;
    int *joint = calloc(cells, sizeof(int));
    int *marg1 = calloc(ba, sizeof(int));
    int *marg2 = calloc(bb, sizeof(int));
    if (!joint || !marg1 || !marg2) {
        free(joint); free(marg1); free(marg2);
        return 0.0;
    }
    for (int i = 0; i < n; i++) {
        int r1 = cmod(a[i], ba);
        int r2 = cmod(b[i], bb);
        joint[r1 * bb + r2]++;
        marg1[r1]++;
        marg2[r2]++;
    }
    double mi = 0.0;
    for (int i = 0; i < ba; i++) {
        for (int j = 0; j < bb; j++) {
            int c = joint[i * bb + j];
            if (c > 0) {
                double pxy = (double)c / n;
                double px = (double)marg1[i] / n;
                double py = (double)marg2[j] / n;
                mi += pxy * log2(pxy / (px * py));
            }
        }
    }
    free(joint); free(marg1); free(marg2);
    return mi;
}

/* ---------- conditional entropy ---------- */

static double cond_entropy(const int *v, int n, int base) {
    if (n < 2 || base < 2) return 0.0;
    int cells = base * base;
    int *bigram = calloc(cells, sizeof(int));
    int *marg = calloc(base, sizeof(int));
    if (!bigram || !marg) { free(bigram); free(marg); return 0.0; }
    for (int i = 0; i < n - 1; i++) {
        int a = cmod(v[i], base);
        int b = cmod(v[i + 1], base);
        bigram[a * base + b]++;
        marg[a]++;
    }
    double h = 0.0;
    for (int a = 0; a < base; a++) {
        if (marg[a] == 0) continue;
        for (int b = 0; b < base; b++) {
            int c = bigram[a * base + b];
            if (c > 0) {
                double p = (double)c / marg[a];
                h -= ((double)marg[a] / (n - 1)) * p * log2(p);
            }
        }
    }
    free(bigram); free(marg);
    return h;
}

/* ---------- autocorrelation ---------- */

static double autocorrelation(const int *v, int n, int lag) {
    if (lag >= n || n < 2) return 0.0;
    double mean = 0;
    for (int i = 0; i < n; i++) mean += v[i];
    mean /= n;
    double num = 0, den = 0;
    for (int i = 0; i < n; i++) {
        double d = v[i] - mean;
        den += d * d;
        if (i + lag < n) num += d * (v[i + lag] - mean);
    }
    return den > 0 ? num / den : 0.0;
}

/* ---------- KL divergence ---------- */

static double kl_divergence(const int *counts, int n, const double *expected, int base) {
    double kl = 0.0;
    for (int i = 0; i < base; i++) {
        double p = (double)counts[i] / n;
        double q = expected[i];
        if (p > 0 && q > 0) kl += p * log2(p / q);
    }
    return kl;
}

/* ---------- random baseline generation ---------- */

static unsigned int rh_rng_state = 0x12345678;

static unsigned int rh_rand(void) {
    rh_rng_state ^= rh_rng_state << 13;
    rh_rng_state ^= rh_rng_state >> 17;
    rh_rng_state ^= rh_rng_state << 5;
    return rh_rng_state;
}

static void generate_random_seq(int *out, int n, int lo, int hi) {
    int range = hi - lo + 1;
    for (int i = 0; i < n; i++)
        out[i] = lo + (int)(rh_rand() % range);
}

/* generate random integers that match the statistical profile of primes
   (same range, same count, but uniformly distributed in valid residues) */
static void generate_random_like_primes(int *out, int n, const int *primes) {
    for (int i = 0; i < n; i++) {
        /* random odd number in same range */
        int lo = (i > 0) ? primes[i - 1] : 2;
        int hi = (i < n - 1) ? primes[i + 1] : primes[n - 1] + 20;
        int v;
        do {
            v = lo + (int)(rh_rand() % (hi - lo + 1));
        } while (v < 2);
        out[i] = v;
    }
}

/* ---------- printing helpers ---------- */

#define RH_SEP "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

static void rh_table_header(const char *title) {
    printf("\n%s\n", RH_SEP);
    printf("%s\n", title);
    printf("%s\n", RH_SEP);
}

static void rh_section(const char *title) {
    printf("\n── %s ──\n\n", title);
}

#endif /* RH_SCAFFOLD_H */
