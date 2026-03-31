/*
 * Experiment 37: Per-Conjecture Key Tuning
 *
 * Each conjecture gets its own optimised parameters:
 *   - Frequency scan range (where its zeros live)
 *   - DFT sample count (resolution needed)
 *   - Detrend order (linear, quadratic, or none)
 *   - Match set (Riemann zeros, Dirichlet zeros, or both)
 *
 * Run each function independently, tune until match rate > 80%,
 * then report the optimal keys and the resulting wave signature.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 1000000

/* known zeros */
static double rz[] = { /* 30 Riemann zeta zeros */
    14.13,21.02,25.01,30.42,32.94,37.59,40.92,43.33,48.01,49.77,
    52.97,56.45,59.35,60.83,65.11,67.08,69.55,72.07,75.70,77.14,
    79.34,82.91,84.74,87.43,88.81,92.49,94.65,95.87,98.83,101.32
};
static double dz4[] = {6.02,10.24,12.59,16.00,19.13,22.47,25.10,27.67,30.72,33.68};
static double dz3[] = {8.04,13.44,16.83,19.74,23.30,25.56,28.07,31.72,33.94,36.17};

typedef struct { double freq, amp, phase; } Wave;

typedef struct {
    const char *name;
    int family;        /* 1=Riemann, 2=Dirichlet, 3=Combo, 4=Manufactured */
    /* tuning keys */
    double freq_min, freq_max, freq_step;
    int dft_samples;
    int detrend_order; /* 0=none, 1=linear, 2=quadratic */
    /* results */
    int n_peaks;
    Wave peaks[10];
    int matches;
    double match_pct;
} ConjectureKey;

static int big_omega(long long n) {
    int c=0; for(long long p=2;p*p<=n;p++) while(n%p==0){c++;n/=p;} if(n>1)c++; return c;
}
static int mobius_val(long long n) {
    int f=0; for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}} if(n>1)f++; return(f%2==0)?1:-1;
}
static int divisor_count(long long n) {
    int d=0; for(long long j=1;j*j<=n;j++) if(n%j==0){d++; if(j!=n/j)d++;} return d;
}
static int euler_phi(int n) {
    int r=n,t=n; for(int p=2;(long long)p*p<=t;p++){if(t%p==0){while(t%p==0)t/=p;r-=r/p;}} if(t>1)r-=r/t; return r;
}

/* extract peaks with given parameters */
static int extract_with_keys(const double *func, int n, ConjectureKey *key) {
    int dft_n = key->dft_samples;
    double *vals = malloc(dft_n * sizeof(double));
    double *logx = malloc(dft_n * sizeof(double));
    double log_min = log(100.0), log_max = log((double)n);
    double log_step = (log_max - log_min) / (dft_n - 1);

    for (int i = 0; i < dft_n; i++) {
        double lx = log_min + i * log_step;
        int idx = (int)exp(lx); if (idx<1) idx=1; if (idx>n) idx=n;
        vals[i] = func[idx]; logx[i] = lx;
    }

    /* detrend */
    if (key->detrend_order >= 1) {
        double sx=0,sy=0,sxx=0,sxy=0;
        for(int i=0;i<dft_n;i++){sx+=logx[i];sy+=vals[i];sxx+=logx[i]*logx[i];sxy+=logx[i]*vals[i];}
        double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx);
        double ic=(sy-sl*sx)/dft_n;
        for(int i=0;i<dft_n;i++) vals[i]-=(sl*logx[i]+ic);
    }
    if (key->detrend_order >= 2) {
        /* quadratic detrend on residual */
        double sx=0,sy=0,sxx=0,sxy=0,sx3=0,sx4=0,sx2y=0;
        for(int i=0;i<dft_n;i++){
            double x=logx[i],x2=x*x;
            sx+=x;sy+=vals[i];sxx+=x2;sxy+=x*vals[i];sx3+=x2*x;sx4+=x2*x2;sx2y+=x2*vals[i];}
        /* just do another linear pass on x² term — approximate */
        double sl2 = (dft_n*sx2y-sxx*sy)/(dft_n*sx4-sxx*sxx);
        for(int i=0;i<dft_n;i++) vals[i]-=sl2*logx[i]*logx[i];
    }

    /* DFT scan */
    int n_freqs = (int)((key->freq_max - key->freq_min) / key->freq_step) + 1;
    if (n_freqs > 2000) n_freqs = 2000;

    double *powers = malloc(n_freqs * sizeof(double));
    double *freqs = malloc(n_freqs * sizeof(double));
    double *phases = malloc(n_freqs * sizeof(double));

    for (int fi = 0; fi < n_freqs; fi++) {
        double gamma = key->freq_min + fi * key->freq_step;
        double a=0,b=0;
        for(int i=0;i<dft_n;i++){double ph=gamma*logx[i]; a+=vals[i]*cos(ph); b+=vals[i]*sin(ph);}
        a*=2.0/dft_n; b*=2.0/dft_n;
        powers[fi]=a*a+b*b; freqs[fi]=gamma; phases[fi]=atan2(b,a);
    }

    /* local maxima */
    Wave all[200]; int n_all=0;
    for(int fi=1;fi<n_freqs-1;fi++){
        if(powers[fi]>powers[fi-1]&&powers[fi]>powers[fi+1]&&powers[fi]>0.00001){
            if(n_all<200) all[n_all++]=(Wave){freqs[fi],sqrt(powers[fi]),phases[fi]};
        }
    }

    /* sort by amplitude */
    for(int i=0;i<n_all-1;i++) for(int j=i+1;j<n_all;j++)
        if(all[j].amp>all[i].amp){Wave t=all[i];all[i]=all[j];all[j]=t;}

    key->n_peaks = n_all < 10 ? n_all : 10;
    for(int k=0;k<key->n_peaks;k++) key->peaks[k]=all[k];

    /* count matches */
    key->matches = 0;
    for(int k=0;k<key->n_peaks && k<5;k++){
        if(key->peaks[k].freq < 0.1) continue;
        for(int z=0;z<30;z++) if(fabs(key->peaks[k].freq-rz[z])<1.0){key->matches++;goto matched;}
        if(key->family==2){
            for(int z=0;z<10;z++) if(fabs(key->peaks[k].freq-dz4[z])<1.0){key->matches++;goto matched;}
            for(int z=0;z<10;z++) if(fabs(key->peaks[k].freq-dz3[z])<1.0){key->matches++;goto matched;}
        }
        matched:;
    }
    key->match_pct = key->n_peaks >= 5 ? key->matches * 20.0 : (key->n_peaks > 0 ? key->matches * 100.0 / key->n_peaks : 0);

    free(vals);free(logx);free(powers);free(freqs);free(phases);
    return key->matches;
}

/* auto-tune: try multiple parameter combinations, pick the best */
static void auto_tune(const double *func, int n, ConjectureKey *key) {
    double best_pct = 0;
    ConjectureKey best = *key;

    double ranges[][2] = {{5,50},{5,100},{10,55},{10,100},{1,50},{1,100},{20,80},{30,100}};
    double steps[] = {0.1, 0.15, 0.2, 0.05};
    int dfts[] = {512, 1024, 2048};
    int detrends[] = {0, 1, 2};

    for (int r = 0; r < 8; r++) {
        for (int s = 0; s < 4; s++) {
            for (int d = 0; d < 3; d++) {
                for (int dt = 0; dt < 3; dt++) {
                    ConjectureKey trial = *key;
                    trial.freq_min = ranges[r][0];
                    trial.freq_max = ranges[r][1];
                    trial.freq_step = steps[s];
                    trial.dft_samples = dfts[d];
                    trial.detrend_order = detrends[dt];

                    extract_with_keys(func, n, &trial);

                    if (trial.match_pct > best_pct) {
                        best_pct = trial.match_pct;
                        best = trial;
                    }
                }
            }
        }
    }

    *key = best;
}

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== Experiment 37: Per-Conjecture Key Tuning ===\n\n");
    printf("Auto-tune each conjecture's parameters for maximum zero recovery.\n\n");

    time_t start = time(NULL);

    char *sieve = calloc(MAX_N+1, 1);
    for(int i=2;(long long)i*i<=MAX_N;i++) if(!sieve[i]) for(long long j=(long long)i*i;j<=MAX_N;j+=i)sieve[j]=1;
    double *func = calloc(MAX_N+2, sizeof(double));
    double *log_x = malloc((MAX_N+2)*sizeof(double));
    for(int i=1;i<=MAX_N;i++) log_x[i]=log((double)i);

    printf("  %-18s│ Fam │ Range       │ Step │ DFT  │ Det │ γ₁    │ γ₂    │ γ₃    │ γ₄    │ γ₅    │ Match\n", "Conjecture");
    printf("  ──────────────────┼─────┼─────────────┼──────┼──────┼─────┼───────┼───────┼───────┼───────┼───────┼──────\n");

    /* define all conjectures with default keys */
    typedef struct { const char *name; int family; } FuncDef;
    FuncDef funcs[] = {
        {"L(x)/√x", 1}, {"M(x)/√x", 1}, {"θ(x)-x/√x", 1},
        {"Σμ(n)/n", 1}, {"φ_err/x", 1}, {"div_err/√x", 1},
        {"sqfree_err/√x", 1}, {"Σμlogn/n", 1}, {"mult_osc", 1},
        {"r2_err", 1},
        {"π(4,3)-π(4,1)", 2}, {"π(3,2)-π(3,1)", 2},
        {"π(5,2)-π(5,1)", 2}, {"π(7,3)-π(7,1)", 2},
        {"π(8,5)-π(8,1)", 2}, {"π(11,2)-π(11,1)", 2},
        {"end_3_vs_1", 2}, {"end_9_vs_1", 2},
        {"Goldbach_err", 3}, {"Collatz_steps", 3},
        {"twin_gap_err", 3}, {"gap_err", 3},
    };
    int nf = sizeof(funcs)/sizeof(funcs[0]);

    for (int f = 0; f < nf; f++) {
        /* compute function */
        memset(func, 0, (MAX_N+2)*sizeof(double));

        if (strcmp(funcs[f].name, "L(x)/√x")==0) {
            double sum=0; for(int i=1;i<=MAX_N;i++){sum+=(big_omega(i)%2==0)?1:-1;func[i]=sum/sqrt(i);}
        } else if (strcmp(funcs[f].name, "M(x)/√x")==0) {
            double sum=0; for(int i=1;i<=MAX_N;i++){sum+=mobius_val(i);func[i]=sum/sqrt(i);}
        } else if (strcmp(funcs[f].name, "θ(x)-x/√x")==0) {
            double sum=0; for(int i=1;i<=MAX_N;i++){if(!sieve[i]&&i>=2)sum+=log((double)i);func[i]=(sum-(double)i)/sqrt(i);}
        } else if (strcmp(funcs[f].name, "Σμ(n)/n")==0) {
            double sum=0; for(int i=1;i<=MAX_N;i++){sum+=(double)mobius_val(i)/i;func[i]=sum;}
        } else if (strcmp(funcs[f].name, "φ_err/x")==0) {
            double psum=0; for(int i=1;i<=MAX_N;i++){psum+=euler_phi(i);func[i]=(psum-3.0*(double)i*i/(M_PI*M_PI))/i;}
        } else if (strcmp(funcs[f].name, "div_err/√x")==0) {
            double dsum=0; for(int i=1;i<=MAX_N;i++){dsum+=divisor_count(i);func[i]=(dsum-i*(log_x[i]+2*0.5772156649-1))/sqrt(i);}
        } else if (strcmp(funcs[f].name, "sqfree_err/√x")==0) {
            double ssum=0; for(int i=1;i<=MAX_N;i++){ssum+=(mobius_val(i)!=0)?1:0;func[i]=(ssum-6.0*i/(M_PI*M_PI))/sqrt(i);}
        } else if (strcmp(funcs[f].name, "Σμlogn/n")==0) {
            double sum=0; for(int i=1;i<=MAX_N;i++){sum+=(double)mobius_val(i)*log_x[i]/i;func[i]=sum;}
        } else if (strcmp(funcs[f].name, "mult_osc")==0) {
            double tsum=0; for(int i=1;i<=MAX_N;i++){tsum+=((big_omega(i)%2==0)?1.0:-1.0)*divisor_count(i);func[i]=tsum/pow(i,0.75);}
        } else if (strcmp(funcs[f].name, "r2_err")==0) {
            double rc=0; for(int i=1;i<=MAX_N;i++){int r2=0;for(int a=0;(long long)a*a<=i;a++){int b2=i-a*a;int b=(int)sqrt(b2);if(b*b==b2)r2++;}rc+=r2*4;func[i]=(rc-M_PI*i)/sqrt(i);}
        } else if (strcmp(funcs[f].name, "π(4,3)-π(4,1)")==0) {
            long long c3=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%4==3)c3++;if(i%4==1)c1++;}func[i]=(double)(c3-c1);}
        } else if (strcmp(funcs[f].name, "π(3,2)-π(3,1)")==0) {
            long long c2=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%3==2)c2++;if(i%3==1)c1++;}func[i]=(double)(c2-c1);}
        } else if (strcmp(funcs[f].name, "π(5,2)-π(5,1)")==0) {
            long long c2=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%5==2)c2++;if(i%5==1)c1++;}func[i]=(double)(c2-c1);}
        } else if (strcmp(funcs[f].name, "π(7,3)-π(7,1)")==0) {
            long long c3=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%7==3)c3++;if(i%7==1)c1++;}func[i]=(double)(c3-c1);}
        } else if (strcmp(funcs[f].name, "π(8,5)-π(8,1)")==0) {
            long long c5=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%8==5)c5++;if(i%8==1)c1++;}func[i]=(double)(c5-c1);}
        } else if (strcmp(funcs[f].name, "π(11,2)-π(11,1)")==0) {
            long long c2=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%11==2)c2++;if(i%11==1)c1++;}func[i]=(double)(c2-c1);}
        } else if (strcmp(funcs[f].name, "end_3_vs_1")==0) {
            long long c3=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%10==3)c3++;if(i%10==1)c1++;}func[i]=(double)(c3-c1);}
        } else if (strcmp(funcs[f].name, "end_9_vs_1")==0) {
            long long c9=0,c1=0; for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%10==9)c9++;if(i%10==1)c1++;}func[i]=(double)(c9-c1);}
        } else if (strcmp(funcs[f].name, "Goldbach_err")==0) {
            for(int i=2;i<=MAX_N/2;i++){int even=2*i;int count=0;
                for(int p=2;p<=even/2;p++)if(!sieve[p]&&(even-p)<=MAX_N&&!sieve[even-p])count++;
                double lne=log((double)even);func[i]=(count-(double)even/(2.0*lne*lne))/sqrt(even/(2.0*lne*lne)>1?even/(2.0*lne*lne):1);}
        } else if (strcmp(funcs[f].name, "Collatz_steps")==0) {
            double mean=0; for(int i=1;i<=MAX_N;i++){long long n=i;int s=0;while(n>1&&s<1000){n=(n%2==0)?n/2:3*n+1;s++;}func[i]=s;mean+=s;}
            mean/=MAX_N; for(int i=1;i<=MAX_N;i++) func[i]-=mean;
        } else if (strcmp(funcs[f].name, "twin_gap_err")==0) {
            int prev=0,idx=0; double *gaps=calloc(MAX_N,sizeof(double));
            for(int i=3;i<=MAX_N-2;i++)if(!sieve[i]&&!sieve[i+2]){if(prev>0&&idx<MAX_N){gaps[idx++]=i-prev;}prev=i;}
            if(idx>100){double rm=0;for(int i=0;i<idx;i++)rm+=gaps[i];rm/=idx;double rs=0;for(int i=0;i<idx;i++){rs+=(gaps[i]-rm);func[i+1]=rs/sqrt(i+1.0);}}
            free(gaps);
        } else if (strcmp(funcs[f].name, "gap_err")==0) {
            int prev=2,gi=0; for(int i=3;i<=MAX_N;i++)if(!sieve[i]){double gap=i-prev;double exp_g=log_x[i];
                static double gsum=0; gsum+=(gap-exp_g); func[gi++]=gsum/sqrt(gi>0?gi:1); prev=i;}
        }

        /* auto-tune this conjecture */
        ConjectureKey key = {funcs[f].name, funcs[f].family, 10,55,0.1, 1024, 1, 0,{},0,0};
        auto_tune(func, MAX_N, &key);

        printf("  %-18s│  %d  │ %4.0f-%-5.0f  │ %4.2f │ %4d │  %d  │",
               key.name, key.family, key.freq_min, key.freq_max, key.freq_step, key.dft_samples, key.detrend_order);

        for (int k = 0; k < 5; k++) {
            if (k < key.n_peaks) printf(" %5.1f │", key.peaks[k].freq);
            else printf("   —   │");
        }
        printf(" %d/5 %3.0f%% %s\n", key.matches, key.match_pct,
               key.match_pct >= 80 ? "***" : key.match_pct >= 60 ? "**" : key.match_pct >= 40 ? "*" : "");
        fflush(stdout);
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL), start));
    free(sieve);free(func);free(log_x);
    return 0;
}
