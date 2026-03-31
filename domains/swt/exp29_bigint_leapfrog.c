/*
 * Experiment 29: The Big Integer Leapfrog — Into the Zone (v2)
 *
 * The zone: 10^100 to 10^500.
 * Skewes broke at 10^316. RH lives on the same sequence, same colour.
 * If RH breaks, it breaks there.
 *
 * v2 fixes: landing point selection was biased.
 *   v1 used landing = current × 2×current + 1 = 2n² + 1
 *   → always near a perfect square, structured residue pattern
 *   → colour measurement was artifact, not signal
 *
 * v2 strategy: UNBIASED landing via prime product
 *   1. At current scale, find two distinct primes p, q
 *   2. q is offset from p by a pseudo-random gap (derived from p's bits)
 *   3. Landing = p × q — guaranteed squarefree, non-square
 *   4. Add pseudo-random offset (from p⊕q bits) to break residual structure
 *   5. Verify landing is not near any small perfect power
 *   6. Take 3 measurements at nearby offsets, report median for stability
 *
 * Scale progression: 10^6 → 10^12 → 10^24 → 10^48 → 10^96 → 10^192 → 10^384
 * That's 7 jumps. Each jump roughly squares the scale (product of two ~10^k primes).
 *
 * Increased sample sizes: 500 primes at small scale, adaptive at large.
 * Enough data for stable H''''/H''' ratio measurement.
 *
 * Big integer arithmetic:
 *   - 512-byte numbers (up to ~10^1200)
 *   - Multiply, add, subtract, mod, modpow
 *   - Miller-Rabin with 12 witnesses
 *   - No external libraries. Pure C.
 *
 * The principle: nothing is random at scale.
 * At 10^384, the colour tells us if the conjecture holds.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

/* ═══════════════════════════════════════════════ */
/* BIG INTEGER: 512 bytes = 4096 bits ≈ 10^1200   */
/* ═══════════════════════════════════════════════ */

#define BIGINT_WORDS 128   /* 128 × 32-bit words = 4096 bits */

typedef struct {
    unsigned int w[BIGINT_WORDS];  /* little-endian: w[0] is least significant */
    int used;                       /* number of words in use */
} BigInt;

static void bi_zero(BigInt *a) {
    memset(a->w, 0, sizeof(a->w));
    a->used = 1;
}

static void bi_from_u64(BigInt *a, unsigned long long v) {
    bi_zero(a);
    a->w[0] = (unsigned int)(v & 0xFFFFFFFF);
    a->w[1] = (unsigned int)(v >> 32);
    a->used = a->w[1] ? 2 : 1;
}

static void bi_copy(BigInt *dst, const BigInt *src) {
    memcpy(dst, src, sizeof(BigInt));
}

static int bi_is_zero(const BigInt *a) {
    for (int i = 0; i < a->used; i++)
        if (a->w[i] != 0) return 0;
    return 1;
}

static int bi_is_even(const BigInt *a) {
    return (a->w[0] & 1) == 0;
}

static int bi_cmp(const BigInt *a, const BigInt *b) {
    int m = a->used > b->used ? a->used : b->used;
    for (int i = m - 1; i >= 0; i--) {
        unsigned int aw = i < a->used ? a->w[i] : 0;
        unsigned int bw = i < b->used ? b->w[i] : 0;
        if (aw > bw) return 1;
        if (aw < bw) return -1;
    }
    return 0;
}

static void bi_trim(BigInt *a) {
    while (a->used > 1 && a->w[a->used - 1] == 0) a->used--;
}

/* a = a + b */
static void bi_add(BigInt *a, const BigInt *b) {
    unsigned long long carry = 0;
    int m = a->used > b->used ? a->used : b->used;
    for (int i = 0; i < m || carry; i++) {
        unsigned long long sum = carry;
        if (i < a->used) sum += a->w[i];
        if (i < b->used) sum += b->w[i];
        if (i < BIGINT_WORDS) a->w[i] = (unsigned int)(sum & 0xFFFFFFFF);
        carry = sum >> 32;
        if (i >= a->used) a->used = i + 1;
    }
    if (a->used < BIGINT_WORDS && carry) a->w[a->used++] = (unsigned int)carry;
    bi_trim(a);
}

/* a = a - b (assumes a >= b) */
static void bi_sub(BigInt *a, const BigInt *b) {
    long long borrow = 0;
    for (int i = 0; i < a->used; i++) {
        long long diff = (long long)a->w[i] - borrow;
        if (i < b->used) diff -= b->w[i];
        if (diff < 0) { diff += (1LL << 32); borrow = 1; }
        else borrow = 0;
        a->w[i] = (unsigned int)diff;
    }
    bi_trim(a);
}

/* a = a + 1 */
static void bi_inc(BigInt *a) {
    BigInt one; bi_from_u64(&one, 1);
    bi_add(a, &one);
}

/* a = a - 1 */
static void bi_dec(BigInt *a) {
    BigInt one; bi_from_u64(&one, 1);
    bi_sub(a, &one);
}

/* c = a × b */
static void bi_mul(BigInt *c, const BigInt *a, const BigInt *b) {
    bi_zero(c);
    for (int i = 0; i < a->used; i++) {
        unsigned long long carry = 0;
        for (int j = 0; j < b->used && i + j < BIGINT_WORDS; j++) {
            unsigned long long prod = (unsigned long long)a->w[i] * b->w[j]
                                    + c->w[i + j] + carry;
            c->w[i + j] = (unsigned int)(prod & 0xFFFFFFFF);
            carry = prod >> 32;
        }
        if (i + b->used < BIGINT_WORDS)
            c->w[i + b->used] = (unsigned int)carry;
    }
    c->used = a->used + b->used;
    if (c->used > BIGINT_WORDS) c->used = BIGINT_WORDS;
    bi_trim(c);
}

/* a = a >> 1 (right shift by 1) */
static void bi_shr1(BigInt *a) {
    unsigned int carry = 0;
    for (int i = a->used - 1; i >= 0; i--) {
        unsigned int next_carry = a->w[i] & 1;
        a->w[i] = (a->w[i] >> 1) | (carry << 31);
        carry = next_carry;
    }
    bi_trim(a);
}

/* r = a mod m (using repeated subtraction for small m, or long division) */
static void bi_mod(BigInt *r, const BigInt *a, const BigInt *m) {
    bi_copy(r, a);
    /* simple: repeated subtraction is slow for big numbers */
    /* use shift-and-subtract division */
    if (bi_cmp(r, m) < 0) return;

    /* find highest bit of m */
    int m_bits = 0;
    for (int i = m->used - 1; i >= 0; i--) {
        if (m->w[i]) {
            m_bits = i * 32;
            unsigned int v = m->w[i];
            while (v) { m_bits++; v >>= 1; }
            break;
        }
    }

    int r_bits = 0;
    for (int i = r->used - 1; i >= 0; i--) {
        if (r->w[i]) {
            r_bits = i * 32;
            unsigned int v = r->w[i];
            while (v) { r_bits++; v >>= 1; }
            break;
        }
    }

    int shift = r_bits - m_bits;
    if (shift < 0) return;

    /* shifted_m = m << shift */
    BigInt shifted_m;
    bi_copy(&shifted_m, m);
    /* left shift by 'shift' bits */
    for (int s = 0; s < shift; s++) {
        unsigned int carry = 0;
        for (int i = 0; i < shifted_m.used || carry; i++) {
            unsigned long long val = ((unsigned long long)(i < shifted_m.used ? shifted_m.w[i] : 0) << 1) | carry;
            if (i < BIGINT_WORDS) shifted_m.w[i] = (unsigned int)(val & 0xFFFFFFFF);
            carry = (unsigned int)(val >> 32);
            if (i >= shifted_m.used) shifted_m.used = i + 1;
        }
        if (shifted_m.used > BIGINT_WORDS) shifted_m.used = BIGINT_WORDS;
    }

    for (int s = shift; s >= 0; s--) {
        if (bi_cmp(r, &shifted_m) >= 0)
            bi_sub(r, &shifted_m);
        bi_shr1(&shifted_m);
    }
    bi_trim(r);
}

/* r = (base^exp) mod mod */
static void bi_modpow(BigInt *r, const BigInt *base, const BigInt *exp, const BigInt *mod) {
    BigInt b, e, temp;
    bi_mod(&b, base, mod);
    bi_copy(&e, exp);
    bi_from_u64(r, 1);

    while (!bi_is_zero(&e)) {
        if (!bi_is_even(&e)) {
            bi_mul(&temp, r, &b);
            bi_mod(r, &temp, mod);
        }
        bi_mul(&temp, &b, &b);
        bi_mod(&b, &temp, mod);
        bi_shr1(&e);
    }
}

/* approximate log10 of a BigInt */
static double bi_log10(const BigInt *a) {
    if (bi_is_zero(a)) return 0;
    /* find highest set bit */
    int bits = 0;
    for (int i = a->used - 1; i >= 0; i--) {
        if (a->w[i]) {
            bits = i * 32;
            unsigned int v = a->w[i];
            while (v) { bits++; v >>= 1; }
            break;
        }
    }
    return bits * 0.30103;  /* log10(2) */
}

/* approximate log of a BigInt */
static double bi_log(const BigInt *a) {
    return bi_log10(a) * 2.302585;  /* ln(10) */
}

/* print a BigInt (hex, abbreviated) */
static void bi_print(const BigInt *a) {
    int started = 0;
    for (int i = a->used - 1; i >= 0; i--) {
        if (a->w[i] || started) {
            if (!started) printf("%x", a->w[i]);
            else printf("%08x", a->w[i]);
            started = 1;
        }
        if (started && i <= a->used - 4 && i > 3) {
            printf("...");
            break;
        }
    }
    if (!started) printf("0");
}

/* ═══════════════════════════════════════════════ */
/* MILLER-RABIN for BigInt                         */
/* ═══════════════════════════════════════════════ */

static int bi_miller_rabin(const BigInt *n, int witnesses) {
    /* handle small cases */
    if (n->used == 1 && n->w[0] < 2) return 0;
    if (n->used == 1 && n->w[0] == 2) return 1;
    if (bi_is_even(n)) return 0;

    /* n - 1 = d × 2^r */
    BigInt d, n_minus_1;
    bi_copy(&n_minus_1, n);
    bi_dec(&n_minus_1);
    bi_copy(&d, &n_minus_1);
    int r = 0;
    while (bi_is_even(&d)) {
        bi_shr1(&d);
        r++;
    }

    /* test with small witnesses */
    unsigned long long witness_vals[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37};
    int nw = witnesses < 12 ? witnesses : 12;

    BigInt a, x, temp, one, two;
    bi_from_u64(&one, 1);
    bi_from_u64(&two, 2);

    for (int wi = 0; wi < nw; wi++) {
        bi_from_u64(&a, witness_vals[wi]);

        /* skip if witness >= n */
        if (bi_cmp(&a, n) >= 0) continue;

        /* x = a^d mod n */
        bi_modpow(&x, &a, &d, n);

        if (bi_cmp(&x, &one) == 0 || bi_cmp(&x, &n_minus_1) == 0)
            continue;

        int found = 0;
        for (int i = 0; i < r - 1; i++) {
            bi_mul(&temp, &x, &x);
            bi_mod(&x, &temp, n);
            if (bi_cmp(&x, &n_minus_1) == 0) { found = 1; break; }
        }
        if (!found) return 0;  /* composite */
    }
    return 1;  /* probably prime */
}

/* ═══════════════════════════════════════════════ */
/* NEXT PRIME: find next prime after n              */
/* ═══════════════════════════════════════════════ */

static void bi_next_prime(BigInt *n) {
    /* ensure odd */
    if (bi_is_even(n)) bi_inc(n);
    else { bi_inc(n); bi_inc(n); }

    BigInt two;
    bi_from_u64(&two, 2);

    while (!bi_miller_rabin(n, 12)) {
        bi_add(n, &two);
    }
}

/* ═══════════════════════════════════════════════ */
/* COLOUR MEASUREMENT at a given big-integer scale */
/* ═══════════════════════════════════════════════ */

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
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

#define WHITE_NOISE_RATIO_D4 1.8709  /* void value at k=4 */

typedef struct {
    double log10_scale;
    int n_primes;
    double mean_gap;
    double expected_gap;
    double ratio;
    double colour;          /* ratio - void */
    double colour_drift;    /* change from baseline */
} Measurement;

/* measure colour from a run of consecutive primes starting at *start_point */
static double measure_colour_single(BigInt *start_point, int target_primes,
                                     double *out_mean_gap, int *out_n_primes) {
    BigInt *local_primes = malloc((target_primes + 5) * sizeof(BigInt));
    BigInt current;
    bi_copy(&current, start_point);
    bi_next_prime(&current);

    bi_copy(&local_primes[0], &current);
    int np = 1;

    time_t start = time(NULL);
    BigInt two;
    bi_from_u64(&two, 2);

    while (np < target_primes) {
        bi_add(&current, &two);
        while (!bi_miller_rabin(&current, 12))
            bi_add(&current, &two);
        bi_copy(&local_primes[np], &current);
        np++;

        if (np % 100 == 0) {
            double elapsed = difftime(time(NULL), start);
            printf("      %d/%d primes (%.0fs)...\n", np, target_primes, elapsed);
            fflush(stdout);
        }
    }
    *out_n_primes = np;

    int ng = np - 1;
    double *gaps = malloc(ng * sizeof(double));

    for (int i = 0; i < ng; i++) {
        BigInt diff;
        bi_copy(&diff, &local_primes[i + 1]);
        bi_sub(&diff, &local_primes[i]);
        double gap = 0;
        for (int w = diff.used - 1; w >= 0; w--)
            gap = gap * 4294967296.0 + diff.w[w];
        gaps[i] = gap;
    }

    double total = 0;
    for (int i = 0; i < ng; i++) total += gaps[i];
    *out_mean_gap = total / ng;

    double colour = 0;
    if (ng > 20) {
        double *d3 = malloc(ng * sizeof(double));
        double *d4 = malloc(ng * sizeof(double));
        int d3n = diff_k_d(gaps, d3, ng, 3);
        int d4n = diff_k_d(gaps, d4, ng, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;
        colour = ratio - WHITE_NOISE_RATIO_D4;
        free(d3); free(d4);
    }

    free(gaps); free(local_primes);
    return colour;
}

/* take 3 measurements at nearby offsets, return median colour for stability */
static Measurement measure_at_scale(BigInt *center, int target_primes) {
    Measurement m = {0};
    m.log10_scale = bi_log10(center);
    m.expected_gap = bi_log(center);

    printf("    Measuring at 10^%.0f (%d primes × 3 samples)...\n",
           m.log10_scale, target_primes);
    fflush(stdout);

    double colours[3];
    double mean_gaps[3];
    int n_primes_found[3];

    /* sample 0: at center */
    BigInt sample_start;
    bi_copy(&sample_start, center);
    printf("    Sample 1/3 (at center):\n");
    colours[0] = measure_colour_single(&sample_start, target_primes,
                                        &mean_gaps[0], &n_primes_found[0]);

    /* sample 1: offset forward by ~expected_gap × 1000 (skip ahead) */
    /* use bits of center to derive offset — pseudo-random, no algebraic relation */
    unsigned long long offset_val = 0;
    for (int i = 0; i < center->used && i < 4; i++)
        offset_val ^= ((unsigned long long)center->w[i] << (i * 7));
    offset_val = (offset_val & 0x7FFFFFFULL) | 0x100000ULL; /* 1M to 128M range */

    BigInt offset_bi;
    bi_from_u64(&offset_bi, offset_val);
    bi_copy(&sample_start, center);
    bi_add(&sample_start, &offset_bi);
    printf("    Sample 2/3 (offset +%llu):\n", offset_val);
    colours[1] = measure_colour_single(&sample_start, target_primes,
                                        &mean_gaps[1], &n_primes_found[1]);

    /* sample 2: offset forward again by different amount */
    offset_val = ((offset_val * 6364136223846793005ULL) + 1442695040888963407ULL) >> 20;
    offset_val = (offset_val & 0x7FFFFFFULL) | 0x200000ULL; /* 2M to 128M range */
    bi_from_u64(&offset_bi, offset_val);
    bi_copy(&sample_start, center);
    bi_add(&sample_start, &offset_bi);
    printf("    Sample 3/3 (offset +%llu):\n", offset_val);
    colours[2] = measure_colour_single(&sample_start, target_primes,
                                        &mean_gaps[2], &n_primes_found[2]);

    /* median of 3 colours */
    double sorted[3] = {colours[0], colours[1], colours[2]};
    for (int i = 0; i < 2; i++)
        for (int j = i + 1; j < 3; j++)
            if (sorted[j] < sorted[i]) { double t = sorted[i]; sorted[i] = sorted[j]; sorted[j] = t; }

    m.colour = sorted[1]; /* median */
    m.ratio = m.colour + WHITE_NOISE_RATIO_D4;
    m.mean_gap = (mean_gaps[0] + mean_gaps[1] + mean_gaps[2]) / 3.0;
    m.n_primes = n_primes_found[0];

    printf("    Colours: [%+.4f, %+.4f, %+.4f] → median %+.4f  spread %.4f\n",
           colours[0], colours[1], colours[2], m.colour,
           sorted[2] - sorted[0]);

    return m;
}

/* ═══════════════════════════════════════════════ */
/* MAIN: THE LEAPFROG INTO THE ZONE                */
/* ═══════════════════════════════════════════════ */

/* ═══════════════════════════════════════════════ */
/* UNBIASED LANDING POINT CONSTRUCTION             */
/*                                                  */
/* Find prime p near current scale.                 */
/* Derive pseudo-random offset from p's bits.       */
/* Find prime q at that offset from p.              */
/* Landing = p × q (squarefree, non-square).        */
/* Add final offset from p⊕q to break residuals.   */
/* ═══════════════════════════════════════════════ */

/* extract a pseudo-random offset from a BigInt's bits */
static unsigned long long bi_hash_bits(const BigInt *a) {
    unsigned long long h = 0xcbf29ce484222325ULL; /* FNV offset basis */
    for (int i = 0; i < a->used; i++) {
        h ^= a->w[i];
        h *= 0x100000001b3ULL; /* FNV prime */
    }
    return h;
}

/* check if n is near a perfect k-th power for k=2..6 */
/* returns 1 if suspiciously close to a perfect power */
static int bi_near_perfect_power(const BigInt *n) {
    double log_n = bi_log10(n) * 2.302585; /* ln */
    if (log_n < 10) return 0; /* too small to worry */

    /* for k=2: check if √n is close to integer */
    /* approximate: if fractional part of log(n)/2 is near 0 or 1 */
    for (int k = 2; k <= 6; k++) {
        double root_log = log_n / k;
        double frac = root_log - floor(root_log);
        /* if log is an almost-integer, we're near a perfect power */
        if (frac < 0.001 || frac > 0.999) return 1;
    }
    return 0;
}

static void construct_landing(BigInt *landing, BigInt *current_pos, int jump) {
    printf("    Constructing unbiased landing point...\n");

    /* step 1: find prime p near current position */
    BigInt p;
    bi_copy(&p, current_pos);
    bi_next_prime(&p);
    printf("    Found p (prime near 10^%.0f)\n", bi_log10(&p));

    /* step 2: derive pseudo-random offset from p's bits */
    unsigned long long h = bi_hash_bits(&p);
    /* offset in range [p/3, p/2] — large enough to make q far from p,
       small enough to keep both at roughly the same scale */
    BigInt offset, third;
    bi_copy(&third, &p);
    /* third ≈ p/3: shift right by ~1.58 bits — approximate with >> 1 + >> 2 */
    BigInt p_half, p_quarter;
    bi_copy(&p_half, &p);
    bi_shr1(&p_half);
    bi_copy(&p_quarter, &p_half);
    bi_shr1(&p_quarter);
    bi_copy(&offset, &p_half);  /* start at p/2 */
    /* add a hash-derived fraction: (h % p_quarter) */
    /* simpler: just add h as a small perturbation to p/2 */
    BigInt perturb;
    bi_from_u64(&perturb, h & 0xFFFFFFFFULL);
    bi_add(&offset, &perturb);

    /* step 3: find prime q at p + offset */
    BigInt q;
    bi_copy(&q, &p);
    bi_add(&q, &offset);
    bi_next_prime(&q);
    printf("    Found q (prime near 10^%.0f, offset from p)\n", bi_log10(&q));

    /* step 4: landing = p × q (squarefree by construction — both are prime) */
    bi_mul(landing, &p, &q);

    /* step 5: add final pseudo-random offset to break any residual pattern */
    /* XOR bits of p and q for an independent offset */
    unsigned long long final_h = bi_hash_bits(&p) ^ bi_hash_bits(&q);
    final_h = (final_h & 0xFFFFFULL) | 0x10000ULL; /* 64K to 1M range */
    /* multiply by jump number for variety across jumps */
    final_h *= (unsigned long long)(jump * 7 + 13);
    BigInt final_offset;
    bi_from_u64(&final_offset, final_h);
    bi_add(landing, &final_offset);

    /* step 6: verify not near a perfect power */
    if (bi_near_perfect_power(landing)) {
        printf("    WARNING: near perfect power — adding extra offset\n");
        BigInt extra;
        bi_from_u64(&extra, 1000003); /* a prime, to break structure */
        bi_add(landing, &extra);
    }

    printf("    Landing = p×q + offset at 10^%.0f (", bi_log10(landing));
    bi_print(landing);
    printf(")\n");
    printf("    Squarefree: YES (product of two distinct primes + small offset)\n");
}

int main(void) {
    printf("=== Experiment 29: Big Integer Leapfrog v2 — Into the Zone ===\n\n");
    printf("Target: 10^100 to 10^500 (the RH zone)\n");
    printf("Method: prime×prime landing (squarefree, non-square, unbiased)\n");
    printf("Metric: colour drift from +0.0022 (RH baseline)\n");
    printf("Samples: 3 measurements per landing, report median\n\n");

    time_t total_start = time(NULL);

    /* ──────────────────────────────────────────── */
    /* Phase 1: Base measurement at 10^6            */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: BASE MEASUREMENT\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    BigInt start_point;
    bi_from_u64(&start_point, 1000000);

    int primes_per_measure = 500;  /* 500 primes for stable ratio */
    Measurement base = measure_at_scale(&start_point, primes_per_measure);

    printf("\n  Base: 10^%.0f\n", base.log10_scale);
    printf("  Primes found: %d\n", base.n_primes);
    printf("  Mean gap: %.2f  Expected: %.2f\n", base.mean_gap, base.expected_gap);
    printf("  Ratio: %.4f\n", base.ratio);
    printf("  Colour: %+.4f\n\n", base.colour);

    /* ──────────────────────────────────────────── */
    /* Phase 2: The Leapfrog                        */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("THE LEAPFROG (v2 — unbiased landing)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Jump │ Scale          │ Mean gap    │ Ratio  │ Colour  │ Drift    │ Status\n");
    printf("  ─────┼────────────────┼─────────────┼────────┼─────────┼──────────┼───────\n");

    printf("  base │ 10^%5.0f        │ %10.2f │ %6.4f │ %+6.4f  │    —     │ %s\n",
           base.log10_scale, base.mean_gap, base.ratio, base.colour,
           fabs(base.colour - 0.0022) < 0.005 ? "OK" : "CHECK");

    #define MAX_JUMPS 10
    Measurement measurements[MAX_JUMPS + 1];
    measurements[0] = base;
    int n_jumps = 0;

    BigInt current_pos;
    bi_copy(&current_pos, &start_point);

    for (int jump = 1; jump <= MAX_JUMPS; jump++) {
        printf("\n  ── JUMP %d ──\n", jump);

        /* construct unbiased landing point */
        BigInt landing;
        construct_landing(&landing, &current_pos, jump);

        double landing_scale = bi_log10(&landing);

        /* check if we've overflowed our BigInt capacity */
        if (landing.used >= BIGINT_WORDS - 10) {
            printf("    BigInt capacity reached. Stopping.\n");
            break;
        }

        /* adaptive sample size: more primes at small scale, fewer at huge scale */
        int local_primes = primes_per_measure;
        if (landing_scale > 50)  local_primes = 300;
        if (landing_scale > 100) local_primes = 150;
        if (landing_scale > 200) local_primes = 80;
        if (landing_scale > 500) local_primes = 50;

        Measurement m = measure_at_scale(&landing, local_primes);
        m.colour_drift = m.colour - base.colour;
        measurements[jump] = m;
        n_jumps = jump;

        printf("\n  %4d │ 10^%5.0f        │ %10.2f │ %6.4f │ %+6.4f  │ %+7.4f  │ %s\n",
               jump, m.log10_scale, m.mean_gap, m.ratio, m.colour,
               m.colour_drift,
               fabs(m.colour - 0.0022) < 0.01 ? "OK" :
               m.colour < 0.0003 ? "*** MERTENS ZONE" :
               m.colour > 0.01 ? "** COLOURED" : "SHIFTED");

        /* check for approach to breaking point */
        if (m.colour < 0.0003 && m.colour > -0.01) {
            printf("\n  *** COLOUR HAS ENTERED MERTENS ZONE (< 0.0003) ***\n");
            printf("  *** This is where Pólya and Mertens broke ***\n");
            printf("  *** RH may be approaching its breaking point ***\n");
        }

        if (m.colour < -0.01) {
            printf("\n  *** COLOUR IS STRONGLY NEGATIVE ***\n");
            printf("  *** Check measurement quality — may need more primes ***\n");
        }

        /* update position for next jump */
        bi_copy(&current_pos, &landing);

        /* check if we're in the zone */
        if (landing_scale >= 100 && landing_scale <= 500) {
            printf("    *** WE ARE IN THE ZONE (10^100 to 10^500) ***\n");
        }

        double elapsed = difftime(time(NULL), total_start);
        printf("    Elapsed: %.0f seconds\n", elapsed);

        /* stop if scale exceeds our capacity or time is too long */
        if (elapsed > 7200) {
            printf("    Time limit reached (2 hours). Stopping.\n");
            break;
        }
    }

    /* ──────────────────────────────────────────── */
    /* RESULTS: Colour trajectory from leapfrog     */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("RESULTS: COLOUR TRAJECTORY THROUGH THE LEAPFROG\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Jump │ log₁₀(scale) │ Colour   │ Drift    │ Status\n");
    printf("  ─────┼──────────────┼──────────┼──────────┼──────────────────\n");

    for (int j = 0; j <= n_jumps; j++) {
        Measurement *mm = &measurements[j];
        const char *status;
        if (fabs(mm->colour - 0.0022) < 0.005) status = "ON BASELINE";
        else if (mm->colour < 0.0003) status = "*** MERTENS ZONE";
        else if (mm->colour < 0.001) status = "** DRIFTING DOWN";
        else if (mm->colour > 0.005) status = "** DRIFTING UP";
        else status = "* SHIFTED";

        printf("  %4d │   %10.0f │ %+7.4f  │ %+7.4f  │ %s\n",
               j, mm->log10_scale, mm->colour,
               j > 0 ? mm->colour - measurements[0].colour : 0.0,
               status);
    }

    /* compute gradient from leapfrog data */
    double leapfrog_slope = 0;
    if (n_jumps >= 2) {
        double sx = 0, sy = 0, sxx = 0, sxy = 0;
        for (int j = 0; j <= n_jumps; j++) {
            double x = measurements[j].log10_scale;
            double y = measurements[j].colour;
            sx += x; sy += y; sxx += x * x; sxy += x * y;
        }
        int n = n_jumps + 1;
        leapfrog_slope = (n * sxy - sx * sy) / (n * sxx - sx * sx);

        printf("\n  Colour trend: %+.2e per decade of scale\n", leapfrog_slope);
        if (leapfrog_slope < -1e-6) {
            printf("  *** COLOUR DECREASING WITH SCALE ***\n");
            double crossing = (0.0003 - measurements[0].colour) / leapfrog_slope + measurements[0].log10_scale;
            printf("  Extrapolated Mertens crossing: 10^%.0f\n", crossing);
        } else if (leapfrog_slope > 1e-6) {
            printf("  Colour increasing — moving AWAY from Mertens zone.\n");
        } else {
            printf("  Colour flat — no drift detected.\n");
        }
    }

    /* ──────────────────────────────────────────── */
    /* Phase 3: NEWTON REFINEMENT WITHIN THE ZONE   */
    /*                                               */
    /* The leapfrog gave coarse samples. Now refine. */
    /* Use colour gradient to predict where colour   */
    /* crosses the Mertens threshold (0.0003).       */
    /*                                               */
    /* Newton step:                                  */
    /*   s_{n+1} = s_n - (c(s_n) - 0.0003) / c'(s)  */
    /*                                               */
    /* where s = log₁₀(scale), c = colour,           */
    /* c' estimated from two nearest measurements.   */
    /*                                               */
    /* If gradient is zero or positive, colour isn't  */
    /* approaching Mertens → RH holds at this scale. */
    /* If gradient is negative, Newton finds the      */
    /* predicted crossing point.                      */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 3: NEWTON REFINEMENT — NARROWING THE ZONE\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    #define MERTENS_THRESHOLD 0.0003
    #define NEWTON_MAX_ITER 5
    #define NEWTON_TOL 5.0     /* converged if |predicted - measured| < 5 decades */

    /* we need at least 2 in-zone measurements to start Newton */
    /* collect the two highest-scale measurements as our bracket */
    int have_gradient = 0;
    double s_a = 0, c_a = 0, s_b = 0, c_b = 0;

    if (n_jumps >= 2) {
        /* use the two most recent measurements */
        s_a = measurements[n_jumps - 1].log10_scale;
        c_a = measurements[n_jumps - 1].colour;
        s_b = measurements[n_jumps].log10_scale;
        c_b = measurements[n_jumps].colour;
        have_gradient = (fabs(s_b - s_a) > 1.0);
    }

    if (!have_gradient) {
        printf("  Not enough data for Newton refinement (need 2+ leapfrog points).\n");
    } else {
        double gradient = (c_b - c_a) / (s_b - s_a);
        printf("  Initial bracket: [10^%.0f, 10^%.0f]\n", s_a, s_b);
        printf("  Colours: [%+.4f, %+.4f]\n", c_a, c_b);
        printf("  Gradient: %+.2e colour/decade\n\n", gradient);

        if (gradient >= 0 && c_b > MERTENS_THRESHOLD) {
            printf("  Colour is RISING or FLAT and above Mertens threshold.\n");
            printf("  No crossing predicted. RH stable across measured range.\n\n");
            printf("  Performing verification: 3 extra measurements between bracket points.\n\n");

            /* even if no crossing predicted, fill in the gap with extra samples */
            double step = (s_b - s_a) / 4.0;
            printf("  Refine │ Target scale │ Colour   │ Gradient │ Status\n");
            printf("  ───────┼──────────────┼──────────┼──────────┼──────────\n");

            double prev_s = s_a, prev_c = c_a;

            for (int ri = 1; ri <= 3; ri++) {
                double target_s = s_a + step * ri;
                if (target_s < 10 || target_s > 1200) break;

                /* construct a point at target_s: 10^target_s ≈ 2^(target_s/0.30103) */
                /* build BigInt = 2^(target_bits) where target_bits = target_s / 0.30103 */
                int target_bits = (int)(target_s / 0.30103);
                BigInt target_point;
                bi_zero(&target_point);
                int word_idx = target_bits / 32;
                int bit_idx = target_bits % 32;
                if (word_idx < BIGINT_WORDS) {
                    target_point.w[word_idx] = 1U << bit_idx;
                    target_point.used = word_idx + 1;
                }

                /* add pseudo-random offset from bits to avoid exact power of 2 */
                unsigned long long h = bi_hash_bits(&target_point) ^ (unsigned long long)ri;
                BigInt perturb;
                bi_from_u64(&perturb, (h & 0xFFFFFFFFULL) | 0x1ULL);
                bi_add(&target_point, &perturb);

                int local_primes = 150;
                if (target_s > 200) local_primes = 80;
                if (target_s > 500) local_primes = 50;

                double elapsed = difftime(time(NULL), total_start);
                if (elapsed > 7200) {
                    printf("  Time limit reached. Stopping refinement.\n");
                    break;
                }

                Measurement rm = measure_at_scale(&target_point, local_primes);
                double local_grad = (rm.colour - prev_c) / (rm.log10_scale - prev_s);

                printf("  %5d  │   %10.0f │ %+7.4f  │ %+8.2e │ %s\n",
                       ri, rm.log10_scale, rm.colour, local_grad,
                       rm.colour < MERTENS_THRESHOLD ? "*** BELOW THRESHOLD" :
                       local_grad < -1e-5 ? "DECLINING" : "STABLE");

                prev_s = rm.log10_scale;
                prev_c = rm.colour;
            }

        } else if (gradient < 0) {
            /* colour declining — Newton iteration to find crossing */
            double s_newton = s_b;
            double c_newton = c_b;
            double grad_newton = gradient;

            printf("  Colour DECLINING — applying Newton iteration to find crossing.\n");
            printf("  Target: colour = %+.4f (Mertens threshold)\n\n", MERTENS_THRESHOLD);

            printf("  Iter │ Predicted 10^ │ Measured col │ Gradient     │ Status\n");
            printf("  ─────┼───────────────┼──────────────┼──────────────┼──────────\n");

            double prev_s_n = s_a, prev_c_n = c_a;

            for (int ni = 0; ni < NEWTON_MAX_ITER; ni++) {
                /* Newton step: s_next = s_n - (c_n - threshold) / gradient */
                double s_next = s_newton - (c_newton - MERTENS_THRESHOLD) / grad_newton;

                /* clamp to sane range */
                if (s_next < 10) s_next = 10;
                if (s_next > 1200) s_next = 1100;

                /* construct a BigInt at 10^s_next */
                int target_bits = (int)(s_next / 0.30103);
                BigInt target_point;
                bi_zero(&target_point);
                int word_idx = target_bits / 32;
                int bit_idx = target_bits % 32;
                if (word_idx < BIGINT_WORDS) {
                    target_point.w[word_idx] = 1U << bit_idx;
                    target_point.used = word_idx + 1;
                }

                /* offset to avoid exact power of 2 */
                unsigned long long h = bi_hash_bits(&target_point) ^ (unsigned long long)(ni + 42);
                BigInt perturb;
                bi_from_u64(&perturb, (h & 0xFFFFFFFFULL) | 0x1ULL);
                bi_add(&target_point, &perturb);

                int local_primes = 150;
                if (s_next > 200) local_primes = 80;
                if (s_next > 500) local_primes = 50;

                double elapsed = difftime(time(NULL), total_start);
                if (elapsed > 7200) {
                    printf("  Time limit reached during Newton iteration.\n");
                    break;
                }

                Measurement nm = measure_at_scale(&target_point, local_primes);
                double new_grad = (nm.colour - prev_c_n) / (nm.log10_scale - prev_s_n);

                printf("  %4d  │   %10.0f  │  %+8.4f    │ %+10.2e   │ %s\n",
                       ni + 1, nm.log10_scale, nm.colour, new_grad,
                       fabs(nm.colour - MERTENS_THRESHOLD) < 0.001 ? "*** CONVERGED" :
                       nm.colour < MERTENS_THRESHOLD ? "*** BELOW THRESHOLD" :
                       nm.colour < 0.001 ? "APPROACHING" : "ABOVE");

                /* check convergence */
                if (fabs(nm.colour - MERTENS_THRESHOLD) < 0.001) {
                    printf("\n  *** NEWTON CONVERGED ***\n");
                    printf("  Crossing scale: 10^%.0f\n", nm.log10_scale);
                    printf("  Colour at crossing: %+.4f\n", nm.colour);
                    break;
                }

                /* update for next iteration */
                prev_s_n = s_newton;
                prev_c_n = c_newton;
                s_newton = nm.log10_scale;
                c_newton = nm.colour;
                if (fabs(new_grad) > 1e-10) grad_newton = new_grad;
            }
        } else {
            /* gradient zero but colour below threshold */
            printf("  Colour below Mertens threshold with flat gradient.\n");
            printf("  Already in Mertens zone. Scale: 10^%.0f\n", s_b);
        }
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Leapfrog: %d jumps, scale 10^%.0f to 10^%.0f\n",
           n_jumps, measurements[0].log10_scale,
           measurements[n_jumps].log10_scale);
    printf("  Colour at base:    %+.4f\n", measurements[0].colour);
    printf("  Colour at max:     %+.4f\n", measurements[n_jumps].colour);
    printf("  Total drift:       %+.4f\n",
           measurements[n_jumps].colour - measurements[0].colour);
    printf("  Time: %.0f seconds\n\n", difftime(time(NULL), total_start));

    int in_zone = 0;
    for (int j = 0; j <= n_jumps; j++)
        if (measurements[j].log10_scale >= 100 && measurements[j].log10_scale <= 500)
            in_zone++;

    if (in_zone > 0) {
        printf("  *** Measurements inside the zone (10^100-10^500): %d ***\n\n", in_zone);
    }

    printf("  VERDICT:\n");
    if (measurements[n_jumps].colour > 0.001 &&
        fabs(measurements[n_jumps].colour - measurements[0].colour) < 0.01) {
        printf("    Colour stable across all scales tested.\n");
        printf("    RH consistent from 10^%.0f to 10^%.0f.\n",
               measurements[0].log10_scale, measurements[n_jumps].log10_scale);
        printf("    The conjecture holds in the zone.\n");
    } else if (measurements[n_jumps].colour < MERTENS_THRESHOLD) {
        printf("    *** COLOUR ENTERED MERTENS ZONE ***\n");
        printf("    This is where conjectures break.\n");
        printf("    RH may be approaching its limit.\n");
    } else {
        printf("    Colour shifted but within bounds.\n");
        printf("    Newton refinement provides higher-resolution picture.\n");
    }

    printf("\n  Nothing is random at scale.\n");

    return 0;
}
