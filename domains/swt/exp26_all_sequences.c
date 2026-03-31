/*
 * Experiment 26: All Sequences — The Universal Pattern
 *
 * Every famous integer sequence is a projection of the integers
 * through a different function. Apply the same H-scaffold to ALL of them.
 * Does a common ratio emerge? Does something bind them?
 *
 * Sequences tested:
 *   - Primes (reference: ratio ≈ 1.873)
 *   - Fibonacci
 *   - Triangular numbers
 *   - Square numbers
 *   - Collatz stopping times
 *   - Euler totient φ(n)
 *   - Divisor count d(n)
 *   - Sum of divisors σ(n)
 *   - Ω(n) — prime factor count
 *   - Möbius μ(n)
 *   - Liouville λ(n)
 *   - Sum of digits (base 10)
 *   - Lucky numbers
 *   - Abundant/deficient indicator
 *   - Powers of 2 gaps
 *   - Twin prime indicator
 *   - Palindrome indicator
 *   - Partition function approximation
 *   - Collatz max trajectory height
 *   - Digital root
 *
 * If they all give the same ratio: universal structure.
 * If they cluster: families of structure.
 * If they scatter: each is unique.
 */

#include "rh_scaffold.h"

#define N 500000  /* sequence length */

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* ────────────────────────────────────────────────── */
/* Sequence generators                                */
/* ────────────────────────────────────────────────── */

/* Collatz stopping time: steps to reach 1 */
static int collatz_steps(long long n) {
    int steps = 0;
    while (n > 1 && steps < 1000) {
        if (n % 2 == 0) n /= 2;
        else n = 3 * n + 1;
        steps++;
    }
    return steps;
}

/* Collatz max height in trajectory */
static long long collatz_max(long long n) {
    long long mx = n;
    int steps = 0;
    while (n > 1 && steps < 1000) {
        if (n % 2 == 0) n /= 2;
        else n = 3 * n + 1;
        if (n > mx) mx = n;
        steps++;
    }
    return mx;
}

/* Euler totient φ(n) */
static int euler_phi(int n) {
    int result = n;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) {
            while (n % p == 0) n /= p;
            result -= result / p;
        }
    }
    if (n > 1) result -= result / n;
    return result;
}

/* divisor count d(n) */
static int divisor_count(int n) {
    int count = 0;
    for (int d = 1; (long long)d * d <= n; d++) {
        if (n % d == 0) {
            count++;
            if (d != n / d) count++;
        }
    }
    return count;
}

/* sum of divisors σ(n) */
static int divisor_sum(int n) {
    int sum = 0;
    for (int d = 1; (long long)d * d <= n; d++) {
        if (n % d == 0) {
            sum += d;
            if (d != n / d) sum += n / d;
        }
    }
    return sum;
}

/* Ω(n) */
static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++)
        while (n % p == 0) { count++; n /= p; }
    if (n > 1) count++;
    return count;
}

/* Möbius μ(n) */
static int mobius(int n) {
    int factors = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) { n /= p; factors++; if (n % p == 0) return 0; }
    }
    if (n > 1) factors++;
    return (factors % 2 == 0) ? 1 : -1;
}

/* sum of digits base 10 */
static int digit_sum(int n) {
    int s = 0;
    while (n > 0) { s += n % 10; n /= 10; }
    return s;
}

/* digital root (repeated digit sum until single digit) */
static int digital_root(int n) {
    if (n == 0) return 0;
    return 1 + (n - 1) % 9;
}

/* is palindrome base 10? */
static int is_palindrome(int n) {
    if (n < 0) return 0;
    int rev = 0, orig = n;
    while (n > 0) { rev = rev * 10 + n % 10; n /= 10; }
    return rev == orig;
}

/* Fibonacci (mod to prevent overflow, we care about pattern not value) */
static void gen_fibonacci_mod(double *out, int len, int mod) {
    long long a = 1, b = 1;
    for (int i = 0; i < len; i++) {
        out[i] = (double)(a % mod);
        long long c = (a + b) % mod;
        a = b; b = c;
    }
}

int main(void) {
    printf("=== Experiment 26: All Sequences — The Universal Pattern ===\n\n");
    printf("Apply H-scaffold to every known integer pattern.\n");
    printf("Does a universal structure emerge?\n\n");

    /* ──────────────────────────────────────────── */
    /* Generate all sequences                       */
    /* ──────────────────────────────────────────── */
    typedef struct {
        const char *name;
        double *data;
        int len;
        double ratio;  /* H''''/H''' — filled later */
        double entropy; /* d^3 entropy — filled later */
    } Sequence;

    Sequence seqs[30];
    int ns = 0;

    printf("Generating sequences (N = %d)...\n", N);

    /* 1. Prime gaps */
    {
        seqs[ns].name = "Prime gaps";
        seqs[ns].data = malloc(N * sizeof(double));
        char *sieve = calloc(N * 20 + 1, 1);
        for (int i = 2; (long long)i * i <= N * 20; i++)
            if (!sieve[i]) for (int j = i * i; j <= N * 20; j += i) sieve[j] = 1;
        int prev = 2, idx = 0;
        for (int i = 3; i <= N * 20 && idx < N; i++)
            if (!sieve[i]) { seqs[ns].data[idx++] = (double)(i - prev); prev = i; }
        seqs[ns].len = idx;
        free(sieve);
        ns++;
    }

    /* 2. Fibonacci mod 1000 */
    seqs[ns].name = "Fibonacci mod1000";
    seqs[ns].data = malloc(N * sizeof(double));
    gen_fibonacci_mod(seqs[ns].data, N, 1000);
    seqs[ns].len = N;
    ns++;

    /* 3. Fibonacci mod 7 (Pisano period) */
    seqs[ns].name = "Fibonacci mod7";
    seqs[ns].data = malloc(N * sizeof(double));
    gen_fibonacci_mod(seqs[ns].data, N, 7);
    seqs[ns].len = N;
    ns++;

    /* 4. Collatz stopping times */
    seqs[ns].name = "Collatz steps";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)collatz_steps(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 5. Collatz max trajectory height (log) */
    seqs[ns].name = "Collatz max(log)";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = log((double)collatz_max(i + 2) + 1);
    seqs[ns].len = N;
    ns++;

    /* 6. Euler totient φ(n) */
    seqs[ns].name = "Euler φ(n)";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)euler_phi(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 7. Divisor count d(n) */
    seqs[ns].name = "Divisor d(n)";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)divisor_count(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 8. Sum of divisors σ(n) */
    seqs[ns].name = "Divisor σ(n)";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)divisor_sum(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 9. Ω(n) */
    seqs[ns].name = "Ω(n)";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)big_omega(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 10. Möbius μ(n) */
    seqs[ns].name = "Möbius μ(n)";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)mobius(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 11. Liouville λ(n) */
    seqs[ns].name = "Liouville λ(n)";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (big_omega(i + 2) % 2 == 0) ? 1.0 : -1.0;
    seqs[ns].len = N;
    ns++;

    /* 12. Sum of digits */
    seqs[ns].name = "Digit sum";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)digit_sum(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 13. Digital root */
    seqs[ns].name = "Digital root";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)digital_root(i + 2);
    seqs[ns].len = N;
    ns++;

    /* 14. Triangular number gaps */
    seqs[ns].name = "Triangular gaps";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)(i + 3);  /* T(n+1)-T(n) = n+1 */
    seqs[ns].len = N;
    ns++;

    /* 15. n mod 6 (cyclic) */
    seqs[ns].name = "n mod 6";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)((i + 2) % 6);
    seqs[ns].len = N;
    ns++;

    /* 16. Abundant indicator: σ(n) > 2n */
    seqs[ns].name = "Abundant?";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (divisor_sum(i + 2) > 2 * (i + 2)) ? 1.0 : -1.0;
    seqs[ns].len = N;
    ns++;

    /* 17. Palindrome indicator */
    seqs[ns].name = "Palindrome?";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = is_palindrome(i + 2) ? 1.0 : -1.0;
    seqs[ns].len = N;
    ns++;

    /* 18. φ(n)/n — the totient ratio */
    seqs[ns].name = "φ(n)/n";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)euler_phi(i + 2) / (i + 2);
    seqs[ns].len = N;
    ns++;

    /* 19. σ(n)/n — the abundancy index */
    seqs[ns].name = "σ(n)/n";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) seqs[ns].data[i] = (double)divisor_sum(i + 2) / (i + 2);
    seqs[ns].len = N;
    ns++;

    /* 20. Collatz parity sequence: for n, record the sequence of odd/even in trajectory */
    seqs[ns].name = "Collatz parity";
    seqs[ns].data = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) {
        /* encode first 8 parity bits of Collatz trajectory as a number */
        long long n = i + 2;
        int code = 0;
        for (int b = 0; b < 8 && n > 1; b++) {
            if (n % 2 != 0) code |= (1 << b);
            n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        }
        seqs[ns].data[i] = (double)code;
    }
    seqs[ns].len = N;
    ns++;

    printf("Generated %d sequences.\n\n", ns);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: H''''/H''' ratio for ALL sequences */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: H''''/H''' RATIO — ALL SEQUENCES");
    printf("  %-20s│ d1/d0 │ d2/d1 │ d3/d2 │ d4/d3 │ d5/d4 │ Gap from 2\n", "Sequence");
    printf("  ──────────────────┼───────┼───────┼───────┼───────┼───────┼──────────\n");

    for (int s = 0; s < ns; s++) {
        double *seq = malloc(seqs[s].len * sizeof(double));
        memcpy(seq, seqs[s].data, seqs[s].len * sizeof(double));
        int sn = seqs[s].len;
        double prev_rms = 0;
        double ratios[8];

        printf("  %-20s│", seqs[s].name);
        for (int k = 0; k <= 5 && sn > 100; k++) {
            if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
            double r = rms_d(seq, sn);
            double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
            ratios[k] = ratio;
            if (k >= 1) printf(" %5.3f │", ratio);
            prev_rms = r;
        }
        seqs[s].ratio = ratios[4];
        printf(" %+7.4f\n", 2.0 - ratios[4]);

        /* compute d^3 entropy */
        memcpy(seq, seqs[s].data, seqs[s].len * sizeof(double));
        sn = seqs[s].len;
        for (int k = 0; k < 3 && sn > 100; k++) sn = diff_k_d(seq, seq, sn, 1);
        seqs[s].entropy = shannon_entropy_d(seq, sn, 64) / log2(64.0);

        free(seq);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Sorted by ratio — find the clusters */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: SEQUENCES SORTED BY H''''/H''' RATIO");
    printf("  %-20s│ Ratio  │ Gap    │ d3 ent │ Cluster\n", "Sequence");
    printf("  ──────────────────┼────────┼────────┼────────┼────────\n");

    /* sort indices by ratio */
    int idx[30];
    for (int i = 0; i < ns; i++) idx[i] = i;
    for (int i = 0; i < ns - 1; i++)
        for (int j = i + 1; j < ns; j++)
            if (seqs[idx[j]].ratio < seqs[idx[i]].ratio) {
                int t = idx[i]; idx[i] = idx[j]; idx[j] = t;
            }

    for (int i = 0; i < ns; i++) {
        int s = idx[i];
        const char *cluster;
        double r = seqs[s].ratio;
        if (r < 1.01) cluster = "DEGENERATE";
        else if (r < 1.5) cluster = "LOW";
        else if (fabs(r - 1.873) < 0.03) cluster = "*** PRIME-LIKE";
        else if (r > 1.95) cluster = "NEAR-RANDOM";
        else if (r > 1.9) cluster = "HIGH";
        else cluster = "MIDDLE";

        printf("  %-20s│ %6.4f │ %+6.4f │ %6.4f │ %s\n",
               seqs[s].name, r, 2.0 - r, seqs[s].entropy, cluster);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Cross-correlation matrix (selected) */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: CROSS-MI BETWEEN KEY SEQUENCES");
    printf("Do different sequences see the same structure?\n\n");

    /* select key sequences for MI comparison */
    int key[] = {0, 3, 4, 5, 6, 8, 9, 11};  /* gaps, collatz, φ, d, Ω, μ, digits */
    int nkey = sizeof(key) / sizeof(key[0]);

    /* discretise */
    int **disc = malloc(ns * sizeof(int *));
    for (int s = 0; s < ns; s++) {
        disc[s] = malloc(N * sizeof(int));
        double mn = seqs[s].data[0], mx = seqs[s].data[0];
        int len = seqs[s].len < N ? seqs[s].len : N;
        for (int i = 1; i < len; i++) {
            if (seqs[s].data[i] < mn) mn = seqs[s].data[i];
            if (seqs[s].data[i] > mx) mx = seqs[s].data[i];
        }
        double range = mx - mn;
        if (range < 1e-10) range = 1;
        for (int i = 0; i < len; i++) {
            disc[s][i] = (int)((seqs[s].data[i] - mn) / range * 19);
            if (disc[s][i] >= 20) disc[s][i] = 19;
        }
    }

    printf("%-16s", "");
    for (int j = 0; j < nkey; j++) printf("│ %-9s", seqs[key[j]].name);
    printf("\n────────────────");
    for (int j = 0; j < nkey; j++) printf("┼──────────");
    printf("\n");

    for (int i = 0; i < nkey; i++) {
        printf("%-16s", seqs[key[i]].name);
        for (int j = 0; j < nkey; j++) {
            int common = seqs[key[i]].len < seqs[key[j]].len ?
                         seqs[key[i]].len : seqs[key[j]].len;
            if (common > N) common = N;
            double mi = mutual_info_pair(disc[key[i]], disc[key[j]], common, 20, 20);
            printf("│ %8.4f ", mi);
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: The Collatz connection */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: THE COLLATZ CONNECTION");
    printf("Does Collatz structure correlate with prime structure?\n\n");

    /* MI between Collatz stopping time and various prime-related sequences */
    printf("  Sequence pair                │ MI (bits) │ Correlation?\n");
    printf("  ─────────────────────────────┼───────────┼─────────────\n");

    int pairs[][2] = {{3, 0}, {3, 6}, {3, 8}, {3, 9}, {3, 5}, {4, 0}, {4, 8}, {19, 0}, {19, 8}};
    int npairs = sizeof(pairs) / sizeof(pairs[0]);
    for (int p = 0; p < npairs; p++) {
        int a = pairs[p][0], b = pairs[p][1];
        int common = seqs[a].len < seqs[b].len ? seqs[a].len : seqs[b].len;
        if (common > N) common = N;
        double mi = mutual_info_pair(disc[a], disc[b], common, 20, 20);
        char label[64];
        snprintf(label, sizeof(label), "%s × %s", seqs[a].name, seqs[b].name);
        printf("  %-29s│  %7.4f  │ %s\n", label, mi,
               mi > 0.1 ? "*** STRONG" :
               mi > 0.01 ? "**  moderate" :
               mi > 0.001 ? "*   weak" : "    none");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Universal ratio families */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: RATIO FAMILIES");
    printf("Group sequences by H''''/H''' ratio.\n\n");

    /* count per cluster */
    int c_degen = 0, c_low = 0, c_prime = 0, c_mid = 0, c_high = 0, c_rand = 0;
    for (int s = 0; s < ns; s++) {
        double r = seqs[s].ratio;
        if (r < 1.01) c_degen++;
        else if (r < 1.5) c_low++;
        else if (fabs(r - 1.873) < 0.03) c_prime++;
        else if (r > 1.95) c_rand++;
        else if (r > 1.9) c_high++;
        else c_mid++;
    }

    printf("  DEGENERATE (ratio < 1.01):     %d sequences\n", c_degen);
    printf("  LOW (1.01 - 1.50):             %d sequences\n", c_low);
    printf("  MIDDLE (1.50 - 1.85):          %d sequences\n", c_mid);
    printf("  *** PRIME-LIKE (1.85 - 1.90):  %d sequences\n", c_prime);
    printf("  HIGH (1.90 - 1.95):            %d sequences\n", c_high);
    printf("  NEAR-RANDOM (> 1.95):          %d sequences\n\n", c_rand);

    printf("  Sequences in the PRIME-LIKE cluster (1.85 - 1.90):\n");
    for (int i = 0; i < ns; i++) {
        int s = idx[i];
        if (fabs(seqs[s].ratio - 1.873) < 0.03) {
            printf("    %-20s ratio = %.4f  (Δ = %+.4f)\n",
                   seqs[s].name, seqs[s].ratio, seqs[s].ratio - 1.873);
        }
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE UNIVERSAL PATTERN");
    printf("%d sequences through the same scaffold.\n\n", ns);
    printf("Key question: does something bind them?\n\n");
    printf("If the prime-like cluster contains sequences unrelated to primes:\n");
    printf("  → The ratio 1.873 is NOT unique to primes.\n");
    printf("  → It's a property of a CLASS of integer functions.\n");
    printf("  → RH is a statement about that class, not just primes.\n\n");
    printf("If only prime-related sequences give 1.873:\n");
    printf("  → The ratio IS specific to prime structure.\n");
    printf("  → RH is fundamentally about primality.\n\n");
    printf("The Collatz connection (if any) would be explosive:\n");
    printf("  → Two unproven conjectures sharing the same scaffold constant\n");
    printf("  → would suggest a common underlying mechanism.\n");

    for (int s = 0; s < ns; s++) { free(seqs[s].data); free(disc[s]); }
    free(disc);
    return 0;
}
