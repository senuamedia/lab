/*
 * Experiment 51: Two Lines of Attack
 *
 * LINE 1: Predict π(3,2)-π(3,1) first reversal using wave model.
 *   Known answer: x = 608,981,813,029 (Bays-Hudson 2001).
 *   Train on data to 50M, predict, compare.
 *
 * LINE 2: Find a reversal within cheap compute range.
 *   Push to 200M for the unreversed mod-8, mod-12, mod-19, mod-24 pairs.
 *   If any reverse, we have a new concrete result.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define SIEVE_LIMIT 200000000LL  /* 200M — affordable, extends the search */
#define SIEVE_BYTES ((SIEVE_LIMIT / 8) + 1)

typedef struct { double freq, amp, phase; } Wave;

static unsigned char *sieve_bits;
static inline void set_composite(long long n){sieve_bits[n>>3]|=(1<<(n&7));}
static inline int is_composite(long long n){return(sieve_bits[n>>3]>>(n&7))&1;}

#define MAX_WAVES 30

static int extract(const double *func, int n, Wave *waves, int max_w, double *out_dc) {
    int dft_n=2048;
    double *v=malloc(dft_n*sizeof(double));double *lx=malloc(dft_n*sizeof(double));
    double lmin=log(100.0);double lmax=log((double)n);double ls=(lmax-lmin)/(dft_n-1);
    for(int i=0;i<dft_n;i++){double l=lmin+i*ls;int idx=(int)exp(l);if(idx<1)idx=1;if(idx>n)idx=n;v[i]=func[idx];lx[i]=l;}
    double dc=0;for(int i=0;i<dft_n;i++)dc+=v[i];dc/=dft_n;*out_dc=dc;
    /* detrend */
    double sx=0;double sy=0;double sxx=0;double sxy=0;
    for(int i=0;i<dft_n;i++){sx+=lx[i];sy+=v[i];sxx+=lx[i]*lx[i];sxy+=lx[i]*v[i];}
    double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx);double ic=(sy-sl*sx)/dft_n;
    for(int i=0;i<dft_n;i++)v[i]-=(sl*lx[i]+ic);
    Wave all[500];int na=0;double pp=0;double ppp=0;
    for(int fi=0;fi<3000;fi++){
        double g=1.0+fi*0.05;double a=0;double b=0;
        for(int i=0;i<dft_n;i++){double ph=g*lx[i];a+=v[i]*cos(ph);b+=v[i]*sin(ph);}
        a*=2.0/dft_n;b*=2.0/dft_n;double p=a*a+b*b;
        if(fi>=2&&ppp<pp&&pp>p&&pp>1e-8&&na<500)all[na++]=(Wave){1.0+(fi-1)*0.05,sqrt(pp),atan2(b,a)};
        ppp=pp;pp=p;
    }
    for(int i=0;i<na-1;i++)for(int j=i+1;j<na;j++)if(all[j].amp>all[i].amp){Wave t=all[i];all[i]=all[j];all[j]=t;}
    int nw=na<max_w?na:max_w;for(int i=0;i<nw;i++)waves[i]=all[i];
    free(v);free(lx);return nw;
}

static double recon(const Wave *w,int nw,double dc,double lx){
    double s=dc;for(int i=0;i<nw;i++)s+=w[i].amp*cos(w[i].freq*lx+w[i].phase);return s;}

int main(void) {
    setvbuf(stdout,NULL,_IONBF,0);
    printf("=== Experiment 51: Two Lines of Attack ===\n\n");
    time_t t0=time(NULL);

    /* sieve to 200M */
    printf("Sieving to %lldM...\n", SIEVE_LIMIT/1000000);
    sieve_bits = calloc(SIEVE_BYTES, 1);
    set_composite(0); set_composite(1);
    for (long long i=2; i*i<=SIEVE_LIMIT; i++)
        if (!is_composite(i)) for(long long j=i*i;j<=SIEVE_LIMIT;j+=i) set_composite(j);
    printf("Done (%.0fs).\n\n", difftime(time(NULL),t0));

    /* ═══ LINE 1: Predict mod-3 reversal ═══ */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("LINE 1: PREDICT π(3,2)-π(3,1) FIRST REVERSAL\n");
    printf("Known answer: x = 608,981,813,029 (10^11.78)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* compute π(3,2) - π(3,1) to 200M */
    printf("  Computing bias to 200M...\n");
    double *bias3 = calloc(SIEVE_LIMIT+2, sizeof(double));
    long long c2=0; long long c1=0;
    for (long long i=2; i<=SIEVE_LIMIT; i++) {
        if (!is_composite(i)) {
            if (i%3==2) c2++;
            if (i%3==1) c1++;
        }
        bias3[i] = (double)(c2 - c1);
    }
    printf("  Final: π(3,2)=%lld, π(3,1)=%lld, bias=%lld\n", c2, c1, c2-c1);
    printf("  Bias at 200M: %+.0f (non-residue leads)\n\n", bias3[SIEVE_LIMIT]);

    /* extract waves */
    Wave w3[MAX_WAVES]; double dc3;
    int nw3 = extract(bias3, (int)SIEVE_LIMIT, w3, MAX_WAVES, &dc3);

    printf("  Waves: %d  DC: %+.2f\n", nw3, dc3);
    printf("  Top 5: ");
    for(int k=0;k<5&&k<nw3;k++) printf("γ=%.2f(A=%.1f) ",w3[k].freq,w3[k].amp);
    printf("\n\n");

    /* scan reconstruction for first zero crossing (reversal) */
    printf("  Scanning wave reconstruction for first reversal...\n");
    double prev = recon(w3, nw3, dc3, log(1e8));
    double first_rev_lx = -1;
    for (double lx = log(1e8); lx <= log(1e15); lx += 0.001) {
        double val = recon(w3, nw3, dc3, lx);
        if (prev > 0 && val <= 0) {
            first_rev_lx = lx;
            break;
        }
        prev = val;
    }

    if (first_rev_lx > 0) {
        double pred_x = exp(first_rev_lx);
        double known_x = 608981813029.0;
        printf("\n  PREDICTED first reversal: 10^%.2f ≈ %.2e\n", first_rev_lx/log(10), pred_x);
        printf("  KNOWN first reversal:    10^11.78 ≈ 6.09×10^11\n");
        printf("  Error in log₁₀(x): %.2f decades (%.1f%%)\n\n",
               fabs(first_rev_lx/log(10) - 11.78),
               fabs(first_rev_lx/log(10) - 11.78)/11.78*100);
    } else {
        printf("\n  No reversal predicted in [10^8, 10^15]\n");
        printf("  Wave model bias stays positive — may need more waves or\n");
        printf("  the DC offset is too strong for 30 waves to overcome.\n\n");

        /* report what the model shows */
        printf("  Model values at key points:\n");
        double checks[] = {1e8, 1e9, 1e10, 1e11, 1e12, 1e13, 1e14};
        for (int c = 0; c < 7; c++) {
            double lx = log(checks[c]);
            double val = recon(w3, nw3, dc3, lx);
            printf("    10^%.0f: bias ≈ %+.1f %s\n", log10(checks[c]), val,
                   val < 0 ? "*** REVERSED" : "");
        }

        /* find minimum (closest approach to zero) */
        double min_val = 1e30; double min_lx = 0;
        for (double lx = log(1e8); lx <= log(1e15); lx += 0.001) {
            double val = recon(w3, nw3, dc3, lx);
            if (val < min_val) { min_val = val; min_lx = lx; }
        }
        printf("\n    Closest approach to zero: %+.1f at 10^%.2f\n", min_val, min_lx/log(10));
        printf("    DC offset: %+.2f. Need waves to overcome this.\n", dc3);
    }

    free(bias3);

    /* ═══ LINE 2: Find NEW reversals at 200M ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("LINE 2: HUNT FOR NEW REVERSALS UP TO 200M\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    typedef struct { int q; int a; int b; } Pair;
    /* test the pairs that were unreversed at 50M */
    Pair targets[] = {
        {3,1,2}, {8,1,3}, {8,1,5}, {8,1,7},
        {12,1,5}, {12,1,7}, {12,1,11},
        {19,1,2}, {19,1,3}, {19,1,4}, {19,1,5}, {19,1,6},
        {19,1,7}, {19,1,8}, {19,1,9}, {19,1,10},
        {24,1,5}, {24,1,7}, {24,1,11}, {24,1,13},
        {24,1,17}, {24,1,19}, {24,1,23},
        {29,1,2}, {29,1,3}, {29,1,4}, {29,1,5},
        {31,1,2}, {31,1,3}, {31,1,4}, {31,1,5},
    };
    int nt = 30;

    printf("  q  │ a vs b │ Reversal at x        │ Reversals │ Status\n");
    printf("  ───┼────────┼──────────────────────┼───────────┼───────\n");

    int new_found = 0;

    for (int t = 0; t < nt; t++) {
        int q = targets[t].q;
        int a = targets[t].a;
        int b = targets[t].b;

        long long ca=0; long long cb=0;
        long long first_rev = -1;
        int n_rev = 0;
        int leading = 0;

        for (long long i = 2; i <= SIEVE_LIMIT; i++) {
            if (!is_composite(i)) {
                if (i%q == a) ca++;
                if (i%q == b) cb++;
            }
            if (i > (long long)q + 1) {
                int now = (ca>cb)?1:(cb>ca)?-1:0;
                if (now != 0 && leading != 0 && now != leading) {
                    n_rev++;
                    if (first_rev < 0) first_rev = i;
                }
                if (now != 0) leading = now;
            }
        }

        if (first_rev > 50000000) { /* new — not in our 50M data */
            printf("  %2d │ %2d v %2d│ %20lld │  %8d │ *** NEW at %.1fM\n",
                   q, a, b, first_rev, n_rev, first_rev/1e6);
            new_found++;
        } else if (first_rev > 0) {
            printf("  %2d │ %2d v %2d│ %20lld │  %8d │ (known <50M)\n",
                   q, a, b, first_rev, n_rev);
        } else {
            printf("  %2d │ %2d v %2d│         none ≤ 200M │         0 │ still unreversed\n",
                   q, a, b);
        }
        fflush(stdout);
    }

    printf("\n  New reversals found (50M < x ≤ 200M): %d\n", new_found);

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL), t0));
    free(sieve_bits);
    return 0;
}
