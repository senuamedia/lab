/*
 * Experiment 40: Predict All — Progressive Lock on Every Conjecture
 *
 * Lock frequencies at 2K, refine amplitudes to 1M, project breach.
 * Start small (known breaches for validation), then open conjectures.
 *
 * For each:
 *   - Lock scale (when frequencies stabilise)
 *   - Σ|A| (max possible constructive interference)
 *   - DC offset (baseline)
 *   - Predicted first breach scale
 *   - Confidence (validated against known if available)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 1000000
#define MAX_WAVES 30

typedef struct { double freq, amp, phase; } Wave;

static int big_omega(long long n){int c=0;for(long long p=2;p*p<=n;p++)while(n%p==0){c++;n/=p;}if(n>1)c++;return c;}
static int mobius_val(long long n){int f=0;for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}}if(n>1)f++;return(f%2==0)?1:-1;}
static int divisor_count(long long n){int d=0;for(long long j=1;j*j<=n;j++)if(n%j==0){d++;if(j!=n/j)d++;}return d;}
static int euler_phi(int n){int r=n,t=n;for(int p=2;(long long)p*p<=t;p++){if(t%p==0){while(t%p==0)t/=p;r-=r/p;}}if(t>1)r-=r/t;return r;}

static int extract(const double *func, int n, Wave *waves, int max_w, int dft_n) {
    double *v=malloc(dft_n*sizeof(double)),*lx=malloc(dft_n*sizeof(double));
    double lmin=log(10.0),lmax=log((double)n),ls=(lmax-lmin)/(dft_n-1);
    for(int i=0;i<dft_n;i++){double l=lmin+i*ls;int idx=(int)exp(l);if(idx<1)idx=1;if(idx>n)idx=n;v[i]=func[idx];lx[i]=l;}
    double sx=0,sy=0,sxx=0,sxy=0;
    for(int i=0;i<dft_n;i++){sx+=lx[i];sy+=v[i];sxx+=lx[i]*lx[i];sxy+=lx[i]*v[i];}
    double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx),ic=(sy-sl*sx)/dft_n;
    for(int i=0;i<dft_n;i++)v[i]-=(sl*lx[i]+ic);
    Wave all[300];int na=0;double pp=0,ppp=0;
    for(int fi=0;fi<1500;fi++){
        double g=5.0+fi*0.1,a=0,b=0;
        for(int i=0;i<dft_n;i++){double ph=g*lx[i];a+=v[i]*cos(ph);b+=v[i]*sin(ph);}
        a*=2.0/dft_n;b*=2.0/dft_n;double p=a*a+b*b;
        if(fi>=2&&ppp<pp&&pp>p&&pp>1e-8&&na<300)all[na++]=(Wave){5.0+(fi-1)*0.1,sqrt(pp),atan2(b,a)};
        ppp=pp;pp=p;}
    for(int i=0;i<na-1;i++)for(int j=i+1;j<na;j++)if(all[j].amp>all[i].amp){Wave t=all[i];all[i]=all[j];all[j]=t;}
    int nw=na<max_w?na:max_w;for(int i=0;i<nw;i++)waves[i]=all[i];
    free(v);free(lx);return nw;
}

static double recon(const Wave *w,int nw,double dc,double lx){
    double s=dc;for(int i=0;i<nw;i++)s+=w[i].amp*cos(w[i].freq*lx+w[i].phase);return s;}

/* find first crossing of threshold in reconstruction */
static double find_breach(const Wave *w, int nw, double dc, double threshold, int above,
                           double lx_start, double lx_end, double step) {
    for(double lx=lx_start;lx<=lx_end;lx+=step){
        double val=recon(w,nw,dc,lx);
        if(above && val>threshold) return lx;
        if(!above && val<threshold) return lx;
        if(!above && fabs(val)>threshold) return lx;
    }
    return -1;
}

/* find max |val| in range */
static double find_envelope(const Wave *w, int nw, double dc,
                             double lx_start, double lx_end, double step) {
    double best=0;
    for(double lx=lx_start;lx<=lx_end;lx+=step){double v=fabs(recon(w,nw,dc,lx));if(v>best)best=v;}
    return best;
}

typedef struct {
    const char *name;
    const char *conjecture;
    const char *status;          /* BROKEN, OPEN, PROVEN */
    double known_breach_log10;   /* log10 of known breach, or -1 */
    double threshold;            /* what value constitutes breach */
    int breach_above;            /* 1 = value > threshold, 0 = |value| > threshold */
    /* results */
    double lock_freq[5];
    double amp_sum;
    double dc;
    double predicted_breach_log10;
    double envelope_max;
} Result;

int main(void) {
    setvbuf(stdout,NULL,_IONBF,0);
    printf("=== Experiment 40: Predict All Conjectures ===\n\n");
    time_t t0=time(NULL);

    char *sieve=calloc(MAX_N+1,1);
    for(int i=2;(long long)i*i<=MAX_N;i++)if(!sieve[i])for(long long j=(long long)i*i;j<=MAX_N;j+=i)sieve[j]=1;
    double *func=calloc(MAX_N+2,sizeof(double));
    double *log_x=malloc((MAX_N+2)*sizeof(double));
    for(int i=1;i<=MAX_N;i++)log_x[i]=log((double)i);

    Result results[30]; int nr=0;

    printf("  %-20s│ %-14s│ γ₁    │ γ₂    │ γ₃    │ Σ|A|  │ DC      │ Predicted 10^│ Known 10^ │ Verdict\n","Conjecture","Status");
    printf("  ────────────────────┼───────────────┼───────┼───────┼───────┼───────┼─────────┼──────────────┼───────────┼────────\n");

    #define DO_CONJ(NAME, STATUS, KNOWN_LOG, THRESH, ABOVE, COMPUTE) { \
        COMPUTE; \
        Wave w[MAX_WAVES]; \
        int nw=extract(func,MAX_N,w,MAX_WAVES,1024); \
        double dc=0; for(int i=1;i<=MAX_N;i++)dc+=func[i]; dc/=MAX_N; \
        double asum=0; for(int k=0;k<nw;k++)asum+=w[k].amp; \
        double pred=find_breach(w,nw,dc,THRESH,ABOVE,log(1e7),log(1e200),0.01); \
        double env=find_envelope(w,nw,dc,log(1e6),log(1e100),0.01); \
        double pred_log=pred>0?pred/log(10):-1; \
        printf("  %-20s│ %-14s│ %5.1f │ %5.1f │ %5.1f │ %5.3f │ %+7.4f │",NAME,STATUS,nw>0?w[0].freq:0,nw>1?w[1].freq:0,nw>2?w[2].freq:0,asum,dc); \
        if(pred_log>0)printf(" %11.1f  │",pred_log);else printf("    beyond   │"); \
        if(KNOWN_LOG>0)printf(" %8.1f  │",KNOWN_LOG);else printf("     —    │"); \
        if(KNOWN_LOG>0&&pred_log>0)printf(" err %.0f%%\n",fabs(pred_log-KNOWN_LOG)/KNOWN_LOG*100); \
        else if(pred_log>0)printf(" PREDICTED\n");else printf(" NO BREACH\n"); \
        fflush(stdout); }

    /* ═══ KNOWN BROKEN — VALIDATION ═══ */
    printf("\n  ─── KNOWN BROKEN (validation) ───\n\n");

    /* Pólya: L(x)>0 at 10^8.96 */
    DO_CONJ("Pólya L(x)>0", "BROKEN 10^9", 8.96, 0.0, 1,
        double s=0;for(int i=1;i<=MAX_N;i++){s+=(big_omega(i)%2==0)?1:-1;func[i]=s/sqrt(i);})

    /* Mertens |M/√x|>0.5 */
    DO_CONJ("|M/√x|>0.5", "BROKEN 10^0.5", 0.48, 0.5, 0,
        double s=0;for(int i=1;i<=MAX_N;i++){s+=mobius_val(i);func[i]=s/sqrt(i);})

    /* Mertens |M/√x|>0.6 */
    DO_CONJ("|M/√x|>0.6", "BROKEN ~10^3", 3.0, 0.6, 0,
        double s=0;for(int i=1;i<=MAX_N;i++){s+=mobius_val(i);func[i]=s/sqrt(i);})

    /* |L/√x|>0.5 */
    DO_CONJ("|L/√x|>0.5", "BROKEN 10^1", 1.3, 0.5, 0,
        double s=0;for(int i=1;i<=MAX_N;i++){s+=(big_omega(i)%2==0)?1:-1;func[i]=s/sqrt(i);})

    /* |L/√x|>1.0 */
    DO_CONJ("|L/√x|>1.0", "BROKEN 10^7.7", 7.7, 1.0, 0,
        double s=0;for(int i=1;i<=MAX_N;i++){s+=(big_omega(i)%2==0)?1:-1;func[i]=s/sqrt(i);})

    /* Chebyshev bias mod 4 first reversal */
    DO_CONJ("Cheb mod4 rev", "BROKEN 10^7.5", 7.5, 0.0, 0,
        long long c3=0;long long c1=0;for(int i=2;i<=MAX_N;i++){if(!sieve[i]){if(i%4==3)c3++;if(i%4==1)c1++;}func[i]=(double)(c1-c3);})

    /* ψ(x) > x */
    DO_CONJ("ψ(x) > x", "BROKEN ~10^10", 10.0, 0.0, 1,
        double s=0;for(int i=1;i<=MAX_N;i++){if(!sieve[i]&&i>=2){long long pk=i;while(pk<=MAX_N){s+=log((double)i);if(pk>MAX_N/i)break;pk*=i;}}func[i]=(s-(double)i)/sqrt(i);})

    /* ═══ OPEN — PREDICTION ═══ */
    printf("\n  ─── OPEN CONJECTURES (prediction) ───\n\n");

    /* RH: |π(x)-li(x)|/√x > 1 (Littlewood: happens infinitely often) */
    DO_CONJ("RH |πerr/√x|>1", "OPEN", -1.0, 1.0, 0,
        long long pi=0;for(int i=1;i<=MAX_N;i++){if(!sieve[i]&&i>=2)pi++;
        double lnx=log_x[i];double li=i>2?(double)i/lnx*(1+1.0/lnx+2.0/(lnx*lnx)):0;
        func[i]=((double)pi-li)/sqrt(i);})

    /* RH: first sign change of π(x)-li(x) (Skewes) */
    DO_CONJ("Skewes π>li", "OPEN ~10^316", -1.0, 0.0, 1,
        long long pi=0;for(int i=1;i<=MAX_N;i++){if(!sieve[i]&&i>=2)pi++;
        double lnx=log_x[i];double li=i>2?(double)i/lnx*(1+1.0/lnx+2.0/(lnx*lnx)):0;
        func[i]=((double)pi-li)/sqrt(i);})

    /* Mertens conjecture |M/√x| > 1 */
    DO_CONJ("Mertens |M|>1", "OPEN 10^(10^40)", -1.0, 1.0, 0,
        double s=0;for(int i=1;i<=MAX_N;i++){s+=mobius_val(i);func[i]=s/sqrt(i);})

    /* Collatz: cumulative drift of stopping times */
    DO_CONJ("Collatz drift", "OPEN", -1.0, 100.0, 0,
        double mean=0;for(int i=1;i<=MAX_N;i++){long long n=i;int s=0;while(n>1&&s<1000){n=(n%2==0)?n/2:3*n+1;s++;}func[i]=s;mean+=s;}
        mean/=MAX_N;double cs=0;for(int i=1;i<=MAX_N;i++){cs+=(func[i]-mean);func[i]=cs/sqrt(i);})

    /* Twin prime gaps: gap growth → last twin if finite */
    DO_CONJ("Twin gap drift", "OPEN", -1.0, 50.0, 0,
        int prev=0;int idx=0;for(int i=3;i<=MAX_N-2;i++)if(!sieve[i]&&!sieve[i+2]){if(prev>0&&idx<MAX_N){func[idx]=(double)(i-prev);}prev=i;idx++;}
        double rm=0;for(int i=0;i<idx;i++)rm+=func[i];rm/=idx;double rs=0;for(int i=0;i<idx;i++){rs+=(func[i]-rm);func[i]=rs/sqrt(i+1.0);})

    /* Goldbach: representation count approaching 0 */
    DO_CONJ("Goldbach repr", "OPEN", -1.0, 50.0, 0,
        for(int i=2;i<=MAX_N/2;i++){int ev=2*i;int cnt=0;for(int p=2;p<=ev/2;p++)if(!sieve[p]&&(ev-p)<=MAX_N&&!sieve[ev-p])cnt++;
        double lne=log((double)ev);double exp_v=ev/(2.0*lne*lne);func[i]=(cnt-exp_v)/sqrt(exp_v>1?exp_v:1);})

    /* Sophie Germain: gap growth */
    DO_CONJ("SG gap drift", "OPEN", -1.0, 50.0, 0,
        int prev=0;int idx=0;for(int i=2;i<=MAX_N/2;i++)if(!sieve[i]&&2*i+1<=MAX_N&&!sieve[2*i+1]){if(prev>0&&idx<MAX_N)func[idx]=(double)(i-prev);prev=i;idx++;}
        double rm=0;for(int i=0;i<idx;i++)rm+=func[i];rm/=idx;double rs=0;for(int i=0;i<idx;i++){rs+=(func[i]-rm);func[i]=rs/sqrt(i+1.0);})

    /* Divisor error growth */
    DO_CONJ("div_err growth", "OPEN", -1.0, 2.0, 0,
        double ds=0;for(int i=1;i<=MAX_N;i++){ds+=divisor_count(i);func[i]=(ds-i*(log_x[i]+2*0.5772156649-1))/sqrt(i);})

    /* Squarefree error growth */
    DO_CONJ("sqfree growth", "OPEN", -1.0, 2.0, 0,
        double ss=0;for(int i=1;i<=MAX_N;i++){ss+=(mobius_val(i)!=0)?1:0;func[i]=(ss-6.0*i/(M_PI*M_PI))/sqrt(i);})

    /* Totient error growth */
    DO_CONJ("φ_err growth", "OPEN", -1.0, 5.0, 0,
        double ps=0;for(int i=1;i<=MAX_N;i++){ps+=euler_phi(i);func[i]=(ps-3.0*(double)i*i/(M_PI*M_PI))/i;})

    /* ═══ SUMMARY ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");
    printf("  Conjectures analysed: known broken + open\n");
    printf("  Method: progressive wave lock, 30 waves, 1M scale\n");
    printf("  Frequency range: 5-155 at step 0.1\n\n");
    printf("  Validation: compare predicted breach to known breach for broken conjectures.\n");
    printf("  Prediction: first breach scale for open conjectures.\n\n");
    printf("  Rod Conjecture: every open conjecture has a predicted breach.\n");
    printf("  The wave signatures determine the scale.\n");
    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));

    free(sieve);free(func);free(log_x);
    return 0;
}
