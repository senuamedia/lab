/*
 * SWT Pipeline: Predict → Verify → Report
 *
 * Automated pipeline for solving Chebyshev bias reversals.
 * For each (q, a, b) pair:
 *   1. Sieve to TRAIN_LIMIT, compute bias
 *   2. Extract waves, predict reversal location
 *   3. Sieve further to VERIFY_LIMIT, check if reversal occurs
 *   4. Report: predicted vs actual
 *
 * Uses segmented sieve for large ranges — memory efficient.
 * Single binary, all pairs, full table output.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

/* segmented sieve parameters */
#define SEG_SIZE 1000000  /* 1M per segment */

/* wave extraction */
#define MAX_WAVES 30
typedef struct { double freq, amp, phase; } Wave;

static int extract_from_array(const double *func, int n, Wave *waves, int max_w, double *out_dc) {
    int dft_n = n < 2048 ? n/2 : 2048;
    if (dft_n < 64) dft_n = 64;
    double *v=malloc(dft_n*sizeof(double)); double *lx=malloc(dft_n*sizeof(double));
    double lmin=log(100.0); double lmax=log((double)n); double ls=(lmax-lmin)/(dft_n-1);
    for(int i=0;i<dft_n;i++){double l=lmin+i*ls;int idx=(int)exp(l);if(idx<1)idx=1;if(idx>n)idx=n;v[i]=func[idx];lx[i]=l;}
    double dc=0;for(int i=0;i<dft_n;i++)dc+=v[i];dc/=dft_n;*out_dc=dc;
    double sx=0,sy=0,sxx=0,sxy=0;
    for(int i=0;i<dft_n;i++){sx+=lx[i];sy+=v[i];sxx+=lx[i]*lx[i];sxy+=lx[i]*v[i];}
    double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx);double ic=(sy-sl*sx)/dft_n;
    for(int i=0;i<dft_n;i++)v[i]-=(sl*lx[i]+ic);
    Wave all[500];int na=0;double pp=0,ppp=0;
    for(int fi=0;fi<2000;fi++){
        double g=1.0+fi*0.05;double a=0,b=0;
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

/* predict first zero crossing of reconstruction beyond training range */
static double predict_reversal(const Wave *w, int nw, double dc, double train_lx) {
    double prev = recon(w, nw, dc, train_lx);
    for (double lx = train_lx; lx <= train_lx + 20; lx += 0.001) {
        double val = recon(w, nw, dc, lx);
        if (prev > 0 && val <= 0) return lx;
        if (prev < 0 && val >= 0) return lx;
        prev = val;
    }
    return -1;
}

/* simple sieve for small range */
static char *simple_sieve(long long limit) {
    char *s = calloc(limit+1, 1);
    s[0]=s[1]=1;
    for (long long i=2; i*i<=limit; i++)
        if (!s[i]) for(long long j=i*i;j<=limit;j+=i) s[j]=1;
    return s;
}

/* segmented sieve: iterate through primes from lo to hi */
/* calls callback(prime) for each prime found */
typedef void (*prime_callback)(long long prime, void *ctx);

static void segmented_sieve(long long lo, long long hi, prime_callback cb, void *ctx) {
    /* need small primes up to sqrt(hi) */
    long long sqrt_hi = (long long)sqrt((double)hi) + 1;
    char *small = simple_sieve(sqrt_hi);

    /* collect small primes */
    long long *sp = malloc((sqrt_hi/2+100)*sizeof(long long));
    int nsp = 0;
    for (long long i=2; i<=sqrt_hi; i++) if (!small[i]) sp[nsp++]=i;

    char *seg = malloc(SEG_SIZE);

    for (long long seg_lo = lo; seg_lo <= hi; seg_lo += SEG_SIZE) {
        long long seg_hi = seg_lo + SEG_SIZE - 1;
        if (seg_hi > hi) seg_hi = hi;
        long long seg_len = seg_hi - seg_lo + 1;

        memset(seg, 0, seg_len);

        /* sieve this segment */
        for (int i = 0; i < nsp; i++) {
            long long p = sp[i];
            long long start = ((seg_lo + p - 1) / p) * p;
            if (start < p*p) start = p*p;
            for (long long j = start; j <= seg_hi; j += p)
                seg[j - seg_lo] = 1;
        }

        /* report primes */
        for (long long j = 0; j < seg_len; j++) {
            long long n = seg_lo + j;
            if (n < 2) continue;
            if (!seg[j]) cb(n, ctx);
        }
    }

    free(small); free(sp); free(seg);
}

/* context for bias tracking */
typedef struct {
    int q, a, b;
    long long ca, cb;
    long long first_rev;
    int n_rev;
    int leading;
    long long last_check;
} BiasCtx;

static void bias_callback(long long prime, void *ctx) {
    BiasCtx *b = (BiasCtx*)ctx;
    int r = prime % b->q;
    if (r == b->a) b->ca++;
    if (r == b->b) b->cb++;

    /* check every 10000 primes for reversal */
    if ((b->ca + b->cb) % 5000 == 0 && (b->ca + b->cb) > 100) {
        int now = (b->cb > b->ca) ? 1 : (b->ca > b->cb) ? -1 : 0;
        if (now != 0 && b->leading != 0 && now != b->leading) {
            b->n_rev++;
            if (b->first_rev < 0) b->first_rev = prime;
        }
        if (now != 0) b->leading = now;
    }
}

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== SWT Pipeline: Predict → Verify → Report ===\n\n");
    time_t t0 = time(NULL);

    /* ═══ CONFIGURATION ═══ */
    long long TRAIN_LIMIT = 200000000LL;   /* 200M for wave training */
    long long VERIFY_LIMIT = 2000000000LL; /* 2B first pass, scale up after */

    /* all target pairs — comprehensive */
    typedef struct { int q; int a; int b; } Target;
    Target targets[] = {
        /* mod 3 */ {3,1,2},
        /* mod 4 */ {4,1,3},
        /* mod 5 */ {5,1,2},{5,1,3},{5,1,4},{5,2,4},{5,3,4},
        /* mod 7 */ {7,1,2},{7,1,3},{7,1,4},{7,1,5},{7,1,6},
        /* mod 8 */ {8,1,3},{8,1,5},{8,1,7},{8,3,5},{8,3,7},{8,5,7},
        /* mod 11 */ {11,1,2},{11,1,3},{11,1,4},{11,1,5},
        /* mod 12 */ {12,1,5},{12,1,7},{12,1,11},{12,5,7},{12,5,11},{12,7,11},
        /* mod 13 */ {13,1,2},{13,1,3},{13,1,4},{13,1,5},
        /* mod 16 */ {16,1,3},{16,1,5},{16,1,7},{16,1,9},
        /* mod 19 */ {19,1,2},{19,1,3},{19,1,4},{19,1,5},{19,1,7},
        /* mod 23 */ {23,1,2},{23,1,3},{23,1,4},{23,1,5},
        /* mod 24 */ {24,1,5},{24,1,7},{24,1,11},{24,1,13},{24,1,17},{24,1,19},{24,1,23},
        /* mod 29 */ {29,1,2},{29,1,3},{29,1,4},{29,1,5},
        /* mod 31 */ {31,1,2},{31,1,3},{31,1,4},{31,1,5},
    };
    int nt = sizeof(targets)/sizeof(targets[0]);

    printf("  Targets: %d bias pairs\n", nt);
    printf("  Training: to %lldM\n", TRAIN_LIMIT/1000000);
    printf("  Verification: to %lldB\n\n", VERIFY_LIMIT/1000000000);

    /* ═══ PHASE 1: Train on small sieve ═══ */
    printf("Phase 1: Training sieve to %lldM...\n", TRAIN_LIMIT/1000000);
    char *train_sieve = simple_sieve(TRAIN_LIMIT);
    printf("Done (%.0fs).\n\n", difftime(time(NULL),t0));

    /* results table */
    typedef struct {
        int q, a, b;
        double predicted_log10;
        long long found_at;
        int n_rev;
        double error_pct;
        int status; /* 0=not found, 1=found in train, 2=found in verify, 3=predicted only */
    } Result;
    Result results[200];

    printf("Phase 1 results (training + prediction):\n\n");
    printf("  q  │ a vs b │ Bias@%lldM │ Predicted 10^ │ Status\n", TRAIN_LIMIT/1000000);
    printf("  ───┼────────┼──────────┼───────────────┼───────\n");

    for (int t = 0; t < nt; t++) {
        int q=targets[t].q, a=targets[t].a, b=targets[t].b;
        Result *r = &results[t];
        r->q=q; r->a=a; r->b=b; r->found_at=-1; r->n_rev=0; r->status=3;

        /* compute bias to TRAIN_LIMIT */
        /* use a compact representation — sample at log-spaced points */
        int nsamp = 10000;
        double *bias_samp = malloc(nsamp * sizeof(double));
        double lmin=log(100.0), lmax=log((double)TRAIN_LIMIT);
        double lstep=(lmax-lmin)/(nsamp-1);

        long long ca=0, cb=0;
        int si=0; double next_l=lmin;
        long long first_rev_train=-1; int n_rev_train=0; int leading=0;

        for (long long x=2; x<=TRAIN_LIMIT; x++) {
            if (!train_sieve[x]) {
                if (x%q==a) ca++;
                if (x%q==b) cb++;
            }
            /* sample */
            double lx = log((double)x);
            if (lx >= next_l && si < nsamp) {
                bias_samp[si] = (double)(cb - ca);
                si++;
                next_l = lmin + si * lstep;
            }
            /* check reversal */
            if (x > (long long)q+1 && x%10000==0) {
                int now=(cb>ca)?1:(ca>cb)?-1:0;
                if(now!=0&&leading!=0&&now!=leading){n_rev_train++;if(first_rev_train<0)first_rev_train=x;}
                if(now!=0)leading=now;
            }
        }

        if (first_rev_train > 0) {
            r->found_at = first_rev_train;
            r->n_rev = n_rev_train;
            r->status = 1;
            r->predicted_log10 = log10((double)first_rev_train);
            printf("  %2d │ %2d v %2d│ %+8lld │  (found@%.1f)  │ in training\n",
                   q,a,b,cb-ca,log10((double)first_rev_train));
        } else {
            /* predict from waves */
            Wave w[MAX_WAVES]; double dc;
            int nw = extract_from_array(bias_samp, si, w, MAX_WAVES, &dc);
            double pred = predict_reversal(w, nw, dc, lmax);

            if (pred > 0) {
                r->predicted_log10 = pred / log(10);
                printf("  %2d │ %2d v %2d│ %+8lld │    %6.2f      │ PREDICTED\n",
                       q,a,b,cb-ca,r->predicted_log10);
            } else {
                r->predicted_log10 = -1;
                printf("  %2d │ %2d v %2d│ %+8lld │    beyond     │ far\n", q,a,b,cb-ca);
            }
        }
        free(bias_samp);
        fflush(stdout);
    }

    free(train_sieve);

    /* ═══ PHASE 2: Verify predictions with segmented sieve ═══ */
    printf("\nPhase 2: Segmented sieve verification to %lldB...\n\n", VERIFY_LIMIT/1000000000);

    /* only verify pairs that were predicted (not already found) */
    /* and whose prediction is within VERIFY_LIMIT */
    int n_to_verify = 0;
    for (int t=0; t<nt; t++) {
        if (results[t].status != 1 && results[t].predicted_log10 > 0 &&
            results[t].predicted_log10 <= log10((double)VERIFY_LIMIT) + 1) {
            n_to_verify++;
        }
    }
    printf("  Pairs to verify: %d\n\n", n_to_verify);

    if (n_to_verify > 0) {
        /* track all unresolved pairs simultaneously through segmented sieve */
        BiasCtx *ctxs = calloc(nt, sizeof(BiasCtx));
        for (int t=0; t<nt; t++) {
            ctxs[t].q = targets[t].q;
            ctxs[t].a = targets[t].a;
            ctxs[t].b = targets[t].b;
            ctxs[t].first_rev = -1;
        }

        /* we need to re-count from 2 (can't start mid-stream easily) */
        /* use segmented sieve from 2 to VERIFY_LIMIT */
        long long sqrt_hi = (long long)sqrt((double)VERIFY_LIMIT) + 1;
        char *small = simple_sieve(sqrt_hi);
        long long *sp = malloc((sqrt_hi/2+100)*sizeof(long long));
        int nsp=0;
        for(long long i=2;i<=sqrt_hi;i++) if(!small[i]) sp[nsp++]=i;

        char *seg = malloc(SEG_SIZE);
        time_t last_report = time(NULL);

        for (long long seg_lo = 2; seg_lo <= VERIFY_LIMIT; seg_lo += SEG_SIZE) {
            long long seg_hi = seg_lo + SEG_SIZE - 1;
            if (seg_hi > VERIFY_LIMIT) seg_hi = VERIFY_LIMIT;
            long long seg_len = seg_hi - seg_lo + 1;

            memset(seg, 0, seg_len);
            for(int i=0;i<nsp;i++){
                long long p=sp[i];
                long long start=((seg_lo+p-1)/p)*p;
                if(start<p*p)start=p*p;
                for(long long j=start;j<=seg_hi;j+=p) seg[j-seg_lo]=1;
            }

            for(long long j=0;j<seg_len;j++){
                long long n=seg_lo+j;
                if(n<2||seg[j]) continue;
                /* this is a prime — update all bias contexts */
                for(int t=0;t<nt;t++){
                    if(results[t].status==1) continue; /* already found */
                    int r=n%ctxs[t].q;
                    if(r==ctxs[t].a) ctxs[t].ca++;
                    if(r==ctxs[t].b) ctxs[t].cb++;
                }
            }

            /* check reversals at end of each segment */
            for(int t=0;t<nt;t++){
                if(results[t].status==1) continue;
                int now=(ctxs[t].cb>ctxs[t].ca)?1:(ctxs[t].ca>ctxs[t].cb)?-1:0;
                if(now!=0&&ctxs[t].leading!=0&&now!=ctxs[t].leading){
                    ctxs[t].n_rev++;
                    if(ctxs[t].first_rev<0){
                        ctxs[t].first_rev=seg_hi;
                        results[t].found_at=seg_hi;
                        results[t].n_rev=ctxs[t].n_rev;
                        results[t].status=2;
                        double actual=log10((double)seg_hi);
                        results[t].error_pct=results[t].predicted_log10>0?
                            fabs(actual-results[t].predicted_log10)/results[t].predicted_log10*100:0;
                        printf("  *** FOUND: π(%d,%d) vs π(%d,%d) reversal at x≈%.2e (10^%.2f) — predicted 10^%.2f — %.1f%% err\n",
                               ctxs[t].q, ctxs[t].b, ctxs[t].q, ctxs[t].a,
                               (double)seg_hi, actual, results[t].predicted_log10, results[t].error_pct);
                        fflush(stdout);
                    }
                }
                if(now!=0) ctxs[t].leading=now;
            }

            time_t now=time(NULL);
            if(difftime(now,last_report)>30){
                double pct=100.0*seg_hi/VERIFY_LIMIT;
                printf("  [%.1f%% — x=%.2e — %.0fs]\n",pct,(double)seg_hi,difftime(now,t0));
                fflush(stdout);
                last_report=now;
            }
        }

        free(small);free(sp);free(seg);free(ctxs);
    }

    /* ═══ FINAL TABLE ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("THE TABLE — Spectral Wave Theory Results\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    int solved=0, predicted=0, pending=0;
    printf("  #  │ q  │ a vs b │ Predicted 10^ │ Found at 10^  │ Error │ Status\n");
    printf("  ───┼────┼────────┼───────────────┼───────────────┼───────┼───────\n");

    for (int t=0; t<nt; t++) {
        Result *r = &results[t];
        printf("  %2d │ %2d │ %2d v %2d│", t+1, r->q, r->a, r->b);
        if (r->predicted_log10 > 0) printf("    %6.2f      │", r->predicted_log10);
        else printf("    beyond     │");

        if (r->found_at > 0) {
            double actual = log10((double)r->found_at);
            printf("    %6.2f      │", actual);
            if (r->predicted_log10 > 0) printf(" %4.1f%% │", r->error_pct);
            else printf("   —   │");
            printf(" SOLVED\n");
            solved++;
        } else if (r->predicted_log10 > 0) {
            printf("    pending    │   —   │ predicted\n");
            predicted++;
        } else {
            printf("       —       │   —   │ far\n");
            pending++;
        }
    }

    printf("\n  SOLVED: %d  |  PREDICTED: %d  |  PENDING: %d  |  TOTAL: %d\n", solved, predicted, pending, nt);
    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));

    return 0;
}
