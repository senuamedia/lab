/*
 * Experiment 35: Universal Catalog — Every Conjecture, Every Wave
 *
 * 50+ arithmetic functions. Every breach event cataloged.
 * Wave decomposition per function. Train/validate split.
 *
 * Functions organized by L-function family:
 *
 * FAMILY 1: Riemann zeta ζ(s) — same zeros drive all
 *   1.  L(x) = Σλ(n)           Liouville sum
 *   2.  M(x) = Σμ(n)           Mertens sum
 *   3.  π(x) - li(x)           prime counting error
 *   4.  Σμ(n)/n                 reciprocal Mertens
 *   5.  Σμ(n)log(n)/n           weighted Mertens
 *   6.  Σ1/p - loglog(x)       Mertens' theorem error
 *   7.  Σd(n) - x(logx+2γ-1)  divisor error
 *   8.  Σσ(n) - π²x²/12        sum-of-divisors error
 *   9.  Σφ(n) - 3x²/π²          totient sum error
 *   10. Σω(n) - x·loglogx      distinct prime factors error
 *   11. Σ(-1)^n/p_n             alternating prime reciprocal
 *   12. ψ(x) - x               Chebyshev psi error
 *   13. θ(x) - x               Chebyshev theta error
 *
 * FAMILY 2: Dirichlet L(s,χ) — different zeros per character
 *   14. π(x;3,1) - π(x;3,2)   Chebyshev bias mod 3
 *   15. π(x;4,1) - π(x;4,3)   Chebyshev bias mod 4
 *   16. π(x;5,1) - π(x;5,2)   bias mod 5 (1 vs 2)
 *   17. π(x;5,1) - π(x;5,3)   bias mod 5 (1 vs 3)
 *   18. π(x;7,1) - π(x;7,3)   bias mod 7
 *   19. π(x;8,1) - π(x;8,3)   bias mod 8
 *   20. π(x;8,1) - π(x;8,5)   bias mod 8 (1 vs 5)
 *   21. π(x;11,1) - π(x;11,2) bias mod 11
 *   22. π(x;12,1) - π(x;12,5) bias mod 12
 *   23. π(x;12,1) - π(x;12,7) bias mod 12 (1 vs 7)
 *   24. π(x;24,1) - π(x;24,5) bias mod 24
 *
 * FAMILY 3: Polynomial/combinatorial — may have own structure
 *   25. Collatz steps           stopping time sequence
 *   26. Collatz max             max value in trajectory
 *   27. Goldbach count          representations as p+q
 *   28. Twin prime gaps         gaps between twin pairs
 *   29. Cousin prime gaps       gaps between p, p+4 pairs
 *   30. Sexy prime gaps         gaps between p, p+6 pairs
 *   31. Sophie Germain gaps     gaps between SG primes
 *   32. Prime k-tuple gaps      various admissible patterns
 *
 * FAMILY 4: Multiplicative function errors
 *   33. Σμ²(n) - 6x/π²          squarefree count error
 *   34. Σ2^ω(n)/n - (logx)²/2   powerful number sum
 *   35. ΣΩ(n) - x·sum           big omega sum error
 *   36. Σd²(n) error             squared divisor sum
 *   37. Σlog(d(n)) error         log divisor sum
 *
 * For each: compute to 10M, find all breach events,
 * characterise waves, catalog.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 1000000
#define MAX_BREACHES 6000
#define MAX_FUNCS 50
#define DFT_FREQS 950  /* 5.0 to 100.0 in steps of 0.1 — full zero range */

/* ═══════════════════════════════════════════════ */
/* BREACH EVENT                                    */
/* ═══════════════════════════════════════════════ */

typedef struct {
    int func_id;
    int family;           /* 1=Riemann, 2=Dirichlet, 3=Poly, 4=Mult */
    const char *func_name;
    const char *breach_type;
    long long x;
    double value;
    double threshold;
    int training;
} BreachEvent;

static BreachEvent breaches[MAX_BREACHES];
static int n_breaches = 0;

/* ═══════════════════════════════════════════════ */
/* WAVE SIGNATURE per function                     */
/* ═══════════════════════════════════════════════ */

typedef struct {
    int func_id;
    int family;
    const char *name;
    int n_samples;
    double peak_freqs[10];   /* top 10 frequencies */
    double peak_amps[10];    /* their amplitudes */
    double peak_phases[10];
    int n_peaks;
    int n_breaches;          /* how many breaches this function had */
    int n_sign_changes;
    int n_records;
} WaveSignature;

static WaveSignature signatures[MAX_FUNCS];
static int n_sigs = 0;

/* ═══════════════════════════════════════════════ */
/* DFT in log space — extract dominant frequencies */
/* ═══════════════════════════════════════════════ */

static void extract_frequencies(double *values, const double *log_x,
                                 int n, WaveSignature *sig) {
    /* scan γ = 1 to 100 */
    double best_power[10] = {0};
    double best_freq[10] = {0};
    double best_phase[10] = {0};

    /* detrend: remove linear fit to kill low-frequency dominance */
    {
        double sx=0,sy=0,sxx=0,sxy=0;
        for (int i=0; i<n; i++) { sx+=log_x[i]; sy+=values[i]; sxx+=log_x[i]*log_x[i]; sxy+=log_x[i]*values[i]; }
        double slope = (n*sxy-sx*sy)/(n*sxx-sx*sx);
        double intercept = (sy - slope*sx)/n;
        for (int i=0; i<n; i++) values[i] -= (slope*log_x[i] + intercept);
    }

    for (int fi = 0; fi < DFT_FREQS; fi++) {
        double gamma = 5.0 + fi * 0.1;  /* 5.0 to 100.0 */
        double a = 0, b = 0;
        for (int i = 0; i < n; i++) {
            double ph = gamma * log_x[i];
            a += values[i] * cos(ph);
            b += values[i] * sin(ph);
        }
        a *= 2.0 / n; b *= 2.0 / n;
        double power = a*a + b*b;
        double phase = atan2(b, a);

        /* insert into top-10 if large enough */
        for (int k = 0; k < 10; k++) {
            if (power > best_power[k]) {
                /* shift down */
                for (int j = 9; j > k; j--) {
                    best_power[j] = best_power[j-1];
                    best_freq[j] = best_freq[j-1];
                    best_phase[j] = best_phase[j-1];
                }
                best_power[k] = power;
                best_freq[k] = gamma;
                best_phase[k] = phase;
                break;
            }
        }
    }

    /* find LOCAL MAXIMA in the power spectrum — only report peaks, not slopes */
    /* scan the full DFT power array and pick points where power[i] > power[i-1] and power[i] > power[i+1] */
    /* store all local maxima, then take top 10 */
    typedef struct { double g, p, ph; } Peak;
    Peak all_peaks[200];
    int n_all = 0;

    /* rebuild the power spectrum for local max detection */
    double powers[DFT_FREQS];
    double freqs[DFT_FREQS];
    double phases_arr[DFT_FREQS];
    /* re-scan (cheap at this point) */
    for (int fi = 0; fi < DFT_FREQS; fi++) {
        double gamma = 10.0 + fi * 0.1;
        double a2 = 0, b2 = 0;
        for (int i = 0; i < n; i++) {
            double ph = gamma * log_x[i];
            a2 += values[i] * cos(ph);
            b2 += values[i] * sin(ph);
        }
        a2 *= 2.0/n; b2 *= 2.0/n;
        powers[fi] = a2*a2 + b2*b2;
        freqs[fi] = gamma;
        phases_arr[fi] = atan2(b2, a2);
    }

    /* find local maxima */
    for (int fi = 1; fi < DFT_FREQS - 1; fi++) {
        if (powers[fi] > powers[fi-1] && powers[fi] > powers[fi+1] && powers[fi] > 0.0001) {
            if (n_all < 200) {
                all_peaks[n_all++] = (Peak){freqs[fi], powers[fi], phases_arr[fi]};
            }
        }
    }

    /* sort by power descending */
    for (int i = 0; i < n_all - 1; i++)
        for (int j = i+1; j < n_all; j++)
            if (all_peaks[j].p > all_peaks[i].p) { Peak t=all_peaks[i]; all_peaks[i]=all_peaks[j]; all_peaks[j]=t; }

    /* take top 10 local maxima */
    sig->n_peaks = n_all < 10 ? n_all : 10;
    for (int k = 0; k < sig->n_peaks; k++) {
        sig->peak_freqs[k] = all_peaks[k].g;
        sig->peak_amps[k] = sqrt(all_peaks[k].p);
        sig->peak_phases[k] = all_peaks[k].ph;
    }
    /* zero remaining */
    for (int k = sig->n_peaks; k < 10; k++) {
        sig->peak_freqs[k] = 0; sig->peak_amps[k] = 0; sig->peak_phases[k] = 0;
    }
}

/* ═══════════════════════════════════════════════ */
/* Helper: count breaches for a function           */
/* ═══════════════════════════════════════════════ */

static void catalog_function(const double *func, int n, int func_id, int family,
                              const char *name, const double *log_x) {
    WaveSignature *sig = &signatures[n_sigs];
    sig->func_id = func_id;
    sig->family = family;
    sig->name = name;
    sig->n_samples = n;
    sig->n_breaches = 0;
    sig->n_sign_changes = 0;
    sig->n_records = 0;

    /* sign changes */
    double prev = func[1];
    for (int i = 2; i <= n; i++) {
        if (func[i] != 0 && prev != 0 && func[i] * prev < 0) {
            sig->n_sign_changes++;
            if (n_breaches < MAX_BREACHES) {
                breaches[n_breaches++] = (BreachEvent){
                    func_id, family, name, "sign_change", i, func[i], 0.0,
                    ((i * 2654435761ULL) >> 16) % 100 < 60
                };
                sig->n_breaches++;
            }
        }
        prev = func[i];
    }

    /* records */
    double record_pos = 0, record_neg = 0;
    for (int i = 100; i <= n; i++) {
        if (func[i] > record_pos + 0.01) {
            record_pos = func[i];
            sig->n_records++;
            if (n_breaches < MAX_BREACHES && sig->n_records < 20) {
                breaches[n_breaches++] = (BreachEvent){
                    func_id, family, name, "record_pos", i, func[i], record_pos,
                    ((i * 2654435761ULL) >> 16) % 100 < 60
                };
                sig->n_breaches++;
            }
        }
        if (func[i] < record_neg - 0.01) {
            record_neg = func[i];
            sig->n_records++;
            if (n_breaches < MAX_BREACHES && sig->n_records < 40) {
                breaches[n_breaches++] = (BreachEvent){
                    func_id, family, name, "record_neg", i, func[i], record_neg,
                    ((i * 2654435761ULL) >> 16) % 100 < 60
                };
                sig->n_breaches++;
            }
        }
    }

    /* DFT — extract top frequencies */
    int dft_n = 1024;
    double *dft_vals = malloc(dft_n * sizeof(double));
    double *dft_logx = malloc(dft_n * sizeof(double));
    double log_min = log(100.0);
    double log_max = log((double)n);
    double log_step = (log_max - log_min) / (dft_n - 1);

    for (int i = 0; i < dft_n; i++) {
        double lx = log_min + i * log_step;
        int idx = (int)exp(lx);
        if (idx < 1) idx = 1;
        if (idx > n) idx = n;
        dft_vals[i] = func[idx];
        dft_logx[i] = lx;
    }

    extract_frequencies(dft_vals, dft_logx, dft_n, sig);
    free(dft_vals); free(dft_logx);

    n_sigs++;
    fflush(stdout);
}

/* number theory helpers */
static int big_omega(long long n) {
    int c=0; for(long long p=2;p*p<=n;p++) while(n%p==0){c++;n/=p;} if(n>1)c++; return c;
}
static int small_omega(long long n) {
    int c=0; for(long long p=2;p*p<=n;p++) if(n%p==0){c++;while(n%p==0)n/=p;} if(n>1)c++; return c;
}
static int mobius_val(long long n) {
    int f=0; for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}} if(n>1)f++; return(f%2==0)?1:-1;
}
static int divisor_count(long long n) {
    int d=0; for(long long j=1;j*j<=n;j++) if(n%j==0){d++; if(j!=n/j)d++;} return d;
}
static long long divisor_sum(long long n) {
    long long s=0; for(long long j=1;j*j<=n;j++) if(n%j==0){s+=j; if(j!=n/j)s+=n/j;} return s;
}
static int euler_phi(int n) {
    int r=n,t=n; for(int p=2;(long long)p*p<=t;p++){if(t%p==0){while(t%p==0)t/=p;r-=r/p;}} if(t>1)r-=r/t; return r;
}

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);  /* unbuffered — see data as it computes */
    printf("=== Experiment 35: Universal Catalog ===\n\n");
    printf("Every function. Every breach. Every wave.\n");
    printf("One framework to characterise them all.\n\n");

    time_t total_start = time(NULL);

    /* sieve */
    printf("Sieving to %dM...\n", MAX_N/1000000);
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i*i <= MAX_N; i++)
        if (!sieve[i]) for (long long j = (long long)i*i; j <= MAX_N; j += i) sieve[j] = 1;

    /* prime list for gap computations */
    int *primes = malloc(100000 * sizeof(int));
    int np = 0;
    for (int i = 2; i <= MAX_N; i++) if (!sieve[i]) primes[np++] = i;
    printf("Primes: %d. Sieve done.\n\n", np);

    /* allocate function arrays — we reuse memory */
    double *func = calloc(MAX_N + 2, sizeof(double));
    double *log_x = malloc(MAX_N * sizeof(double));
    for (int i = 1; i <= MAX_N; i++) log_x[i] = log((double)i);

    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("COMPUTING ALL FUNCTIONS AND CATALOGING BREACHES\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* ─── FAMILY 1: RIEMANN ZETA ─── */
    printf("  FAMILY 1: Riemann zeta functions\n");

    /* 1. Liouville L(x)/√x */
    { double sum=0; for(int i=1;i<=MAX_N;i++){sum+=(big_omega(i)%2==0)?1:-1; func[i]=sum/sqrt(i);}
      catalog_function(func, MAX_N, 1, 1, "L(x)/√x", log_x);
      printf("    1. L(x)/√x: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 2. Mertens M(x)/√x */
    { double sum=0; for(int i=1;i<=MAX_N;i++){sum+=mobius_val(i); func[i]=sum/sqrt(i);}
      catalog_function(func, MAX_N, 2, 1, "M(x)/√x", log_x);
      printf("    2. M(x)/√x: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 3. ψ(x)-x / √x  (Chebyshev psi) */
    { double sum=0; for(int i=1;i<=MAX_N;i++){
        /* ψ(x) = Σ log(p) for p^k ≤ x */
        if(!sieve[i]&&i>=2){long long pk=i; while(pk<=MAX_N){sum+=log((double)i); if(pk > MAX_N/i) break; pk*=i;}}
        func[i]=(sum-(double)i)/sqrt(i);}
      catalog_function(func, MAX_N, 3, 1, "ψ(x)-x/√x", log_x);
      printf("    3. ψ(x)-x/√x: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 4. θ(x)-x / √x  (Chebyshev theta) */
    { double sum=0; for(int i=1;i<=MAX_N;i++){if(!sieve[i]&&i>=2)sum+=log((double)i); func[i]=(sum-(double)i)/sqrt(i);}
      catalog_function(func, MAX_N, 4, 1, "θ(x)-x/√x", log_x);
      printf("    4. θ(x)-x/√x: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 5. Σμ(n)/n */
    { double sum=0; for(int i=1;i<=MAX_N;i++){sum+=(double)mobius_val(i)/i; func[i]=sum;}
      catalog_function(func, MAX_N, 5, 1, "Σμ(n)/n", log_x);
      printf("    5. Σμ(n)/n: %d sign changes\n", signatures[n_sigs-1].n_sign_changes); }

    /* 6. Σd(n) - x(logx+2γ-1) / √x */
    { double dsum=0; for(int i=1;i<=MAX_N;i++){dsum+=divisor_count(i);
        double expect=i*(log_x[i]+2*0.5772156649-1); func[i]=(dsum-expect)/sqrt(i);}
      catalog_function(func, MAX_N, 6, 1, "div_err/√x", log_x);
      printf("    6. div_err/√x: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 7. Σφ(n) - 3x²/π² scaled */
    { double psum=0; for(int i=1;i<=MAX_N;i++){psum+=euler_phi(i);
        double expect=3.0*(double)i*i/(M_PI*M_PI); func[i]=(psum-expect)/((double)i);}
      catalog_function(func, MAX_N, 7, 1, "φ_err/x", log_x);
      printf("    7. φ_err/x: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 8. Σσ(n) - π²x²/12 scaled */
    { double ssum=0; for(int i=1;i<=MAX_N;i++){ssum+=divisor_sum(i);
        double expect=M_PI*M_PI*(double)i*i/12.0; func[i]=(ssum-expect)/((double)i*sqrt(i));}
      catalog_function(func, MAX_N, 8, 1, "σ_err", log_x);
      printf("    8. σ_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 9. Σμ²(n) - 6x/π² / √x (squarefree count error) */
    { double ssum=0; for(int i=1;i<=MAX_N;i++){ssum+=(mobius_val(i)!=0)?1:0;
        double expect=6.0*i/(M_PI*M_PI); func[i]=(ssum-expect)/sqrt(i);}
      catalog_function(func, MAX_N, 9, 1, "sqfree_err/√x", log_x);
      printf("    9. sqfree_err/√x: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 10. Σω(n) - x·loglogx scaled */
    { double osum=0; for(int i=2;i<=MAX_N;i++){osum+=small_omega(i);
        double expect=(double)i*log(log_x[i]); func[i]=i>10?(osum-expect)/sqrt((double)i*log(log_x[i])):0;}
      catalog_function(func, MAX_N, 10, 1, "ω_err", log_x);
      printf("    10. ω_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    printf("\n  FAMILY 2: Dirichlet L-function (Chebyshev biases)\n");

    /* Chebyshev biases — different moduli */
    int mods[] =  {3, 4, 5, 5, 7, 8,  8, 11, 12, 12, 24};
    int res_a[] = {2, 3, 2, 3, 3, 3,  5,  2,  5,  7,  5};
    int res_b[] = {1, 1, 1, 1, 1, 1,  1,  1,  1,  1,  1};
    int n_cheb = 11;

    for (int c = 0; c < n_cheb; c++) {
        int m = mods[c], ra = res_a[c], rb = res_b[c];
        long long count_a = 0, count_b = 0;
        for (int i = 2; i <= MAX_N; i++) {
            if (!sieve[i]) {
                if (i % m == ra) count_a++;
                if (i % m == rb) count_b++;
            }
            func[i] = (double)(count_a - count_b);
        }
        char name[64];
        snprintf(name, sizeof(name), "π(%d,%d)-π(%d,%d)", m, ra, m, rb);
        /* need static storage for name */
        static char names[20][64];
        snprintf(names[c], sizeof(names[c]), "π(%d,%d)-π(%d,%d)", m, ra, m, rb);
        catalog_function(func, MAX_N, 11 + c, 2, names[c], log_x);
        printf("    %d. %s: %d sign changes, %d records\n",
               11 + c, names[c], signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
    }

    printf("\n  FAMILY 3: Combinatorial/polynomial\n");

    /* Collatz stopping time */
    { for(int i=1;i<=MAX_N;i++){long long n=i;int s=0;while(n>1&&s<1000){n=(n%2==0)?n/2:3*n+1;s++;} func[i]=(double)s;}
      /* scale: subtract mean, divide by sqrt */
      double mean=0; for(int i=1;i<=MAX_N;i++) mean+=func[i]; mean/=MAX_N;
      for(int i=1;i<=MAX_N;i++) func[i]=(func[i]-mean);
      catalog_function(func, MAX_N, 22, 3, "Collatz_steps", log_x);
      printf("    22. Collatz_steps: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* Twin prime gaps */
    { memset(func, 0, (MAX_N+2)*sizeof(double));
      int prev_tp = 0, tp_idx = 0;
      for (int i = 3; i <= MAX_N - 2; i++) {
          if (!sieve[i] && !sieve[i+2]) {
              if (prev_tp > 0 && tp_idx < MAX_N) { func[tp_idx] = (double)(i - prev_tp); tp_idx++; }
              prev_tp = i;
          }
      }
      /* compute running deviation from mean gap */
      if (tp_idx > 100) {
          double rmean = 0; for(int i=0;i<tp_idx;i++) rmean+=func[i]; rmean/=tp_idx;
          double rsum = 0;
          for(int i=0;i<tp_idx;i++){rsum+=(func[i]-rmean); func[i+1]=rsum/sqrt(i+1.0);}
          catalog_function(func, tp_idx, 23, 3, "twin_gap_err", log_x);
          printf("    23. twin_gap_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
      }
    }

    /* Cousin primes (p, p+4) */
    { memset(func, 0, (MAX_N+2)*sizeof(double));
      int prev = 0, idx = 0;
      for (int i = 3; i <= MAX_N - 4; i++) {
          if (!sieve[i] && !sieve[i+4]) {
              if (prev > 0 && idx < MAX_N) { func[idx] = (double)(i - prev); idx++; }
              prev = i;
          }
      }
      if (idx > 100) {
          double rmean = 0; for(int i=0;i<idx;i++) rmean+=func[i]; rmean/=idx;
          double rsum = 0;
          for(int i=0;i<idx;i++){rsum+=(func[i]-rmean); func[i+1]=rsum/sqrt(i+1.0);}
          catalog_function(func, idx, 24, 3, "cousin_gap_err", log_x);
          printf("    24. cousin_gap_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
      }
    }

    /* Sexy primes (p, p+6) */
    { memset(func, 0, (MAX_N+2)*sizeof(double));
      int prev = 0, idx = 0;
      for (int i = 5; i <= MAX_N - 6; i++) {
          if (!sieve[i] && !sieve[i+6]) {
              if (prev > 0 && idx < MAX_N) { func[idx] = (double)(i - prev); idx++; }
              prev = i;
          }
      }
      if (idx > 100) {
          double rmean = 0; for(int i=0;i<idx;i++) rmean+=func[i]; rmean/=idx;
          double rsum = 0;
          for(int i=0;i<idx;i++){rsum+=(func[i]-rmean); func[i+1]=rsum/sqrt(i+1.0);}
          catalog_function(func, idx, 25, 3, "sexy_gap_err", log_x);
          printf("    25. sexy_gap_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
      }
    }

    /* Prime gap running sum error */
    { memset(func, 0, (MAX_N+2)*sizeof(double));
      double gsum = 0;
      for (int i = 1; i < np; i++) {
          double gap = primes[i] - primes[i-1];
          double expected = log((double)primes[i]);
          gsum += (gap - expected);
          func[i] = gsum / sqrt((double)i);
      }
      catalog_function(func, np-1, 26, 3, "gap_err/√n", log_x);
      printf("    26. gap_err/√n: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
    }

    /* Sophie Germain (p, 2p+1 both prime) */
    { memset(func, 0, (MAX_N+2)*sizeof(double));
      int prev = 0, idx = 0;
      for (int i = 2; i <= MAX_N/2; i++) {
          if (!sieve[i] && 2*i+1 <= MAX_N && !sieve[2*i+1]) {
              if (prev > 0 && idx < MAX_N) { func[idx] = (double)(i - prev); idx++; }
              prev = i;
          }
      }
      if (idx > 100) {
          double rmean = 0; for(int i=0;i<idx;i++) rmean+=func[i]; rmean/=idx;
          double rsum = 0;
          for(int i=0;i<idx;i++){rsum+=(func[i]-rmean); func[i+1]=rsum/sqrt(i+1.0);}
          catalog_function(func, idx, 27, 3, "SG_gap_err", log_x);
          printf("    27. SG_gap_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
      }
    }

    printf("\n  FAMILY 4: Manufactured threshold conjectures\n");

    /* 28. |M(x)/√x| < 0.5 — manufactured bound, breaks quickly */
    { double sum=0; for(int i=1;i<=MAX_N;i++){sum+=mobius_val(i); func[i]=fabs(sum/sqrt(i))-0.5;}
      catalog_function(func, MAX_N, 28, 4, "|M/√x|-0.5", log_x);
      printf("    28. |M/√x|-0.5: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 29. |M(x)/√x| < 0.3 — tighter bound */
    { double sum=0; for(int i=1;i<=MAX_N;i++){sum+=mobius_val(i); func[i]=fabs(sum/sqrt(i))-0.3;}
      catalog_function(func, MAX_N, 29, 4, "|M/√x|-0.3", log_x);
      printf("    29. |M/√x|-0.3: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 30. |L(x)/√x| < 0.5 — Liouville bound */
    { double sum=0; for(int i=1;i<=MAX_N;i++){sum+=(big_omega(i)%2==0)?1:-1; func[i]=fabs(sum/sqrt(i))-0.5;}
      catalog_function(func, MAX_N, 30, 4, "|L/√x|-0.5", log_x);
      printf("    30. |L/√x|-0.5: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 31. Goldbach representation count error */
    { memset(func, 0, (MAX_N+2)*sizeof(double));
      for(int i=2;i<=MAX_N/2;i++){
        int even=2*i; int count=0;
        for(int p=2;p<=even/2;p++) if(!sieve[p]&&(even-p)<=MAX_N&&!sieve[even-p]) count++;
        /* expected ~ even / (2 ln²(even)) */
        double lne = log((double)even);
        double expected = (double)even / (2.0*lne*lne);
        func[i] = (count - expected) / sqrt(expected > 1 ? expected : 1);
      }
      catalog_function(func, MAX_N/2, 31, 3, "Goldbach_err", log_x);
      printf("    31. Goldbach_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 32-36. More Chebyshev biases: mod 5(4vs1), mod 7(2vs1), mod 7(6vs1), mod 13(2vs1), mod 16(3vs1) */
    { int extra_mods[] = {5, 7, 7, 13, 16};
      int extra_a[] = {4, 2, 6, 2, 3};
      int extra_b[] = {1, 1, 1, 1, 1};
      static char enames[5][64];
      for (int c = 0; c < 5; c++) {
        int m=extra_mods[c], ra=extra_a[c], rb=extra_b[c];
        long long ca=0, cb=0;
        for(int i=2;i<=MAX_N;i++){ if(!sieve[i]){if(i%m==ra)ca++;if(i%m==rb)cb++;} func[i]=(double)(ca-cb); }
        snprintf(enames[c], sizeof(enames[c]), "π(%d,%d)-π(%d,%d)", m, ra, m, rb);
        catalog_function(func, MAX_N, 32+c, 2, enames[c], log_x);
        printf("    %d. %s: %d sign changes, %d records\n", 32+c, enames[c], signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
      }
    }

    /* 37. Σd(n)² error — squared divisor sum */
    { double dsum=0; for(int i=1;i<=MAX_N;i++){int d=divisor_count(i); dsum+=(double)d*d;
        /* expected ~ x/π² × (log x)³ roughly */
        double expected=(double)i/(M_PI*M_PI)*log_x[i]*log_x[i]*log_x[i]/6.0;
        func[i]=(dsum-expected)/((double)i);}
      catalog_function(func, MAX_N, 37, 4, "Σd²_err", log_x);
      printf("    37. Σd²_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 38. Prime race: primes ≡ 1 mod 6 vs primes ≡ 5 mod 6 */
    { long long c1=0,c5=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%6==1)c1++;if(i%6==5)c5++;} func[i]=(double)(c5-c1);}
      static char n38[] = "π(6,5)-π(6,1)";
      catalog_function(func, MAX_N, 38, 2, n38, log_x);
      printf("    38. %s: %d sign changes, %d records\n", n38, signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 39. Σμ(n)·log(n)/n — weighted Mertens */
    { double sum=0; for(int i=1;i<=MAX_N;i++){sum+=(double)mobius_val(i)*log_x[i]/i; func[i]=sum;}
      catalog_function(func, MAX_N, 39, 1, "Σμlogn/n", log_x);
      printf("    39. Σμlogn/n: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 40. Ramanujan τ(n) partial sums — highly multiplicative */
    { double tsum=0;
      /* simplified: use Σ(-1)^Ω(n)·d(n) as proxy for multiplicative oscillation */
      for(int i=1;i<=MAX_N;i++){
        int d=divisor_count(i); int omega=big_omega(i);
        tsum += ((omega%2==0)?1.0:-1.0) * d;
        func[i] = tsum / pow((double)i, 0.75);
      }
      catalog_function(func, MAX_N, 40, 1, "mult_osc", log_x);
      printf("    40. mult_osc: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    printf("\n  FAMILY 5: Additional number-theoretic functions\n");

    /* 41. Abundant number count error: #{n≤x : σ(n)>2n} - 0.2477x (density ≈ 24.77%) */
    { double acount=0; for(int i=1;i<=MAX_N;i++){
        long long s=0; for(long long j=1;j*j<=i;j++) if(i%j==0){s+=j;if(j!=i/j)s+=i/j;}
        if(s > 2*i) acount++;
        func[i]=(acount - 0.2477*i)/sqrt(i);}
      catalog_function(func, MAX_N, 41, 1, "abundant_err", log_x);
      printf("    41. abundant_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 42. σ(n)/n - mean: individual values oscillating around 1+γ+... */
    { double ssum=0; for(int i=1;i<=MAX_N;i++){
        long long s=0; for(long long j=1;j*j<=i;j++) if(i%j==0){s+=j;if(j!=i/j)s+=i/j;}
        ssum += (double)s/i;
        /* expected Σσ(k)/k ≈ π²x/6 + ... */
        func[i] = (ssum - M_PI*M_PI*i/6.0) / sqrt(i);}
      catalog_function(func, MAX_N, 42, 1, "σ/n_err", log_x);
      printf("    42. σ/n_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 43. Sum of two squares: r₂(n) cumulative error */
    { double rcount=0; for(int i=1;i<=MAX_N;i++){
        int r2=0; for(int a=0;(long long)a*a<=i;a++){int b2=i-a*a; int b=(int)sqrt(b2); if(b*b==b2) r2++;}
        rcount += r2 * 4; /* count all representations */
        func[i] = (rcount - M_PI*i) / sqrt(i); /* expected ~ πx */}
      catalog_function(func, MAX_N, 43, 1, "r2_err", log_x);
      printf("    43. r2_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 44-48. Prime ending digit races (mod 10) */
    { int digits[] = {1, 3, 7, 9};
      static char dnames[4][64];
      for (int d = 0; d < 4; d++) {
        long long cd=0, c1=0;
        for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%10==digits[d])cd++;if(i%10==1)c1++;} func[i]=(double)(cd-c1);}
        snprintf(dnames[d], sizeof(dnames[d]), "end_%d_vs_1", digits[d]);
        if (digits[d] != 1) {
          catalog_function(func, MAX_N, 44+d, 2, dnames[d], log_x);
          printf("    %d. %s: %d sign changes, %d records\n", 44+d, dnames[d], signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records);
        }
      }
    }

    /* 47. |M(x)/√x| threshold crossings at 0.1 intervals */
    { double sum=0;
      double thresholds[] = {0.1, 0.2, 0.3, 0.4, 0.5};
      static char tnames[5][64];
      printf("    Manufactured M(x) thresholds:\n");
      for (int t = 0; t < 5; t++) {
        sum = 0;
        for(int i=1;i<=MAX_N;i++){sum+=mobius_val(i); func[i]=fabs(sum/sqrt(i))-thresholds[t];}
        snprintf(tnames[t], sizeof(tnames[t]), "|M/√x|-%.1f", thresholds[t]);
        catalog_function(func, MAX_N, 48+t, 4, tnames[t], log_x);
        printf("      %s: %d sign changes (first breach = first crossing)\n",
               tnames[t], signatures[n_sigs-1].n_sign_changes);
      }
    }

    /* 53. Waring: count of representations as sum of 2 squares, cumulative error */
    /* already done as r2_err above */

    /* 54. ΣΛ(n)/n - log(x): prime number theorem in Λ form */
    { double sum=0; for(int i=1;i<=MAX_N;i++){
        /* Λ(n) = log(p) if n=p^k, 0 otherwise */
        if(!sieve[i]&&i>=2){long long pk=i; while(pk<=MAX_N){if(pk==i)sum+=log((double)i); if(pk>MAX_N/i)break; pk*=i;}}
        func[i]=sum/i - 1.0; /* Σ Λ(n)/n should approach x, so Σ Λ(n)/(n·1) → log x, error = Σ Λ(n)/n - log x */
      }
      /* recompute properly */
      double lsum=0;
      for(int i=2;i<=MAX_N;i++){
        if(!sieve[i]) lsum += log((double)i)/(double)i;
        func[i] = lsum - log_x[i];
      }
      catalog_function(func, MAX_N, 54, 1, "ΣΛ/n-logx", log_x);
      printf("    54. ΣΛ/n-logx: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    /* 55. Prime gap variance: running variance of gaps vs expected */
    { int prev_p=2; double gvar_sum=0, gmean=0; int gcount=0;
      for(int i=3;i<=MAX_N;i++){
        if(!sieve[i]){
          double gap=i-prev_p; gcount++;
          double old_mean=gmean; gmean+=(gap-gmean)/gcount;
          gvar_sum += (gap-old_mean)*(gap-gmean);
          /* expected variance ~ (log x)² */
          double expected_var = log_x[i]*log_x[i];
          func[i] = gcount>10 ? (gvar_sum/gcount - expected_var)/expected_var : 0;
          prev_p=i;
        } else func[i]=func[i-1];
      }
      catalog_function(func, MAX_N, 55, 3, "gap_var_err", log_x);
      printf("    55. gap_var_err: %d sign changes, %d records\n", signatures[n_sigs-1].n_sign_changes, signatures[n_sigs-1].n_records); }

    double compute_time = difftime(time(NULL), total_start);
    printf("\n  All functions computed in %.0f seconds.\n", compute_time);
    printf("  Total signatures: %d\n", n_sigs);
    printf("  Total breach events: %d\n\n", n_breaches);

    int n_train = 0, n_val = 0;
    for (int i = 0; i < n_breaches; i++) { if (breaches[i].training) n_train++; else n_val++; }
    printf("  Training: %d | Validation: %d\n\n", n_train, n_val);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: WAVE SIGNATURES — TOP FREQUENCIES   */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 1: WAVE SIGNATURES — TOP 5 FREQUENCIES PER FUNCTION\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* known zeta zeros for matching — extended to 30 zeros */
    double known_zeros[] = {
        14.13, 21.02, 25.01, 30.42, 32.94, 37.59, 40.92, 43.33, 48.01, 49.77,
        52.97, 56.45, 59.35, 60.83, 65.11, 67.08, 69.55, 72.07, 75.70, 77.14,
        79.34, 82.91, 84.74, 87.43, 88.81, 92.49, 94.65, 95.87, 98.83, 101.32
    };
    /* first Dirichlet L-function zeros for χ mod 3, 4, 5, 7 */
    double dir_zeros_mod4[] = {6.02, 10.24, 12.59, 16.00, 19.13, 22.47};
    double dir_zeros_mod3[] = {8.04, 13.44, 16.83, 19.74, 23.30, 25.56};
    int n_dir4 = 6, n_dir3 = 6;

    printf("  %-18s│ Fam │ γ₁     │ γ₂     │ γ₃     │ γ₄     │ γ₅     │ Zeta matches\n", "Function");
    printf("  ──────────────────┼─────┼────────┼────────┼────────┼────────┼────────┼────────────\n");

    for (int s = 0; s < n_sigs; s++) {
        WaveSignature *sig = &signatures[s];
        printf("  %-18s│  %d  │", sig->name, sig->family);

        int matches = 0;
        for (int k = 0; k < 5; k++) {
            printf(" %6.1f │", sig->peak_freqs[k]);
            if (sig->peak_freqs[k] < 0.1) continue;
            /* check Riemann zeros (30 zeros) */
            for (int z = 0; z < 30; z++)
                if (fabs(sig->peak_freqs[k] - known_zeros[z]) < 1.0) { matches++; goto next_peak; }
            /* check Dirichlet zeros for family 2 */
            if (sig->family == 2) {
                for (int z = 0; z < n_dir4; z++)
                    if (fabs(sig->peak_freqs[k] - dir_zeros_mod4[z]) < 1.0) { matches++; goto next_peak; }
                for (int z = 0; z < n_dir3; z++)
                    if (fabs(sig->peak_freqs[k] - dir_zeros_mod3[z]) < 1.0) { matches++; goto next_peak; }
            }
            next_peak:;
        }
        printf(" %d/5 %s\n", matches, matches >= 3 ? "***" : matches >= 2 ? "*" : "");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: DO FAMILY 1 FUNCTIONS SHARE FREQS?  */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 2: FREQUENCY SHARING WITHIN FAMILIES\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Do functions in the same family share dominant frequencies?\n\n");

    for (int fam = 1; fam <= 3; fam++) {
        const char *fam_name = fam==1?"Riemann":fam==2?"Dirichlet":"Combinatorial";
        printf("  FAMILY %d (%s):\n", fam, fam_name);

        /* collect all top-5 frequencies from this family */
        double all_freqs[200]; int nf = 0;
        for (int s = 0; s < n_sigs; s++) {
            if (signatures[s].family == fam) {
                for (int k = 0; k < 5 && k < signatures[s].n_peaks; k++)
                    if (nf < 200) all_freqs[nf++] = signatures[s].peak_freqs[k];
            }
        }

        /* find most common frequencies (cluster within ±1.0) */
        printf("    Most shared frequencies (appearing in 2+ functions):\n");
        double reported[50]; int n_reported = 0;
        for (int i = 0; i < nf; i++) {
            /* skip if already reported nearby */
            int skip = 0;
            for (int r = 0; r < n_reported; r++)
                if (fabs(all_freqs[i] - reported[r]) < 1.5) { skip = 1; break; }
            if (skip) continue;

            int count = 0;
            for (int j = 0; j < nf; j++)
                if (fabs(all_freqs[j] - all_freqs[i]) < 1.5) count++;

            if (count >= 2) {
                /* check if it matches a zeta zero */
                int is_zero = 0;
                for (int z = 0; z < 10; z++)
                    if (fabs(all_freqs[i] - known_zeros[z]) < 1.5) { is_zero = 1; break; }

                printf("      γ ≈ %5.1f: appears %d times %s\n",
                       all_freqs[i], count, is_zero ? "← ZETA ZERO" : "");
                if (n_reported < 50) reported[n_reported++] = all_freqs[i];
            }
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: BREACH STATISTICS BY FAMILY          */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("TABLE 3: BREACH STATISTICS BY FAMILY\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Family        │ Functions │ Breaches │ Sign changes │ Records │ Mean per func\n");
    printf("  ──────────────┼───────────┼──────────┼──────────────┼─────────┼──────────────\n");

    for (int fam = 1; fam <= 3; fam++) {
        int funcs=0, total_b=0, total_sc=0, total_r=0;
        for (int s = 0; s < n_sigs; s++) {
            if (signatures[s].family == fam) {
                funcs++;
                total_b += signatures[s].n_breaches;
                total_sc += signatures[s].n_sign_changes;
                total_r += signatures[s].n_records;
            }
        }
        printf("  %-14s│    %3d    │   %5d  │    %7d   │  %5d  │   %7.1f\n",
               fam==1?"Riemann":fam==2?"Dirichlet":"Combinatorial",
               funcs, total_b, total_sc, total_r,
               funcs > 0 ? (double)total_b/funcs : 0);
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY                                      */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: THE UNIVERSAL CATALOG\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Functions cataloged: %d\n", n_sigs);
    printf("  Breach events: %d (train=%d, val=%d)\n", n_breaches, n_train, n_val);
    printf("  Families: 3 (Riemann, Dirichlet, Combinatorial)\n\n");

    /* count total zero matches (Riemann + Dirichlet where applicable) */
    int total_matches = 0, total_possible = 0;
    int riemann_matches = 0, riemann_possible = 0;
    int dirichlet_matches = 0, dirichlet_possible = 0;
    for (int s = 0; s < n_sigs; s++) {
        for (int k = 0; k < 5; k++) {
            if (signatures[s].peak_freqs[k] < 0.1) continue;
            total_possible++;
            if (signatures[s].family == 1 || signatures[s].family == 4) riemann_possible++;
            if (signatures[s].family == 2) dirichlet_possible++;
            int matched = 0;
            for (int z = 0; z < 30; z++)
                if (fabs(signatures[s].peak_freqs[k] - known_zeros[z]) < 1.0) { matched=1; break; }
            if (!matched && signatures[s].family == 2) {
                for (int z = 0; z < n_dir4; z++)
                    if (fabs(signatures[s].peak_freqs[k] - dir_zeros_mod4[z]) < 1.0) { matched=1; break; }
                if (!matched) for (int z = 0; z < n_dir3; z++)
                    if (fabs(signatures[s].peak_freqs[k] - dir_zeros_mod3[z]) < 1.0) { matched=1; break; }
            }
            if (matched) {
                total_matches++;
                if (signatures[s].family == 1 || signatures[s].family == 4) riemann_matches++;
                if (signatures[s].family == 2) dirichlet_matches++;
            }
        }
    }
    printf("  Overall zero matches: %d/%d top-5 peaks (%.0f%%)\n",
           total_matches, total_possible, 100.0*total_matches/total_possible);
    printf("  Riemann family:       %d/%d (%.0f%%)\n",
           riemann_matches, riemann_possible,
           riemann_possible > 0 ? 100.0*riemann_matches/riemann_possible : 0);
    printf("  Dirichlet family:     %d/%d (%.0f%%)\n\n",
           dirichlet_matches, dirichlet_possible,
           dirichlet_possible > 0 ? 100.0*dirichlet_matches/dirichlet_possible : 0);

    printf("  KEY QUESTION: Do Riemann family functions share frequencies?\n");
    printf("  If YES: one wave system, different amplitudes → universal theory\n");
    printf("  If NO: each function has its own wave structure → not universal\n\n");

    printf("  Time: %.0f seconds.\n", difftime(time(NULL), total_start));

    free(sieve); free(primes); free(func); free(log_x);
    return 0;
}
