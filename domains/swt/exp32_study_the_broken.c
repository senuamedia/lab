/*
 * Experiment 32: Study The Broken — Calibrate Against Known Failure
 *
 * "Start with fact, then move to fiction."
 *
 * The Rod Conjecture says all patterns break. To prove it,
 * don't chase unknowns — study the KNOWN broken conjectures.
 * Learn what breaking looks like. Find the right filter.
 * Then apply to unknowns.
 *
 * Known breaks:
 *   Pólya:   L(x) > 0 first at x = 906,150,257
 *   Mertens: |M(x)/√x| → first record excursions in known range
 *   Skewes:  π(x) - li(x) changes sign at ~1.397 × 10^316
 *
 * Pólya is our calibration standard:
 *   - Break point is within sieve range (< 2B)
 *   - We can measure colour APPROACHING the break
 *   - We can measure colour THROUGH the break
 *   - We can measure colour AFTER the break
 *
 * Method:
 *   1. Sieve to 1.2B (covers Pólya break at 906M with margin)
 *   2. Compute L(x) = Σλ(n) in a streaming fashion
 *   3. At 50 measurement points from 10M to 1B:
 *      - Extract local Liouville sequence
 *      - Measure wavelet colour under db1 through db6
 *      - Track L(x)/√x (the quantity that breaks)
 *      - Find which wavelet shows the precursor signal
 *   4. Identify the PRECURSOR SIGNATURE:
 *      - What does colour do in the 100M before the break?
 *      - Which wavelet detects it earliest?
 *      - How far before the break can we see it coming?
 *   5. Apply the winning filter to prime gaps (RH unknown)
 *
 * Memory: bit-packed sieve ~150MB for 1.2B
 * Time: ~2.5 hours for sieve + Liouville + wavelet analysis
 *
 * THIS IS THE CALIBRATION EXPERIMENT.
 * After this, we know what breaking looks like.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define SIEVE_LIMIT 1200000000LL
#define SIEVE_BYTES ((SIEVE_LIMIT / 8) + 1)

static unsigned char *sieve_bits;

static inline void set_composite(long long n) {
    sieve_bits[n >> 3] |= (1 << (n & 7));
}

static inline int is_composite(long long n) {
    return (sieve_bits[n >> 3] >> (n & 7)) & 1;
}

/* Daubechies high-pass filters */
static const double db1_h[] = {0.7071067811865476, -0.7071067811865476};
static const double db2_h[] = {-0.4829629131445341, 0.8365163037378079,
    -0.2241438680420134, -0.1294095225512604};
static const double db3_h[] = {0.3326705529500826, -0.8068915093110925,
    0.4598775021184915, 0.1350110200102546, -0.0854412738820267, -0.0352262918857095};
static const double db4_h[] = {-0.2303778133088965, 0.7148465705529156,
    -0.6308807679298589, -0.0279837694168599, 0.1870348117190930, 0.0308413818355607,
    -0.0328830116668852, -0.0105974017850690};
static const double db5_h[] = {0.1601023979741930, -0.6038292697971896,
    0.7243085284377729, 0.1384281459013204, -0.2422948870663824, -0.0322448695846381,
    0.0775714938400459, -0.0062414902127983, -0.0125807519990820, 0.0033357252854738};
static const double db6_h[] = {-0.1115407433501095, 0.4946238903984533,
    -0.7511339080210959, 0.3152503517091982, 0.2262646939654400, -0.1297668675672625,
    -0.0975016055873225, 0.0275228655303053, 0.0315820393174862, 0.0005538422011614,
    -0.0047772575109455, 0.0010773010853085};

typedef struct { const char *name; const double *filter; int len; } Wavelet;
static Wavelet wavelets[] = {
    {"db1", db1_h, 2}, {"db2", db2_h, 4}, {"db3", db3_h, 6},
    {"db4", db4_h, 8}, {"db5", db5_h, 10}, {"db6", db6_h, 12}
};
static const int n_wavelets = 6;

static double rms_d(const double *v, int n) {
    double s = 0; for (int i = 0; i < n; i++) s += v[i] * v[i]; return sqrt(s / n);
}

static int wavelet_detail(const double *in, int n, const double *f, int fl, double *out) {
    int out_len = n / 2;
    for (int i = 0; i < out_len; i++) {
        double sum = 0;
        for (int j = 0; j < fl; j++) { int idx = 2*i+j; if (idx < n) sum += in[idx]*f[j]; }
        out[i] = sum;
    }
    return out_len;
}

/* measure wavelet colour at depth 4 */
static double measure_colour(const double *seq, int n,
                              const Wavelet *wf, double void_ratio) {
    double *current = malloc(n * sizeof(double));
    memcpy(current, seq, n * sizeof(double));
    int cur_len = n;
    double *detail = malloc(n * sizeof(double));
    double prev_rms = 0, ratio = 0;

    for (int d = 1; d <= 4 && cur_len > wf->len * 4; d++) {
        int det_len = wavelet_detail(current, cur_len, wf->filter, wf->len, detail);
        double det_rms = rms_d(detail, det_len);
        if (d == 4 && prev_rms > 1e-30) ratio = det_rms / prev_rms;
        prev_rms = det_rms;
        int next_len = cur_len / 2;
        for (int i = 0; i < next_len; i++) current[i] = current[2*i];
        cur_len = next_len;
    }
    free(current); free(detail);
    return ratio - void_ratio;
}

/* compute void for a wavelet */
static unsigned long long rng_state = 0x123456789ABCDEF0ULL;
static double rng_normal(void) {
    rng_state = rng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    double u1 = (double)(rng_state >> 11) / (double)(1ULL << 53);
    if (u1 < 1e-15) u1 = 1e-15;
    rng_state = rng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    double u2 = (double)(rng_state >> 11) / (double)(1ULL << 53);
    return sqrt(-2.0 * log(u1)) * cos(6.283185307179586 * u2);
}

static double compute_void(const Wavelet *wf, int trials) {
    int sig_len = 65536;
    double *signal = malloc(sig_len * sizeof(double));
    double *detail = malloc(sig_len * sizeof(double));
    double ratio_sum = 0; int valid = 0;
    for (int t = 0; t < trials; t++) {
        rng_state += (unsigned long long)(t * 7 + 13);
        for (int i = 0; i < sig_len; i++) signal[i] = rng_normal();
        double *cur = malloc(sig_len * sizeof(double));
        memcpy(cur, signal, sig_len * sizeof(double));
        int cl = sig_len; double prev_rms = 0, ratio = 0;
        for (int d = 1; d <= 4 && cl > wf->len * 4; d++) {
            int dl = wavelet_detail(cur, cl, wf->filter, wf->len, detail);
            double dr = rms_d(detail, dl);
            if (d == 4 && prev_rms > 1e-30) ratio = dr / prev_rms;
            prev_rms = dr;
            int nl = cl/2; for (int i = 0; i < nl; i++) cur[i] = cur[2*i]; cl = nl;
        }
        free(cur);
        if (ratio > 0.1 && ratio < 5.0) { ratio_sum += ratio; valid++; }
    }
    free(signal); free(detail);
    return valid > 0 ? ratio_sum / valid : 0;
}

/* ═══════════════════════════════════════════════ */
/* MEASUREMENT POINT: everything we track          */
/* ═══════════════════════════════════════════════ */

typedef struct {
    long long x;              /* position on number line */
    double L_x;               /* Liouville L(x) = Σλ(n) up to x */
    double L_scaled;          /* L(x) / √x */
    double M_x;               /* Mertens M(x) = Σμ(n) up to x */
    double M_scaled;          /* M(x) / √x */
    double colour[6];         /* wavelet colour under db1-db6 */
    int is_before_break;      /* 1 if before Pólya break (x < 906150257) */
    double dist_to_break;     /* log₁₀ distance to break point */
} MeasurementPoint;

#define MAX_POINTS 60
#define POLYA_BREAK 906150257LL

/* window of Liouville values for wavelet analysis */
#define WINDOW_SIZE 32768  /* power of 2 for clean wavelet decomposition */

int main(void) {
    printf("=== Experiment 32: Study The Broken ===\n\n");
    printf("\"Start with fact, then move to fiction.\"\n");
    printf("Calibrate the instrument against Pólya's known failure.\n");
    printf("Break point: L(x) > 0 first at x = 906,150,257.\n\n");

    time_t total_start = time(NULL);

    /* compute voids */
    printf("Computing wavelet voids...\n");
    double voids[6];
    for (int w = 0; w < n_wavelets; w++) voids[w] = compute_void(&wavelets[w], 50);
    printf("Done.\n\n");

    /* ──────────────────────────────────────────── */
    /* Phase 1: Sieve                               */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: SIEVE TO %.0fM\n", SIEVE_LIMIT / 1e6);
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("Allocating bit sieve (%.0f MB)...\n", SIEVE_BYTES / 1e6);
    sieve_bits = calloc(SIEVE_BYTES, 1);
    if (!sieve_bits) { printf("FATAL: cannot allocate sieve.\n"); return 1; }

    printf("Sieving to %lld...\n", SIEVE_LIMIT);
    set_composite(0); set_composite(1);
    for (long long i = 2; i * i <= SIEVE_LIMIT; i++)
        if (!is_composite(i))
            for (long long j = i * i; j <= SIEVE_LIMIT; j += i)
                set_composite(j);

    double sieve_time = difftime(time(NULL), total_start);
    printf("Sieve complete in %.0f seconds.\n\n", sieve_time);

    /* ──────────────────────────────────────────── */
    /* Phase 2: Define measurement points           */
    /* ──────────────────────────────────────────── */

    /* dense measurements around the Pólya break point */
    long long measure_points[] = {
        /* far before break */
        10000000LL, 50000000LL, 100000000LL, 200000000LL, 300000000LL,
        /* approaching break */
        400000000LL, 500000000LL, 600000000LL, 700000000LL,
        750000000LL, 800000000LL, 830000000LL, 850000000LL,
        /* close to break */
        870000000LL, 880000000LL, 890000000LL, 895000000LL,
        900000000LL, 903000000LL, 905000000LL,
        /* very close */
        906000000LL, 906100000LL, 906140000LL, 906148000LL,
        906149000LL, 906150000LL,
        /* AT the break */
        906150257LL,
        /* just after */
        906150500LL, 906151000LL, 906155000LL, 906160000LL,
        906200000LL, 906500000LL, 907000000LL,
        /* further after */
        910000000LL, 920000000LL, 950000000LL,
        1000000000LL, 1100000000LL, 1200000000LL
    };
    int n_points = sizeof(measure_points) / sizeof(measure_points[0]);

    MeasurementPoint points[MAX_POINTS];

    /* ──────────────────────────────────────────── */
    /* Phase 3: Stream through, compute everything  */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: STREAMING LIOUVILLE + MERTENS + WAVELET ANALYSIS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("Computing L(x), M(x), and wavelet colour at %d points...\n", n_points);
    printf("Dense sampling around Pólya break at x = 906,150,257.\n\n");

    double L_sum = 0;   /* Liouville sum */
    double M_sum = 0;   /* Mertens sum */
    int point_idx = 0;
    time_t last_report = time(NULL);

    /* rolling window of Liouville values for wavelet analysis */
    double *liou_window = malloc(WINDOW_SIZE * sizeof(double));
    int win_idx = 0;
    int win_full = 0;

    /* also track Mertens rolling window */
    double *mert_window = malloc(WINDOW_SIZE * sizeof(double));

    for (long long n = 1; n <= SIEVE_LIMIT && point_idx < n_points; n++) {
        /* Liouville: λ(n) = (-1)^Ω(n) */
        {
            int omega = 0;
            long long temp = n;
            for (long long p = 2; p * p <= temp; p++)
                while (temp % p == 0) { omega++; temp /= p; }
            if (temp > 1) omega++;
            double lambda_n = (omega % 2 == 0) ? 1.0 : -1.0;
            L_sum += lambda_n;
            liou_window[win_idx] = lambda_n;
        }

        /* Möbius: μ(n) */
        {
            int factors = 0, squarefree = 1;
            long long temp = n;
            for (long long p = 2; p * p <= temp; p++) {
                if (temp % p == 0) {
                    temp /= p; factors++;
                    if (temp % p == 0) { squarefree = 0; break; }
                }
            }
            if (temp > 1) factors++;
            double mu_n = squarefree ? ((factors % 2 == 0) ? 1.0 : -1.0) : 0.0;
            M_sum += mu_n;
            mert_window[win_idx] = mu_n;
        }

        win_idx = (win_idx + 1) % WINDOW_SIZE;
        if (win_idx == 0) win_full = 1;

        /* check if we've hit a measurement point */
        if (point_idx < n_points && n == measure_points[point_idx]) {
            MeasurementPoint *p = &points[point_idx];
            p->x = n;
            p->L_x = L_sum;
            p->L_scaled = L_sum / sqrt((double)n);
            p->M_x = M_sum;
            p->M_scaled = M_sum / sqrt((double)n);
            p->is_before_break = (n < POLYA_BREAK);
            p->dist_to_break = log10(fabs((double)(n - POLYA_BREAK)) + 1.0);

            /* wavelet analysis on rolling window */
            if (win_full) {
                /* linearise the circular buffer */
                double *linear = malloc(WINDOW_SIZE * sizeof(double));
                for (int i = 0; i < WINDOW_SIZE; i++)
                    linear[i] = liou_window[(win_idx + i) % WINDOW_SIZE];

                for (int w = 0; w < n_wavelets; w++)
                    p->colour[w] = measure_colour(linear, WINDOW_SIZE, &wavelets[w], voids[w]);

                free(linear);
            }

            printf("  x = %13lld │ L/√x = %+8.4f │ M/√x = %+8.4f │ Haar = %+6.4f │ %s\n",
                   n, p->L_scaled, p->M_scaled, p->colour[0],
                   n == POLYA_BREAK ? "*** BREAK POINT ***" :
                   p->is_before_break ? "before" : "after");
            fflush(stdout);

            point_idx++;
        }

        /* progress */
        time_t now = time(NULL);
        if (difftime(now, last_report) > 60) {
            double pct = 100.0 * n / SIEVE_LIMIT;
            double elapsed = difftime(now, total_start);
            printf("  [%.1f%% — n=%lld — %.0fs elapsed]\n", pct, n, elapsed);
            fflush(stdout);
            last_report = now;
        }
    }

    double compute_time = difftime(time(NULL), total_start);
    printf("\nComputation complete in %.0f seconds.\n\n", compute_time);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: The approach to Pólya's break       */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 1: L(x)/√x APPROACHING THE PÓLYA BREAK\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  x             │ L(x)/√x    │ M(x)/√x    │ Dist to break │ Side\n");
    printf("  ──────────────┼────────────┼────────────┼───────────────┼──────\n");

    for (int i = 0; i < point_idx; i++) {
        MeasurementPoint *p = &points[i];
        printf("  %13lld │ %+10.5f │ %+10.5f │  %11.1f   │ %s\n",
               p->x, p->L_scaled, p->M_scaled, p->dist_to_break,
               p->x == POLYA_BREAK ? "BREAK" :
               p->is_before_break ? "before" : "after");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Wavelet colour approaching the break */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 2: WAVELET COLOUR APPROACHING THE BREAK\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  x             │ db1    │ db2    │ db3    │ db4    │ db5    │ db6    │ Best detect\n");
    printf("  ──────────────┼────────┼────────┼────────┼────────┼────────┼────────┼────────────\n");

    for (int i = 0; i < point_idx; i++) {
        MeasurementPoint *p = &points[i];
        printf("  %13lld │", p->x);

        double max_abs = 0; int max_w = 0;
        for (int w = 0; w < n_wavelets; w++) {
            printf(" %+5.3f │", p->colour[w]);
            if (fabs(p->colour[w]) > max_abs) { max_abs = fabs(p->colour[w]); max_w = w; }
        }
        printf(" db%d (%+.3f)%s\n", max_w + 1, p->colour[max_w],
               p->x == POLYA_BREAK ? " *** BREAK" : "");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Which wavelet detects the break     */
    /*          earliest?                            */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 3: PRECURSOR DETECTION — WHICH WAVELET SEES IT FIRST?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* for each wavelet, find the first point where colour changes direction */
    /* or crosses a threshold, before the break */
    printf("  Wavelet │ Mean before │ Mean after │ Shift    │ t-like stat │ Detects break?\n");
    printf("  ────────┼─────────────┼────────────┼──────────┼─────────────┼───────────────\n");

    for (int w = 0; w < n_wavelets; w++) {
        double sum_before = 0, sum_after = 0;
        double sum_sq_before = 0, sum_sq_after = 0;
        int n_before = 0, n_after = 0;

        for (int i = 0; i < point_idx; i++) {
            if (points[i].is_before_break) {
                sum_before += points[i].colour[w];
                sum_sq_before += points[i].colour[w] * points[i].colour[w];
                n_before++;
            } else {
                sum_after += points[i].colour[w];
                sum_sq_after += points[i].colour[w] * points[i].colour[w];
                n_after++;
            }
        }

        double mean_b = n_before > 0 ? sum_before / n_before : 0;
        double mean_a = n_after > 0 ? sum_after / n_after : 0;
        double var_b = n_before > 1 ? (sum_sq_before / n_before - mean_b * mean_b) : 0;
        double var_a = n_after > 1 ? (sum_sq_after / n_after - mean_a * mean_a) : 0;
        double pooled_se = sqrt(var_b / (n_before > 0 ? n_before : 1) +
                               var_a / (n_after > 0 ? n_after : 1));
        double t_stat = pooled_se > 1e-10 ? fabs(mean_a - mean_b) / pooled_se : 0;

        printf("  %-7s │  %+9.4f  │ %+9.4f  │ %+7.4f  │   %7.2f   │ %s\n",
               wavelets[w].name, mean_b, mean_a, mean_a - mean_b, t_stat,
               t_stat > 2.0 ? "*** YES — significant" :
               t_stat > 1.0 ? "* marginal" : "no");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Colour gradient approaching break   */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 4: COLOUR GRADIENT — DOES COLOUR ACCELERATE NEAR BREAK?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* for the best-detecting wavelet, plot colour gradient */
    /* first find the best wavelet from table 3 */
    int best_w = 0;
    double best_t = 0;
    for (int w = 0; w < n_wavelets; w++) {
        double sum_b = 0, sum_a = 0, ssq_b = 0, ssq_a = 0;
        int nb = 0, na = 0;
        for (int i = 0; i < point_idx; i++) {
            if (points[i].is_before_break) { sum_b += points[i].colour[w]; ssq_b += points[i].colour[w]*points[i].colour[w]; nb++; }
            else { sum_a += points[i].colour[w]; ssq_a += points[i].colour[w]*points[i].colour[w]; na++; }
        }
        double mb = nb>0?sum_b/nb:0, ma = na>0?sum_a/na:0;
        double vb = nb>1?(ssq_b/nb-mb*mb):0, va = na>1?(ssq_a/na-ma*ma):0;
        double se = sqrt(vb/(nb>0?nb:1)+va/(na>0?na:1));
        double t = se>1e-10?fabs(ma-mb)/se:0;
        if (t > best_t) { best_t = t; best_w = w; }
    }

    printf("  Best detecting wavelet: %s (t = %.2f)\n\n", wavelets[best_w].name, best_t);
    printf("  Colour gradient (consecutive differences) under %s:\n\n", wavelets[best_w].name);

    printf("  From → To             │ Colour change │ Per decade │ Accelerating?\n");
    printf("  ──────────────────────┼───────────────┼────────────┼──────────────\n");

    for (int i = 1; i < point_idx; i++) {
        double dc = points[i].colour[best_w] - points[i-1].colour[best_w];
        double dx = log10((double)points[i].x) - log10((double)points[i-1].x);
        double slope = dx > 0.01 ? dc / dx : 0;

        /* only print a selection */
        if (i < 5 || i > point_idx - 5 ||
            points[i].x == POLYA_BREAK || points[i-1].x == POLYA_BREAK ||
            (points[i].x > 800000000LL && points[i].x < 920000000LL)) {
            printf("  %11lld→%11lld│   %+9.4f   │ %+9.4f   │ %s\n",
                   points[i-1].x, points[i].x, dc, slope,
                   points[i].x == POLYA_BREAK ? "*** AT BREAK" :
                   fabs(slope) > 0.05 ? "** rapid change" :
                   fabs(slope) > 0.01 ? "* changing" : "stable");
        }
    }

    /* ──────────────────────────────────────────── */
    /* MERTENS: same analysis                       */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 5: MERTENS M(x)/√x — TRACKING TOWARD ITS (DISTANT) BREAK\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Mertens breaks at ~10^(10^40). We can't reach it.\n");
    printf("  But we can measure: is M(x)/√x range growing? What's its wavelet colour?\n\n");

    double M_max = -1e30, M_min = 1e30;
    for (int i = 0; i < point_idx; i++) {
        if (points[i].M_scaled > M_max) M_max = points[i].M_scaled;
        if (points[i].M_scaled < M_min) M_min = points[i].M_scaled;
    }
    printf("  M(x)/√x range in [10M, 1.2B]: [%+.4f, %+.4f] = %.4f\n", M_min, M_max, M_max - M_min);
    printf("  Mertens bound: 1.0. Current max |M/√x|: %.4f (headroom: %.1f%%)\n\n",
           fmax(fabs(M_max), fabs(M_min)),
           (1.0 - fmax(fabs(M_max), fabs(M_min))) * 100);

    /* ──────────────────────────────────────────── */
    /* CALIBRATION RESULT                           */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("CALIBRATION RESULT: THE PRECURSOR SIGNATURE\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Best wavelet for detecting Pólya break: %s\n", wavelets[best_w].name);
    printf("  Statistical significance: t = %.2f\n\n", best_t);

    printf("  Mean colour before break: ");
    double before_mean[6], after_mean[6];
    for (int w = 0; w < n_wavelets; w++) {
        double sb = 0, sa = 0; int nb = 0, na = 0;
        for (int i = 0; i < point_idx; i++) {
            if (points[i].is_before_break) { sb += points[i].colour[w]; nb++; }
            else { sa += points[i].colour[w]; na++; }
        }
        before_mean[w] = nb > 0 ? sb / nb : 0;
        after_mean[w] = na > 0 ? sa / na : 0;
    }
    for (int w = 0; w < n_wavelets; w++) printf("%s=%+.4f ", wavelets[w].name, before_mean[w]);
    printf("\n  Mean colour after break:  ");
    for (int w = 0; w < n_wavelets; w++) printf("%s=%+.4f ", wavelets[w].name, after_mean[w]);

    printf("\n\n  THIS IS THE INSTRUMENT CALIBRATION.\n");
    printf("  Apply the %s filter to prime gaps, Collatz, twin primes.\n", wavelets[best_w].name);
    printf("  If they show the same precursor pattern, they will break too.\n");
    printf("  If they show a different pattern, they hold.\n");
    printf("  The Rod Conjecture predicts: same pattern. Everything breaks.\n");

    free(sieve_bits); free(liou_window); free(mert_window);
    return 0;
}
