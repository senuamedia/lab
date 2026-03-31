/*
 * Experiment 24: A Million Gaps
 *
 * 13x more data than any previous experiment.
 * Sieve to 16M, get ~1M primes, compute gaps.
 * DFT at full resolution — catch slow oscillations invisible before.
 *
 * Looking for: low-frequency drift that only appears at this scale.
 * That drift, if it exists, is the Mertens-style precursor.
 */

#include "rh_scaffold.h"

#define SIEVE_LIMIT 16000000
#define MAX_PRIMES  1100000
#define DFT_SIZE    65536    /* 2^16 — practical DFT size */

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

int main(void) {
    printf("=== Experiment 24: A Million Gaps ===\n\n");

    /* sieve to 16M */
    printf("Sieving to %d...\n", SIEVE_LIMIT);
    char *sieve = calloc(SIEVE_LIMIT + 1, 1);
    for (int i = 2; (long long)i * i <= SIEVE_LIMIT; i++)
        if (!sieve[i])
            for (int j = i * i; j <= SIEVE_LIMIT; j += i)
                sieve[j] = 1;

    int *primes = malloc(MAX_PRIMES * sizeof(int));
    int np = 0;
    for (int i = 2; i <= SIEVE_LIMIT && np < MAX_PRIMES; i++)
        if (!sieve[i]) primes[np++] = i;
    free(sieve);

    int ng = np - 1;
    printf("Primes: %d (up to %d)\n", np, primes[np - 1]);
    printf("Gaps: %d\n\n", ng);

    /* compute normalised gaps */
    double *gaps = malloc(ng * sizeof(double));
    double *raw_gaps = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++) {
        raw_gaps[i] = (double)(primes[i + 1] - primes[i]);
        gaps[i] = raw_gaps[i] / log((double)primes[i]) - 1.0;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 1: H-scaffold at million-gap scale */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: H-SCAFFOLD — 1 MILLION GAPS");
    printf("  Order │ RMS        │ Ratio  │ Entropy │ Norm  │ vs 78K\n");
    printf("  ──────┼────────────┼────────┼─────────┼───────┼───────\n");

    double *seq = malloc(ng * sizeof(double));
    memcpy(seq, gaps, ng * sizeof(double));
    int sn = ng;
    double prev_rms = 0;
    /* 78K ratios from previous experiments for comparison */
    double ref_ratios[] = {0, 0.907, 1.741, 1.830, 1.873, 1.899, 1.916, 1.928, 1.937};

    for (int k = 0; k <= 8 && sn > 100; k++) {
        if (k > 0) sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        double ent = shannon_entropy_d(seq, sn, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        printf("  d^%-4d│ %10.5f │ %6.4f │ %7.4f │ %5.3f │ %+6.4f\n",
               k, r, ratio, ent * log2(64.0), ent,
               k > 0 ? ratio - ref_ratios[k] : 0.0);
        prev_rms = r;
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: DFT at high resolution */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: DFT — 65536-point (16x resolution of exp07)");
    printf("Looking for slow oscillations invisible at 20K.\n\n");

    /* mean-centre gaps for DFT */
    double *dft_in = calloc(DFT_SIZE, sizeof(double));
    double gap_mean = 0;
    for (int i = 0; i < ng && i < DFT_SIZE; i++) gap_mean += gaps[i];
    gap_mean /= (ng < DFT_SIZE ? ng : DFT_SIZE);
    for (int i = 0; i < DFT_SIZE && i < ng; i++)
        dft_in[i] = gaps[i] - gap_mean;

    /* DFT (O(N²) but N=65536 is manageable) — use Cooley-Tukey-like approach */
    /* Actually at 65536, O(N²) is 4 billion ops. Too slow. */
    /* Use a simpler approach: compute only the top frequencies */
    /* Scan at coarse resolution first, then refine */

    int n_coarse = 500;  /* check 500 frequencies */
    double *mags = malloc(n_coarse * sizeof(double));
    int *freq_idx = malloc(n_coarse * sizeof(int));

    printf("  Computing %d frequency bins (coarse scan)...\n\n", n_coarse);

    for (int fi = 0; fi < n_coarse; fi++) {
        int f = fi + 1;
        freq_idx[fi] = f;
        double re = 0, im = 0;
        double omega = 2.0 * M_PI * f / DFT_SIZE;
        for (int i = 0; i < DFT_SIZE; i++) {
            re += dft_in[i] * cos(omega * i);
            im += dft_in[i] * sin(omega * i);
        }
        mags[fi] = sqrt(re * re + im * im) / DFT_SIZE;
    }

    /* sort by magnitude */
    int *sorted = malloc(n_coarse * sizeof(int));
    for (int i = 0; i < n_coarse; i++) sorted[i] = i;
    for (int i = 0; i < n_coarse - 1; i++)
        for (int j = i + 1; j < n_coarse; j++)
            if (mags[sorted[j]] > mags[sorted[i]]) {
                int t = sorted[i]; sorted[i] = sorted[j]; sorted[j] = t;
            }

    printf("  Top 25 frequencies:\n");
    printf("  Rank │ Freq  │ Period   │ Magnitude │ New? │ Interpretation\n");
    printf("  ─────┼───────┼──────────┼───────────┼──────┼──────────────\n");

    /* exp07 found these at 20K: 178, 168, 76, 126, 199 */
    int known_freqs[] = {76, 126, 168, 178, 199};
    int n_known = sizeof(known_freqs) / sizeof(known_freqs[0]);

    int new_count = 0;
    for (int t = 0; t < 25; t++) {
        int fi = sorted[t];
        int f = freq_idx[fi];
        double period = (double)DFT_SIZE / f;
        /* check if this was known from exp07 */
        /* at 65536 points, the old f=178 at 20000 maps to ~178*65536/20000 ≈ 583 */
        /* but we're using different indexing. Check if f is near a known. */
        int is_known = 0;
        for (int k = 0; k < n_known; k++) {
            /* scale: old freq at 20K → new freq at 65K */
            double scaled = known_freqs[k] * (double)DFT_SIZE / 20000.0;
            if (fabs(f - scaled) < 5) is_known = 1;
        }
        if (!is_known && mags[fi] > 0.005) new_count++;

        printf("  %4d │ %5d │ %8.1f │ %9.6f │ %s │ %s\n",
               t + 1, f, period, mags[fi],
               is_known ? "    " : "NEW ",
               mags[fi] > 0.01 ? "*** STRONG" :
               mags[fi] > 0.005 ? "**  moderate" :
               mags[fi] > 0.002 ? "*   weak" : "    background");
    }

    printf("\n  New frequencies not seen at 20K scale: %d\n", new_count);

    /* ──────────────────────────────────────────── */
    /* TABLE 3: LOW frequency scan — the slow drift */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: LOW FREQUENCY SCAN — periods > 10,000 gaps");
    printf("These oscillations are INVISIBLE at 20K. Only a million gaps can see them.\n\n");

    printf("  Freq │ Period     │ Magnitude │ Significance\n");
    printf("  ─────┼────────────┼───────────┼─────────────\n");

    /* compute very low frequencies: f = 1 to 50 */
    /* at DFT_SIZE=65536: f=1 → period 65536, f=6 → period ~10922 */
    double low_mags[50];
    double low_max = 0;
    for (int f = 1; f <= 50; f++) {
        double re = 0, im = 0;
        double omega = 2.0 * M_PI * f / DFT_SIZE;
        for (int i = 0; i < DFT_SIZE; i++) {
            re += dft_in[i] * cos(omega * i);
            im += dft_in[i] * sin(omega * i);
        }
        low_mags[f - 1] = sqrt(re * re + im * im) / DFT_SIZE;
        if (low_mags[f - 1] > low_max) low_max = low_mags[f - 1];
    }

    for (int f = 1; f <= 50; f++) {
        double period = (double)DFT_SIZE / f;
        printf("  %4d │ %10.0f │ %9.6f │ %s\n",
               f, period, low_mags[f - 1],
               low_mags[f - 1] > low_max * 0.8 ? "*** DOMINANT" :
               low_mags[f - 1] > low_max * 0.5 ? "**  strong" :
               low_mags[f - 1] > low_max * 0.2 ? "*   moderate" : "    low");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Does the low-freq power GROW with scale? */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: LOW-FREQUENCY POWER vs SCALE");
    printf("Compute DFT on increasing subsets. Does low-freq power grow?\n");
    printf("Growing = slow drift emerging. Flat = no new structure.\n\n");

    printf("  N gaps   │ f=1 mag  │ f=2 mag  │ f=3 mag  │ f=5 mag  │ Trend\n");
    printf("  ─────────┼──────────┼──────────┼──────────┼──────────┼──────\n");

    int scales[] = {5000, 10000, 20000, 40000, 65536};
    int nsc = sizeof(scales) / sizeof(scales[0]);
    double prev_f1 = 0;

    for (int si = 0; si < nsc; si++) {
        int sz = scales[si];
        if (sz > ng) sz = ng;

        double lf[5];
        for (int f = 1; f <= 5; f++) {
            double re = 0, im = 0;
            double omega = 2.0 * M_PI * f / sz;
            for (int i = 0; i < sz; i++) {
                re += dft_in[i] * cos(omega * i);
                im += dft_in[i] * sin(omega * i);
            }
            lf[f - 1] = sqrt(re * re + im * im) / sz;
        }

        const char *trend = (si == 0) ? "—" :
                           lf[0] > prev_f1 * 1.1 ? "▲ GROWING" :
                           lf[0] < prev_f1 * 0.9 ? "▽ shrinking" : "→ stable";

        printf("  %8d │ %8.5f │ %8.5f │ %8.5f │ %8.5f │ %s\n",
               sz, lf[0], lf[1], lf[2], lf[4], trend);
        prev_f1 = lf[0];
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Windowed ratio stability at 1M scale */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: H''''/H''' IN SLIDING WINDOWS (1M scale)");
    printf("  Window   │ Start gap │ Ratio  │ vs 1.873 │ Anomaly?\n");
    printf("  ─────────┼───────────┼────────┼──────────┼─────────\n");

    int wsize = 50000;
    int nwindows = ng / wsize;
    double max_dev = 0;
    int max_dev_win = 0;

    for (int w = 0; w < nwindows; w++) {
        int start = w * wsize;
        double *d3 = malloc(wsize * sizeof(double));
        double *d4 = malloc(wsize * sizeof(double));
        int d3n = diff_k_d(raw_gaps + start, d3, wsize, 3);
        int d4n = diff_k_d(raw_gaps + start, d4, wsize, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;
        double dev = fabs(ratio - 1.873);
        if (dev > max_dev) { max_dev = dev; max_dev_win = w; }

        printf("  %8d │ %9d │ %6.4f │ %+7.4f  │ %s\n",
               w, start, ratio, ratio - 1.873,
               dev > 0.01 ? "** CHECK" :
               dev > 0.005 ? "*  slight" : "   normal");
        free(d3); free(d4);
    }

    printf("\n  Max deviation: %.4f at window %d (gaps %d-%d)\n",
           max_dev, max_dev_win, max_dev_win * wsize, (max_dev_win + 1) * wsize);
    printf("  Prime range: p[%d]=%d to p[%d]=%d\n",
           max_dev_win * wsize, primes[max_dev_win * wsize],
           (max_dev_win + 1) * wsize, primes[(max_dev_win + 1) * wsize]);

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Running Mertens at 16M scale */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: MERTENS AT 16M — largest scale yet");

    /* we freed the sieve, so recompute Möbius for sampled points */
    /* instead: use Liouville which only needs factorisation */
    printf("  Liouville L(x)/√x at million-prime checkpoints:\n\n");
    printf("  x          │ L(x)      │ √x       │ L(x)/√x   │ Record?\n");
    printf("  ───────────┼───────────┼──────────┼───────────┼────────\n");

    double L_sum = 0;
    double L_record = 0;
    int check = 0;
    int checkpoints[] = {100000, 500000, 1000000, 2000000, 5000000, 10000000, 15000000};
    int ncp = sizeof(checkpoints) / sizeof(checkpoints[0]);

    for (int n = 1; n <= SIEVE_LIMIT && check < ncp; n++) {
        /* compute Liouville: (-1)^Ω(n) */
        int omega = 0;
        int temp = n;
        for (int p = 2; (long long)p * p <= temp; p++)
            while (temp % p == 0) { omega++; temp /= p; }
        if (temp > 1) omega++;
        L_sum += (omega % 2 == 0) ? 1.0 : -1.0;

        if (n == checkpoints[check]) {
            double sqrtn = sqrt((double)n);
            double scaled = L_sum / sqrtn;
            int is_record = fabs(scaled) > L_record;
            if (fabs(scaled) > L_record) L_record = fabs(scaled);
            printf("  %11d │ %+9.0f │ %8.1f │ %+9.5f  │ %s\n",
                   n, L_sum, sqrtn, scaled,
                   is_record ? "*** YES" : "");
            check++;
        }
    }

    printf("\n  Maximum |L(x)/√x| seen: %.5f\n", L_record);
    printf("  Bound for RH: must stay < ∞ (no specific constant)\n");
    printf("  For reference: at 10^7, |L/√x| is still < 1.0: %s\n",
           L_record < 1.0 ? "YES ✓" : "NO ✗");

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: A MILLION GAPS");
    printf("13x more data than any previous experiment.\n\n");
    printf("Looking for:\n");
    printf("  1. Does the ratio change? (Table 1)\n");
    printf("  2. New DFT frequencies invisible at 20K? (Table 2)\n");
    printf("  3. Slow drift in low frequencies? (Table 3-4)\n");
    printf("  4. Any window with anomalous ratio? (Table 5)\n");
    printf("  5. Mertens/Liouville bound holding at 16M? (Table 6)\n\n");
    printf("If ALL are consistent: more yes, at the largest scale yet.\n");
    printf("If ANY show a crack: that's the first hint of a no.\n");

    free(primes); free(gaps); free(raw_gaps);
    free(dft_in); free(mags); free(freq_idx); free(sorted); free(seq);
    return 0;
}
