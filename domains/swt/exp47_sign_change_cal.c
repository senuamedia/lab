/*
 * Experiment 47: Sign Change Calibration
 *
 * Use SIGN CHANGES as calibration points.
 * M(x)/√x crosses zero many times in [1, 5M].
 * Each crossing is a type-2 breach event.
 *
 * For each crossing: how many waves participated?
 * Fit: log₁₀(x_crossing) = f(crossing_number)
 * This gives the spacing between sign changes,
 * which directly models how interference events
 * become rarer at larger scale.
 *
 * Then extrapolate: when does the N-th crossing happen?
 * The Mertens breach is just a very distant crossing
 * where the envelope exceeds 1.0.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 5000000

static int mobius_val(long long n){int f=0;for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}}if(n>1)f++;return(f%2==0)?1:-1;}
static int big_omega(long long n){int c=0;for(long long p=2;p*p<=n;p++)while(n%p==0){c++;n/=p;}if(n>1)c++;return c;}

int main(void) {
    setvbuf(stdout,NULL,_IONBF,0);
    printf("=== Experiment 47: Sign Change Calibration ===\n\n");
    time_t t0=time(NULL);

    printf("Computing M(x)/√x and L(x)/√x to 5M...\n");
    double *M=calloc(MAX_N+2,sizeof(double));
    double *L=calloc(MAX_N+2,sizeof(double));
    double msum=0;double lsum=0;
    for(int i=1;i<=MAX_N;i++){msum+=mobius_val(i);M[i]=msum/sqrt(i);lsum+=(big_omega(i)%2==0)?1:-1;L[i]=lsum/sqrt(i);}
    printf("Done (%.0fs).\n\n",difftime(time(NULL),t0));

    /* ═══ PHASE 1: Catalog all M(x)/√x sign changes ═══ */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: M(x)/√x SIGN CHANGES\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    long long M_crossings[10000]; int M_nc=0;
    double M_prev=M[1];
    for(int i=2;i<=MAX_N&&M_nc<10000;i++){
        if(M[i]*M_prev<0&&M_prev!=0&&M[i]!=0) M_crossings[M_nc++]=i;
        M_prev=M[i];
    }
    printf("  M(x)/√x sign changes found: %d in [1, %dM]\n\n", M_nc, MAX_N/1000000);

    /* spacing analysis: how does gap between crossings grow? */
    printf("  Crossing │ At x        │ log₁₀(x) │ Gap from prev │ log₁₀(gap) │ M value\n");
    printf("  ─────────┼─────────────┼──────────┼───────────────┼────────────┼────────\n");

    /* print every 50th crossing + first 10 + last 10 */
    double *log_x_cross = malloc(M_nc*sizeof(double));
    double *log_gap = malloc(M_nc*sizeof(double));
    for(int i=0;i<M_nc;i++){
        log_x_cross[i]=log10((double)M_crossings[i]);
        log_gap[i]=(i>0)?log10((double)(M_crossings[i]-M_crossings[i-1])):0;
    }

    for(int i=0;i<M_nc;i++){
        if(i<10 || i>=M_nc-5 || i%500==0){
            printf("  %7d  │ %11lld │   %6.2f  │ %13lld │    %6.2f   │ %+.4f\n",
                   i+1, M_crossings[i], log_x_cross[i],
                   i>0?M_crossings[i]-M_crossings[i-1]:0,
                   i>0?log_gap[i]:0, M[M_crossings[i]]);
        }
        if(i==10) printf("  ...\n");
    }

    /* ═══ PHASE 2: Fit crossing number → x ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: FIT crossing_number → log₁₀(x)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* Model: log₁₀(x_n) = a + b × log₁₀(n) → x_n ∝ n^b */
    { double sx=0;double sy=0;double sxx=0;double sxy=0;
      for(int i=10;i<M_nc;i++){double x=log10(i+1.0);double y=log_x_cross[i];sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;}
      int n=M_nc-10;
      double b=(n*sxy-sx*sy)/(n*sxx-sx*sx);double a=(sy-b*sx)/n;
      printf("  Model: log₁₀(x_n) = %.3f + %.3f × log₁₀(n)\n", a, b);
      printf("  Meaning: x_n ≈ 10^%.2f × n^%.3f\n\n", a, b);

      /* validate */
      printf("  Validate on data:\n");
      printf("  Crossing n │ Actual 10^ │ Predicted 10^ │ Error\n");
      printf("  ───────────┼────────────┼───────────────┼──────\n");
      int check_n[]={10,50,100,500,1000,2000,3000,4000,5000,6000,7000,8000};
      for(int ci=0;ci<12;ci++){
          int nn=check_n[ci]; if(nn>=M_nc) break;
          double pred=a+b*log10(nn+1.0);
          printf("  %10d │     %5.2f  │       %5.2f   │ %+.2f\n",
                 nn, log_x_cross[nn-1], pred, pred-log_x_cross[nn-1]);
      }

      /* extrapolate: where is the 10^6-th crossing? 10^9-th? */
      printf("\n  EXTRAPOLATION:\n\n");
      printf("  Crossing number │ Predicted x at     │ Notes\n");
      printf("  ────────────────┼────────────────────┼──────\n");
      double ext_n[]={1e4,1e5,1e6,1e7,1e8,1e9,1e10,1e15,1e20};
      for(int e=0;e<9;e++){
          double pred=a+b*log10(ext_n[e]);
          printf("  %16.0f │ 10^%-15.1f │\n", ext_n[e], pred);
      }

      /* ═══ PHASE 3: Record excursions ═══ */
      printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
      printf("PHASE 3: |M/√x| RECORD EXCURSIONS — type-2 for Mertens bound\n");
      printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

      /* each new record of |M/√x| is a "breach" of the previous bound */
      double record=0; int nrec=0;
      double rec_x[200]; double rec_val[200];

      for(int i=2;i<=MAX_N;i++){
          if(fabs(M[i])>record+0.001){
              record=fabs(M[i]);
              if(nrec<200){rec_x[nrec]=log10(i);rec_val[nrec]=record;nrec++;}
          }
      }

      printf("  Records found: %d\n\n", nrec);
      printf("  Record │ At 10^  │ |M/√x|  │ Gap (decades) │ Rate\n");
      printf("  ───────┼─────────┼─────────┼───────────────┼─────\n");

      for(int i=0;i<nrec;i++){
          double gap=i>0?rec_x[i]-rec_x[i-1]:0;
          if(i<15 || i>=nrec-5 || i%5==0)
              printf("  %5d  │  %5.2f  │  %5.4f │    %5.2f      │ %s\n",
                     i+1, rec_x[i], rec_val[i], gap,
                     gap>0.5?"slowing":"fast");
          if(i==15) printf("  ...\n");
      }

      /* fit: record value vs log₁₀(x) */
      printf("\n  Fit: |M/√x|_record = a + b × log₁₀(x)\n");
      { double sx2=0;double sy2=0;double sxx2=0;double sxy2=0;
        for(int i=5;i<nrec;i++){sx2+=rec_x[i];sy2+=rec_val[i];sxx2+=rec_x[i]*rec_x[i];sxy2+=rec_x[i]*rec_val[i];}
        int nn=nrec-5;
        double bb=(nn*sxy2-sx2*sy2)/(nn*sxx2-sx2*sx2);double aa=(sy2-bb*sx2)/nn;
        printf("    |M/√x|_record = %.4f + %.4f × log₁₀(x)\n", aa, bb);
        printf("    At what x does record reach 1.0?\n");
        double x_mertens=(1.0-aa)/bb;
        printf("    log₁₀(x) = %.1f → x ≈ 10^%.1f\n\n", x_mertens, x_mertens);

        /* same with √(log₁₀(x)) fit */
        printf("  Fit: |M/√x|_record = a + b × √(log₁₀(x))\n");
        sx2=0;sy2=0;sxx2=0;sxy2=0;
        for(int i=5;i<nrec;i++){double sqx=sqrt(rec_x[i]);sx2+=sqx;sy2+=rec_val[i];sxx2+=sqx*sqx;sxy2+=sqx*rec_val[i];}
        bb=(nn*sxy2-sx2*sy2)/(nn*sxx2-sx2*sx2);aa=(sy2-bb*sx2)/nn;
        printf("    |M/√x|_record = %.4f + %.4f × √(log₁₀(x))\n", aa, bb);
        double sqrt_x_mertens=(1.0-aa)/bb;
        printf("    √(log₁₀(x)) = %.2f → log₁₀(x) = %.1f → x ≈ 10^%.1f\n\n",
               sqrt_x_mertens, sqrt_x_mertens*sqrt_x_mertens, sqrt_x_mertens*sqrt_x_mertens);

        /* and log log fit */
        printf("  Fit: |M/√x|_record = a + b × log(log₁₀(x))\n");
        sx2=0;sy2=0;sxx2=0;sxy2=0;
        for(int i=5;i<nrec;i++){double llx=log(rec_x[i]);sx2+=llx;sy2+=rec_val[i];sxx2+=llx*llx;sxy2+=llx*rec_val[i];}
        bb=(nn*sxy2-sx2*sy2)/(nn*sxx2-sx2*sx2);aa=(sy2-bb*sx2)/nn;
        printf("    |M/√x|_record = %.4f + %.4f × log(log₁₀(x))\n", aa, bb);
        double ll_mertens=exp((1.0-aa)/bb);
        printf("    log(log₁₀(x)) = %.2f → log₁₀(x) = %.1f → x ≈ 10^%.1f\n\n",
               (1.0-aa)/bb, ll_mertens, ll_mertens);

        /* the known answer: Mertens breaks at ~10^(10^40) */
        printf("  ═══════════════════════════════════════════\n");
        printf("  MERTENS PREDICTION FROM RECORD GROWTH:\n\n");
        printf("    Linear:   |M|>1 at 10^%.0f\n", (1.0-((sy2-bb*sx2)/nn))/((nn*sxy2-sx2*sy2)/(nn*sxx2-sx2*sx2)));
        printf("    √log:     |M|>1 at 10^%.0f\n", sqrt_x_mertens*sqrt_x_mertens);
        printf("    log-log:  |M|>1 at 10^%.0f\n", ll_mertens);
        printf("    Known:    |M|>1 at ~10^(10^40)\n");
      }
    }

    /* ═══ L(x) record excursions ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 4: |L/√x| RECORD GROWTH → Pólya prediction\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    { double record=0; int nrec=0;
      double rec_x[200]; double rec_val[200];
      for(int i=2;i<=MAX_N;i++){
          if(fabs(L[i])>record+0.001){record=fabs(L[i]);if(nrec<200){rec_x[nrec]=log10(i);rec_val[nrec]=record;nrec++;}}
      }
      printf("  Records: %d. Last record: |L/√x| = %.4f at 10^%.2f\n\n", nrec, rec_val[nrec-1], rec_x[nrec-1]);

      /* fit with various models */
      int nn=nrec-3;
      double sx=0;double sy=0;double sxx=0;double sxy=0;
      for(int i=3;i<nrec;i++){double x=log(rec_x[i]);sx+=x;sy+=rec_val[i];sxx+=x*x;sxy+=x*rec_val[i];}
      double bb=(nn*sxy-sx*sy)/(nn*sxx-sx*sx);double aa=(sy-bb*sx)/nn;
      printf("  Fit: |L/√x|_record = %.4f + %.4f × log(log₁₀(x))\n", aa, bb);

      /* L needs to overcome DC ≈ -0.67 for Pólya */
      /* record reaches 0.67 (overcoming DC) at: */
      double target=0.67;
      double ll_polya=exp((target-aa)/bb);
      printf("  L overcomes DC (0.67) at log₁₀(x) = %.1f → x ≈ 10^%.1f\n", ll_polya, ll_polya);
      printf("  Known Pólya break: 10^8.96\n");
      printf("  Error: %.1f%%\n", fabs(ll_polya-8.96)/8.96*100);

      /* using √log model */
      sx=0;sy=0;sxx=0;sxy=0;
      for(int i=3;i<nrec;i++){double x=sqrt(rec_x[i]);sx+=x;sy+=rec_val[i];sxx+=x*x;sxy+=x*rec_val[i];}
      bb=(nn*sxy-sx*sy)/(nn*sxx-sx*sx);aa=(sy-bb*sx)/nn;
      printf("\n  Fit: |L/√x|_record = %.4f + %.4f × √(log₁₀(x))\n", aa, bb);
      double sq_polya=(target-aa)/bb;
      printf("  L overcomes DC at √log₁₀(x) = %.2f → 10^%.1f\n", sq_polya, sq_polya*sq_polya);
      printf("  Known: 10^8.96.  Error: %.1f%%\n", fabs(sq_polya*sq_polya-8.96)/8.96*100);
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));
    free(M);free(L);free(log_x_cross);free(log_gap);
    return 0;
}
