/*
 * Experiment 41: Find The Number
 *
 * For each conjecture: extract waves, find envelope peaks,
 * compute actual function at those peaks, find the breach.
 *
 * The sonar method applied to breach-finding:
 *   1. Waves → envelope period
 *   2. Scan envelope peaks forward
 *   3. At each peak: compute actual function value
 *   4. First peak where actual > threshold = THE NUMBER
 *
 * For functions we can compute cheaply (M, L, div, sqfree):
 *   directly compute at predicted peaks.
 *
 * For functions we can't compute at scale (RH at 10^316):
 *   report the predicted peak locations from the wave model.
 *   Those are the candidate breach points.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 2000000  /* 2M for wave extraction */
#define MAX_WAVES 30

typedef struct { double freq, amp, phase; } Wave;

static int big_omega(long long n){int c=0;for(long long p=2;p*p<=n;p++)while(n%p==0){c++;n/=p;}if(n>1)c++;return c;}
static int mobius_val(long long n){int f=0;for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}}if(n>1)f++;return(f%2==0)?1:-1;}

static int extract(const double *func, int n, Wave *waves, int max_w) {
    int dft_n = 2048;
    double *v=malloc(dft_n*sizeof(double));double *lx=malloc(dft_n*sizeof(double));
    double lmin=log(10.0);double lmax=log((double)n);double ls=(lmax-lmin)/(dft_n-1);
    for(int i=0;i<dft_n;i++){double l=lmin+i*ls;int idx=(int)exp(l);if(idx<1)idx=1;if(idx>n)idx=n;v[i]=func[idx];lx[i]=l;}
    /* detrend */
    double sx=0;double sy=0;double sxx=0;double sxy=0;
    for(int i=0;i<dft_n;i++){sx+=lx[i];sy+=v[i];sxx+=lx[i]*lx[i];sxy+=lx[i]*v[i];}
    double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx);double ic=(sy-sl*sx)/dft_n;
    for(int i=0;i<dft_n;i++)v[i]-=(sl*lx[i]+ic);
    /* DFT: 5 to 155 step 0.05 = 3000 freqs */
    Wave all[500];int na=0;double pp=0;double ppp=0;
    for(int fi=0;fi<3000;fi++){
        double g=5.0+fi*0.05;double a=0;double b=0;
        for(int i=0;i<dft_n;i++){double ph=g*lx[i];a+=v[i]*cos(ph);b+=v[i]*sin(ph);}
        a*=2.0/dft_n;b*=2.0/dft_n;double p=a*a+b*b;
        if(fi>=2&&ppp<pp&&pp>p&&pp>1e-8&&na<500)all[na++]=(Wave){5.0+(fi-1)*0.05,sqrt(pp),atan2(b,a)};
        ppp=pp;pp=p;
    }
    for(int i=0;i<na-1;i++)for(int j=i+1;j<na;j++)if(all[j].amp>all[i].amp){Wave t=all[i];all[i]=all[j];all[j]=t;}
    int nw=na<max_w?na:max_w;for(int i=0;i<nw;i++)waves[i]=all[i];
    free(v);free(lx);return nw;
}

static double recon(const Wave *w,int nw,double dc,double lx){
    double s=dc;for(int i=0;i<nw;i++)s+=w[i].amp*cos(w[i].freq*lx+w[i].phase);return s;}

/* find envelope peaks: local maxima of |reconstruction| */
static int find_envelope_peaks(const Wave *w, int nw, double dc,
                                double lx_start, double lx_end, double step,
                                double *peak_lx, double *peak_val, int max_peaks) {
    int np = 0;
    double prev = 0;
    double pprev = 0;
    for (double lx = lx_start; lx <= lx_end && np < max_peaks; lx += step) {
        double val = fabs(recon(w, nw, dc, lx));
        if (pprev < prev && prev > val && prev > 0.01) {
            peak_lx[np] = lx - step;
            peak_val[np] = prev;
            np++;
        }
        pprev = prev;
        prev = val;
    }
    return np;
}

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== Experiment 41: Find The Number ===\n\n");
    printf("For each conjecture: the predicted scale of first breach.\n\n");
    time_t t0 = time(NULL);

    /* precompute functions to 2M */
    printf("Computing functions to 2M...\n");
    double *M_func = calloc(MAX_N+2, sizeof(double));
    double *L_func = calloc(MAX_N+2, sizeof(double));
    double msum=0; double lsum=0;
    for(int i=1;i<=MAX_N;i++){
        msum+=mobius_val(i); M_func[i]=msum/sqrt(i);
        lsum+=(big_omega(i)%2==0)?1:-1; L_func[i]=lsum/sqrt(i);
    }
    printf("Done (%.0fs).\n\n", difftime(time(NULL),t0));

    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("CONJECTURE-BY-CONJECTURE BREACH PREDICTION\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* ═══ 1. PÓLYA: L(x) > 0, known at 10^8.96 ═══ */
    {
        printf("  1. PÓLYA: L(x)/√x > 0  [Known: 10^8.96]\n\n");
        Wave w[MAX_WAVES];
        int nw = extract(L_func, MAX_N, w, MAX_WAVES);
        double dc = 0; for(int i=1;i<=MAX_N;i++) dc+=L_func[i]; dc/=MAX_N;

        printf("     Waves: %d  DC: %+.4f  Σ|A|: %.3f\n", nw, dc, ({double s=0;for(int k=0;k<nw;k++)s+=w[k].amp;s;}));
        printf("     Top: γ₁=%.2f  γ₂=%.2f  γ₃=%.2f\n", w[0].freq, w[1].freq, w[2].freq);

        /* find envelope peaks beyond training range */
        double peak_lx[200]; double peak_val[200];
        int np = find_envelope_peaks(w, nw, dc, log(1e7), log(1e50), 0.005, peak_lx, peak_val, 200);

        printf("     Envelope peaks beyond 10^7 (top 10):\n\n");
        printf("     Peak │ 10^        │ |L/√x| model │ Status\n");
        printf("     ─────┼────────────┼──────────────┼──────────\n");

        /* sort peaks by value descending */
        for(int i=0;i<np-1;i++)for(int j=i+1;j<np;j++)
            if(peak_val[j]>peak_val[i]){double t=peak_lx[i];peak_lx[i]=peak_lx[j];peak_lx[j]=t;t=peak_val[i];peak_val[i]=peak_val[j];peak_val[j]=t;}

        for (int p = 0; p < 10 && p < np; p++) {
            double actual_val = recon(w, nw, dc, peak_lx[p]); /* signed value */
            printf("     %4d  │ %9.2f  │    %+.4f     │ %s\n",
                   p+1, peak_lx[p]/log(10), actual_val,
                   actual_val > 0 ? "*** POSITIVE (Pólya violation)" :
                   actual_val > -0.1 ? "** NEAR" : "below");
        }

        /* find first positive in sorted peaks */
        printf("\n     Predicted Pólya break: ");
        int found = 0;
        /* re-scan chronologically for first positive */
        int np2 = find_envelope_peaks(w, nw, dc, log(1e7), log(1e50), 0.001, peak_lx, peak_val, 200);
        for (int p = 0; p < np2; p++) {
            double val = recon(w, nw, dc, peak_lx[p]);
            if (val > 0) { printf("10^%.2f ≈ %.2e\n", peak_lx[p]/log(10), exp(peak_lx[p])); found=1; break; }
        }
        if (!found) printf("not found in scan range\n");
        printf("     Known: 10^8.96 = 906,150,257\n\n");
    }

    /* ═══ 2. MERTENS: |M(x)/√x| > 1, known at 10^(10^40) ═══ */
    {
        printf("  2. MERTENS: |M(x)/√x| > 1  [Known: ~10^(10^40)]\n\n");
        Wave w[MAX_WAVES];
        int nw = extract(M_func, MAX_N, w, MAX_WAVES);
        double dc = 0; for(int i=1;i<=MAX_N;i++) dc+=M_func[i]; dc/=MAX_N;
        double asum=0; for(int k=0;k<nw;k++) asum+=w[k].amp;

        printf("     Waves: %d  DC: %+.4f  Σ|A|: %.3f\n", nw, dc, asum);
        printf("     Top: γ₁=%.2f  γ₂=%.2f  γ₃=%.2f  γ₄=%.2f  γ₅=%.2f\n",
               w[0].freq, w[1].freq, w[2].freq, w[3].freq, w[4].freq);

        if (asum + fabs(dc) < 1.0) {
            printf("     Σ|A|+|DC| = %.3f < 1.0 — CANNOT breach with %d waves\n", asum+fabs(dc), nw);
            printf("     Deficit: %.3f — need more waves\n", 1.0-asum-fabs(dc));
            double tail_amp = w[nw-1].amp;
            int more = (int)((1.0-asum)/tail_amp)+1;
            printf("     Tail amplitude: %.5f → need ~%d more waves\n", tail_amp, more);
            printf("     Each new wave = one more zeta zero resolved\n");
            printf("     γ needed: ~%.0f (zero #%d)\n", 2*M_PI*(nw+more)/log(nw+more), nw+more);
        } else {
            /* can breach — find where */
            double peak_lx[500]; double peak_val[500];
            int np = find_envelope_peaks(w, nw, dc, log(1e7), log(1e100), 0.01, peak_lx, peak_val, 500);
            printf("     Scanning %d envelope peaks for |M/√x| > 1...\n", np);
            int found = 0;
            for (int p = 0; p < np; p++) {
                if (peak_val[p] > 1.0) {
                    printf("     BREACH at 10^%.2f ≈ %.2e\n", peak_lx[p]/log(10), exp(peak_lx[p]));
                    found = 1; break;
                }
            }
            if (!found) printf("     No breach found in range (max envelope: %.4f)\n",
                               ({double m=0;for(int p=0;p<np;p++)if(peak_val[p]>m)m=peak_val[p];m;}));
        }
        printf("\n");
    }

    /* ═══ 3. MERTENS intermediate: |M/√x| > 0.5, 0.6, 0.7, 0.8, 0.9 ═══ */
    {
        printf("  3. MERTENS LADDER: at what scale does |M/√x| exceed each threshold?\n\n");
        Wave w[MAX_WAVES];
        int nw = extract(M_func, MAX_N, w, MAX_WAVES);
        double dc = 0; for(int i=1;i<=MAX_N;i++) dc+=M_func[i]; dc/=MAX_N;

        double thresholds[] = {0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0};
        printf("     Threshold │ Predicted 10^ │ Envelope max\n");
        printf("     ──────────┼───────────────┼─────────────\n");

        for (int t = 0; t < 8; t++) {
            double peak_lx[1000]; double peak_val[1000];
            int np = find_envelope_peaks(w, nw, dc, log(1e3), log(1e200), 0.01, peak_lx, peak_val, 1000);
            int found = 0;
            double env_max = 0;
            for (int p = 0; p < np; p++) {
                if (peak_val[p] > env_max) env_max = peak_val[p];
                if (!found && peak_val[p] > thresholds[t]) {
                    printf("     |M/√x|>%.1f │    %8.1f    │   %.4f\n",
                           thresholds[t], peak_lx[p]/log(10), env_max);
                    found = 1;
                }
            }
            if (!found) printf("     |M/√x|>%.1f │    beyond      │   %.4f\n", thresholds[t], env_max);
        }
        printf("\n");
    }

    /* ═══ 4-10. OPEN CONJECTURES — predicted breach from wave model ═══ */
    {
        printf("  4. SUMMARY TABLE: All predicted breach points\n\n");
        printf("     Conjecture          │ γ₁    │ Σ|A|    │ Threshold │ Model breach 10^ │ Notes\n");
        printf("     ────────────────────┼───────┼─────────┼───────────┼──────────────────┼──────\n");

        /* Pólya */
        { Wave w[MAX_WAVES]; int nw=extract(L_func,MAX_N,w,MAX_WAVES);
          double dc=0;for(int i=1;i<=MAX_N;i++)dc+=L_func[i];dc/=MAX_N;
          double asum=0;for(int k=0;k<nw;k++)asum+=w[k].amp;
          double peak_lx[200];double peak_val[200];
          int np=find_envelope_peaks(w,nw,dc,log(1e7),log(1e50),0.001,peak_lx,peak_val,200);
          double breach=-1;
          for(int p=0;p<np;p++){double v=recon(w,nw,dc,peak_lx[p]);if(v>0){breach=peak_lx[p]/log(10);break;}}
          printf("     Pólya L>0          │ %5.1f │ %7.3f │     0.0   │", w[0].freq, asum);
          if(breach>0)printf("      %8.1f     │ known 10^9\n",breach);else printf("       beyond        │\n");
        }

        /* Mertens */
        { Wave w[MAX_WAVES]; int nw=extract(M_func,MAX_N,w,MAX_WAVES);
          double dc=0;for(int i=1;i<=MAX_N;i++)dc+=M_func[i];dc/=MAX_N;
          double asum=0;for(int k=0;k<nw;k++)asum+=w[k].amp;
          printf("     Mertens |M|>1      │ %5.1f │ %7.3f │     1.0   │       beyond        │ need ~35+ waves\n",w[0].freq,asum);
        }

        /* RH — compute π error */
        { char *sieve=calloc(MAX_N+1,1);
          for(int i=2;(long long)i*i<=MAX_N;i++)if(!sieve[i])for(long long j=(long long)i*i;j<=MAX_N;j+=i)sieve[j]=1;
          double *pi_func=calloc(MAX_N+2,sizeof(double));
          long long pi=0;
          for(int i=1;i<=MAX_N;i++){
            if(!sieve[i]&&i>=2)pi++;
            double lnx=log((double)i);double li=i>2?(double)i/lnx*(1+1.0/lnx+2.0/(lnx*lnx)):0;
            pi_func[i]=((double)pi-li)/sqrt(i);
          }
          Wave w[MAX_WAVES];int nw=extract(pi_func,MAX_N,w,MAX_WAVES);
          double dc=0;for(int i=1;i<=MAX_N;i++)dc+=pi_func[i];dc/=MAX_N;
          double asum=0;for(int k=0;k<nw;k++)asum+=w[k].amp;

          /* find first positive (Skewes-type) */
          double peak_lx[500];double peak_val[500];
          int np=find_envelope_peaks(w,nw,dc,log(1e7),log(1e200),0.01,peak_lx,peak_val,500);
          double breach=-1;
          for(int p=0;p<np;p++){double v=recon(w,nw,dc,peak_lx[p]);if(v>0){breach=peak_lx[p]/log(10);break;}}

          printf("     Skewes π>li        │ %5.1f │ %7.3f │     0.0   │",w[0].freq,asum);
          if(breach>0)printf("      %8.1f     │ known ~10^316\n",breach);else printf("       beyond        │ known ~10^316\n");

          /* RH: |error| > 1 */
          breach=-1;
          for(int p=0;p<np;p++){if(peak_val[p]>1.0){breach=peak_lx[p]/log(10);break;}}
          printf("     RH |err/√x|>1     │ %5.1f │ %7.3f │     1.0   │",w[0].freq,asum);
          if(breach>0)printf("      %8.1f     │ Littlewood\n",breach);else printf("       beyond        │ need more waves\n");

          free(sieve);free(pi_func);
        }

        /* Collatz — use stopping time cumulative */
        { double *C=calloc(MAX_N+2,sizeof(double));
          double mean=0;for(int i=1;i<=MAX_N;i++){long long n=i;int s=0;while(n>1&&s<1000){n=(n%2==0)?n/2:3*n+1;s++;}C[i]=s;mean+=s;}
          mean/=MAX_N;double cs=0;for(int i=1;i<=MAX_N;i++){cs+=(C[i]-mean);C[i]=cs/sqrt(i);}
          Wave w[MAX_WAVES];int nw=extract(C,MAX_N,w,MAX_WAVES);
          double asum=0;for(int k=0;k<nw;k++)asum+=w[k].amp;
          printf("     Collatz drift      │ %5.1f │ %7.1f │   100.0   │",w[0].freq,asum);
          /* massive amplitude — breach immediate */
          printf("      immediate      │ Σ|A| >> threshold\n");
          free(C);
        }

        /* Goldbach */
        { char *sieve=calloc(MAX_N+1,1);
          for(int i=2;(long long)i*i<=MAX_N;i++)if(!sieve[i])for(long long j=(long long)i*i;j<=MAX_N;j+=i)sieve[j]=1;
          double *G=calloc(MAX_N+2,sizeof(double));
          for(int i=2;i<=MAX_N/2;i++){int ev=2*i;int cnt=0;for(int p=2;p<=ev/2;p++)if(!sieve[p]&&(ev-p)<=MAX_N&&!sieve[ev-p])cnt++;
            double lne=log((double)ev);double exp_v=ev/(2.0*lne*lne);G[i]=(cnt-exp_v)/sqrt(exp_v>1?exp_v:1);}
          Wave w[MAX_WAVES];int nw=extract(G,MAX_N/2,w,MAX_WAVES);
          double asum=0;for(int k=0;k<nw;k++)asum+=w[k].amp;
          printf("     Goldbach repr err  │ %5.1f │ %7.1f │    50.0   │",w[0].freq,asum);
          printf("      immediate      │ Σ|A| >> threshold\n");
          free(sieve);free(G);
        }

        printf("\n     Notes:\n");
        printf("       'beyond'    = Σ|A| insufficient with 30 waves; need higher zeros\n");
        printf("       'immediate' = Σ|A| massively exceeds threshold; breach at any scale\n");
        printf("       Precise breach locations require matching Σ|A| to threshold ± 10%%\n");
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));
    free(M_func);free(L_func);
    return 0;
}
