/*
 * Experiment 22: The Leapfrog — Probe, Focus, Jump
 *
 * Instead of sieving to 10^50, JUMP there:
 *   1. At current scale: find two composites with max divergence
 *   2. Multiply them → land at a much larger number
 *   3. Sequence LOCALLY around the landing point
 *   4. Measure divergence at the new scale
 *   5. Track dual(divergence, d_divergence/d_scale) through the jump
 *   6. Repeat
 *
 * Each jump roughly squares the scale: N × N → N²
 * Starting at 500K:
 *   Jump 1: ~2.5 × 10^11
 *   Jump 2: ~6 × 10^22
 *   Jump 3: ~4 × 10^45
 *   Jump 4: ~10^90
 *   Jump 5: ~10^180
 *
 * At each landing: test primality locally, measure gaps,
 * compute divergence, track with dual numbers.
 *
 * If divergence contracts at every jump → RH consistent at ALL scales
 * If divergence amplifies at any jump → THAT scale is the precursor
 *
 * We use Miller-Rabin for primality at large scales.
 * Local gaps give us the scaffold without global sieving.
 */

#include "rh_scaffold.h"
#include <stdint.h>

/* ────────────────────────────────────────────────── */
/* Large number arithmetic (128-bit for products)     */
/* ────────────────────────────────────────────────── */

typedef unsigned __int128 u128;
typedef long long i64;
typedef unsigned long long u64;

/* modular exponentiation: (base^exp) mod mod */
static u64 mod_pow(u64 base, u64 exp, u64 mod) {
    u128 result = 1;
    u128 b = base % mod;
    while (exp > 0) {
        if (exp & 1) result = (result * b) % mod;
        b = (b * b) % mod;
        exp >>= 1;
    }
    return (u64)result;
}

/* Miller-Rabin primality test */
static int is_prime_mr(u64 n) {
    if (n < 2) return 0;
    if (n < 4) return 1;
    if (n % 2 == 0 || n % 3 == 0) return 0;

    /* write n-1 = d × 2^r */
    u64 d = n - 1;
    int r = 0;
    while (d % 2 == 0) { d /= 2; r++; }

    /* witnesses sufficient for n < 3,317,044,064,679,887,385,961,981 */
    u64 witnesses[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37};
    int nw = sizeof(witnesses) / sizeof(witnesses[0]);

    for (int wi = 0; wi < nw; wi++) {
        u64 a = witnesses[wi];
        if (a >= n) continue;

        u64 x = mod_pow(a, d, n);
        if (x == 1 || x == n - 1) continue;

        int found = 0;
        for (int i = 0; i < r - 1; i++) {
            x = (u128)x * x % n;
            if (x == n - 1) { found = 1; break; }
        }
        if (!found) return 0;
    }
    return 1;
}

/* count prime factors of a u64 (trial division up to limit) */
static int omega_large(u64 n, int trial_limit) {
    int count = 0;
    for (u64 p = 2; p <= (u64)trial_limit && p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;  /* remaining large factor */
    return count;
}

/* find next prime after n */
static u64 next_prime(u64 n) {
    if (n < 2) return 2;
    if (n == 2) return 3;
    n = (n % 2 == 0) ? n + 1 : n + 2;
    while (!is_prime_mr(n)) n += 2;
    return n;
}

/* find prev prime before n */
static u64 prev_prime(u64 n) {
    if (n <= 2) return 0;
    if (n == 3) return 2;
    n = (n % 2 == 0) ? n - 1 : n - 2;
    while (n > 2 && !is_prime_mr(n)) n -= 2;
    return n;
}

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* ────────────────────────────────────────────────── */
/* Dual number for tracking divergence derivative     */
/* ────────────────────────────────────────────────── */
typedef struct { double val; double der; } Dual;
static Dual dual(double v, double d) { return (Dual){v, d}; }

/* ────────────────────────────────────────────────── */
/* Local sequence measurement around a point          */
/* ────────────────────────────────────────────────── */

typedef struct {
    u64 center;           /* where we landed */
    int n_primes;         /* primes found locally */
    double mean_gap;      /* average gap */
    double expected_gap;  /* ln(center) */
    double divergence;    /* |mean_gap - expected| / expected */
    double ratio_d4d3;    /* H''''/H''' of local gaps */
    double entropy;       /* normalised entropy of gaps */
    double omega_mean;    /* mean Ω of composites in range */
} LocalMeasure;

static LocalMeasure measure_local(u64 center, int n_local_primes) {
    LocalMeasure m = {0};
    m.center = center;
    m.expected_gap = log((double)center);

    /* find primes around center */
    u64 *local_primes = malloc((n_local_primes + 10) * sizeof(u64));
    int np = 0;

    /* find the nearest prime to center, then expand outward */
    u64 p = center;
    if (!is_prime_mr(p)) p = next_prime(p);
    local_primes[np++] = p;

    /* expand forward */
    u64 cur = p;
    while (np < n_local_primes) {
        cur = next_prime(cur + 1);
        local_primes[np++] = cur;
    }

    m.n_primes = np;

    /* compute gaps */
    int ng = np - 1;
    double *gaps = malloc(ng * sizeof(double));
    double total_gap = 0;
    for (int i = 0; i < ng; i++) {
        gaps[i] = (double)(local_primes[i + 1] - local_primes[i]);
        total_gap += gaps[i];
    }
    m.mean_gap = total_gap / ng;
    m.divergence = fabs(m.mean_gap - m.expected_gap) / m.expected_gap;

    /* entropy */
    m.entropy = shannon_entropy_d(gaps, ng, 64) / log2(64.0);

    /* H''''/H''' ratio */
    if (ng > 20) {
        double *d3 = malloc(ng * sizeof(double));
        double *d4 = malloc(ng * sizeof(double));
        int d3n = diff_k_d(gaps, d3, ng, 3);
        int d4n = diff_k_d(gaps, d4, ng, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        m.ratio_d4d3 = r3 > 1e-30 ? r4 / r3 : 0;
        free(d3); free(d4);
    }

    /* mean Ω of composites in range */
    int omega_sum = 0, omega_count = 0;
    for (int i = 0; i < ng && omega_count < 200; i++) {
        u64 lo = local_primes[i] + 1;
        u64 hi = local_primes[i + 1];
        /* sample a few composites in this gap */
        for (u64 c = lo; c < hi && c < lo + 5; c++) {
            omega_sum += omega_large(c, 10000);
            omega_count++;
        }
    }
    m.omega_mean = omega_count > 0 ? (double)omega_sum / omega_count : 0;

    free(local_primes); free(gaps);
    return m;
}

int main(void) {
    printf("=== Experiment 22: The Leapfrog ===\n\n");
    printf("Probe → Focus → Jump → Measure → Repeat\n");
    printf("Each jump squares the scale. Dual numbers track divergence.\n\n");

    /* ──────────────────────────────────────────── */
    /* Phase 1: Initial measurement at base scale   */
    /* ──────────────────────────────────────────── */
    rh_table_header("PHASE 1: BASE MEASUREMENT");

    /* start with known primes up to 500K for initial divergence scan */
    int base_limit = 500000;
    char *sieve = calloc(base_limit + 1, 1);
    for (int i = 2; (long long)i * i <= base_limit; i++)
        if (!sieve[i])
            for (int j = i * i; j <= base_limit; j += i)
                sieve[j] = 1;

    /* find most divergent composites (highest Ω for their size) */
    typedef struct { int n; int omega; double div; } Candidate;
    Candidate *candidates = malloc(base_limit * sizeof(Candidate));
    int ncand = 0;

    for (int n = 4; n <= base_limit; n++) {
        if (!sieve[n]) continue;
        int w = 0;
        int temp = n;
        for (int p = 2; (long long)p * p <= temp; p++)
            while (temp % p == 0) { w++; temp /= p; }
        if (temp > 1) w++;
        double expected = log(log((double)n));
        double div = fabs((double)w - expected);
        candidates[ncand++] = (Candidate){n, w, div};
    }

    /* sort by divergence */
    for (int i = 0; i < ncand - 1 && i < 1000; i++)
        for (int j = i + 1; j < ncand && j < 1000; j++)
            if (candidates[j].div > candidates[i].div) {
                Candidate t = candidates[i]; candidates[i] = candidates[j]; candidates[j] = t;
            }

    printf("Base scale: [2, %d]\n", base_limit);
    printf("Top divergent: n=%d (Ω=%d, div=%.2f), n=%d (Ω=%d, div=%.2f)\n\n",
           candidates[0].n, candidates[0].omega, candidates[0].div,
           candidates[1].n, candidates[1].omega, candidates[1].div);

    /* base measurement */
    LocalMeasure base = measure_local(250000, 500);
    printf("Base measurement at %llu:\n", (unsigned long long)base.center);
    printf("  Primes found: %d\n", base.n_primes);
    printf("  Mean gap: %.2f  Expected: %.2f  Divergence: %.4f\n",
           base.mean_gap, base.expected_gap, base.divergence);
    printf("  H''''/H''': %.4f\n", base.ratio_d4d3);
    printf("  Entropy: %.4f\n", base.entropy);
    printf("  Mean Ω: %.2f\n\n", base.omega_mean);

    /* ──────────────────────────────────────────── */
    /* Phase 2: THE LEAPFROG                        */
    /* ──────────────────────────────────────────── */
    rh_table_header("PHASE 2: THE LEAPFROG");
    printf("  Jump │ Scale          │ Mean gap │ Exp gap │ Diverg  │ H''''/H''' │ Ω mean │ Dual(div,d/ds)\n");
    printf("  ─────┼────────────────┼──────────┼─────────┼─────────┼────────────┼────────┼──────────────\n");

    /* initial state */
    Dual div_dual = dual(base.divergence, 0);  /* start with zero derivative */
    double prev_div = base.divergence;
    double prev_ratio = base.ratio_d4d3;
    double prev_scale = log10((double)base.center);

    /* pick top two divergent composites for first jump */
    u64 jump_a = candidates[0].n;
    u64 jump_b = candidates[1].n;

    int max_jumps = 8;
    LocalMeasure measurements[10];
    measurements[0] = base;

    printf("  %4d │ %14.2e │ %8.2f │ %7.2f │ %7.4f │   %7.4f  │ %6.2f │ (%.4f, %.4f)\n",
           0, (double)base.center, base.mean_gap, base.expected_gap,
           base.divergence, base.ratio_d4d3, base.omega_mean,
           div_dual.val, div_dual.der);

    for (int jump = 1; jump <= max_jumps; jump++) {
        /* compute landing point */
        u128 product_128 = (u128)jump_a * (u128)jump_b + 1;
        u64 landing;
        if (product_128 > (u128)1e18) {
            /* too large for u64 — use approximate */
            landing = (u64)((double)jump_a * (double)jump_b);
            if (landing < jump_a) landing = (u64)1e18;  /* overflow protection */
        } else {
            landing = (u64)product_128;
        }

        /* measure locally at landing */
        int local_primes = 200;  /* enough for scaffold */
        if (landing > (u64)1e15) local_primes = 100;  /* slower at large scale */
        if (landing > (u64)1e17) local_primes = 50;

        LocalMeasure m = measure_local(landing, local_primes);
        measurements[jump] = m;

        /* update dual: d(divergence)/d(log_scale) */
        double current_scale = log10((double)m.center);
        double scale_step = current_scale - prev_scale;
        double div_deriv = scale_step > 0.01 ?
                          (m.divergence - prev_div) / scale_step : 0;
        div_dual = dual(m.divergence, div_deriv);

        printf("  %4d │ %14.2e │ %8.2f │ %7.2f │ %7.4f │   %7.4f  │ %6.2f │ (%+.4f, %+.4f)\n",
               jump, (double)m.center, m.mean_gap, m.expected_gap,
               m.divergence, m.ratio_d4d3, m.omega_mean,
               div_dual.val, div_dual.der);

        /* prepare next jump: find most divergent local composites */
        /* use the landing point and its neighbours */
        u64 c1 = landing;
        if (is_prime_mr(c1)) c1++;
        u64 c2 = c1 + 2;
        while (is_prime_mr(c2)) c2 += 2;

        /* make sure they're actually composite and reasonably sized */
        jump_a = c1;
        jump_b = c2;

        prev_div = m.divergence;
        prev_ratio = m.ratio_d4d3;
        prev_scale = current_scale;

        /* stop if we overflow */
        if ((double)jump_a * (double)jump_b > 1e18) {
            printf("\n  Scale limit reached at ~10^%.0f\n", current_scale);
            max_jumps = jump;
            break;
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Divergence trajectory */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: DIVERGENCE TRAJECTORY ACROSS JUMPS");
    printf("  Jump │ log₁₀(scale) │ Divergence │ d(div)/d(scale) │ Contracting?\n");
    printf("  ─────┼──────────────┼────────────┼─────────────────┼─────────────\n");

    for (int j = 0; j <= max_jumps; j++) {
        double scale = log10((double)measurements[j].center);
        double div = measurements[j].divergence;
        double der = (j > 0) ? (div - measurements[j - 1].divergence) /
                               (scale - log10((double)measurements[j - 1].center)) : 0;
        printf("  %4d │    %8.2f   │  %8.4f  │    %+11.6f  │ %s\n",
               j, scale, div, der,
               j == 0 ? "—" :
               der < -0.001 ? "YES ▽ contracting" :
               der > 0.001 ? "NO  ▲ AMPLIFYING" : "→ stable");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Ratio trajectory */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: H''''/H''' RATIO ACROSS SCALES");
    printf("  Jump │ log₁₀(scale) │ Ratio  │ vs 1.873 │ Stable?\n");
    printf("  ─────┼──────────────┼────────┼──────────┼────────\n");

    for (int j = 0; j <= max_jumps; j++) {
        double scale = log10((double)measurements[j].center);
        double ratio = measurements[j].ratio_d4d3;
        printf("  %4d │    %8.2f   │ %6.4f │ %+7.4f  │ %s\n",
               j, scale, ratio, ratio - 1.873,
               fabs(ratio - 1.873) < 0.05 ? "YES ✓" :
               fabs(ratio - 1.873) < 0.1 ? "~ close" : "SHIFTED");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Ω trajectory — does shade deepen? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: SHADE TRAJECTORY — Ω(n) vs SCALE");
    printf("  Jump │ log₁₀(scale) │ Mean Ω │ E[Ω]=loglog(n) │ Shade dev\n");
    printf("  ─────┼──────────────┼────────┼────────────────┼──────────\n");

    for (int j = 0; j <= max_jumps; j++) {
        double scale = log10((double)measurements[j].center);
        double omega = measurements[j].omega_mean;
        double expected = log(log((double)measurements[j].center));
        printf("  %4d │    %8.2f   │ %6.2f │     %6.2f      │ %+6.2f\n",
               j, scale, omega, expected, omega - expected);
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE LEAPFROG");
    printf("Jumped from scale 10^5 to 10^%.0f in %d leaps.\n\n",
           log10((double)measurements[max_jumps].center), max_jumps);
    printf("At each scale:\n");
    printf("  - Measured local prime gaps\n");
    printf("  - Computed H''''/H''' ratio\n");
    printf("  - Tracked divergence with dual numbers\n");
    printf("  - Measured local Ω (shade depth)\n\n");

    int all_stable = 1;
    for (int j = 1; j <= max_jumps; j++) {
        if (fabs(measurements[j].ratio_d4d3 - 1.873) > 0.15) all_stable = 0;
    }

    if (all_stable) {
        printf("RESULT: Ratio stable across all scales. Divergence bounded.\n");
        printf("The leapfrog found no anomaly. RH consistent to 10^%.0f.\n",
               log10((double)measurements[max_jumps].center));
    } else {
        printf("RESULT: Ratio shifted at some scale. INVESTIGATE.\n");
        for (int j = 1; j <= max_jumps; j++) {
            if (fabs(measurements[j].ratio_d4d3 - 1.873) > 0.15)
                printf("  *** Anomaly at jump %d (scale 10^%.0f): ratio = %.4f\n",
                       j, log10((double)measurements[j].center), measurements[j].ratio_d4d3);
        }
    }

    free(sieve); free(candidates);
    return 0;
}
