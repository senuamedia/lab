/*
 * Experiment 09: The Jerk Under the Microscope
 *
 * H''' is the inflection point — where the system decides.
 * Now apply H'''' to H''' and watch what happens.
 *
 * Two possible outcomes:
 *   A) H'''' smooths H''' → oscillations decay → RH holds
 *      The jerk is the final layer of structure. Beyond it: noise.
 *
 *   B) H'''' amplifies H''' → oscillations grow → divergence point exists
 *      The jerk contains a resonance that higher derivatives excite.
 *      That resonance IS the off-line zero's shadow.
 *
 * We test this on:
 *   1. Prime gaps
 *   2. Mertens function M(x)
 *   3. Density surprise
 *   4. Prime-composite divergence
 *   5. Interleaving pattern
 *
 * And critically: at MULTIPLE SCALES. If H'''' smooths at small x
 * but amplifies at large x, the transition point localises the divergence.
 */

#include "rh_scaffold.h"

#define MAX_N 2000000
#define MAX_PRIMES 150000

/* ────────────────────────────────────────────────── */
/* Oscillation amplitude measurement                  */
/* ────────────────────────────────────────────────── */

/* RMS of a double array */
static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* peak-to-peak amplitude (max - min) */
static double amplitude(const double *v, int n) {
    double lo = v[0], hi = v[0];
    for (int i = 1; i < n; i++) {
        if (v[i] < lo) lo = v[i];
        if (v[i] > hi) hi = v[i];
    }
    return hi - lo;
}

/* zero-crossing rate: how often does the sequence change sign? */
static double zero_crossing_rate(const double *v, int n) {
    int crossings = 0;
    for (int i = 1; i < n; i++) {
        if ((v[i] > 0 && v[i - 1] < 0) || (v[i] < 0 && v[i - 1] > 0))
            crossings++;
    }
    return (double)crossings / (n - 1);
}

/* compute running RMS in windows to track amplitude evolution */
static void windowed_rms(const double *v, int n, int window, double *out, int *out_n) {
    *out_n = 0;
    for (int i = 0; i + window <= n; i += window / 2) {
        double s = 0;
        for (int j = i; j < i + window; j++) s += v[j] * v[j];
        out[(*out_n)++] = sqrt(s / window);
    }
}

/* linear regression slope */
static double linear_slope(const double *y, int n) {
    double sx = 0, sy = 0, sxx = 0, sxy = 0;
    for (int i = 0; i < n; i++) {
        sx += i; sy += y[i];
        sxx += (double)i * i; sxy += i * y[i];
    }
    double denom = n * sxx - sx * sx;
    return denom > 1e-15 ? (n * sxy - sx * sy) / denom : 0;
}

/* Möbius function */
static int mobius(int n) {
    int factors = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) {
            n /= p; factors++;
            if (n % p == 0) return 0;
        }
    }
    if (n > 1) factors++;
    return (factors % 2 == 0) ? 1 : -1;
}

int main(void) {
    printf("=== Experiment 09: The Jerk Under the Microscope ===\n\n");
    printf("Apply H'''' to H'''. Does it smooth or amplify?\n");
    printf("Track oscillation amplitude through deep derivatives.\n\n");

    /* generate primes via sieve */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    int *primes = malloc(MAX_PRIMES * sizeof(int));
    int np = 0;
    for (int i = 2; i <= MAX_N && np < MAX_PRIMES; i++)
        if (!sieve[i]) primes[np++] = i;
    printf("Primes: %d (up to %d)\n", np, primes[np - 1]);

    /* compute base sequences */
    /* 1. Prime gaps */
    double *gaps = malloc(np * sizeof(double));
    for (int i = 0; i < np - 1; i++)
        gaps[i] = (double)(primes[i + 1] - primes[i]);
    int ng = np - 1;

    /* 2. Mertens function (sampled) */
    int mert_stride = 10;
    int mert_n = MAX_N / mert_stride;
    double *mertens = malloc(mert_n * sizeof(double));
    int mert_sum = 0;
    int mi = 0;
    for (int n = 1; n <= MAX_N; n++) {
        mert_sum += mobius(n);
        if (n % mert_stride == 0)
            mertens[mi++] = (double)mert_sum;
    }
    mert_n = mi;
    printf("Mertens samples: %d (stride %d up to %d)\n", mert_n, mert_stride, MAX_N);

    /* 3. Density surprise */
    double *surprise = malloc(np * sizeof(double));
    {
        int window = 100;
        int lo = 0, hi = 0;
        for (int i = 0; i < np; i++) {
            while (lo < np && primes[lo] < primes[i] - window) lo++;
            while (hi < np && primes[hi] <= primes[i] + window) hi++;
            double density = (double)(hi - lo) / (2.0 * window);
            double expected = 1.0 / log((double)primes[i]);
            surprise[i] = density - expected;
        }
    }

    /* 4. Interleaving (composites between consecutive primes) */
    double *interleave = malloc(np * sizeof(double));
    for (int i = 0; i < np - 1; i++)
        interleave[i] = (double)(primes[i + 1] - primes[i] - 1);
    int ni = np - 1;

    /* 5. Prime-composite gap divergence */
    double *div_seq = malloc(np * sizeof(double));
    {
        /* for each prime gap, compare to local composite gap density */
        for (int i = 0; i < np - 1; i++) {
            int pgap = primes[i + 1] - primes[i];
            /* count composite gaps in same range */
            double cgap_avg = 1.0;  /* composites are dense, average gap ≈ 1 */
            /* actual: near p, composite density ≈ 1 - 1/ln(p) */
            double cdensity = 1.0 - 1.0 / log((double)primes[i]);
            if (cdensity > 0.01)
                cgap_avg = 1.0 / cdensity;
            div_seq[i] = (double)pgap - cgap_avg * (double)pgap;  /* divergence */
        }
    }
    int nd = np - 1;

    /* ──────────────────────────────────────────── */
    /* THE CORE TEST: Deep derivative amplitude tracking */
    /* ──────────────────────────────────────────── */

    typedef struct {
        const char *name;
        double *data;
        int len;
    } Sequence;

    Sequence seqs[] = {
        {"Prime gaps", gaps, ng},
        {"Mertens M(x)", mertens, mert_n},
        {"Density surprise", surprise, np},
        {"Interleaving", interleave, ni},
        {"P-C divergence", div_seq, nd},
    };
    int nseqs = sizeof(seqs) / sizeof(seqs[0]);

    int max_order = 12;

    /* ──────────────────────────────────────────── */
    /* TABLE 1: RMS amplitude through derivatives */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: RMS AMPLITUDE THROUGH DERIVATIVES");
    printf("Does H'''' smooth H''' or amplify it?\n\n");
    printf("  Order ");
    for (int s = 0; s < nseqs; s++) printf("│ %-14s", seqs[s].name);
    printf("\n  ──────");
    for (int s = 0; s < nseqs; s++) printf("┼───────────────");
    printf("\n");

    double rms_track[5][15];  /* [seq][order] */

    for (int s = 0; s < nseqs; s++) {
        double *seq = malloc(seqs[s].len * sizeof(double));
        memcpy(seq, seqs[s].data, seqs[s].len * sizeof(double));
        int n = seqs[s].len;

        for (int k = 0; k <= max_order && n > 100; k++) {
            if (k > 0) n = diff_k_d(seq, seq, n, 1);
            rms_track[s][k] = rms_d(seq, n);
        }
        free(seq);
    }

    for (int k = 0; k <= max_order; k++) {
        printf("  d^%-4d", k);
        for (int s = 0; s < nseqs; s++) {
            printf("│ %13.6f", rms_track[s][k]);
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Amplitude RATIO d^k/d^(k-1) — growth or decay? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: AMPLITUDE RATIO d^k / d^(k-1)");
    printf("> 1.0 = GROWING (amplifying), < 1.0 = SHRINKING (smoothing)\n\n");
    printf("  Order ");
    for (int s = 0; s < nseqs; s++) printf("│ %-14s", seqs[s].name);
    printf("\n  ──────");
    for (int s = 0; s < nseqs; s++) printf("┼───────────────");
    printf("\n");

    for (int k = 1; k <= max_order; k++) {
        printf("  d%d/d%d ", k, k - 1);
        for (int s = 0; s < nseqs; s++) {
            double ratio = rms_track[s][k - 1] > 1e-15 ?
                           rms_track[s][k] / rms_track[s][k - 1] : 0;
            const char *indicator = ratio > 1.05 ? " ▲" : ratio < 0.95 ? " ▽" : " →";
            printf("│ %10.4f %s ", ratio, indicator);
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Zero-crossing rate through derivatives */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: ZERO-CROSSING RATE (oscillation frequency)");
    printf("Higher ZCR = faster oscillation. Growing ZCR = waves speeding up.\n\n");
    printf("  Order ");
    for (int s = 0; s < nseqs; s++) printf("│ %-14s", seqs[s].name);
    printf("\n  ──────");
    for (int s = 0; s < nseqs; s++) printf("┼───────────────");
    printf("\n");

    for (int si = 0; si < nseqs; si++) {
        double *seq = malloc(seqs[si].len * sizeof(double));
        memcpy(seq, seqs[si].data, seqs[si].len * sizeof(double));
        int n = seqs[si].len;

        for (int k = 0; k <= max_order && n > 100; k++) {
            if (k == 0) {
                /* subtract mean for ZCR */
                double mean = 0;
                for (int i = 0; i < n; i++) mean += seq[i];
                mean /= n;
                for (int i = 0; i < n; i++) seq[i] -= mean;
            } else {
                n = diff_k_d(seq, seq, n, 1);
            }
            if (si == 0) printf("  d^%-4d", k);
            /* we need to print column by column but we're iterating seq by seq */
            /* store and print after */
        }
        free(seq);
    }
    /* redo properly */
    printf("\r");  /* clear partial output */
    /* table 3 redo */
    double zcr_track[5][15];
    for (int si = 0; si < nseqs; si++) {
        double *seq = malloc(seqs[si].len * sizeof(double));
        memcpy(seq, seqs[si].data, seqs[si].len * sizeof(double));
        int n = seqs[si].len;
        /* subtract mean */
        double mean = 0;
        for (int i = 0; i < n; i++) mean += seq[i];
        mean /= n;
        for (int i = 0; i < n; i++) seq[i] -= mean;

        for (int k = 0; k <= max_order && n > 100; k++) {
            if (k > 0) n = diff_k_d(seq, seq, n, 1);
            zcr_track[si][k] = zero_crossing_rate(seq, n);
        }
        free(seq);
    }

    for (int k = 0; k <= max_order; k++) {
        printf("  d^%-4d", k);
        for (int s = 0; s < nseqs; s++)
            printf("│     %7.4f   ", zcr_track[s][k]);
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Entropy through derivatives */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: NORMALISED ENTROPY THROUGH DERIVATIVES");
    printf("  Order ");
    for (int s = 0; s < nseqs; s++) printf("│ %-14s", seqs[s].name);
    printf("\n  ──────");
    for (int s = 0; s < nseqs; s++) printf("┼───────────────");
    printf("\n");

    double ent_track[5][15];
    for (int si = 0; si < nseqs; si++) {
        double *seq = malloc(seqs[si].len * sizeof(double));
        memcpy(seq, seqs[si].data, seqs[si].len * sizeof(double));
        int n = seqs[si].len;

        for (int k = 0; k <= max_order && n > 100; k++) {
            if (k > 0) n = diff_k_d(seq, seq, n, 1);
            ent_track[si][k] = shannon_entropy_d(seq, n, 64) / log2(64.0);
        }
        free(seq);
    }

    for (int k = 0; k <= max_order; k++) {
        printf("  d^%-4d", k);
        for (int s = 0; s < nseqs; s++)
            printf("│     %7.4f   ", ent_track[s][k]);
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Scale dependence — does behavior change with x? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: SCALE DEPENDENCE OF H''' AMPLITUDE");
    printf("Compute H''' of prime gaps at different ranges of the sequence.\n");
    printf("If amplitude GROWS with range → divergence at large x.\n");
    printf("If amplitude SHRINKS or stable → convergence (RH consistent).\n\n");

    printf("  Range            │ H''' RMS │ H'''' RMS │ Ratio 4/3 │ Trend\n");
    printf("  ─────────────────┼──────────┼───────────┼───────────┼──────\n");

    int ranges[][2] = {
        {0, 5000}, {5000, 15000}, {15000, 30000},
        {30000, 50000}, {50000, 80000}, {80000, 120000},
        {0, 30000}, {0, 60000}, {0, 120000}, {0, ng}
    };
    int nranges = sizeof(ranges) / sizeof(ranges[0]);

    double prev_ratio = 0;
    for (int ri = 0; ri < nranges; ri++) {
        int lo = ranges[ri][0], hi = ranges[ri][1];
        if (hi > ng) hi = ng;
        int rn = hi - lo;
        if (rn < 200) continue;

        double *sub = malloc(rn * sizeof(double));
        memcpy(sub, gaps + lo, rn * sizeof(double));

        /* compute H''' */
        double *d3 = malloc(rn * sizeof(double));
        int d3n = diff_k_d(sub, d3, rn, 3);

        /* compute H'''' */
        double *d4 = malloc(rn * sizeof(double));
        int d4n = diff_k_d(sub, d4, rn, 4);

        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-15 ? r4 / r3 : 0;

        const char *trend;
        if (ri == 0) trend = "baseline";
        else if (ratio > prev_ratio + 0.02) trend = "▲ GROWING";
        else if (ratio < prev_ratio - 0.02) trend = "▽ shrinking";
        else trend = "→ stable";

        printf("  [%6d..%6d] │ %8.4f │  %8.4f │   %6.4f  │ %s\n",
               lo, hi, r3, r4, ratio, trend);
        prev_ratio = ratio;

        free(sub); free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Windowed amplitude evolution of H''' */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: H''' AMPLITUDE EVOLUTION (windowed RMS)");
    printf("Track H''' RMS in sliding windows along the prime sequence.\n");
    printf("Growing windows = amplifying. Shrinking = smoothing.\n\n");

    {
        double *d3 = malloc(ng * sizeof(double));
        int d3n = diff_k_d(gaps, d3, ng, 3);

        int window = d3n / 20;
        if (window < 100) window = 100;
        double *wrms = malloc(d3n * sizeof(double));
        int wrms_n;
        windowed_rms(d3, d3n, window, wrms, &wrms_n);

        printf("  Window │ H''' RMS │ Trend\n");
        printf("  ───────┼──────────┼──────\n");
        double prev_r = 0;
        for (int i = 0; i < wrms_n; i++) {
            const char *trend = (i == 0) ? "—" :
                               (wrms[i] > prev_r * 1.02) ? "▲ growing" :
                               (wrms[i] < prev_r * 0.98) ? "▽ shrinking" : "→ stable";
            printf("  %6d │ %8.4f │ %s\n", i, wrms[i], trend);
            prev_r = wrms[i];
        }

        /* overall trend */
        double slope = linear_slope(wrms, wrms_n);
        printf("\n  Linear trend slope: %+.6f\n", slope);
        printf("  %s\n", slope > 0.001 ? "H''' amplitude is GROWING along the sequence ▲" :
                         slope < -0.001 ? "H''' amplitude is SHRINKING along the sequence ▽" :
                         "H''' amplitude is STABLE along the sequence →");

        /* same for H'''' */
        double *d4 = malloc(ng * sizeof(double));
        int d4n = diff_k_d(gaps, d4, ng, 4);
        double *wrms4 = malloc(d4n * sizeof(double));
        int wrms4_n;
        windowed_rms(d4, d4n, window, wrms4, &wrms4_n);
        double slope4 = linear_slope(wrms4, wrms4_n);
        printf("\n  H'''' trend slope: %+.6f\n", slope4);
        printf("  %s\n", slope4 > 0.001 ? "H'''' amplitude is GROWING ▲ — AMPLIFYING the jerk" :
                         slope4 < -0.001 ? "H'''' amplitude is SHRINKING ▽ — smoothing the jerk" :
                         "H'''' amplitude is STABLE → — preserving the jerk");

        free(d3); free(d4); free(wrms); free(wrms4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: The critical question — ratio H''''/H''' over scale */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: THE CRITICAL RATIO — H''''/H''' vs SCALE");
    printf("If this ratio grows with x → waves amplify → divergence exists.\n");
    printf("If this ratio is constant or shrinks → waves smooth → RH holds.\n\n");

    printf("  Primes up to │ H''' RMS │ H'''' RMS │ Ratio │ Trend\n");
    printf("  ─────────────┼──────────┼───────────┼───────┼──────\n");

    int scale_points[] = {1000, 2000, 5000, 10000, 20000, 50000, 100000, ng};
    int nsp = sizeof(scale_points) / sizeof(scale_points[0]);
    prev_ratio = 0;

    for (int si = 0; si < nsp; si++) {
        int n = scale_points[si];
        if (n > ng) n = ng;

        double *d3 = malloc(n * sizeof(double));
        double *d4 = malloc(n * sizeof(double));
        int d3n = diff_k_d(gaps, d3, n, 3);
        int d4n = diff_k_d(gaps, d4, n, 4);

        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-15 ? r4 / r3 : 0;

        const char *trend = (si == 0) ? "baseline" :
                           (ratio > prev_ratio + 0.01) ? "▲ GROWING" :
                           (ratio < prev_ratio - 0.01) ? "▽ shrinking" : "→ stable";

        printf("  %13d │ %8.4f │  %8.4f │ %5.3f │ %s\n",
               scale_points[si], r3, r4, ratio, trend);
        prev_ratio = ratio;

        free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE JERK DECIDES");
    printf("H''' is the inflection point. H'''' is the test.\n\n");
    printf("If H'''' SMOOTHS H''':\n");
    printf("  → Oscillations decay at every scale\n");
    printf("  → No resonance can grow\n");
    printf("  → All zeros stay on the critical line\n");
    printf("  → RH holds\n\n");
    printf("If H'''' AMPLIFIES H''':\n");
    printf("  → Oscillations grow with scale\n");
    printf("  → A resonance exists that differentiation excites\n");
    printf("  → That resonance corresponds to a zero drifting off Re=1/2\n");
    printf("  → The divergence point is where H''''/H''' exceeds 1\n\n");
    printf("The SCALE DEPENDENCE is the key:\n");
    printf("  If the ratio H''''/H''' is constant across scales → no new structure\n");
    printf("  If the ratio GROWS with x → larger integers reveal hidden oscillation\n");
    printf("  The growth rate constrains where the first off-line zero lives\n");

    free(sieve); free(primes); free(gaps);
    free(mertens); free(surprise); free(interleave); free(div_seq);
    return 0;
}
