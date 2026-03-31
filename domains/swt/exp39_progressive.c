/*
 * Experiment 39: Progressive Wave Lock — Sonar Method
 *
 * Don't compute everything then analyse. Analyse AS you compute.
 * Each doubling of data refines the wave. Once locked, project forward.
 *
 * For Mertens M(x)/√x:
 *   1. Compute to N=1000, extract waves
 *   2. Double N, re-extract, check if frequencies shifted
 *   3. When frequencies stabilise: LOCKED
 *   4. Predict next crest, compute only at that point
 *   5. Validate and project further
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 5000000
#define MAX_WAVES 30

typedef struct { double freq, amp, phase; } Wave;

static int mobius_val(long long n) {
    int f=0; for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}} if(n>1)f++; return(f%2==0)?1:-1;
}
static int big_omega(long long n) {
    int c=0; for(long long p=2;p*p<=n;p++) while(n%p==0){c++;n/=p;} if(n>1)c++; return c;
}

static double rz[] = {
    14.13,21.02,25.01,30.42,32.94,37.59,40.92,43.33,48.01,49.77,
    52.97,56.45,59.35,60.83,65.11,67.08,69.55,72.07,75.70,77.14
};

/* extract top waves from func[1..n] */
static int extract(const double *func, int n, Wave *waves, int max_w,
                    double freq_min, double freq_max, double freq_step, int dft_n) {
    double *vals = malloc(dft_n * sizeof(double));
    double *logx = malloc(dft_n * sizeof(double));
    double lmin = log(10.0), lmax = log((double)n);
    double lstep = (lmax - lmin) / (dft_n - 1);

    for (int i = 0; i < dft_n; i++) {
        double lx = lmin + i * lstep;
        int idx = (int)exp(lx); if(idx<1)idx=1; if(idx>n)idx=n;
        vals[i] = func[idx]; logx[i] = lx;
    }

    /* detrend */
    double sx=0,sy=0,sxx=0,sxy=0;
    for(int i=0;i<dft_n;i++){sx+=logx[i];sy+=vals[i];sxx+=logx[i]*logx[i];sxy+=logx[i]*vals[i];}
    double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx);
    double ic=(sy-sl*sx)/dft_n;
    for(int i=0;i<dft_n;i++) vals[i]-=(sl*logx[i]+ic);

    int nf = (int)((freq_max-freq_min)/freq_step)+1;
    if(nf>2000)nf=2000;

    Wave all[300]; int na=0;
    double prev_p=0, pprev_p=0;
    for(int fi=0;fi<nf;fi++){
        double gamma=freq_min+fi*freq_step;
        double a=0,b=0;
        for(int i=0;i<dft_n;i++){double ph=gamma*logx[i];a+=vals[i]*cos(ph);b+=vals[i]*sin(ph);}
        a*=2.0/dft_n;b*=2.0/dft_n;
        double p=a*a+b*b;
        if(fi>=2 && pprev_p<prev_p && prev_p>p && prev_p>1e-8)
            if(na<300) all[na++]=(Wave){freq_min+(fi-1)*freq_step,sqrt(prev_p),atan2(b,a)};
        pprev_p=prev_p; prev_p=p;
    }

    for(int i=0;i<na-1;i++) for(int j=i+1;j<na;j++)
        if(all[j].amp>all[i].amp){Wave t=all[i];all[i]=all[j];all[j]=t;}

    int nw=na<max_w?na:max_w;
    for(int i=0;i<nw;i++) waves[i]=all[i];
    free(vals);free(logx);
    return nw;
}

static double reconstruct(const Wave *w, int nw, double dc, double lx) {
    double s=dc; for(int i=0;i<nw;i++) s+=w[i].amp*cos(w[i].freq*lx+w[i].phase); return s;
}

/* check if two wave sets have the same top-5 frequencies (within tolerance) */
static int waves_locked(const Wave *a, int na, const Wave *b, int nb, double tol) {
    int matched = 0;
    int check = na < 5 ? na : 5;
    for (int i = 0; i < check; i++) {
        for (int j = 0; j < nb && j < 10; j++) {
            if (fabs(a[i].freq - b[j].freq) < tol) { matched++; break; }
        }
    }
    return matched;
}

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== Experiment 39: Progressive Wave Lock ===\n\n");
    printf("Sonar method: compute, extract, refine, lock, project.\n\n");
    time_t t0 = time(NULL);

    /* precompute M(x)/√x to MAX_N */
    printf("Precomputing M(x)/√x to %dM...\n", MAX_N/1000000);
    double *M = calloc(MAX_N+2, sizeof(double));
    double msum = 0;
    for(int i=1;i<=MAX_N;i++){msum+=mobius_val(i);M[i]=msum/sqrt(i);}
    printf("Done (%.0fs). Starting progressive lock.\n\n", difftime(time(NULL),t0));

    /* also precompute L(x)/√x and π error for later */
    double *L = calloc(MAX_N+2, sizeof(double));
    double lsum = 0;
    for(int i=1;i<=MAX_N;i++){lsum+=(big_omega(i)%2==0)?1:-1;L[i]=lsum/sqrt(i);}

    /* progressive doubling */
    int scales[] = {1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
                    256000, 500000, 1000000, 2000000, 5000000};
    int n_scales = 13;

    Wave prev_waves[MAX_WAVES];
    int prev_nw = 0;
    int locked = 0;
    int lock_scale = 0;

    typedef struct { const char *name; double *func; } Target;
    Target targets[] = {{"M(x)/√x", M}, {"L(x)/√x", L}};
    int n_targets = 2;

    for (int t = 0; t < n_targets; t++) {
        printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
        printf("FUNCTION: %s\n", targets[t].name);
        printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

        printf("  Scale   │ Waves │ γ₁     │ γ₂     │ γ₃     │ γ₄     │ γ₅     │ Locked │ Σ|A|\n");
        printf("  ────────┼───────┼────────┼────────┼────────┼────────┼────────┼────────┼──────\n");

        prev_nw = 0; locked = 0; lock_scale = 0;

        for (int s = 0; s < n_scales; s++) {
            int N = scales[s];
            if (N > MAX_N) break;

            int dft_n = N < 512 ? N/2 : (N < 4096 ? 512 : 1024);
            Wave waves[MAX_WAVES];
            int nw = extract(targets[t].func, N, waves, MAX_WAVES, 5, 120, 0.1, dft_n);

            /* check lock */
            int lock_count = 0;
            if (prev_nw > 0) lock_count = waves_locked(waves, nw, prev_waves, prev_nw, 0.5);

            if (lock_count >= 4 && !locked) { locked = 1; lock_scale = N; }

            double amp_sum = 0;
            for (int k = 0; k < nw; k++) amp_sum += waves[k].amp;

            printf("  %7d │  %3d  │", N, nw);
            for (int k = 0; k < 5; k++) {
                if (k < nw) printf(" %6.2f │", waves[k].freq);
                else printf("    —   │");
            }
            printf(" %s%d/5 │ %.3f\n", locked ? "***" : "   ", lock_count, amp_sum);

            /* save for next comparison */
            for (int k = 0; k < nw && k < MAX_WAVES; k++) prev_waves[k] = waves[k];
            prev_nw = nw;

            /* if locked, do projection */
            if (locked && s == n_scales - 1) {
                printf("\n  LOCKED at scale %d. Projecting forward.\n\n", lock_scale);

                double dc = 0;
                for (int i = 1; i <= N; i++) dc += targets[t].func[i];
                dc /= N;

                printf("  DC: %+.6f  Σ|A|: %.4f  Max interference: %.4f\n", dc, amp_sum, amp_sum + fabs(dc));

                /* envelope at large scales */
                printf("\n  Scale      │ Max |val| │ Envelope\n");
                printf("  ───────────┼───────────┼─────────\n");

                double env_max = 0;
                for (double log_scale = 10; log_scale <= 1000; log_scale *= 1.5) {
                    double lx_c = log_scale * log(10);
                    double best = 0;
                    for (double lx = lx_c - log(10); lx <= lx_c + log(10); lx += 0.001) {
                        double val = reconstruct(waves, nw, dc, lx);
                        if (fabs(val) > best) best = fabs(val);
                    }
                    if (best > env_max) env_max = best;
                    printf("  10^%-7.0f │   %7.4f │ %s\n", log_scale, best,
                           best > 1.0 ? "*** BREACH" : best > env_max * 0.95 ? "↑ peak" : "");
                }

                printf("\n  Envelope max: %.4f\n", env_max);
                printf("  Breach threshold: 1.0 (Mertens) / 0.0 (Pólya)\n");

                if (t == 0) { /* Mertens */
                    printf("  With %d waves, max = %.4f (%.0f%% of breach)\n",
                           nw, env_max, env_max * 100);
                    if (env_max < 1.0) {
                        double deficit = 1.0 - amp_sum;
                        double tail_amp = nw > 5 ? waves[nw-1].amp : 0.001;
                        int more_needed = (int)(deficit / tail_amp);
                        printf("  Need ~%d more waves (tail amp ~%.5f)\n", more_needed, tail_amp);
                        /* waves correspond to zeta zeros, which have density ~log(γ)/(2π) */
                        /* γ_n ≈ 2πn/log(n) for large n */
                        double gamma_needed = 2 * M_PI * (nw + more_needed) / log(nw + more_needed);
                        printf("  Highest γ needed: ~%.0f\n", gamma_needed);
                        printf("  Requires scale: ~10^%.0f to resolve that γ\n",
                               gamma_needed / (2 * M_PI) * log(10));
                    }
                }

                if (t == 1) { /* Liouville — Pólya, threshold = 0 */
                    /* find first positive crossing */
                    printf("  Scanning for first L(x)/√x > 0...\n");
                    for (double lx = 15; lx < 200; lx += 0.001) {
                        double val = reconstruct(waves, nw, dc, lx);
                        if (val > 0) {
                            printf("  First positive: 10^%.2f ≈ %.2e\n", lx/log(10), exp(lx));
                            printf("  Known: Pólya break at 10^8.96\n");
                            printf("  Error: %.1f%%\n", fabs(lx/log(10) - 8.96) / 8.96 * 100);
                            break;
                        }
                    }
                }
            }
        }
        printf("\n");
    }

    printf("Time: %.0f seconds.\n", difftime(time(NULL), t0));
    free(M); free(L);
    return 0;
}
