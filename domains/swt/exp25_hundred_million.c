/*
 * Experiment 25: Hundred Million Gaps
 *
 * Sieve to ~2 billion. ~100M primes. Stream computation.
 * Memory-lean: don't store all primes, process in chunks.
 *
 * Focus on:
 *   1. H''''/H''' ratio in sliding windows across 100M gaps
 *   2. Liouville L(x)/√x — does -1.025 get worse?
 *   3. Low-frequency DFT on the largest dataset yet
 *   4. Any window where the ratio deviates
 *
 * Memory budget: ~4GB total (sieve 2GB + working space)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

/* we need a large sieve — use bit-packed to save memory */
/* 2 billion bits = 250MB. Much better than 2GB byte array. */
#define SIEVE_LIMIT 2000000000LL
#define SIEVE_BYTES ((SIEVE_LIMIT / 8) + 1)

static unsigned char *sieve_bits;

static inline void set_composite(long long n) {
    sieve_bits[n >> 3] |= (1 << (n & 7));
}

static inline int is_composite(long long n) {
    return (sieve_bits[n >> 3] >> (n & 7)) & 1;
}

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

int main(void) {
    printf("=== Experiment 25: Hundred Million Gaps ===\n\n");
    time_t start_time = time(NULL);

    /* ──────────────────────────────────────────── */
    /* Phase 1: Bit-packed sieve to 2 billion       */
    /* ──────────────────────────────────────────── */
    printf("Allocating bit sieve (%.0f MB)...\n", SIEVE_BYTES / 1e6);
    sieve_bits = calloc(SIEVE_BYTES, 1);
    if (!sieve_bits) {
        printf("FATAL: cannot allocate sieve. Need %.0f MB.\n", SIEVE_BYTES / 1e6);
        return 1;
    }

    printf("Sieving to %lld...\n", SIEVE_LIMIT);
    set_composite(0);
    set_composite(1);
    for (long long i = 2; i * i <= SIEVE_LIMIT; i++) {
        if (!is_composite(i)) {
            for (long long j = i * i; j <= SIEVE_LIMIT; j += i)
                set_composite(j);
        }
    }

    double sieve_time = difftime(time(NULL), start_time);
    printf("Sieve complete in %.0f seconds.\n\n", sieve_time);

    /* ──────────────────────────────────────────── */
    /* Phase 2: Stream through primes in chunks     */
    /* Process 50K primes at a time for ratio       */
    /* ──────────────────────────────────────────── */

    #define CHUNK 50000
    #define MAX_WINDOWS 2200  /* expect ~100M/50K = 2000 windows */

    double window_ratios[MAX_WINDOWS];
    double window_means[MAX_WINDOWS];
    int n_windows = 0;

    /* Liouville tracking */
    double L_sum = 0;
    double L_max_abs = 0;
    long long L_max_n = 0;
    double L_record_scaled = 0;
    long long L_record_n = 0;

    /* global tracking */
    long long total_primes = 0;
    long long prev_prime = 0;
    double *chunk_gaps = malloc(CHUNK * sizeof(double));
    int chunk_idx = 0;

    /* Liouville checkpoints */
    long long L_checks[] = {1000000, 5000000, 10000000, 50000000,
                            100000000, 200000000, 500000000, 1000000000, 2000000000};
    int n_Lchecks = sizeof(L_checks) / sizeof(L_checks[0]);
    int L_ci = 0;

    printf("Streaming through primes and computing Liouville...\n");
    printf("(This will take a while — processing 2 billion integers)\n\n");

    /* print header for Liouville checkpoints */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("LIOUVILLE L(x)/√x CHECKPOINTS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("  x            │ L(x)       │ √x         │ L(x)/√x    │ |L/√x| record\n");
    printf("  ─────────────┼────────────┼────────────┼────────────┼──────────────\n");

    time_t last_report = time(NULL);

    for (long long n = 2; n <= SIEVE_LIMIT; n++) {
        /* Liouville: (-1)^Ω(n) */
        {
            int omega = 0;
            long long temp = n;
            for (long long p = 2; p * p <= temp; p++) {
                while (temp % p == 0) { omega++; temp /= p; }
            }
            if (temp > 1) omega++;
            L_sum += (omega % 2 == 0) ? 1.0 : -1.0;
        }

        /* Liouville checkpoint */
        if (L_ci < n_Lchecks && n == L_checks[L_ci]) {
            double sqrtn = sqrt((double)n);
            double scaled = L_sum / sqrtn;
            int is_record = fabs(scaled) > L_record_scaled;
            if (fabs(scaled) > L_record_scaled) {
                L_record_scaled = fabs(scaled);
                L_record_n = n;
            }
            printf("  %13lld │ %+10.0f │ %10.1f │ %+10.5f  │ %s %.5f\n",
                   n, L_sum, sqrtn, scaled,
                   is_record ? "*** NEW" : "       ", L_record_scaled);
            fflush(stdout);
            L_ci++;
        }

        /* prime detection and gap collection */
        if (!is_composite(n)) {
            total_primes++;
            if (prev_prime > 0) {
                double gap = (double)(n - prev_prime);
                chunk_gaps[chunk_idx++] = gap;

                /* when chunk is full, compute ratio */
                if (chunk_idx >= CHUNK) {
                    double *d3 = malloc(CHUNK * sizeof(double));
                    double *d4 = malloc(CHUNK * sizeof(double));
                    int d3n = diff_k_d(chunk_gaps, d3, CHUNK, 3);
                    int d4n = diff_k_d(chunk_gaps, d4, CHUNK, 4);
                    double r3 = rms_d(d3, d3n);
                    double r4 = rms_d(d4, d4n);
                    double ratio = r3 > 1e-30 ? r4 / r3 : 0;

                    double mean_gap = 0;
                    for (int i = 0; i < CHUNK; i++) mean_gap += chunk_gaps[i];
                    mean_gap /= CHUNK;

                    if (n_windows < MAX_WINDOWS) {
                        window_ratios[n_windows] = ratio;
                        window_means[n_windows] = mean_gap;
                        n_windows++;
                    }

                    free(d3); free(d4);
                    chunk_idx = 0;
                }
            }
            prev_prime = n;
        }

        /* progress report every 60 seconds */
        time_t now = time(NULL);
        if (difftime(now, last_report) > 60) {
            double pct = 100.0 * n / SIEVE_LIMIT;
            double elapsed = difftime(now, start_time);
            double eta = elapsed / (pct / 100.0) - elapsed;
            printf("  [%.1f%% — n=%lld — %lld primes — %.0fs elapsed — ETA %.0fs]\n",
                   pct, n, total_primes, elapsed, eta);
            fflush(stdout);
            last_report = now;
        }
    }

    double total_time = difftime(time(NULL), start_time);
    printf("\nComplete. %lld primes found in %.0f seconds.\n\n", total_primes, total_time);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Window ratios across 100M gaps */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 1: H''''/H''' RATIO IN %d WINDOWS OF %d GAPS\n", n_windows, CHUNK);
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    double ratio_min = 9, ratio_max = 0, ratio_sum = 0;
    int anomaly_count = 0;
    int min_win = 0, max_win = 0;

    for (int w = 0; w < n_windows; w++) {
        ratio_sum += window_ratios[w];
        if (window_ratios[w] < ratio_min) { ratio_min = window_ratios[w]; min_win = w; }
        if (window_ratios[w] > ratio_max) { ratio_max = window_ratios[w]; max_win = w; }
        if (fabs(window_ratios[w] - 1.873) > 0.01) anomaly_count++;
    }
    double ratio_mean = ratio_sum / n_windows;

    /* variance */
    double ratio_var = 0;
    for (int w = 0; w < n_windows; w++) {
        double d = window_ratios[w] - ratio_mean;
        ratio_var += d * d;
    }
    ratio_var = sqrt(ratio_var / n_windows);

    printf("  Windows: %d\n", n_windows);
    printf("  Mean ratio:  %.6f\n", ratio_mean);
    printf("  Std dev:     %.6f\n", ratio_var);
    printf("  Min ratio:   %.6f (window %d)\n", ratio_min, min_win);
    printf("  Max ratio:   %.6f (window %d)\n", ratio_max, max_win);
    printf("  Anomalies (|r - 1.873| > 0.01): %d / %d (%.2f%%)\n\n",
           anomaly_count, n_windows, 100.0 * anomaly_count / n_windows);

    /* print every 100th window for overview */
    printf("  Sample windows:\n");
    printf("  Window │ Ratio  │ Mean gap │ vs 1.873\n");
    printf("  ───────┼────────┼──────────┼─────────\n");
    for (int w = 0; w < n_windows; w += n_windows / 20) {
        printf("  %6d │ %6.4f │ %8.2f │ %+7.4f  %s\n",
               w, window_ratios[w], window_means[w],
               window_ratios[w] - 1.873,
               fabs(window_ratios[w] - 1.873) > 0.01 ? "** CHECK" : "");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Ratio drift — is there a trend? */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 2: RATIO DRIFT\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* linear fit of ratio vs window index */
    double sx = 0, sy = 0, sxx = 0, sxy = 0;
    for (int w = 0; w < n_windows; w++) {
        sx += w; sy += window_ratios[w];
        sxx += (double)w * w; sxy += w * window_ratios[w];
    }
    double slope = (n_windows * sxy - sx * sy) / (n_windows * sxx - sx * sx);
    double intercept = (sy - slope * sx) / n_windows;

    printf("  Linear fit: ratio = %.6f + %.2e × window\n", intercept, slope);
    printf("  Slope per million gaps: %+.2e\n", slope * (1000000.0 / CHUNK));
    printf("  Drift across full range: %+.6f\n", slope * n_windows);
    printf("  Verdict: %s\n\n",
           fabs(slope * n_windows) < 0.001 ? "NO DRIFT — ratio is constant ✓" :
           slope > 0 ? "UPWARD DRIFT — ratio increasing with scale" :
           "DOWNWARD DRIFT — ratio decreasing with scale");

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Liouville summary */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 3: LIOUVILLE SUMMARY\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Maximum |L(x)/√x|: %.5f at x = %lld\n", L_record_scaled, L_record_n);
    printf("  Does |L(x)/√x| exceed 1.0? %s\n",
           L_record_scaled > 1.0 ? "YES — excursion observed" : "NO — stays bounded");
    printf("  Is it growing? Check the checkpoints above.\n");

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: HUNDRED MILLION GAPS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Scale: %lld primes up to %lld\n", total_primes, SIEVE_LIMIT);
    printf("  Windows: %d × %d gaps = %lld total\n", n_windows, CHUNK, (long long)n_windows * CHUNK);
    printf("  Ratio: %.6f ± %.6f\n", ratio_mean, ratio_var);
    printf("  Drift: %+.2e per window\n", slope);
    printf("  Anomalies: %d / %d\n", anomaly_count, n_windows);
    printf("  Liouville max |L/√x|: %.5f\n", L_record_scaled);
    printf("  Time: %.0f seconds\n\n", total_time);

    if (anomaly_count == 0 && fabs(slope * n_windows) < 0.001) {
        printf("  VERDICT: More yes. Ratio stable across 100M+ gaps.\n");
    } else if (anomaly_count > 0) {
        printf("  VERDICT: %d anomalous windows found. INVESTIGATE.\n", anomaly_count);
    }
    if (L_record_scaled > 1.0) {
        printf("  NOTE: Liouville excursion past 1.0 confirmed.\n");
        printf("  This is known behavior, not an RH violation.\n");
    }

    free(sieve_bits); free(chunk_gaps);
    return 0;
}
