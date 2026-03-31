/*
 * Experiment 52: Predict Which mod-24 Bias Reverses First
 *
 * 8 pairs unreversed at 200M: (24,1) vs (24,5/7/11/13/17/19/23)
 * Extract waves for each, find which has smallest DC relative to
 * amplitude — that one reverses first.
 *
 * Then: predict the reversal location for the best candidate.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define SIEVE_LIMIT 200000000LL
#define SIEVE_BYTES ((SIEVE_LIMIT / 8) + 1)
#define MAX_WAVES 30

typedef struct { double freq, amp, phase; } Wave;

static unsigned char *sieve_bits;
static inline void set_composite(long long n){sieve_bits[n>>3]|=(1<<(n&7));}
static inline int is_composite(long long n){return(sieve_bits[n>>3]>>(n&7))&1;}

static int extract(const double *func, long long n, Wave *waves, int max_w, double *out_dc) {
    int dft_n=2048;
    double *v=malloc(dft_n*sizeof(double));double *lx=malloc(dft_n*sizeof(double));
    double lmin=log(100.0);double lmax=log((double)n);double ls=(lmax-lmin)/(dft_n-1);
    for(int i=0;i<dft_n;i++){double l=lmin+i*ls;long long idx=(long long)exp(l);if(idx<1)idx=1;if(idx>n)idx=n;v[i]=func[idx];lx[i]=l;}
    double dc=0;for(int i=0;i<dft_n;i++)dc+=v[i];dc/=dft_n;*out_dc=dc;
    double sx=0;double sy=0;double sxx=0;double sxy=0;
    for(int i=0;i<dft_n;i++){sx+=lx[i];sy+=v[i];sxx+=lx[i]*lx[i];sxy+=lx[i]*v[i];}
    double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx);double ic=(sy-sl*sx)/dft_n;
    for(int i=0;i<dft_n;i++)v[i]-=(sl*lx[i]+ic);
    Wave all[500];int na=0;double pp=0;double ppp=0;
    for(int fi=0;fi<3000;fi++){
        double g=1.0+fi*0.05;double a=0;double b=0;
        for(int i=0;i<dft_n;i++){double ph=g*lx[i];a+=v[i]*cos(ph);b+=v[i]*sin(ph);}
        a*=2.0/dft_n;b*=2.0/dft_n;double p=a*a+b*b;
        if(fi>=2&&ppp<pp&&pp>p&&pp>1e-6&&na<500)all[na++]=(Wave){1.0+(fi-1)*0.05,sqrt(pp),atan2(b,a)};
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
    printf("=== Experiment 52: Which mod-24 Bias Reverses First? ===\n\n");
    time_t t0=time(NULL);

    sieve_bits = calloc(SIEVE_BYTES, 1);
    set_composite(0); set_composite(1);
    for(long long i=2;i*i<=SIEVE_LIMIT;i++)if(!is_composite(i))for(long long j=i*i;j<=SIEVE_LIMIT;j+=i)set_composite(j);
    printf("Sieve done (%.0fs).\n\n", difftime(time(NULL),t0));

    int residues[] = {5, 7, 11, 13, 17, 19, 23};
    int nres = 7;

    /* also check mod 8 and mod 12 */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("WAVE ANALYSIS FOR ALL UNREVERSED BIASES\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    typedef struct {
        int q; int b;
        double dc;
        double amp_sum;
        double ratio; /* |DC| / Σ|A| — lower = closer to reversal */
        double pred_rev_log10;
        double min_val; /* minimum of reconstruction */
        double min_lx;
    } Candidate;

    Candidate cands[30]; int nc=0;

    /* all unreversed pairs */
    typedef struct { int q; int b; } Pair;
    Pair pairs[] = {
        {3,2}, {8,3},{8,5},{8,7}, {12,5},{12,7},{12,11},
        {24,5},{24,7},{24,11},{24,13},{24,17},{24,19},{24,23},
        {19,3}
    };
    int npairs = 15;

    double *func = calloc(SIEVE_LIMIT+2, sizeof(double));

    printf("  q  │ 1 vs b │ DC      │ Σ|A|    │ |DC|/Σ|A| │ Min recon │ Min at 10^ │ Pred rev\n");
    printf("  ───┼────────┼─────────┼─────────┼───────────┼───────────┼────────────┼─────────\n");

    for (int p = 0; p < npairs; p++) {
        int q = pairs[p].q;
        int b = pairs[p].b;

        /* compute bias */
        long long c1=0; long long cb=0;
        for (long long i=2; i<=SIEVE_LIMIT; i++) {
            if (!is_composite(i)) {
                if (i%q == 1) c1++;
                if (i%q == b) cb++;
            }
            func[i] = (double)(cb - c1);
        }

        Wave w[MAX_WAVES]; double dc;
        int nw = extract(func, SIEVE_LIMIT, w, MAX_WAVES, &dc);
        double asum=0; for(int k=0;k<nw;k++) asum+=w[k].amp;
        double ratio = asum > 0 ? fabs(dc) / asum : 999;

        /* scan reconstruction for minimum (closest to reversal) */
        double min_val = 1e30; double min_lx = 0;
        double pred_rev = -1;
        double prev = recon(w, nw, dc, log(1e8));

        for (double lx = log(1e8); lx <= log(1e18); lx += 0.001) {
            double val = recon(w, nw, dc, lx);
            if (val < min_val) { min_val = val; min_lx = lx; }
            if (prev > 0 && val <= 0 && pred_rev < 0) { pred_rev = lx; }
            prev = val;
        }

        cands[nc] = (Candidate){q, b, dc, asum, ratio,
                                 pred_rev > 0 ? pred_rev/log(10) : -1,
                                 min_val, min_lx};
        nc++;

        printf("  %2d │  1 v %2d│ %+7.1f │ %7.1f │    %5.3f  │ %+9.1f │   %8.2f  │",
               q, b, dc, asum, ratio, min_val, min_lx/log(10));
        if (pred_rev > 0)
            printf(" 10^%.1f\n", pred_rev/log(10));
        else
            printf(" beyond\n");
        fflush(stdout);
    }

    /* sort by ratio — lowest ratio = most likely to reverse first */
    for(int i=0;i<nc-1;i++)for(int j=i+1;j<nc;j++)
        if(cands[j].ratio<cands[i].ratio){Candidate t=cands[i];cands[i]=cands[j];cands[j]=t;}

    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("RANKED: Most likely to reverse first (lowest |DC|/Σ|A|)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Rank │ q  │ 1 vs b │ |DC|/Σ|A| │ Predicted reversal │ Search window\n");
    printf("  ─────┼────┼────────┼───────────┼────────────────────┼─────────────\n");

    for (int i = 0; i < nc && i < 10; i++) {
        printf("  %4d │ %2d │  1 v %2d│    %5.3f  │",
               i+1, cands[i].q, cands[i].b, cands[i].ratio);
        if (cands[i].pred_rev_log10 > 0) {
            double lo = cands[i].pred_rev_log10 - 1;
            double hi = cands[i].pred_rev_log10 + 1;
            printf("     10^%-11.1f │ 10^%.0f - 10^%.0f\n", cands[i].pred_rev_log10, lo, hi);
        } else {
            printf("     beyond 10^18   │ need larger data\n");
        }
    }

    printf("\n  RECOMMENDATION:\n");
    printf("  Target: π(%d,1) vs π(%d,%d) — lowest |DC|/Σ|A| ratio\n",
           cands[0].q, cands[0].q, cands[0].b);
    if (cands[0].pred_rev_log10 > 0) {
        printf("  Predicted reversal: 10^%.1f\n", cands[0].pred_rev_log10);
        printf("  Search window: 10^%.0f to 10^%.0f\n",
               cands[0].pred_rev_log10 - 1, cands[0].pred_rev_log10 + 1);
        printf("  Compute cost: segmented sieve of ~10^%.0f integers\n",
               cands[0].pred_rev_log10 + 1);
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));
    free(sieve_bits); free(func);
    return 0;
}
