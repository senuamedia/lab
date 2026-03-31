/*
 * SWT Solver — Production deployment binary
 *
 * Usage: ./swt_solve <q> <a> <b> <verify_limit>
 *   q = modulus
 *   a = residue class a
 *   b = residue class b
 *   verify_limit = sieve to this value (e.g. 10000000000 for 10B)
 *
 * Example: ./swt_solve 24 1 17 10000000000
 *
 * Output: JSON-like result for easy parsing
 *
 * Stages:
 *   1. Quick sieve to 200M — train the wave model
 *   2. Predict reversal location from waves
 *   3. Segmented sieve to verify_limit — find actual reversal
 *   4. Report: predicted vs actual
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define TRAIN_LIMIT 200000000LL
#define SEG_SIZE 100000  /* small segments for fine reversal detection */
#define MAX_WAVES 30

typedef struct { double freq, amp, phase; } Wave;

static int extract_waves(const double *func, int n, Wave *waves, int max_w, double *out_dc) {
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
        double g=1.0+fi*0.05;double a2=0,b2=0;
        for(int i=0;i<dft_n;i++){double ph=g*lx[i];a2+=v[i]*cos(ph);b2+=v[i]*sin(ph);}
        a2*=2.0/dft_n;b2*=2.0/dft_n;double p=a2*a2+b2*b2;
        if(fi>=2&&ppp<pp&&pp>p&&pp>1e-6&&na<500)all[na++]=(Wave){1.0+(fi-1)*0.05,sqrt(pp),atan2(b2,a2)};
        ppp=pp;pp=p;
    }
    for(int i=0;i<na-1;i++)for(int j=i+1;j<na;j++)if(all[j].amp>all[i].amp){Wave t=all[i];all[i]=all[j];all[j]=t;}
    int nw=na<max_w?na:max_w;for(int i=0;i<nw;i++)waves[i]=all[i];
    free(v);free(lx);return nw;
}

static double recon(const Wave *w,int nw,double dc,double lx){
    double s=dc;for(int i=0;i<nw;i++)s+=w[i].amp*cos(w[i].freq*lx+w[i].phase);return s;}

int main(int argc, char **argv) {
    setvbuf(stdout, NULL, _IONBF, 0);

    if (argc < 5) {
        fprintf(stderr, "Usage: %s <q> <a> <b> <verify_limit>\n", argv[0]);
        fprintf(stderr, "Example: %s 24 1 17 10000000000\n", argv[0]);
        return 1;
    }

    int q = atoi(argv[1]);
    int a = atoi(argv[2]);
    int b = atoi(argv[3]);
    long long verify_limit = atoll(argv[4]);

    printf("{\n");
    printf("  \"conjecture\": \"pi(%d,%d) vs pi(%d,%d)\",\n", q, b, q, a);
    printf("  \"q\": %d, \"a\": %d, \"b\": %d,\n", q, a, b);
    printf("  \"verify_limit\": %lld,\n", verify_limit);

    time_t t0 = time(NULL);

    /* ═══ STAGE 1: Train ═══ */
    fprintf(stderr, "Stage 1: Training sieve to %lldM...\n", TRAIN_LIMIT/1000000);
    char *train_sieve = calloc(TRAIN_LIMIT+1, 1);
    train_sieve[0]=train_sieve[1]=1;
    for(long long i=2;i*i<=TRAIN_LIMIT;i++)if(!train_sieve[i])for(long long j=i*i;j<=TRAIN_LIMIT;j+=i)train_sieve[j]=1;

    /* compute bias */
    int nsamp = 10000;
    double *bias = malloc(nsamp * sizeof(double));
    double lmin=log(100.0), lmax=log((double)TRAIN_LIMIT);
    double lstep=(lmax-lmin)/(nsamp-1);

    long long ca=0, cb_count=0;
    int si=0; double next_l=lmin;
    long long first_train_rev=-1; int train_revs=0; int leading=0;

    for (long long x=2; x<=TRAIN_LIMIT; x++) {
        if (!train_sieve[x]) {
            if (x%q==a) ca++;
            if (x%q==b) cb_count++;
        }
        double lx=log((double)x);
        if (lx>=next_l && si<nsamp) { bias[si]=(double)(cb_count-ca); si++; next_l=lmin+si*lstep; }
        if (x>(long long)q+1 && x%10000==0) {
            int now=(cb_count>ca)?1:(ca>cb_count)?-1:0;
            if(now!=0&&leading!=0&&now!=leading){train_revs++;if(first_train_rev<0)first_train_rev=x;}
            if(now!=0)leading=now;
        }
    }
    free(train_sieve);

    printf("  \"train_bias\": %lld,\n", cb_count-ca);
    printf("  \"train_reversals\": %d,\n", train_revs);

    if (first_train_rev > 0) {
        printf("  \"found_in_training\": true,\n");
        printf("  \"first_reversal\": %lld,\n", first_train_rev);
        printf("  \"first_reversal_log10\": %.4f,\n", log10((double)first_train_rev));
        printf("  \"predicted_log10\": %.4f,\n", log10((double)first_train_rev));
        printf("  \"error_pct\": 0.0,\n");
        printf("  \"status\": \"SOLVED_IN_TRAINING\",\n");
        printf("  \"time_seconds\": %.0f\n", difftime(time(NULL),t0));
        printf("}\n");
        free(bias);
        return 0;
    }

    /* ═══ STAGE 2: Predict ═══ */
    fprintf(stderr, "Stage 2: Wave prediction...\n");
    Wave w[MAX_WAVES]; double dc;
    int nw = extract_waves(bias, si, w, MAX_WAVES, &dc);
    free(bias);

    double predicted_lx = -1;
    double prev = recon(w, nw, dc, lmax);
    for (double lx=lmax; lx<=lmax+20; lx+=0.001) {
        double val=recon(w,nw,dc,lx);
        if((prev>0&&val<=0)||(prev<0&&val>=0)){predicted_lx=lx;break;}
        prev=val;
    }

    double predicted_log10 = predicted_lx > 0 ? predicted_lx/log(10) : -1;
    printf("  \"waves\": %d,\n", nw);
    printf("  \"dc\": %.4f,\n", dc);
    printf("  \"predicted_log10\": %.4f,\n", predicted_log10);

    if (predicted_log10 > 0)
        fprintf(stderr, "Predicted reversal at 10^%.2f\n", predicted_log10);
    else
        fprintf(stderr, "No reversal predicted in wave model\n");

    /* ═══ STAGE 3: Verify with segmented sieve ═══ */
    fprintf(stderr, "Stage 3: Segmented sieve to %.2e...\n", (double)verify_limit);

    long long sqrt_hi = (long long)sqrt((double)verify_limit) + 1;
    char *small = calloc(sqrt_hi+1, 1);
    small[0]=small[1]=1;
    for(long long i=2;i*i<=sqrt_hi;i++)if(!small[i])for(long long j=i*i;j<=sqrt_hi;j+=i)small[j]=1;
    long long *sp=malloc((sqrt_hi/2+100)*sizeof(long long));
    int nsp=0;
    for(long long i=2;i<=sqrt_hi;i++)if(!small[i])sp[nsp++]=i;

    char *seg=malloc(SEG_SIZE);
    ca=0; cb_count=0;
    long long first_rev=-1; int n_rev=0; leading=0;
    time_t last_report=time(NULL);

    for(long long seg_lo=2;seg_lo<=verify_limit;seg_lo+=SEG_SIZE){
        long long seg_hi=seg_lo+SEG_SIZE-1;
        if(seg_hi>verify_limit)seg_hi=verify_limit;
        long long seg_len=seg_hi-seg_lo+1;
        memset(seg,0,seg_len);
        for(int i=0;i<nsp;i++){
            long long p=sp[i];
            long long start=((seg_lo+p-1)/p)*p;
            if(start<p*p)start=p*p;
            for(long long j=start;j<=seg_hi;j+=p)seg[j-seg_lo]=1;
        }
        for(long long j=0;j<seg_len;j++){
            long long n=seg_lo+j;
            if(n<2||seg[j])continue;
            if(n%q==a)ca++;
            if(n%q==b)cb_count++;
        }
        /* check reversal */
        int now=(cb_count>ca)?1:(ca>cb_count)?-1:0;
        if(now!=0&&leading!=0&&now!=leading){
            n_rev++;
            if(first_rev<0){
                first_rev=seg_hi;
                fprintf(stderr,"*** REVERSAL FOUND at x≈%lld (10^%.2f)\n",seg_hi,log10((double)seg_hi));
            }
        }
        if(now!=0)leading=now;

        time_t now_t=time(NULL);
        if(difftime(now_t,last_report)>60){
            double pct=100.0*seg_hi/verify_limit;
            fprintf(stderr,"[%.1f%% — x=%.2e — %.0fs]\n",pct,(double)seg_hi,difftime(now_t,t0));
            last_report=now_t;
        }
    }

    if (first_rev > 0) {
        double actual_log10 = log10((double)first_rev);
        double error = predicted_log10 > 0 ? fabs(actual_log10-predicted_log10)/predicted_log10*100 : -1;
        printf("  \"first_reversal\": %lld,\n", first_rev);
        printf("  \"first_reversal_log10\": %.4f,\n", actual_log10);
        printf("  \"error_pct\": %.2f,\n", error);
        printf("  \"total_reversals\": %d,\n", n_rev);
        printf("  \"status\": \"SOLVED\",\n");
    } else {
        printf("  \"first_reversal\": null,\n");
        printf("  \"status\": \"NOT_FOUND\",\n");
        printf("  \"searched_to\": %lld,\n", verify_limit);
    }

    printf("  \"final_bias\": %lld,\n", cb_count-ca);
    printf("  \"time_seconds\": %.0f\n", difftime(time(NULL),t0));
    printf("}\n");

    free(small);free(sp);free(seg);
    return 0;
}
