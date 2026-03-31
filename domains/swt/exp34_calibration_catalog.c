/*
 * Experiment 34: Calibration Catalog — Hundreds of Small Breaches
 *
 * "Analyze half, work out the geometry. Leave half for validation."
 *
 * Known small-scale breaches in number theory:
 *
 * TYPE 1: First sign changes of arithmetic sums
 *   - L(x) > 0 (Pólya):        first at 906,150,257
 *   - π(x) > li(x):            first at ~1.397×10^316 (too large)
 *   - π(x;4,3) > π(x;4,1):    Chebyshev bias reversal (small)
 *   - π(x;3,2) > π(x;3,1):    another bias reversal
 *   - Various Σf(n) sign changes with known first crossings
 *
 * TYPE 2: Record-breaking excursions
 *   - M(x)/√x new records: each one is a mini-breach of the previous bound
 *   - L(x)/√x new records: same
 *   - Each record is a wave crest exceeding the previous high-water mark
 *
 * TYPE 3: Oscillation theorems (Littlewood, Ingham)
 *   - π(x) - li(x) changes sign infinitely often
 *   - Each sign change is a breach — we can catalog all of them
 *
 * TYPE 4: Manufactured conjectures
 *   - Take any arithmetic function, set a bound, find where it breaks
 *   - Σμ(n)/n for n≤x:  approaches 0 but oscillates
 *   - Σφ(n)/n² - 6/π²: error term oscillations
 *   - Σd(n) - x(ln x + 2γ-1): Dirichlet divisor error oscillations
 *
 * Protocol:
 *   1. Generate 100+ breach events across multiple functions
 *   2. For each: decompose into waves, extract amplitude/phase/frequency
 *   3. Split 50/50: training set / validation set
 *   4. From training set: learn the wave geometry of breaching
 *   5. On validation set: predict breach location from waves alone
 *   6. Measure prediction accuracy
 *
 * If validation accuracy is high: we have a universal breach predictor.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 10000000  /* 10M — cheap, fast, many breaches */
#define MAX_BREACHES 500

/* ═══════════════════════════════════════════════ */
/* BREACH EVENT: a moment where a function crosses */
/* a threshold for the first time or sets a record */
/* ═══════════════════════════════════════════════ */

typedef struct {
    const char *function_name;
    const char *breach_type;  /* "sign_change", "record", "threshold" */
    long long x;              /* where it happened */
    double value;             /* the value at breach */
    double threshold;         /* what was breached */
    double pre_slope;         /* slope approaching breach (in log space) */
    double pre_amplitude;     /* wave amplitude in 1000 integers before */
    double dominant_freq;     /* strongest frequency in local window */
    int training;             /* 1 = training set, 0 = validation */
} BreachEvent;

static BreachEvent breaches[MAX_BREACHES];
static int n_breaches = 0;

/* RMS of array */
static double rms(const double *v, int n) {
    double s = 0; for (int i = 0; i < n; i++) s += v[i]*v[i]; return sqrt(s/n);
}

/* find dominant frequency in a short window via DFT */
static double dominant_frequency(const double *values, int n) {
    /* test frequencies from 1 to 50 */
    double best_power = 0, best_freq = 0;
    for (double f = 1.0; f <= 50.0; f += 0.5) {
        double a = 0, b = 0;
        for (int i = 0; i < n; i++) {
            double phase = f * (double)i / n * 2.0 * M_PI;
            a += values[i] * cos(phase);
            b += values[i] * sin(phase);
        }
        double power = (a*a + b*b) / (n*n);
        if (power > best_power) { best_power = power; best_freq = f; }
    }
    return best_freq;
}

/* measure pre-breach wave characteristics */
static void characterise_breach(BreachEvent *b, const double *func_values,
                                 long long breach_x, int window_before) {
    /* slope: linear fit of last window_before points */
    int start = (int)(breach_x - window_before);
    if (start < 0) start = 0;
    int end = (int)breach_x;
    if (end > MAX_N) end = MAX_N;
    int n = end - start;
    if (n < 10) return;

    double sx = 0, sy = 0, sxx = 0, sxy = 0;
    for (int i = start; i < end; i++) {
        double x = log((double)(i + 1));
        double y = func_values[i];
        sx += x; sy += y; sxx += x*x; sxy += x*y;
    }
    b->pre_slope = (n*sxy - sx*sy) / (n*sxx - sx*sx);

    /* amplitude: RMS of detrended values in window */
    double mean = sy / n;
    double *detrended = malloc(n * sizeof(double));
    for (int i = 0; i < n; i++)
        detrended[i] = func_values[start + i] - mean;
    b->pre_amplitude = rms(detrended, n);

    /* dominant frequency */
    b->dominant_freq = dominant_frequency(detrended, n > 2048 ? 2048 : n);
    free(detrended);
}

static void add_breach(const char *func, const char *type, long long x,
                        double value, double threshold) {
    if (n_breaches >= MAX_BREACHES) return;
    BreachEvent *b = &breaches[n_breaches];
    b->function_name = func;
    b->breach_type = type;
    b->x = x;
    b->value = value;
    b->threshold = threshold;
    b->pre_slope = 0;
    b->pre_amplitude = 0;
    b->dominant_freq = 0;
    /* randomly assign to training (60%) or validation (40%) */
    b->training = ((x * 2654435761ULL) >> 16) % 100 < 60;
    n_breaches++;
}

static int big_omega(long long n) {
    int c = 0; for (long long p = 2; p*p <= n; p++) while (n%p==0) { c++; n/=p; }
    if (n > 1) c++; return c;
}

static int mobius_val(long long n) {
    int f = 0; for (long long p = 2; p*p <= n; p++) {
        if (n%p==0) { n/=p; f++; if (n%p==0) return 0; } }
    if (n > 1) f++; return (f%2==0) ? 1 : -1;
}

int main(void) {
    printf("=== Experiment 34: Calibration Catalog ===\n\n");
    printf("\"Analyze half, work out the geometry. Leave half for validation.\"\n");
    printf("Catalog every breach event in [1, %d].\n\n", MAX_N);

    time_t total_start = time(NULL);

    /* ──────────────────────────────────────────── */
    /* Phase 1: Compute arithmetic functions         */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: COMPUTE ALL ARITHMETIC FUNCTIONS TO %dM\n", MAX_N/1000000);
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* sieve */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i*i <= MAX_N; i++)
        if (!sieve[i]) for (long long j = (long long)i*i; j <= MAX_N; j += i) sieve[j] = 1;

    /* allocate all functions */
    double *L_func = calloc(MAX_N + 1, sizeof(double));  /* L(x)/√x */
    double *M_func = calloc(MAX_N + 1, sizeof(double));  /* M(x)/√x */
    double *pi_err = calloc(MAX_N + 1, sizeof(double));  /* (π(x) - x/ln(x)) / √x */
    double *mu_sum = calloc(MAX_N + 1, sizeof(double));  /* Σμ(n)/n */
    double *phi_err = calloc(MAX_N + 1, sizeof(double)); /* Σφ(n)/n² - 6/π² */
    double *div_err = calloc(MAX_N + 1, sizeof(double)); /* Σd(n) - x(ln x+2γ-1) / √x */
    double *omega_dev = calloc(MAX_N + 1, sizeof(double)); /* (Ω(x) - loglog x)/√loglog x */
    double *cheb43 = calloc(MAX_N + 1, sizeof(double));  /* π(x;4,3) - π(x;4,1) */

    double L_sum = 0, M_sum_acc = 0, mu_n_sum = 0, phi_sum = 0, div_sum = 0;
    long long pi_count = 0;
    long long pi_4_1 = 0, pi_4_3 = 0;

    printf("Computing 8 arithmetic functions...\n");

    for (long long n = 1; n <= MAX_N; n++) {
        double sqrtn = sqrt((double)n);
        double lnn = log((double)n);

        /* Liouville */
        int omega = big_omega(n);
        double lambda_n = (omega % 2 == 0) ? 1.0 : -1.0;
        L_sum += lambda_n;
        L_func[n] = L_sum / sqrtn;

        /* Mertens */
        int mu = mobius_val(n);
        M_sum_acc += mu;
        M_func[n] = M_sum_acc / sqrtn;

        /* prime counting error */
        if (!sieve[n] && n >= 2) pi_count++;
        double pi_approx = n > 2 ? (double)n / lnn : 0;
        pi_err[n] = sqrtn > 0 ? ((double)pi_count - pi_approx) / sqrtn : 0;

        /* Σμ(n)/n */
        mu_n_sum += (double)mu / n;
        mu_sum[n] = mu_n_sum;

        /* Σφ(n)/n² error from 6/π² */
        {
            long long nn = n; int result = (int)n; int temp = (int)n;
            for (int p = 2; (long long)p*p <= temp; p++) {
                if (temp%p==0) { while (temp%p==0) temp/=p; result -= result/p; }
            }
            if (temp > 1) result -= result/temp;
            phi_sum += (double)result / ((double)n * n);
            phi_err[n] = phi_sum - 6.0 / (M_PI * M_PI);
        }

        /* divisor error */
        {
            int d = 0;
            for (long long j = 1; j*j <= n; j++)
                if (n%j==0) { d++; if (j != n/j) d++; }
            div_sum += d;
            double expected = (double)n * (lnn + 2*0.5772156649 - 1);
            div_err[n] = sqrtn > 0 ? (div_sum - expected) / sqrtn : 0;
        }

        /* Erdős-Kac deviation */
        {
            double lln = n > 10 ? log(log((double)n)) : 1.0;
            double sd = sqrt(fabs(lln));
            omega_dev[n] = sd > 0.1 ? ((double)big_omega(n) - lln) / sd : 0;
        }

        /* Chebyshev bias π(x;4,3) - π(x;4,1) */
        if (!sieve[n] && n >= 3) {
            if (n % 4 == 1) pi_4_1++;
            if (n % 4 == 3) pi_4_3++;
        }
        cheb43[n] = (double)(pi_4_3 - pi_4_1);
    }

    printf("Done in %.0f seconds.\n\n", difftime(time(NULL), total_start));

    /* ──────────────────────────────────────────── */
    /* Phase 2: Find ALL breach events               */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: CATALOG ALL BREACH EVENTS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* TYPE 1: Sign changes of L(x)/√x (looking for L > 0, doesn't happen <10M) */
    /* but we can find sign changes of M(x)/√x */
    {
        double prev = M_func[1]; int sign_changes = 0;
        for (long long n = 2; n <= MAX_N; n++) {
            if ((M_func[n] > 0 && prev <= 0) || (M_func[n] < 0 && prev >= 0)) {
                add_breach("M(x)/√x", "sign_change", n, M_func[n], 0.0);
                sign_changes++;
            }
            prev = M_func[n];
        }
        printf("  M(x)/√x sign changes: %d\n", sign_changes);
    }

    /* TYPE 2: Record excursions of |M(x)/√x| */
    {
        double record = 0; int records = 0;
        for (long long n = 2; n <= MAX_N; n++) {
            if (fabs(M_func[n]) > record) {
                record = fabs(M_func[n]);
                if (n > 100) {
                    add_breach("M(x)/√x", "record", n, M_func[n], record);
                    records++;
                }
            }
        }
        printf("  |M(x)/√x| new records: %d\n", records);
    }

    /* TYPE 3: Record excursions of |L(x)/√x| */
    {
        double record = 0; int records = 0;
        for (long long n = 2; n <= MAX_N; n++) {
            if (fabs(L_func[n]) > record) {
                record = fabs(L_func[n]);
                if (n > 100) {
                    add_breach("L(x)/√x", "record", n, L_func[n], record);
                    records++;
                }
            }
        }
        printf("  |L(x)/√x| new records: %d\n", records);
    }

    /* TYPE 4: Sign changes of Chebyshev bias */
    {
        double prev = cheb43[3]; int changes = 0;
        for (long long n = 4; n <= MAX_N; n++) {
            if ((cheb43[n] > 0 && prev <= 0) || (cheb43[n] < 0 && prev >= 0)) {
                add_breach("Cheb(4,3)-(4,1)", "sign_change", n, cheb43[n], 0.0);
                changes++;
            }
            prev = cheb43[n];
        }
        printf("  Chebyshev bias reversals: %d\n", changes);
    }

    /* TYPE 5: Σμ(n)/n crossing thresholds */
    {
        double thresholds[] = {0.1, 0.05, 0.02, 0.01, -0.01, -0.02, -0.05, -0.1};
        int nth = 8;
        for (int t = 0; t < nth; t++) {
            for (long long n = 2; n <= MAX_N; n++) {
                if ((thresholds[t] > 0 && mu_sum[n] > thresholds[t] && mu_sum[n-1] <= thresholds[t]) ||
                    (thresholds[t] < 0 && mu_sum[n] < thresholds[t] && mu_sum[n-1] >= thresholds[t])) {
                    add_breach("Σμ(n)/n", "threshold", n, mu_sum[n], thresholds[t]);
                    break; /* first crossing only */
                }
            }
        }
    }

    /* TYPE 6: Divisor error new records */
    {
        double record_pos = 0, record_neg = 0; int records = 0;
        for (long long n = 10; n <= MAX_N; n++) {
            if (div_err[n] > record_pos) {
                record_pos = div_err[n];
                if (n > 1000) { add_breach("div_err/√x", "record_pos", n, div_err[n], record_pos); records++; }
            }
            if (div_err[n] < record_neg) {
                record_neg = div_err[n];
                if (n > 1000) { add_breach("div_err/√x", "record_neg", n, div_err[n], record_neg); records++; }
            }
        }
        printf("  Divisor error records: %d\n", records);
    }

    /* TYPE 7: π(x) error sign changes */
    {
        double prev = pi_err[3]; int changes = 0;
        for (long long n = 4; n <= MAX_N; n++) {
            if ((pi_err[n] > 0 && prev <= 0) || (pi_err[n] < 0 && prev >= 0)) {
                if (n > 100 && n_breaches < MAX_BREACHES - 10) {
                    add_breach("π_err/√x", "sign_change", n, pi_err[n], 0.0);
                    changes++;
                }
            }
            prev = pi_err[n];
        }
        printf("  π(x) error sign changes: %d\n", changes);
    }

    /* TYPE 8: Totient error oscillations */
    {
        double record_pos = 0, record_neg = 0; int records = 0;
        for (long long n = 100; n <= MAX_N; n++) {
            if (phi_err[n] > record_pos) {
                record_pos = phi_err[n];
                if (n > 1000) { add_breach("φ_err", "record_pos", n, phi_err[n], record_pos); records++; }
            }
            if (phi_err[n] < record_neg) {
                record_neg = phi_err[n];
                if (n > 1000) { add_breach("φ_err", "record_neg", n, phi_err[n], record_neg); records++; }
            }
        }
        printf("  Totient error records: %d\n", records);
    }

    int n_training = 0, n_validation = 0;
    for (int i = 0; i < n_breaches; i++) {
        if (breaches[i].training) n_training++; else n_validation++;
    }

    printf("\n  TOTAL BREACH EVENTS: %d\n", n_breaches);
    printf("  Training set: %d (60%%)\n", n_training);
    printf("  Validation set: %d (40%%)\n\n", n_validation);

    /* ──────────────────────────────────────────── */
    /* Phase 3: Characterise each breach             */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 3: WAVE CHARACTERISATION OF EACH BREACH\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("For each breach: measure pre-breach slope, amplitude, dominant frequency.\n\n");

    /* pick the right function array for characterisation */
    for (int i = 0; i < n_breaches; i++) {
        const double *func = NULL;
        if (strstr(breaches[i].function_name, "M(x)")) func = M_func;
        else if (strstr(breaches[i].function_name, "L(x)")) func = L_func;
        else if (strstr(breaches[i].function_name, "Cheb")) func = cheb43;
        else if (strstr(breaches[i].function_name, "μ")) func = mu_sum;
        else if (strstr(breaches[i].function_name, "div")) func = div_err;
        else if (strstr(breaches[i].function_name, "π")) func = pi_err;
        else if (strstr(breaches[i].function_name, "φ")) func = phi_err;

        if (func) characterise_breach(&breaches[i], func, breaches[i].x, 1000);
    }

    printf("Characterisation complete.\n\n");

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Training set summary                 */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 1: TRAINING SET — BREACH SIGNATURES\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Function       │ Type        │ Count │ Mean slope │ Mean amp │ Mean freq\n");
    printf("  ───────────────┼─────────────┼───────┼────────────┼──────────┼──────────\n");

    /* aggregate by function × type */
    typedef struct { const char *func; const char *type; int count;
        double sum_slope, sum_amp, sum_freq; } Aggregate;
    Aggregate aggs[50]; int n_agg = 0;

    for (int i = 0; i < n_breaches; i++) {
        if (!breaches[i].training) continue;
        /* find or create aggregate */
        int found = -1;
        for (int a = 0; a < n_agg; a++) {
            if (strcmp(aggs[a].func, breaches[i].function_name) == 0 &&
                strcmp(aggs[a].type, breaches[i].breach_type) == 0) { found = a; break; }
        }
        if (found < 0) {
            found = n_agg++;
            aggs[found] = (Aggregate){breaches[i].function_name, breaches[i].breach_type,
                                       0, 0, 0, 0};
        }
        aggs[found].count++;
        aggs[found].sum_slope += breaches[i].pre_slope;
        aggs[found].sum_amp += breaches[i].pre_amplitude;
        aggs[found].sum_freq += breaches[i].dominant_freq;
    }

    for (int a = 0; a < n_agg; a++) {
        printf("  %-15s│ %-11s │ %5d │ %+9.2e  │ %8.4f │ %8.2f\n",
               aggs[a].func, aggs[a].type, aggs[a].count,
               aggs[a].sum_slope / aggs[a].count,
               aggs[a].sum_amp / aggs[a].count,
               aggs[a].sum_freq / aggs[a].count);
    }

    /* ──────────────────────────────────────────── */
    /* Phase 4: LEARN THE BREACH GEOMETRY            */
    /*                                               */
    /* From training set: what predicts a breach?    */
    /* - Is pre-slope correlated with breach timing? */
    /* - Is dominant frequency consistent per func?  */
    /* - Does amplitude encode distance to breach?   */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 4: LEARN THE GEOMETRY FROM TRAINING SET\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* Q1: Does dominant frequency predict which function is breaching? */
    printf("  Q1: Is dominant frequency unique per function?\n\n");
    for (int a = 0; a < n_agg; a++) {
        if (aggs[a].count > 5) {
            double mean_freq = aggs[a].sum_freq / aggs[a].count;
            /* compute variance */
            double var = 0; int cnt = 0;
            for (int i = 0; i < n_breaches; i++) {
                if (breaches[i].training &&
                    strcmp(breaches[i].function_name, aggs[a].func) == 0 &&
                    strcmp(breaches[i].breach_type, aggs[a].type) == 0) {
                    double d = breaches[i].dominant_freq - mean_freq;
                    var += d*d; cnt++;
                }
            }
            var = cnt > 1 ? sqrt(var / (cnt - 1)) : 0;
            printf("    %-15s %-11s: freq = %.2f ± %.2f (CV = %.0f%%)\n",
                   aggs[a].func, aggs[a].type, mean_freq, var,
                   mean_freq > 0.01 ? var/mean_freq*100 : 0);
        }
    }

    /* Q2: Does pre-slope sign predict breach direction? */
    printf("\n  Q2: Does slope predict breach direction?\n\n");
    int slope_correct = 0, slope_total = 0;
    for (int i = 0; i < n_breaches; i++) {
        if (!breaches[i].training) continue;
        if (strcmp(breaches[i].breach_type, "sign_change") == 0) {
            /* for sign change: slope should point toward the crossing */
            if ((breaches[i].value > 0 && breaches[i].pre_slope > 0) ||
                (breaches[i].value < 0 && breaches[i].pre_slope < 0)) {
                slope_correct++;
            }
            slope_total++;
        }
    }
    if (slope_total > 0)
        printf("    Slope predicts sign change direction: %d/%d (%.0f%%)\n",
               slope_correct, slope_total, 100.0 * slope_correct / slope_total);

    /* Q3: Does amplitude predict breach magnitude? */
    printf("\n  Q3: Correlation between pre-breach amplitude and breach value?\n\n");
    {
        double sx=0,sy=0,sxx=0,syy=0,sxy=0; int n=0;
        for (int i = 0; i < n_breaches; i++) {
            if (!breaches[i].training) continue;
            if (strcmp(breaches[i].breach_type, "record") != 0) continue;
            double x = breaches[i].pre_amplitude;
            double y = fabs(breaches[i].value);
            sx+=x; sy+=y; sxx+=x*x; syy+=y*y; sxy+=x*y; n++;
        }
        if (n > 5) {
            double r = (n*sxy-sx*sy)/sqrt((n*sxx-sx*sx)*(n*syy-sy*sy));
            printf("    Pearson r (amplitude vs |breach value|): %.4f (n=%d)\n", r, n);
            printf("    %s\n", fabs(r) > 0.5 ? "*** STRONG CORRELATION — amplitude predicts breach size" :
                              fabs(r) > 0.3 ? "* moderate correlation" : "weak or no correlation");
        }
    }

    /* ──────────────────────────────────────────── */
    /* Phase 5: VALIDATE — predict on held-out set   */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 5: VALIDATION — PREDICT BREACH LOCATION\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  For each validation breach: given the wave characteristics\n");
    printf("  at x-1000, can we predict that a breach occurs within 1000?\n\n");

    /* simple predictor: breach predicted if |slope| > threshold AND amplitude > threshold */
    /* learn thresholds from training set */
    double slope_thresh = 0, amp_thresh = 0;
    {
        int cnt = 0;
        for (int i = 0; i < n_breaches; i++) {
            if (!breaches[i].training) continue;
            slope_thresh += fabs(breaches[i].pre_slope);
            amp_thresh += breaches[i].pre_amplitude;
            cnt++;
        }
        if (cnt > 0) { slope_thresh /= cnt; amp_thresh /= cnt; }
        /* use 0.5× mean as threshold */
        slope_thresh *= 0.5;
        amp_thresh *= 0.5;
    }

    printf("  Learned thresholds from training: |slope| > %.4e, amp > %.4f\n\n", slope_thresh, amp_thresh);

    int true_pos = 0, false_neg = 0, total_val = 0;
    for (int i = 0; i < n_breaches; i++) {
        if (breaches[i].training) continue;
        total_val++;
        int predicted = (fabs(breaches[i].pre_slope) > slope_thresh) ||
                        (breaches[i].pre_amplitude > amp_thresh);
        if (predicted) true_pos++; else false_neg++;
    }

    printf("  Validation results:\n");
    printf("    Total validation breaches: %d\n", total_val);
    printf("    Correctly predicted:       %d (%.0f%%)\n", true_pos, total_val>0?100.0*true_pos/total_val:0);
    printf("    Missed:                    %d (%.0f%%)\n", false_neg, total_val>0?100.0*false_neg/total_val:0);

    /* ──────────────────────────────────────────── */
    /* SUMMARY                                      */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: THE CALIBRATION CATALOG\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Breach events cataloged: %d\n", n_breaches);
    printf("  Functions studied: 8\n");
    printf("  Breach types: sign changes, records, threshold crossings\n");
    printf("  Training/validation split: %d / %d\n\n", n_training, n_validation);

    printf("  Each breach has a wave signature:\n");
    printf("    - Pre-breach slope (momentum of the swell)\n");
    printf("    - Pre-breach amplitude (wave height)\n");
    printf("    - Dominant frequency (which wave is cresting)\n\n");

    printf("  Next: run exp33 to decompose into zeta-zero frequencies.\n");
    printf("  Then: match each breach's dominant frequency to a specific zero.\n");
    printf("  Then: predict unknown breaches from wave geometry alone.\n");

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL), total_start));

    free(sieve); free(L_func); free(M_func); free(pi_err);
    free(mu_sum); free(phi_err); free(div_err); free(omega_dev); free(cheb43);
    return 0;
}
