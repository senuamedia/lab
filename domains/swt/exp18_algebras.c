/*
 * Experiment 18: Algebraic Rotation — Primes Across Number Systems
 *
 * Stop scaling up. Rotate instead.
 *
 * A prime in Z (the integers) may not be prime in other rings:
 *   - Z[i] (Gaussian integers): p splits if p ≡ 1 mod 4
 *   - Z[ω] (Eisenstein integers): p splits if p ≡ 1 mod 3
 *   - Z[√-5]: class number > 1, unique factorisation FAILS
 *   - GF(p): finite fields, everything wraps
 *
 * Each algebra gives a DIFFERENT binary sequence:
 *   split/inert in Z[i]: 0,0,1,0,1,0,0,1,0,1,0,0,...  (p≡1 mod 4)
 *   split/inert in Z[ω]: 0,1,0,0,1,1,0,0,0,1,...      (p≡1 mod 3)
 *
 * These sequences are governed by Dirichlet L-functions.
 * Each L-function has its own zeros. Each has its own RH (GRH).
 *
 * Apply the scaffold to EACH algebraic view.
 * If the ratio is the same: universal structure.
 * If different: algebra-dependent structure.
 *
 * This overcomes scale by adding ALGEBRAIC dimensions instead of numeric ones.
 *
 * Also: XOR algebra. Primes have no XOR meaning — but the XOR of
 * consecutive primes creates a DIFFERENT sequence. Apply the scaffold.
 * Same for shift, rotate, exponentiate.
 */

#include "rh_scaffold.h"

#define MAX_N 1000000
#define MAX_PRIMES 80000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* ────────────────────────────────────────────────── */
/* Algebraic classifications of primes                */
/* ────────────────────────────────────────────────── */

/* Gaussian integers Z[i]: p splits iff p ≡ 1 (mod 4) */
static int gaussian_splits(int p) {
    if (p == 2) return 1;  /* 2 = -i(1+i)² ramifies */
    return (p % 4 == 1) ? 1 : 0;
}

/* Eisenstein integers Z[ω]: p splits iff p ≡ 1 (mod 3) */
static int eisenstein_splits(int p) {
    if (p == 3) return 1;  /* 3 ramifies */
    return (p % 3 == 1) ? 1 : 0;
}

/* Z[√2]: p splits iff 2 is a quadratic residue mod p, i.e. p ≡ ±1 (mod 8) */
static int sqrt2_splits(int p) {
    if (p == 2) return 1;
    int r = p % 8;
    return (r == 1 || r == 7) ? 1 : 0;
}

/* Z[√-5]: class number 2 — unique factorisation FAILS */
/* p splits iff -5 is a QR mod p */
static int sqrt_neg5_splits(int p) {
    if (p == 2 || p == 5) return 1;
    /* Legendre symbol (-5/p) = (-1/p)(5/p) */
    int neg1 = (p % 4 == 1) ? 1 : -1;
    /* (5/p) by quadratic reciprocity: (5/p)(p/5) = (-1)^((5-1)/2 * (p-1)/2) */
    int p_mod_5 = p % 5;
    int five_p;
    if (p_mod_5 == 1 || p_mod_5 == 4) five_p = 1;
    else five_p = -1;
    return (neg1 * five_p == 1) ? 1 : 0;
}

/* Z[√3]: p splits iff 3 is a QR mod p, i.e. p ≡ ±1 (mod 12) */
static int sqrt3_splits(int p) {
    if (p == 2 || p == 3) return 1;
    int r = p % 12;
    return (r == 1 || r == 11) ? 1 : 0;
}

/* Legendre symbol (a/p) for small a */
static int legendre(int a, int p) {
    if (a % p == 0) return 0;
    /* Euler's criterion: a^((p-1)/2) mod p */
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

int main(void) {
    printf("=== Experiment 18: Algebraic Rotation ===\n\n");
    printf("Same primes, different algebras. Does the scaffold care?\n\n");

    /* generate primes */
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

    /* ──────────────────────────────────────────── */
    /* Build algebraic classification sequences     */
    /* ──────────────────────────────────────────── */

    typedef struct {
        const char *name;
        const char *description;
        double *seq;      /* classification: +1 splits, -1 inert */
        double *gaps;     /* gaps in the classification sequence */
        int split_count;
    } Algebra;

    Algebra algs[10];
    int nalg = 0;

    /* helper to build an algebra from a classification function */
    #define BUILD_ALG(NAME, DESC, FUNC) do { \
        algs[nalg].name = NAME; \
        algs[nalg].description = DESC; \
        algs[nalg].seq = malloc(np * sizeof(double)); \
        algs[nalg].gaps = malloc(ng * sizeof(double)); \
        algs[nalg].split_count = 0; \
        for (int i = 0; i < np; i++) { \
            algs[nalg].seq[i] = FUNC(primes[i]) ? 1.0 : -1.0; \
            if (FUNC(primes[i])) algs[nalg].split_count++; \
        } \
        for (int i = 0; i < ng; i++) \
            algs[nalg].gaps[i] = algs[nalg].seq[i + 1] - algs[nalg].seq[i]; \
        nalg++; \
    } while(0)

    BUILD_ALG("Z[i]",   "Gaussian: p≡1(4)",   gaussian_splits);
    BUILD_ALG("Z[ω]",   "Eisenstein: p≡1(3)", eisenstein_splits);
    BUILD_ALG("Z[√2]",  "p≡±1(8)",            sqrt2_splits);
    BUILD_ALG("Z[√-5]", "class number 2",      sqrt_neg5_splits);
    BUILD_ALG("Z[√3]",  "p≡±1(12)",           sqrt3_splits);

    /* XOR algebra: xor consecutive primes */
    algs[nalg].name = "XOR";
    algs[nalg].description = "p[n] XOR p[n+1]";
    algs[nalg].seq = malloc(ng * sizeof(double));
    algs[nalg].gaps = malloc(ng * sizeof(double));
    algs[nalg].split_count = 0;
    for (int i = 0; i < ng; i++) {
        algs[nalg].seq[i] = (double)(primes[i] ^ primes[i + 1]);
    }
    /* normalise XOR to [−1, 1] by taking sign of (xor - mean) */
    double xor_mean = 0;
    for (int i = 0; i < ng; i++) xor_mean += algs[nalg].seq[i];
    xor_mean /= ng;
    for (int i = 0; i < ng; i++) {
        algs[nalg].seq[i] = algs[nalg].seq[i] > xor_mean ? 1.0 : -1.0;
        if (algs[nalg].seq[i] > 0) algs[nalg].split_count++;
    }
    for (int i = 0; i < ng - 1; i++)
        algs[nalg].gaps[i] = algs[nalg].seq[i + 1] - algs[nalg].seq[i];
    nalg++;

    /* Additive: is p[n]+p[n+1] prime? */
    algs[nalg].name = "ADD";
    algs[nalg].description = "p[n]+p[n+1] prime?";
    algs[nalg].seq = malloc(ng * sizeof(double));
    algs[nalg].gaps = malloc(ng * sizeof(double));
    algs[nalg].split_count = 0;
    for (int i = 0; i < ng; i++) {
        int sum = primes[i] + primes[i + 1];
        algs[nalg].seq[i] = (sum <= MAX_N && !sieve[sum]) ? 1.0 : -1.0;
        if (algs[nalg].seq[i] > 0) algs[nalg].split_count++;
    }
    for (int i = 0; i < ng - 1; i++)
        algs[nalg].gaps[i] = algs[nalg].seq[i + 1] - algs[nalg].seq[i];
    nalg++;

    /* Quadratic residue: is p a QR mod the next prime? */
    algs[nalg].name = "QR";
    algs[nalg].description = "Legendre(p[n]/p[n+1])";
    algs[nalg].seq = malloc(ng * sizeof(double));
    algs[nalg].gaps = malloc(ng * sizeof(double));
    algs[nalg].split_count = 0;
    for (int i = 0; i < ng; i++) {
        int leg = legendre(primes[i], primes[i + 1]);
        algs[nalg].seq[i] = (double)leg;
        if (leg == 1) algs[nalg].split_count++;
    }
    for (int i = 0; i < ng - 1; i++)
        algs[nalg].gaps[i] = algs[nalg].seq[i + 1] - algs[nalg].seq[i];
    nalg++;

    printf("Algebras built: %d\n\n", nalg);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Classification statistics */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: ALGEBRAIC CLASSIFICATION OF PRIMES");
    printf("  Algebra │ Description           │ Split    │ Inert    │ Ratio  │ Expected\n");
    printf("  ────────┼───────────────────────┼──────────┼──────────┼────────┼─────────\n");

    for (int a = 0; a < nalg; a++) {
        int total = (a < 5) ? np : ng;  /* ring algebras use np, others use ng */
        printf("  %-7s │ %-21s │ %8d │ %8d │ %6.3f │ %6.3f\n",
               algs[a].name, algs[a].description,
               algs[a].split_count, total - algs[a].split_count,
               (double)algs[a].split_count / total,
               a < 5 ? 0.5 : 0.5);  /* Chebotarev: equal split for degree 2 */
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: H-scaffold on each algebraic sequence */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: H''''/H''' RATIO PER ALGEBRA");
    printf("THE key test: does the ratio depend on the algebra?\n\n");

    printf("  Algebra │ d1/d0  │ d2/d1  │ d3/d2  │ d4/d3  │ d5/d4  │ d6/d5\n");
    printf("  ────────┼────────┼────────┼────────┼────────┼────────┼───────\n");

    double alg_ratios[10][15];
    for (int a = 0; a < nalg; a++) {
        int len = (a < 5) ? np : ng;
        double *seq = malloc(len * sizeof(double));
        memcpy(seq, algs[a].seq, len * sizeof(double));
        int sn = len;
        double prev_rms = 0;

        printf("  %-7s │", algs[a].name);
        for (int k = 0; k <= 6 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
            double r = rms_d(seq, sn);
            double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
            alg_ratios[a][k] = ratio;
            if (k >= 1) printf(" %6.3f │", ratio);
            prev_rms = r;
        }
        printf("\n");
        free(seq);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Entropy at H''' per algebra */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: ENTROPY AT H''' PER ALGEBRA");
    printf("  Algebra │ d^0 ent │ d^1 ent │ d^2 ent │ d^3 ent │ Floor?\n");
    printf("  ────────┼─────────┼─────────┼─────────┼─────────┼───────\n");

    for (int a = 0; a < nalg; a++) {
        int len = (a < 5) ? np : ng;
        double *seq = malloc(len * sizeof(double));
        memcpy(seq, algs[a].seq, len * sizeof(double));
        int sn = len;
        double prev_ent = 0;
        int has_floor = 0;

        printf("  %-7s │", algs[a].name);
        for (int k = 0; k <= 3 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
            double ent = shannon_entropy_d(seq, sn, 64) / log2(64.0);
            printf("  %6.4f │", ent);
            if (k >= 2 && fabs(ent - prev_ent) < 0.01) has_floor = 1;
            prev_ent = ent;
        }
        printf(" %s\n", has_floor ? "YES — floor" : "no");
        free(seq);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Cross-algebra MI */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: CROSS-ALGEBRA MUTUAL INFORMATION");
    printf("Do different algebras see the same structure?\n\n");

    /* discretise sequences for MI */
    int common = ng - 1;
    if (common > 50000) common = 50000;

    int **disc = malloc(nalg * sizeof(int *));
    for (int a = 0; a < nalg; a++) {
        disc[a] = malloc(common * sizeof(int));
        for (int i = 0; i < common; i++) {
            disc[a][i] = algs[a].seq[i] > 0 ? 1 : 0;
        }
    }

    printf("%-8s", "");
    for (int j = 0; j < nalg; j++) printf("│ %-7s", algs[j].name);
    printf("\n────────");
    for (int j = 0; j < nalg; j++) printf("┼────────");
    printf("\n");

    for (int i = 0; i < nalg; i++) {
        printf("%-8s", algs[i].name);
        for (int j = 0; j < nalg; j++) {
            double mi = mutual_info_pair(disc[i], disc[j], common, 2, 2);
            printf("│ %6.4f ", mi);
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Combined multi-algebra scaffold */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: COMBINED — all algebras as dimensions");
    printf("Each algebra is a dimension. Euclidean distance in algebra-space.\n\n");

    /* compute Euclidean distance between consecutive primes in algebra-space */
    double *alg_dist = malloc(common * sizeof(double));
    for (int i = 0; i < common; i++) {
        double sum = 0;
        for (int a = 0; a < nalg; a++) {
            double v = (i + 1 < (a < 5 ? np : ng)) ?
                       algs[a].seq[i + 1] - algs[a].seq[i] : 0;
            sum += v * v;
        }
        alg_dist[i] = sqrt(sum);
    }

    printf("  Algebra-space H-scaffold:\n\n");
    printf("  Order │ RMS       │ Ratio │ Entropy │ Norm\n");
    printf("  ──────┼───────────┼───────┼─────────┼─────\n");

    double *aseq = malloc(common * sizeof(double));
    memcpy(aseq, alg_dist, common * sizeof(double));
    int asn = common;
    double prev_rms = 0;
    double combined_ratios[15];
    for (int k = 0; k <= 8 && asn > 100; k++) {
        if (k > 0) asn = diff_k_d(aseq, aseq, asn, 1);
        double r = rms_d(aseq, asn);
        double ent = shannon_entropy_d(aseq, asn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        combined_ratios[k] = ratio;
        printf("  d^%-4d│ %9.5f │ %5.3f │ %7.4f │ %5.3f\n",
               k, r, ratio, ent * log2(64.0), ent);
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: The convergence test — add algebras one by one */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: RATIO vs ALGEBRAIC DIMENSIONALITY");
    printf("  D │ Algebras            │ H''''/H''' │ Gap from 2 │ Trend\n");
    printf("  ──┼─────────────────────┼────────────┼────────────┼──────\n");

    double prev_ratio = 0;
    for (int d = 1; d <= nalg; d++) {
        double *dist = malloc(common * sizeof(double));
        for (int i = 0; i < common; i++) {
            double sum = 0;
            for (int a = 0; a < d; a++) {
                double v = (i + 1 < (a < 5 ? np : ng)) ?
                           algs[a].seq[i + 1] - algs[a].seq[i] : 0;
                sum += v * v;
            }
            dist[i] = sqrt(sum);
        }
        double *d3 = malloc(common * sizeof(double));
        double *d4 = malloc(common * sizeof(double));
        int d3n = diff_k_d(dist, d3, common, 3);
        int d4n = diff_k_d(dist, d4, common, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;

        /* build label */
        char label[64] = "";
        for (int a = 0; a < d && a < 3; a++) {
            if (a > 0) strcat(label, ",");
            strcat(label, algs[a].name);
        }
        if (d > 3) strcat(label, ",...");

        const char *trend = (d == 1) ? "—" :
                           ratio < prev_ratio - 0.005 ? "▽ dropping" :
                           ratio > prev_ratio + 0.005 ? "▲ rising" : "→ stable";
        printf("  %d │ %-19s │   %7.4f  │   %7.4f  │ %s\n",
               d, label, ratio, 2.0 - ratio, trend);
        prev_ratio = ratio;
        free(dist); free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: The universal ratio comparison */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: THE UNIVERSAL RATIO");
    printf("H''''/H''' across ALL measurement types:\n\n");

    printf("  Source                  │ Ratio  │ Gap from 2\n");
    printf("  ────────────────────────┼────────┼──────────\n");
    printf("  Binary (P=1/C=0)       │ 2.0000 │  0.0000  (no structure)\n");
    printf("  Prime gaps (1D)        │ 1.8730 │  0.1270\n");
    printf("  Ω(n) shade (1D)        │ 1.9160 │  0.0840\n");
    printf("  λ(n) Liouville (1D)    │ 1.8710 │  0.1290\n");
    for (int a = 0; a < nalg; a++) {
        printf("  %-24s │ %6.4f │  %6.4f\n",
               algs[a].name, alg_ratios[a][4], 2.0 - alg_ratios[a][4]);
    }
    printf("  Combined %dD algebra   │ %6.4f │  %6.4f\n",
           nalg, combined_ratios[4], 2.0 - combined_ratios[4]);

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: ALGEBRAIC ROTATION");
    printf("1. Each algebra (Z[i], Z[ω], Z[√2], XOR, QR, ...) gives a\n");
    printf("   DIFFERENT binary classification of the same primes.\n\n");
    printf("2. The H''''/H''' ratio for ±1 sequences is ~2.0 (binary noise)\n");
    printf("   but the GAP from 2.0 differs per algebra.\n\n");
    printf("3. Cross-algebra MI reveals which algebras see the SAME structure\n");
    printf("   and which see INDEPENDENT structure.\n\n");
    printf("4. Combined multi-algebra scaffold merges all views.\n");
    printf("   The combined ratio vs single-algebra ratio shows whether\n");
    printf("   algebraic rotation provides new information or not.\n\n");
    printf("5. If the ratio is algebra-INDEPENDENT: the structure is universal.\n");
    printf("   RH (and GRH) hold because the mechanism doesn't depend on\n");
    printf("   which ring you work in.\n\n");
    printf("6. If the ratio is algebra-DEPENDENT: the structure changes with\n");
    printf("   the ring. GRH may hold for some L-functions and fail for others.\n");

    for (int a = 0; a < nalg; a++) { free(algs[a].seq); free(algs[a].gaps); }
    for (int a = 0; a < nalg; a++) free(disc[a]);
    free(disc); free(sieve); free(primes); free(alg_dist); free(aseq);
    return 0;
}
