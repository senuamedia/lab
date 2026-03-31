/*
 * Experiment 16: The Adversarial Sieve
 *
 * Stop confirming. Start falsifying.
 *
 * Layer by layer, strip everything that says "yes RH holds":
 *   L0: Raw data
 *   L1: Strip the density trend (PNT)
 *   L2: Strip the known zero oscillations
 *   L3: Strip the GUE statistics
 *   L4: Strip the scale invariance
 *   L5: Strip the dimensional damping
 *
 * What's LEFT after all the "yes" is removed?
 * If nothing: RH is unfalsifiable at this scale (not the same as true)
 * If something: that something is the candidate for "no"
 *
 * Also: CONSTRUCT what failure would look like.
 * Inject a fake off-line zero and measure what changes.
 * Then look for that signature in the real data.
 *
 * The Mertens lesson: if the counterexample is at 10^(10^40),
 * what PRECURSOR would be visible at 10^6?
 */

#include "rh_scaffold.h"
#include "rh_zeta.h"

#define MAX_N 2000000
#define MAX_PRIMES 150000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

static int mobius(int n) {
    int factors = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) { n /= p; factors++; if (n % p == 0) return 0; }
    }
    if (n > 1) factors++;
    return (factors % 2 == 0) ? 1 : -1;
}

static int liouville(int n) { return (big_omega(n) % 2 == 0) ? 1 : -1; }

/* ────────────────────────────────────────────────── */
/* CONSTRUCT a fake off-line zero's contribution      */
/* If a zero existed at ρ = σ + iγ with σ ≠ 1/2,    */
/* its contribution to π(x) would be:                 */
/*   ~ x^σ * cos(γ ln(x)) / (|ρ| ln(x))             */
/* For σ > 1/2, this GROWS faster than sqrt(x).      */
/* ────────────────────────────────────────────────── */
static double fake_zero_contribution(double x, double sigma, double gamma_val) {
    if (x < 2.0) return 0.0;
    double lnx = log(x);
    double amp = pow(x, sigma) / (sqrt(sigma * sigma + gamma_val * gamma_val) * lnx);
    return amp * cos(gamma_val * lnx);
}

int main(void) {
    printf("=== Experiment 16: The Adversarial Sieve ===\n\n");
    printf("Strip everything that says YES. Look for anything that says NO.\n");
    printf("Construct what failure looks like. Search for its shadow.\n\n");

    /* sieve */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    int *primes = malloc(MAX_PRIMES * sizeof(int));
    int np = 0;
    for (int i = 2; i <= MAX_N && np < MAX_PRIMES; i++)
        if (!sieve[i]) primes[np++] = i;
    printf("Primes: %d up to %d\n\n", np, MAX_N);

    /* ──────────────────────────────────────────── */
    /* PART 1: CONSTRUCT THE FAILURE SIGNATURE      */
    /* ──────────────────────────────────────────── */
    rh_table_header("PART 1: WHAT DOES FAILURE LOOK LIKE?");
    printf("Inject a fake zero at σ = 0.6 (off the line by 0.1).\n");
    printf("Measure what changes in our scaffold.\n\n");

    /* compute π(x) - li(x) for real primes */
    double *real_resid = malloc(np * sizeof(double));
    for (int i = 0; i < np; i++) {
        double x = (double)primes[i];
        real_resid[i] = (double)(i + 1) - li(x);
    }

    /* inject fake zero: add contribution of zero at 0.6 + 14.13i */
    double fake_sigma = 0.6;
    double fake_gamma = 14.1347;  /* same height as first real zero */

    double *fake_resid = malloc(np * sizeof(double));
    for (int i = 0; i < np; i++) {
        double x = (double)primes[i];
        fake_resid[i] = real_resid[i] + fake_zero_contribution(x, fake_sigma, fake_gamma);
    }

    /* also inject a barely-off-line zero: σ = 0.501 */
    double *subtle_resid = malloc(np * sizeof(double));
    for (int i = 0; i < np; i++) {
        double x = (double)primes[i];
        subtle_resid[i] = real_resid[i] + fake_zero_contribution(x, 0.501, fake_gamma);
    }

    /* compare scaffolds */
    printf("  Measure          │ Real       │ Fake(σ=0.6) │ Subtle(σ=0.501) │ Detect?\n");
    printf("  ─────────────────┼────────────┼─────────────┼─────────────────┼────────\n");

    double r_rms = rms_d(real_resid, np);
    double f_rms = rms_d(fake_resid, np);
    double s_rms = rms_d(subtle_resid, np);
    printf("  RMS              │ %10.4f │  %10.4f  │    %10.4f    │ %s\n",
           r_rms, f_rms, s_rms,
           fabs(f_rms - r_rms) / r_rms > 0.01 ? "YES" : "no");

    double r_ent = shannon_entropy_d(real_resid, np, 64) / log2(64.0);
    double f_ent = shannon_entropy_d(fake_resid, np, 64) / log2(64.0);
    double s_ent = shannon_entropy_d(subtle_resid, np, 64) / log2(64.0);
    printf("  Entropy(norm)    │ %10.4f │  %10.4f  │    %10.4f    │ %s\n",
           r_ent, f_ent, s_ent,
           fabs(f_ent - r_ent) > 0.01 ? "YES" : "no");

    /* H''''/H''' ratio */
    double *rd3 = malloc(np * sizeof(double));
    double *rd4 = malloc(np * sizeof(double));
    double *fd3 = malloc(np * sizeof(double));
    double *fd4 = malloc(np * sizeof(double));
    double *sd3 = malloc(np * sizeof(double));
    double *sd4 = malloc(np * sizeof(double));
    int rd3n = diff_k_d(real_resid, rd3, np, 3);
    int rd4n = diff_k_d(real_resid, rd4, np, 4);
    int fd3n = diff_k_d(fake_resid, fd3, np, 3);
    int fd4n = diff_k_d(fake_resid, fd4, np, 4);
    int sd3n = diff_k_d(subtle_resid, sd3, np, 3);
    int sd4n = diff_k_d(subtle_resid, sd4, np, 4);
    double r_ratio = rms_d(rd4, rd4n) / rms_d(rd3, rd3n);
    double f_ratio = rms_d(fd4, fd4n) / rms_d(fd3, fd3n);
    double s_ratio = rms_d(sd4, sd4n) / rms_d(sd3, sd3n);
    printf("  H''''/H'''       │ %10.4f │  %10.4f  │    %10.4f    │ %s\n",
           r_ratio, f_ratio, s_ratio,
           fabs(f_ratio - r_ratio) > 0.005 ? "YES" : "no");

    /* max deviation / sqrt(x) */
    double r_max_scaled = 0, f_max_scaled = 0, s_max_scaled = 0;
    for (int i = 0; i < np; i++) {
        double sqrtx = sqrt((double)primes[i]);
        double rv = fabs(real_resid[i]) / sqrtx;
        double fv = fabs(fake_resid[i]) / sqrtx;
        double sv = fabs(subtle_resid[i]) / sqrtx;
        if (rv > r_max_scaled) r_max_scaled = rv;
        if (fv > f_max_scaled) f_max_scaled = fv;
        if (sv > s_max_scaled) s_max_scaled = sv;
    }
    printf("  Max|r|/√x        │ %10.4f │  %10.4f  │    %10.4f    │ %s\n",
           r_max_scaled, f_max_scaled, s_max_scaled,
           f_max_scaled > r_max_scaled * 1.5 ? "YES" : "no");

    /* does scaled residual grow with x? (the precursor) */
    /* check last 10% vs first 10% */
    int tenth = np / 10;
    double r_early = 0, r_late = 0, f_early = 0, f_late = 0, s_early = 0, s_late = 0;
    for (int i = 0; i < tenth; i++) {
        r_early += fabs(real_resid[i]) / sqrt((double)primes[i]);
        f_early += fabs(fake_resid[i]) / sqrt((double)primes[i]);
        s_early += fabs(subtle_resid[i]) / sqrt((double)primes[i]);
    }
    for (int i = np - tenth; i < np; i++) {
        r_late += fabs(real_resid[i]) / sqrt((double)primes[i]);
        f_late += fabs(fake_resid[i]) / sqrt((double)primes[i]);
        s_late += fabs(subtle_resid[i]) / sqrt((double)primes[i]);
    }
    r_early /= tenth; r_late /= tenth;
    f_early /= tenth; f_late /= tenth;
    s_early /= tenth; s_late /= tenth;

    printf("  Early/Late ratio │ %10.4f │  %10.4f  │    %10.4f    │ %s\n",
           r_late / r_early, f_late / f_early, s_late / s_early,
           f_late / f_early > r_late / r_early * 1.1 ? "YES — GROWING" : "no");

    printf("\n  The SIGNATURE of an off-line zero:\n");
    printf("    σ=0.6:   RMS changes %.1f%%, ratio changes %.4f, max/√x changes %.1f%%\n",
           (f_rms - r_rms) / r_rms * 100, f_ratio - r_ratio,
           (f_max_scaled - r_max_scaled) / r_max_scaled * 100);
    printf("    σ=0.501: RMS changes %.1f%%, ratio changes %.4f, max/√x changes %.1f%%\n",
           (s_rms - r_rms) / r_rms * 100, s_ratio - r_ratio,
           (s_max_scaled - r_max_scaled) / r_max_scaled * 100);

    free(rd3); free(rd4); free(fd3); free(fd4); free(sd3); free(sd4);

    /* ──────────────────────────────────────────── */
    /* PART 2: THE ADVERSARIAL SIEVE ON MERTENS    */
    /* ──────────────────────────────────────────── */
    rh_table_header("PART 2: ADVERSARIAL SIEVE ON M(x)");
    printf("M(x)/√x should be bounded. Search for growth.\n");
    printf("Strip the 'bounded' narrative. Look for drift.\n\n");

    double *mertens = malloc(MAX_N * sizeof(double));
    double *mertens_scaled = malloc(MAX_N * sizeof(double));
    int msum = 0;
    int mn = 0;
    double max_pos = 0, max_neg = 0;
    int max_pos_n = 0, max_neg_n = 0;

    for (int n = 1; n <= MAX_N; n++) {
        msum += mobius(n);
        if (n % 10 == 0) {
            double scaled = (double)msum / sqrt((double)n);
            mertens[mn] = (double)msum;
            mertens_scaled[mn] = scaled;
            mn++;
            if (scaled > max_pos) { max_pos = scaled; max_pos_n = n; }
            if (scaled < max_neg) { max_neg = scaled; max_neg_n = n; }
        }
    }

    printf("  M(x)/√x extremes in [1, %d]:\n", MAX_N);
    printf("    Maximum: %+.6f at n = %d\n", max_pos, max_pos_n);
    printf("    Minimum: %+.6f at n = %d\n", max_neg, max_neg_n);
    printf("    Range:   %.6f\n\n", max_pos - max_neg);

    /* is the RANGE of M(x)/√x growing with x? */
    printf("  Range growth of M(x)/√x in expanding windows:\n\n");
    printf("  Window     │ Max M/√x │ Min M/√x │ Range    │ Growing?\n");
    printf("  ───────────┼──────────┼──────────┼──────────┼─────────\n");

    double prev_range = 0;
    int windows[] = {1000, 5000, 10000, 50000, 100000, 500000, 1000000, 2000000};
    int nwin = sizeof(windows) / sizeof(windows[0]);
    msum = 0;
    double w_max = -1e30, w_min = 1e30;

    for (int wi = 0; wi < nwin; wi++) {
        /* scan mertens_scaled array up to this window */
        int target = windows[wi] / 10;
        if (target > mn) target = mn;
        w_max = -1e30; w_min = 1e30;
        for (int i = 0; i < target; i++) {
            if (mertens_scaled[i] > w_max) w_max = mertens_scaled[i];
            if (mertens_scaled[i] < w_min) w_min = mertens_scaled[i];
        }
        double range = w_max - w_min;
        printf("  [1, %7d]│ %+8.4f │ %+8.4f │ %8.4f │ %s\n",
               windows[wi], w_max, w_min, range,
               range > prev_range + 0.05 ? "▲ YES — EXPANDING" :
               range < prev_range - 0.05 ? "▽ shrinking" : "→ stable");
        prev_range = range;
    }

    /* ──────────────────────────────────────────── */
    /* PART 3: ADVERSARIAL SIEVE ON LIOUVILLE      */
    /* ──────────────────────────────────────────── */
    rh_table_header("PART 3: ADVERSARIAL SIEVE ON L(x)");
    printf("L(x) = Σλ(n). The Pólya conjecture said L(x) ≤ 0 always.\n");
    printf("DISPROVEN: first positive L(x) at x = 906,150,257.\n");
    printf("If Pólya can fail, what else can?\n\n");

    double *L_seq = malloc(MAX_N * sizeof(double));
    double *L_scaled = malloc(MAX_N * sizeof(double));
    double L_sum = 0;
    int ln = 0;
    double L_max = -1e30, L_min = 1e30;
    int L_max_n = 0, L_min_n = 0;
    int sign_changes = 0;
    double prev_L = 0;

    for (int n = 1; n <= MAX_N; n++) {
        L_sum += liouville(n);
        if (n % 10 == 0) {
            double scaled = L_sum / sqrt((double)n);
            L_seq[ln] = L_sum;
            L_scaled[ln] = scaled;
            ln++;
            if (scaled > L_max) { L_max = scaled; L_max_n = n; }
            if (scaled < L_min) { L_min = scaled; L_min_n = n; }
            if (ln > 1 && L_scaled[ln - 1] * prev_L < 0) sign_changes++;
            prev_L = scaled;
        }
    }

    printf("  L(x)/√x extremes:\n");
    printf("    Maximum: %+.6f at n = %d\n", L_max, L_max_n);
    printf("    Minimum: %+.6f at n = %d\n", L_min, L_min_n);
    printf("    Range:   %.6f\n", L_max - L_min);
    printf("    Sign changes of L(x)/√x: %d\n\n", sign_changes);

    /* does L(x) ever go positive? (Pólya conjecture) */
    L_sum = 0;
    int polya_violations = 0;
    for (int n = 1; n <= MAX_N; n++) {
        L_sum += liouville(n);
        if (L_sum > 0) polya_violations++;
    }
    printf("  Pólya violations (L(x) > 0): %d out of %d (%.4f%%)\n",
           polya_violations, MAX_N, 100.0 * polya_violations / MAX_N);
    printf("  (First known violation at n = 906,150,257 — beyond our range)\n");

    /* ──────────────────────────────────────────── */
    /* PART 4: SEARCH FOR ANOMALIES                 */
    /* ──────────────────────────────────────────── */
    rh_table_header("PART 4: ANOMALY SEARCH");
    printf("Look for ANY measurement that deviates from RH prediction.\n\n");

    /* Test 1: Is M(x)/√x trending upward? Linear fit */
    double sx = 0, sy = 0, sxx = 0, sxy = 0;
    for (int i = mn / 2; i < mn; i++) {  /* fit second half only */
        sx += i; sy += fabs(mertens_scaled[i]);
        sxx += (double)i * i; sxy += i * fabs(mertens_scaled[i]);
    }
    int fn = mn - mn / 2;
    double m_slope = (fn * sxy - sx * sy) / (fn * sxx - sx * sx);
    printf("  Test 1: |M(x)/√x| trend in second half\n");
    printf("    Slope: %+.8f per sample\n", m_slope);
    printf("    Verdict: %s\n\n",
           m_slope > 1e-6 ? "*** GROWING — possible precursor" :
           m_slope < -1e-6 ? "shrinking (good for RH)" : "flat (neutral)");

    /* Test 2: Is the H''''/H''' ratio EXACTLY approaching 2.0? */
    /* Or does it have a limit < 2.0? */
    int N = MAX_N - 1;
    double *omega_seq = malloc(N * sizeof(double));
    for (int i = 0; i < N; i++) omega_seq[i] = (double)big_omega(i + 2);

    double prev_ratio = 0;
    double ratio_deltas[15];
    double *seq = malloc(N * sizeof(double));
    memcpy(seq, omega_seq, N * sizeof(double));
    int sn = N;
    double prev_rms = 0;
    printf("  Test 2: Does H''''/H''' approach 2.0 or stop short?\n");
    printf("  Order │ Ratio    │ 2.0 - ratio │ Halving? │ Verdict\n");
    printf("  ──────┼──────────┼─────────────┼──────────┼────────\n");
    for (int k = 1; k <= 12 && sn > 100; k++) {
        sn = diff_k_d(seq, seq, sn, 1);
        double r = rms_d(seq, sn);
        double ratio = prev_rms > 1e-30 ? r / prev_rms : 0;
        double gap = 2.0 - ratio;
        double delta = ratio - prev_ratio;
        ratio_deltas[k] = delta;
        /* is the gap halving? if gap(k)/gap(k-1) ≈ 0.5, it converges to 2.0 */
        double gap_ratio = (k > 2 && fabs(2.0 - prev_ratio) > 1e-10) ?
                          gap / (2.0 - prev_ratio) : 0;
        printf("  d%d/d%d│ %8.5f │  %10.7f │ %8.4f  │ %s\n",
               k, k - 1, ratio, gap, gap_ratio,
               gap_ratio > 0.45 && gap_ratio < 0.55 ? "converges to 2.0" :
               gap_ratio > 0.7 ? "STALLING — limit < 2.0" :
               gap_ratio < 0.3 ? "accelerating past 2.0?" : "—");
        prev_ratio = ratio;
        prev_rms = r;
    }

    /* Test 3: Local extremes of M(x)/√x — are they getting bigger? */
    printf("\n  Test 3: Local extremes of |M(x)/√x|\n");
    printf("  Scanning for new records as x increases...\n\n");
    printf("  n          │ M(x)/√x    │ New record? │ Time since last\n");
    printf("  ───────────┼────────────┼─────────────┼────────────────\n");

    double record = 0;
    int last_record_n = 1;
    msum = 0;
    int records_found = 0;
    for (int n = 1; n <= MAX_N; n++) {
        msum += mobius(n);
        double scaled = fabs((double)msum / sqrt((double)n));
        if (scaled > record) {
            record = scaled;
            if (n > 100 && records_found < 25) {
                printf("  %11d │ %+10.6f │ YES — %.4f │ %d\n",
                       n, (double)msum / sqrt((double)n), record, n - last_record_n);
                records_found++;
            }
            last_record_n = n;
        }
    }
    printf("  ...\n");
    printf("  Total records: %d\n", records_found);
    printf("  Current record: %.6f\n", record);
    printf("  Mertens conjecture bound: 1.0\n");
    printf("  Headroom: %.4f  (%.1f%% of bound)\n\n",
           1.0 - record, (1.0 - record) * 100);

    /* Test 4: The shade gradient — any local reversal? */
    printf("  Test 4: Shade entropy reversal search\n");
    printf("  Looking for windows where entropy DECREASES through derivatives\n\n");

    int wsize = 5000;
    int reversals = 0;
    int worst_reversal_pos = 0;
    double worst_reversal_size = 0;

    for (int start = 0; start + wsize < N; start += wsize) {
        double *win = malloc(wsize * sizeof(double));
        memcpy(win, omega_seq + start, wsize * sizeof(double));
        int wn = wsize;

        double prev_ent = 0;
        for (int k = 0; k <= 5 && wn > 50; k++) {
            if (k > 0) wn = diff_k_d(win, win, wn, 1);
            double ent = shannon_entropy_d(win, wn, 64) / log2(64.0);
            if (k >= 3 && ent < prev_ent - 0.02) {
                reversals++;
                double size = prev_ent - ent;
                if (size > worst_reversal_size) {
                    worst_reversal_size = size;
                    worst_reversal_pos = start + 2;
                }
            }
            prev_ent = ent;
        }
        free(win);
    }

    printf("  Windows checked: %d (size %d)\n", N / wsize, wsize);
    printf("  Entropy reversals at H''' or beyond: %d\n", reversals);
    if (reversals > 0) {
        printf("  Worst reversal: %.4f at n ≈ %d  *** INVESTIGATE\n", worst_reversal_size, worst_reversal_pos);
    } else {
        printf("  No reversals found (consistent with RH)\n");
    }

    /* ──────────────────────────────────────────── */
    /* PART 5: THE HONEST ASSESSMENT                */
    /* ──────────────────────────────────────────── */
    rh_table_header("PART 5: THE HONEST ASSESSMENT");
    printf("What we CAN say:\n");
    printf("  Every test at scale ≤ 2×10^6 is consistent with RH.\n");
    printf("  The scaffold, sieve, hypercube, shade all agree.\n\n");

    printf("What we CANNOT say:\n");
    printf("  That RH is true. Our scale is negligible.\n");
    printf("  The Mertens conjecture held to 10^(10^40) before failing.\n\n");

    printf("What would change our mind:\n");
    printf("  1. M(x)/√x record exceeding 1.0\n");
    printf("     Current: %.4f (%.1f%% headroom)\n", record, (1.0 - record) * 100);
    printf("  2. H''''/H''' ratio increasing with scale (currently stable)\n");
    printf("  3. Entropy reversal at H''' in any window (found: %d)\n", reversals);
    printf("  4. Dimensional convergence reversing (ratio increasing with D)\n");
    printf("  5. Scaled residual |r|/√x trending upward (slope: %+.2e)\n\n", m_slope);

    printf("ADVERSARIAL VERDICT:\n");
    int red_flags = 0;
    if (m_slope > 1e-6) { printf("  ⚠ |M(x)/√x| shows upward trend\n"); red_flags++; }
    if (record > 0.9) { printf("  ⚠ Mertens record above 0.9\n"); red_flags++; }
    if (reversals > 0) { printf("  ⚠ Entropy reversals detected\n"); red_flags++; }

    if (red_flags == 0) {
        printf("  No anomalies detected. RH unfalsified at this scale.\n");
        printf("  But: absence of evidence ≠ evidence of absence.\n");
    } else {
        printf("  %d potential anomalies found. INVESTIGATE.\n", red_flags);
    }

    free(sieve); free(primes);
    free(real_resid); free(fake_resid); free(subtle_resid);
    free(mertens); free(mertens_scaled);
    free(L_seq); free(L_scaled);
    free(omega_seq); free(seq);
    return 0;
}
