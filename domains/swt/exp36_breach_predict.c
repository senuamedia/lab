/*
 * Experiment 36: Breach Prediction from Wave Signatures
 *
 * For each function with sign changes in [1, 1M]:
 *   1. Use FIRST HALF of data (1 to 500K) to extract waves
 *   2. Reconstruct from waves
 *   3. Predict where sign changes occur in SECOND HALF (500K to 1M)
 *   4. Compare prediction to actual
 *   5. Measure prediction accuracy
 *
 * This is the definitive train/validate test.
 * If the wave model predicts breaches accurately, Spectral Wave Theory works.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define TRAIN_N 500000
#define TOTAL_N 1000000
#define DFT_N 1024
#define N_FREQS 450  /* 10.0 to 55.0 in steps of 0.1 */
#define MAX_WAVES 20

static int big_omega(long long n) {
    int c=0; for(long long p=2;p*p<=n;p++) while(n%p==0){c++;n/=p;} if(n>1)c++; return c;
}
static int mobius_val(long long n) {
    int f=0; for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}} if(n>1)f++; return(f%2==0)?1:-1;
}
static int divisor_count(long long n) {
    int d=0; for(long long j=1;j*j<=n;j++) if(n%j==0){d++; if(j!=n/j)d++;} return d;
}

typedef struct { double freq, amp, phase; } Wave;

/* extract waves from data via DFT with detrending and local maxima */
static int extract_waves(const double *func, int n, Wave *waves, int max_waves) {
    /* subsample to DFT_N points in log space */
    double *vals = malloc(DFT_N * sizeof(double));
    double *logx = malloc(DFT_N * sizeof(double));
    double log_min = log(100.0), log_max = log((double)n);
    double log_step = (log_max - log_min) / (DFT_N - 1);

    for (int i = 0; i < DFT_N; i++) {
        double lx = log_min + i * log_step;
        int idx = (int)exp(lx); if (idx < 1) idx = 1; if (idx > n) idx = n;
        vals[i] = func[idx]; logx[i] = lx;
    }

    /* detrend */
    double sx=0,sy=0,sxx=0,sxy=0;
    for (int i=0; i<DFT_N; i++) { sx+=logx[i]; sy+=vals[i]; sxx+=logx[i]*logx[i]; sxy+=logx[i]*vals[i]; }
    double slope = (DFT_N*sxy-sx*sy)/(DFT_N*sxx-sx*sx);
    double intercept = (sy - slope*sx)/DFT_N;
    for (int i=0; i<DFT_N; i++) vals[i] -= (slope*logx[i] + intercept);

    /* compute power spectrum — dual range: low freq 1-10 + high freq 10-55 */
    double powers[N_FREQS], freqs[N_FREQS], phases[N_FREQS];
    for (int fi = 0; fi < N_FREQS; fi++) {
        double gamma = fi < 100 ? 1.0 + fi * 0.1 : 10.0 + (fi-100) * 0.13;
        double a=0, b=0;
        for (int i=0; i<DFT_N; i++) {
            double ph = gamma * logx[i];
            a += vals[i]*cos(ph); b += vals[i]*sin(ph);
        }
        a *= 2.0/DFT_N; b *= 2.0/DFT_N;
        powers[fi] = a*a + b*b;
        freqs[fi] = gamma;
        phases[fi] = atan2(b, a);
    }

    /* find local maxima */
    Wave all[200]; int n_all = 0;
    for (int fi = 1; fi < N_FREQS - 1; fi++) {
        if (powers[fi] > powers[fi-1] && powers[fi] > powers[fi+1] && powers[fi] > 0.00001) {
            if (n_all < 200) { all[n_all++] = (Wave){freqs[fi], sqrt(powers[fi]), phases[fi]}; }
        }
    }

    /* sort by amplitude descending */
    for (int i=0; i<n_all-1; i++)
        for (int j=i+1; j<n_all; j++)
            if (all[j].amp > all[i].amp) { Wave t=all[i]; all[i]=all[j]; all[j]=t; }

    int nw = n_all < max_waves ? n_all : max_waves;
    for (int i=0; i<nw; i++) waves[i] = all[i];

    free(vals); free(logx);
    return nw;
}

/* reconstruct function value at x from waves + DC */
static double reconstruct(const Wave *waves, int nw, double dc, double log_x) {
    double sum = dc;
    for (int i = 0; i < nw; i++)
        sum += waves[i].amp * cos(waves[i].freq * log_x + waves[i].phase);
    return sum;
}

/* count sign changes of a function in a range */
static int count_sign_changes(const double *func, int from, int to) {
    int count = 0;
    double prev = func[from];
    for (int i = from+1; i <= to; i++) {
        if (func[i] != 0 && prev != 0 && func[i] * prev < 0) count++;
        prev = func[i];
    }
    return count;
}

typedef struct {
    const char *name;
    int actual_crossings_val;    /* actual sign changes in validation set */
    int predicted_crossings_val; /* predicted from wave model */
    int hits;                    /* predicted crossings near actual ones */
    double accuracy;             /* hits / actual */
    double top_freq;             /* dominant wave frequency */
} PredResult;

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== Experiment 36: Breach Prediction from Waves ===\n\n");
    printf("Train on [1, 500K]. Predict breaches in [500K, 1M]. Validate.\n\n");

    time_t start = time(NULL);

    /* sieve */
    char *sieve = calloc(TOTAL_N + 1, 1);
    for (int i=2; (long long)i*i <= TOTAL_N; i++)
        if (!sieve[i]) for (long long j=(long long)i*i; j<=TOTAL_N; j+=i) sieve[j]=1;

    double *func = calloc(TOTAL_N + 2, sizeof(double));
    double *logx = malloc((TOTAL_N + 2) * sizeof(double));
    for (int i=1; i<=TOTAL_N; i++) logx[i] = log((double)i);

    PredResult results[20];
    int nr = 0;

    printf("  Function          │ Train waves │ Actual SC │ Pred SC │ Hits  │ Accuracy │ γ₁\n");
    printf("  ──────────────────┼─────────────┼───────────┼─────────┼───────┼──────────┼──────\n");

    /* === Function 1: M(x)/√x === */
    { double sum=0; for(int i=1;i<=TOTAL_N;i++){sum+=mobius_val(i); func[i]=sum/sqrt(i);}
      Wave waves[MAX_WAVES]; int nw = extract_waves(func, TRAIN_N, waves, MAX_WAVES);
      double dc=0; for(int i=1;i<=TRAIN_N;i++) dc+=func[i]; dc/=TRAIN_N;
      int actual = count_sign_changes(func, TRAIN_N, TOTAL_N);
      /* predict: scan reconstruction for sign changes in validation range */
      int predicted = 0, hits = 0;
      double prev = reconstruct(waves, nw, dc, logx[TRAIN_N]);
      for (int i=TRAIN_N+100; i<=TOTAL_N; i+=100) {
        double val = reconstruct(waves, nw, dc, logx[i]);
        if (val * prev < 0) { predicted++;
          /* check if actual function also crosses near here */
          int near = 0; for (int j=i-200; j<=i+200 && j<=TOTAL_N; j++) {
            if (j>1 && func[j]*func[j-1]<0) { near=1; break; } }
          if (near) hits++;
        }
        prev = val;
      }
      double acc = predicted > 0 ? 100.0*hits/predicted : 0;
      printf("  M(x)/√x         │     %3d     │   %5d   │  %5d  │ %5d │  %5.1f%%  │ %5.1f\n",
             nw, actual, predicted, hits, acc, nw>0?waves[0].freq:0);
      results[nr++] = (PredResult){"M(x)/√x", actual, predicted, hits, acc, nw>0?waves[0].freq:0};
    }

    /* === Function 2: ψ(x)-x / √x === */
    { double sum=0; for(int i=1;i<=TOTAL_N;i++){
        if(!sieve[i]&&i>=2){long long pk=i; while(pk<=TOTAL_N){sum+=log((double)i); if(pk>TOTAL_N/i)break; pk*=i;}}
        func[i]=(sum-(double)i)/sqrt(i);}
      Wave waves[MAX_WAVES]; int nw = extract_waves(func, TRAIN_N, waves, MAX_WAVES);
      double dc=0; for(int i=1;i<=TRAIN_N;i++) dc+=func[i]; dc/=TRAIN_N;
      int actual = count_sign_changes(func, TRAIN_N, TOTAL_N);
      int predicted=0, hits=0;
      double prev = reconstruct(waves, nw, dc, logx[TRAIN_N]);
      for (int i=TRAIN_N+100; i<=TOTAL_N; i+=100) {
        double val = reconstruct(waves, nw, dc, logx[i]);
        if (val*prev<0) { predicted++;
          int near=0; for(int j=i-200;j<=i+200&&j<=TOTAL_N;j++){if(j>1&&func[j]*func[j-1]<0){near=1;break;}} if(near)hits++; }
        prev = val;
      }
      double acc = predicted>0?100.0*hits/predicted:0;
      printf("  ψ(x)-x/√x      │     %3d     │   %5d   │  %5d  │ %5d │  %5.1f%%  │ %5.1f\n",
             nw, actual, predicted, hits, acc, nw>0?waves[0].freq:0);
      results[nr++] = (PredResult){"ψ(x)-x/√x", actual, predicted, hits, acc, nw>0?waves[0].freq:0};
    }

    /* === Function 3: Σμ(n)/n === */
    { double sum=0; for(int i=1;i<=TOTAL_N;i++){sum+=(double)mobius_val(i)/i; func[i]=sum;}
      Wave waves[MAX_WAVES]; int nw = extract_waves(func, TRAIN_N, waves, MAX_WAVES);
      double dc=0; for(int i=1;i<=TRAIN_N;i++) dc+=func[i]; dc/=TRAIN_N;
      int actual = count_sign_changes(func, TRAIN_N, TOTAL_N);
      int predicted=0, hits=0;
      double prev = reconstruct(waves, nw, dc, logx[TRAIN_N]);
      for (int i=TRAIN_N+100; i<=TOTAL_N; i+=100) {
        double val = reconstruct(waves, nw, dc, logx[i]);
        if (val*prev<0) { predicted++;
          int near=0; for(int j=i-200;j<=i+200&&j<=TOTAL_N;j++){if(j>1&&func[j]*func[j-1]<0){near=1;break;}} if(near)hits++; }
        prev = val;
      }
      double acc = predicted>0?100.0*hits/predicted:0;
      printf("  Σμ(n)/n         │     %3d     │   %5d   │  %5d  │ %5d │  %5.1f%%  │ %5.1f\n",
             nw, actual, predicted, hits, acc, nw>0?waves[0].freq:0);
      results[nr++] = (PredResult){"Σμ(n)/n", actual, predicted, hits, acc, nw>0?waves[0].freq:0};
    }

    /* === Function 4: div_err/√x === */
    { double dsum=0; for(int i=1;i<=TOTAL_N;i++){dsum+=divisor_count(i);
        double expect=i*(logx[i]+2*0.5772156649-1); func[i]=(dsum-expect)/sqrt(i);}
      Wave waves[MAX_WAVES]; int nw = extract_waves(func, TRAIN_N, waves, MAX_WAVES);
      double dc=0; for(int i=1;i<=TRAIN_N;i++) dc+=func[i]; dc/=TRAIN_N;
      int actual = count_sign_changes(func, TRAIN_N, TOTAL_N);
      int predicted=0, hits=0;
      double prev = reconstruct(waves, nw, dc, logx[TRAIN_N]);
      for (int i=TRAIN_N+100; i<=TOTAL_N; i+=100) {
        double val = reconstruct(waves, nw, dc, logx[i]);
        if (val*prev<0) { predicted++;
          int near=0; for(int j=i-200;j<=i+200&&j<=TOTAL_N;j++){if(j>1&&func[j]*func[j-1]<0){near=1;break;}} if(near)hits++; }
        prev = val;
      }
      double acc = predicted>0?100.0*hits/predicted:0;
      printf("  div_err/√x      │     %3d     │   %5d   │  %5d  │ %5d │  %5.1f%%  │ %5.1f\n",
             nw, actual, predicted, hits, acc, nw>0?waves[0].freq:0);
      results[nr++] = (PredResult){"div_err/√x", actual, predicted, hits, acc, nw>0?waves[0].freq:0};
    }

    /* === Function 5: sqfree_err/√x === */
    { double ssum=0; for(int i=1;i<=TOTAL_N;i++){ssum+=(mobius_val(i)!=0)?1:0;
        double expect=6.0*i/(M_PI*M_PI); func[i]=(ssum-expect)/sqrt(i);}
      Wave waves[MAX_WAVES]; int nw = extract_waves(func, TRAIN_N, waves, MAX_WAVES);
      double dc=0; for(int i=1;i<=TRAIN_N;i++) dc+=func[i]; dc/=TRAIN_N;
      int actual = count_sign_changes(func, TRAIN_N, TOTAL_N);
      int predicted=0, hits=0;
      double prev = reconstruct(waves, nw, dc, logx[TRAIN_N]);
      for (int i=TRAIN_N+100; i<=TOTAL_N; i+=100) {
        double val = reconstruct(waves, nw, dc, logx[i]);
        if (val*prev<0) { predicted++;
          int near=0; for(int j=i-200;j<=i+200&&j<=TOTAL_N;j++){if(j>1&&func[j]*func[j-1]<0){near=1;break;}} if(near)hits++; }
        prev = val;
      }
      double acc = predicted>0?100.0*hits/predicted:0;
      printf("  sqfree_err/√x   │     %3d     │   %5d   │  %5d  │ %5d │  %5.1f%%  │ %5.1f\n",
             nw, actual, predicted, hits, acc, nw>0?waves[0].freq:0);
      results[nr++] = (PredResult){"sqfree_err/√x", actual, predicted, hits, acc, nw>0?waves[0].freq:0};
    }

    /* === Function 6: φ_err/x === */
    { double psum=0; for(int i=1;i<=TOTAL_N;i++){
        int n=i, r=n, t=n; for(int p=2;(long long)p*p<=t;p++){if(t%p==0){while(t%p==0)t/=p;r-=r/p;}} if(t>1)r-=r/t;
        psum+=r; double expect=3.0*(double)i*i/(M_PI*M_PI); func[i]=(psum-expect)/((double)i);}
      Wave waves[MAX_WAVES]; int nw = extract_waves(func, TRAIN_N, waves, MAX_WAVES);
      double dc=0; for(int i=1;i<=TRAIN_N;i++) dc+=func[i]; dc/=TRAIN_N;
      int actual = count_sign_changes(func, TRAIN_N, TOTAL_N);
      int predicted=0, hits=0;
      double prev = reconstruct(waves, nw, dc, logx[TRAIN_N]);
      for (int i=TRAIN_N+100; i<=TOTAL_N; i+=100) {
        double val = reconstruct(waves, nw, dc, logx[i]);
        if (val*prev<0) { predicted++;
          int near=0; for(int j=i-200;j<=i+200&&j<=TOTAL_N;j++){if(j>1&&func[j]*func[j-1]<0){near=1;break;}} if(near)hits++; }
        prev = val;
      }
      double acc = predicted>0?100.0*hits/predicted:0;
      printf("  φ_err/x          │     %3d     │   %5d   │  %5d  │ %5d │  %5.1f%%  │ %5.1f\n",
             nw, actual, predicted, hits, acc, nw>0?waves[0].freq:0);
      results[nr++] = (PredResult){"φ_err/x", actual, predicted, hits, acc, nw>0?waves[0].freq:0};
    }

    /* === SUMMARY === */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: BREACH PREDICTION ACCURACY\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    double total_acc = 0; int n_with_pred = 0;
    for (int i = 0; i < nr; i++) {
        if (results[i].predicted_crossings_val > 0) {
            total_acc += results[i].accuracy;
            n_with_pred++;
        }
    }

    printf("  Functions tested: %d\n", nr);
    printf("  Functions with predictions: %d\n", n_with_pred);
    if (n_with_pred > 0)
        printf("  Mean prediction accuracy: %.1f%%\n", total_acc / n_with_pred);
    printf("\n  Train: first 500K integers\n");
    printf("  Validate: next 500K integers\n");
    printf("  A 'hit' = predicted crossing within ±200 of an actual crossing\n\n");

    printf("  If accuracy > 50%%: wave model has predictive power.\n");
    printf("  If accuracy > 80%%: wave model is reliable for breach prediction.\n");
    printf("  If accuracy < 30%%: need more waves or finer resolution.\n");

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL), start));

    free(sieve); free(func); free(logx);
    return 0;
}
