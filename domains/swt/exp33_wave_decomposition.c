/*
 * Experiment 33: Wave Decomposition — The Geometry of Breaking
 *
 * The insight: L(x)/√x oscillates because it's a superposition of waves.
 * Each zeta zero at height γ contributes: A_γ × cos(γ ln(x) + φ_γ)
 * The break happens when waves constructively interfere past the bound.
 *
 * Method:
 *   1. Compute L(x)/√x at many points (use exp25's sieve range, ≤2B)
 *   2. DFT in log-space: sample L(x)/√x at uniform log(x) spacing
 *   3. Extract dominant frequencies → these ARE the zeta zero heights γ
 *   4. For each frequency: measure amplitude A and phase φ
 *   5. Reconstruct: L_approx(x) = Σ A_γ cos(γ ln(x) + φ_γ)
 *   6. The reconstruction should predict the break at 906M
 *   7. Extrapolate: when does the next constructive interference happen?
 *
 * Same for M(x)/√x (Mertens) and π(x)-li(x)/√x (Skewes).
 *
 * The Rod Conjecture: every sequence has such waves, and every
 * boundary eventually gets breached by constructive interference.
 * The geometry of the waves determines WHEN.
 *
 * Key known zeta zero heights for verification:
 *   γ₁ = 14.1347, γ₂ = 21.0220, γ₃ = 25.0109
 *   γ₄ = 30.4249, γ₅ = 32.9351, γ₆ = 37.5862
 *
 * If our DFT recovers these frequencies from the arithmetic data alone,
 * we've confirmed the wave decomposition works without using zeta directly.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define SIEVE_LIMIT 1000000000LL  /* 1B — enough for Pólya break */
#define SIEVE_BYTES ((SIEVE_LIMIT / 8) + 1)

static unsigned char *sieve_bits;
static inline void set_composite(long long n) { sieve_bits[n>>3] |= (1<<(n&7)); }
static inline int is_composite(long long n) { return (sieve_bits[n>>3]>>(n&7))&1; }

/* ═══════════════════════════════════════════════ */
/* PHASE 1: Compute L(x)/√x, M(x)/√x, π(x)-li(x)*/
/* at uniformly spaced points in log(x)            */
/* ═══════════════════════════════════════════════ */

/* logarithmic integral li(x) approximation */
static double li(double x) {
    if (x <= 2.0) return 0;
    double sum = 0, dt = 0.01;
    for (double t = 2.0; t < x && t < 1e8; t *= (1.0 + dt)) {
        double mid = t * (1.0 + dt * 0.5);
        sum += (t * dt) / log(mid);
    }
    /* for large x, use asymptotic: li(x) ≈ x/ln(x) × (1 + 1/ln(x) + 2/ln²(x)) */
    if (x >= 1e8) {
        double lnx = log(x);
        sum = x / lnx * (1.0 + 1.0/lnx + 2.0/(lnx*lnx));
    }
    return sum;
}

/* ═══════════════════════════════════════════════ */
/* DFT on non-uniform data → extract frequencies   */
/* Lomb-Scargle-like: test specific frequencies     */
/* against the data to find resonances              */
/* ═══════════════════════════════════════════════ */

typedef struct {
    double frequency;  /* γ in the zeta zero sense */
    double amplitude;
    double phase;
    double power;      /* |amplitude|² */
} WaveComponent;

/* compute power at a specific frequency for data sampled at log-spaced points */
static WaveComponent test_frequency(const double *values, const double *log_x,
                                     int n, double gamma) {
    WaveComponent w = {0};
    w.frequency = gamma;

    /* Fourier coefficient at frequency gamma:
       a = (2/N) Σ f(x_i) cos(γ ln(x_i))
       b = (2/N) Σ f(x_i) sin(γ ln(x_i))  */
    double a = 0, b = 0;
    for (int i = 0; i < n; i++) {
        double phase = gamma * log_x[i];
        a += values[i] * cos(phase);
        b += values[i] * sin(phase);
    }
    a *= 2.0 / n;
    b *= 2.0 / n;

    w.amplitude = sqrt(a * a + b * b);
    w.phase = atan2(b, a);
    w.power = a * a + b * b;

    return w;
}

/* scan a range of frequencies and find peaks */
#define MAX_PEAKS 50

static int find_peaks(const double *values, const double *log_x, int n,
                       double gamma_min, double gamma_max, double step,
                       WaveComponent *peaks, int max_peaks) {
    int n_peaks = 0;
    double prev_power = 0, pprev_power = 0;

    for (double gamma = gamma_min; gamma <= gamma_max; gamma += step) {
        WaveComponent w = test_frequency(values, log_x, n, gamma);

        /* detect local maximum: power was rising, now falling */
        if (pprev_power < prev_power && prev_power > w.power && prev_power > 0.0001) {
            if (n_peaks < max_peaks) {
                /* refine: test nearby frequencies at finer resolution */
                double best_gamma = gamma - step;
                double best_power = prev_power;
                for (double g2 = gamma - 2*step; g2 <= gamma; g2 += step/20) {
                    WaveComponent w2 = test_frequency(values, log_x, n, g2);
                    if (w2.power > best_power) {
                        best_power = w2.power;
                        best_gamma = g2;
                    }
                }
                peaks[n_peaks] = test_frequency(values, log_x, n, best_gamma);
                n_peaks++;
            }
        }
        pprev_power = prev_power;
        prev_power = w.power;
    }
    return n_peaks;
}

/* sort peaks by power descending */
static void sort_peaks(WaveComponent *peaks, int n) {
    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
            if (peaks[j].power > peaks[i].power) {
                WaveComponent tmp = peaks[i]; peaks[i] = peaks[j]; peaks[j] = tmp;
            }
}

/* ═══════════════════════════════════════════════ */
/* RECONSTRUCTION: sum of waves → predict breach   */
/* ═══════════════════════════════════════════════ */

static double reconstruct(const WaveComponent *waves, int nw, double log_x) {
    double sum = 0;
    for (int i = 0; i < nw; i++)
        sum += waves[i].amplitude * cos(waves[i].frequency * log_x + waves[i].phase);
    return sum;
}

/* find next breach: where does reconstruction exceed a threshold? */
static double find_breach(const WaveComponent *waves, int nw,
                           double threshold, double log_x_start,
                           double log_x_end, double step) {
    for (double lx = log_x_start; lx <= log_x_end; lx += step) {
        double val = reconstruct(waves, nw, lx);
        if (val > threshold) return lx;
    }
    return -1;  /* no breach found in range */
}

/* known zeta zero heights for verification */
static double known_zeros[] = {
    14.1347, 21.0220, 25.0109, 30.4249, 32.9351,
    37.5862, 40.9187, 43.3271, 48.0052, 49.7738,
    52.9703, 56.4462, 59.3470, 60.8318, 65.1125,
    67.0798, 69.5464, 72.0672, 75.7047, 77.1448
};
static int n_known_zeros = 20;

int main(void) {
    printf("=== Experiment 33: Wave Decomposition — The Geometry of Breaking ===\n\n");
    printf("Every arithmetic oscillation is a superposition of waves.\n");
    printf("Each wave comes from a zeta zero. The breach is constructive interference.\n");
    printf("Decompose → identify → predict.\n\n");

    time_t total_start = time(NULL);

    /* ──────────────────────────────────────────── */
    /* Phase 1: Sieve and compute arithmetic funcs  */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: COMPUTE L(x)/√x, M(x)/√x, (π(x)-li(x))/√x\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    sieve_bits = calloc(SIEVE_BYTES, 1);
    if (!sieve_bits) { printf("FATAL: sieve alloc failed\n"); return 1; }
    set_composite(0); set_composite(1);
    for (long long i = 2; i * i <= SIEVE_LIMIT; i++)
        if (!is_composite(i))
            for (long long j = i * i; j <= SIEVE_LIMIT; j += i)
                set_composite(j);
    printf("Sieve to %lld complete.\n", SIEVE_LIMIT);

    /* sample at N_SAMPLES uniformly-spaced points in log(x) */
    #define N_SAMPLES 4096
    double *L_scaled = malloc(N_SAMPLES * sizeof(double));
    double *M_scaled = malloc(N_SAMPLES * sizeof(double));
    double *pi_resid = malloc(N_SAMPLES * sizeof(double));
    double *log_x = malloc(N_SAMPLES * sizeof(double));

    /* log-space from log(1000) to log(SIEVE_LIMIT) */
    double log_min = log(1000.0);
    double log_max = log((double)SIEVE_LIMIT);
    double log_step = (log_max - log_min) / (N_SAMPLES - 1);

    printf("Sampling %d points from x=1000 to x=%lld (uniform in log x)...\n\n", N_SAMPLES, SIEVE_LIMIT);

    /* stream through integers, accumulate L, M, π */
    double L_sum = 0, M_sum = 0;
    long long pi_count = 0;
    int sample_idx = 0;
    double next_log = log_min;

    time_t last_report = time(NULL);

    for (long long n = 1; n <= SIEVE_LIMIT && sample_idx < N_SAMPLES; n++) {
        /* Liouville */
        {
            int omega = 0; long long t = n;
            for (long long p = 2; p*p <= t; p++) while (t%p==0) { omega++; t/=p; }
            if (t > 1) omega++;
            L_sum += (omega % 2 == 0) ? 1.0 : -1.0;
        }

        /* Möbius */
        {
            int factors = 0, sqfree = 1; long long t = n;
            for (long long p = 2; p*p <= t; p++) {
                if (t%p==0) { t/=p; factors++; if (t%p==0) { sqfree=0; break; } }
            }
            if (t > 1) factors++;
            M_sum += sqfree ? ((factors%2==0) ? 1.0 : -1.0) : 0.0;
        }

        /* prime count */
        if (!is_composite(n)) pi_count++;

        /* sample at this point? */
        double ln_n = log((double)n);
        if (ln_n >= next_log && sample_idx < N_SAMPLES) {
            double sqrtn = sqrt((double)n);
            log_x[sample_idx] = ln_n;
            L_scaled[sample_idx] = L_sum / sqrtn;
            M_scaled[sample_idx] = M_sum / sqrtn;
            pi_resid[sample_idx] = ((double)pi_count - li((double)n)) / sqrtn;
            sample_idx++;
            next_log = log_min + sample_idx * log_step;
        }

        time_t now = time(NULL);
        if (difftime(now, last_report) > 30) {
            printf("  [%.1f%% — n=%lld — %d/%d samples — %.0fs]\n",
                   100.0*n/SIEVE_LIMIT, n, sample_idx, N_SAMPLES,
                   difftime(now, total_start));
            fflush(stdout);
            last_report = now;
        }
    }

    printf("\n%d samples collected in %.0f seconds.\n\n", sample_idx, difftime(time(NULL), total_start));

    /* ──────────────────────────────────────────── */
    /* Phase 2: Frequency scan — find the waves     */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: FREQUENCY SCAN — FIND THE WAVES\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("Scanning γ = 1.0 to 100.0 in L(x)/√x, M(x)/√x, (π(x)-li(x))/√x...\n\n");

    /* === LIOUVILLE L(x)/√x === */
    WaveComponent L_peaks[MAX_PEAKS];
    int L_npeaks = find_peaks(L_scaled, log_x, sample_idx, 1.0, 100.0, 0.1, L_peaks, MAX_PEAKS);
    sort_peaks(L_peaks, L_npeaks);

    printf("  LIOUVILLE L(x)/√x — top 15 frequencies:\n\n");
    printf("  Rank │ γ (freq)  │ Amplitude │ Phase    │ Nearest known zero │ Match?\n");
    printf("  ─────┼───────────┼───────────┼──────────┼────────────────────┼───────\n");

    for (int i = 0; i < 15 && i < L_npeaks; i++) {
        /* find nearest known zero */
        double nearest = 0; double min_dist = 999;
        for (int z = 0; z < n_known_zeros; z++) {
            double d = fabs(L_peaks[i].frequency - known_zeros[z]);
            if (d < min_dist) { min_dist = d; nearest = known_zeros[z]; }
        }
        printf("  %4d │ %9.3f │ %9.4f │ %+7.3f  │      γ = %7.3f    │ %s\n",
               i + 1, L_peaks[i].frequency, L_peaks[i].amplitude,
               L_peaks[i].phase, nearest,
               min_dist < 1.0 ? "*** YES" : min_dist < 2.0 ? "* close" : "no");
    }

    /* === MERTENS M(x)/√x === */
    WaveComponent M_peaks[MAX_PEAKS];
    int M_npeaks = find_peaks(M_scaled, log_x, sample_idx, 1.0, 100.0, 0.1, M_peaks, MAX_PEAKS);
    sort_peaks(M_peaks, M_npeaks);

    printf("\n  MERTENS M(x)/√x — top 15 frequencies:\n\n");
    printf("  Rank │ γ (freq)  │ Amplitude │ Phase    │ Nearest known zero │ Match?\n");
    printf("  ─────┼───────────┼───────────┼──────────┼────────────────────┼───────\n");

    for (int i = 0; i < 15 && i < M_npeaks; i++) {
        double nearest = 0; double min_dist = 999;
        for (int z = 0; z < n_known_zeros; z++) {
            double d = fabs(M_peaks[i].frequency - known_zeros[z]);
            if (d < min_dist) { min_dist = d; nearest = known_zeros[z]; }
        }
        printf("  %4d │ %9.3f │ %9.4f │ %+7.3f  │      γ = %7.3f    │ %s\n",
               i + 1, M_peaks[i].frequency, M_peaks[i].amplitude,
               M_peaks[i].phase, nearest,
               min_dist < 1.0 ? "*** YES" : min_dist < 2.0 ? "* close" : "no");
    }

    /* === PRIME COUNTING π(x)-li(x) === */
    WaveComponent P_peaks[MAX_PEAKS];
    int P_npeaks = find_peaks(pi_resid, log_x, sample_idx, 1.0, 100.0, 0.1, P_peaks, MAX_PEAKS);
    sort_peaks(P_peaks, P_npeaks);

    printf("\n  PRIME COUNTING (π(x)-li(x))/√x — top 15 frequencies:\n\n");
    printf("  Rank │ γ (freq)  │ Amplitude │ Phase    │ Nearest known zero │ Match?\n");
    printf("  ─────┼───────────┼───────────┼──────────┼────────────────────┼───────\n");

    for (int i = 0; i < 15 && i < P_npeaks; i++) {
        double nearest = 0; double min_dist = 999;
        for (int z = 0; z < n_known_zeros; z++) {
            double d = fabs(P_peaks[i].frequency - known_zeros[z]);
            if (d < min_dist) { min_dist = d; nearest = known_zeros[z]; }
        }
        printf("  %4d │ %9.3f │ %9.4f │ %+7.3f  │      γ = %7.3f    │ %s\n",
               i + 1, P_peaks[i].frequency, P_peaks[i].amplitude,
               P_peaks[i].phase, nearest,
               min_dist < 1.0 ? "*** YES" : min_dist < 2.0 ? "* close" : "no");
    }

    /* ──────────────────────────────────────────── */
    /* Phase 3: RECONSTRUCTION — predict the breach */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 3: RECONSTRUCTION — CAN WE PREDICT THE PÓLYA BREAK?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* use top N waves to reconstruct L(x)/√x */
    int use_waves[] = {3, 5, 10, 15, 20};
    int n_use = 5;

    printf("  Pólya break: L(x) > 0 at x = 906,150,257 (ln(x) = %.4f)\n\n", log(906150257.0));

    printf("  Waves used │ Predicted breach (ln x) │ Predicted x        │ Actual x      │ Error\n");
    printf("  ───────────┼─────────────────────────┼────────────────────┼───────────────┼──────\n");

    double actual_log = log(906150257.0);

    for (int u = 0; u < n_use; u++) {
        int nw = use_waves[u];
        if (nw > L_npeaks) nw = L_npeaks;

        /* add the DC offset (mean of L_scaled) */
        double dc = 0;
        for (int i = 0; i < sample_idx; i++) dc += L_scaled[i];
        dc /= sample_idx;

        /* find where reconstruction + DC crosses zero from negative */
        double breach_log = -1;
        double prev_val = -999;
        for (double lx = log(1e6); lx <= log(2e9); lx += 0.001) {
            double val = dc + reconstruct(L_peaks, nw, lx);
            if (prev_val < 0 && val >= 0) {
                breach_log = lx;
                break;
            }
            prev_val = val;
        }

        if (breach_log > 0) {
            double predicted_x = exp(breach_log);
            double error_pct = 100.0 * fabs(breach_log - actual_log) / actual_log;
            printf("  %10d │         %15.4f │ %18.0f │ 906,150,257   │ %.1f%%\n",
                   nw, breach_log, predicted_x, error_pct);
        } else {
            printf("  %10d │         (no breach)     │                    │ 906,150,257   │ —\n", nw);
        }
    }

    /* ──────────────────────────────────────────── */
    /* Phase 4: EXTRAPOLATION — next breaches       */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 4: EXTRAPOLATION — WHEN DOES EACH FUNCTION BREACH NEXT?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    int nw_extrap = 15;  /* use top 15 waves */
    if (nw_extrap > L_npeaks) nw_extrap = L_npeaks;

    /* Liouville: find next time L(x)/√x > 0 beyond our data range */
    printf("  Using top %d waves for extrapolation beyond 10^9...\n\n", nw_extrap);

    /* DC offsets */
    double L_dc = 0, M_dc = 0, P_dc = 0;
    for (int i = 0; i < sample_idx; i++) {
        L_dc += L_scaled[i]; M_dc += M_scaled[i]; P_dc += pi_resid[i];
    }
    L_dc /= sample_idx; M_dc /= sample_idx; P_dc /= sample_idx;

    printf("  Function      │ DC offset │ Current state         │ Next predicted breach\n");
    printf("  ──────────────┼───────────┼───────────────────────┼─────────────────────\n");

    /* L(x): next positive crossing */
    {
        double breach = find_breach(L_peaks, nw_extrap > L_npeaks ? L_npeaks : nw_extrap,
                                     -L_dc, log(1e9), log(1e20), 0.01);
        if (breach > 0)
            printf("  L(x)/√x > 0  │ %+7.4f   │ Oscillating negative  │ x ≈ 10^%.0f\n",
                   L_dc, breach / log(10));
        else
            printf("  L(x)/√x > 0  │ %+7.4f   │ Oscillating negative  │ not in range\n", L_dc);
    }

    /* M(x): next |M/√x| > 1 (Mertens bound) */
    {
        int mw = M_npeaks > nw_extrap ? nw_extrap : M_npeaks;
        double breach = -1;
        for (double lx = log(1e9); lx <= log(1e50); lx += 0.01) {
            double val = M_dc + reconstruct(M_peaks, mw, lx);
            if (fabs(val) > 1.0) { breach = lx; break; }
        }
        if (breach > 0)
            printf("  |M/√x| > 1   │ %+7.4f   │ Bounded < 1           │ x ≈ 10^%.0f\n",
                   M_dc, breach / log(10));
        else
            printf("  |M/√x| > 1   │ %+7.4f   │ Bounded < 1           │ beyond 10^21\n", M_dc);
    }

    /* π(x)-li(x): next sign change (Skewes) */
    {
        int pw = P_npeaks > nw_extrap ? nw_extrap : P_npeaks;
        double breach = find_breach(P_peaks, pw, -P_dc, log(1e9), log(1e50), 0.01);
        if (breach > 0)
            printf("  π(x) > li(x) │ %+7.4f   │ Below li(x)           │ x ≈ 10^%.0f\n",
                   P_dc, breach / log(10));
        else
            printf("  π(x) > li(x) │ %+7.4f   │ Below li(x)           │ beyond 10^21\n", P_dc);
    }

    /* ──────────────────────────────────────────── */
    /* Phase 5: WAVE GEOMETRY — interference pattern */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 5: WAVE GEOMETRY — THE PATTERN OF INTERFERENCE\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  The top 5 waves in L(x)/√x and their interference:\n\n");

    int top_n = 5;
    if (top_n > L_npeaks) top_n = L_npeaks;

    printf("  Wave │ γ         │ Period (in ln x) │ Amplitude │ Phase\n");
    printf("  ─────┼───────────┼──────────────────┼───────────┼──────\n");

    for (int i = 0; i < top_n; i++) {
        double period = 2.0 * M_PI / L_peaks[i].frequency;
        printf("  %4d │ %9.3f │     %12.4f │ %9.4f │ %+.3f\n",
               i + 1, L_peaks[i].frequency, period,
               L_peaks[i].amplitude, L_peaks[i].phase);
    }

    /* when do all top waves have crests aligned (constructive interference)? */
    printf("\n  Constructive interference search:\n");
    printf("  Looking for points where all top %d waves have cos > 0.5...\n\n", top_n);

    printf("  ln(x)    │ x ≈           │ Wave alignment (cos values)      │ Sum\n");
    printf("  ─────────┼───────────────┼──────────────────────────────────┼─────\n");

    int found = 0;
    for (double lx = log(1e6); lx <= log(1e15) && found < 20; lx += 0.01) {
        int all_positive = 1;
        double sum = L_dc;
        double min_cos = 1.0;

        for (int i = 0; i < top_n; i++) {
            double c = cos(L_peaks[i].frequency * lx + L_peaks[i].phase);
            sum += L_peaks[i].amplitude * c;
            if (c < 0.3) all_positive = 0;
            if (c < min_cos) min_cos = c;
        }

        if (all_positive && sum > -0.1) {
            printf("  %8.3f  │ 10^%5.1f       │ min_cos = %+.3f                  │ %+.3f %s\n",
                   lx, lx / log(10), min_cos, sum,
                   sum > 0 ? "*** BREACH" : "");
            found++;
        }
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY                                      */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: THE GEOMETRY OF BREAKING\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* count how many peaks matched known zeros */
    int L_matches = 0, M_matches = 0, P_matches = 0;
    for (int i = 0; i < 15 && i < L_npeaks; i++) {
        for (int z = 0; z < n_known_zeros; z++)
            if (fabs(L_peaks[i].frequency - known_zeros[z]) < 1.0) { L_matches++; break; }
    }
    for (int i = 0; i < 15 && i < M_npeaks; i++) {
        for (int z = 0; z < n_known_zeros; z++)
            if (fabs(M_peaks[i].frequency - known_zeros[z]) < 1.0) { M_matches++; break; }
    }
    for (int i = 0; i < 15 && i < P_npeaks; i++) {
        for (int z = 0; z < n_known_zeros; z++)
            if (fabs(P_peaks[i].frequency - known_zeros[z]) < 1.0) { P_matches++; break; }
    }

    printf("  Frequency recovery (top 15 peaks vs 20 known zeta zeros):\n");
    printf("    L(x)/√x:           %d/15 matched known zeros\n", L_matches);
    printf("    M(x)/√x:           %d/15 matched known zeros\n", M_matches);
    printf("    (π(x)-li(x))/√x:  %d/15 matched known zeros\n\n", P_matches);

    if (L_matches >= 5 || M_matches >= 5 || P_matches >= 5) {
        printf("  *** ZETA ZEROS RECOVERED FROM ARITHMETIC DATA ALONE ***\n");
        printf("  The waves are real. They come from the zeros.\n");
        printf("  The geometry of their interference determines breaking.\n\n");
    }

    printf("  The Rod Conjecture in wave language:\n");
    printf("    Every arithmetic function is a superposition of zeta-zero waves.\n");
    printf("    Every boundary is a finite threshold.\n");
    printf("    Waves are quasi-periodic — they eventually align.\n");
    printf("    Therefore every boundary eventually breaks.\n");
    printf("    The geometry of the wave frequencies determines WHEN.\n\n");

    printf("  Time: %.0f seconds.\n", difftime(time(NULL), total_start));

    free(sieve_bits); free(L_scaled); free(M_scaled); free(pi_resid); free(log_x);
    return 0;
}
