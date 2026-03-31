/*
 * Experiment 46: Multi-Point Calibration
 *
 * Compute actual breach points for MANY thresholds from real data.
 * Each is a calibration point: (threshold, Σ|A| needed, actual x).
 * Fit the zeros-to-scale relationship from 20+ data points.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 5000000

static int big_omega(long long n){int c=0;for(long long p=2;p*p<=n;p++)while(n%p==0){c++;n/=p;}if(n>1)c++;return c;}
static int mobius_val(long long n){int f=0;for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}}if(n>1)f++;return(f%2==0)?1:-1;}

/* known |ζ'(ρ)| for first 30 zeros */
static double gamma_n[]={14.135,21.022,25.011,30.425,32.935,37.586,40.919,43.327,48.005,49.774,52.970,56.446,59.347,60.832,65.113,67.080,69.546,72.067,75.705,77.145,79.337,82.910,84.735,87.425,88.809,92.492,94.651,95.871,98.831,101.318};
static double zp[]={3.745,4.735,5.111,4.517,6.584,5.765,7.175,5.304,7.666,5.646,8.453,6.806,8.198,10.150,7.180,9.835,8.437,7.923,11.588,8.218,10.476,8.987,11.740,9.539,12.640,9.030,12.091,10.815,10.250,13.408};

typedef struct { double threshold; double actual_log10_x; double waves_needed_amp; int zeros_needed; } CalPoint;

int main(void) {
    setvbuf(stdout,NULL,_IONBF,0);
    printf("=== Experiment 46: Multi-Point Calibration ===\n\n");
    time_t t0=time(NULL);

    /* compute M and L to 5M */
    printf("Computing M(x)/√x and L(x)/√x to 5M...\n");
    double *M=calloc(MAX_N+2,sizeof(double));
    double *L=calloc(MAX_N+2,sizeof(double));
    double msum=0;double lsum=0;
    for(int i=1;i<=MAX_N;i++){msum+=mobius_val(i);M[i]=msum/sqrt(i);lsum+=(big_omega(i)%2==0)?1:-1;L[i]=lsum/sqrt(i);}
    printf("Done (%.0fs).\n\n",difftime(time(NULL),t0));

    /* compute M amplitudes from theoretical formula */
    double M_amps[30];
    double M_cum_at[31]; M_cum_at[0]=0;
    for(int n=0;n<30;n++){M_amps[n]=2.0/(gamma_n[n]*zp[n]); M_cum_at[n+1]=M_cum_at[n]+M_amps[n];}

    /* ═══ PHASE 1: Find actual breach for many |M/√x| thresholds ═══ */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: ACTUAL |M(x)/√x| THRESHOLDS AND BREACH POINTS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    CalPoint M_cal[50]; int M_ncal=0;
    double M_thresholds[]={0.05,0.10,0.15,0.20,0.25,0.30,0.35,0.40,0.45,0.50,0.55,0.60,0.65};
    int M_nth=13;

    printf("  Threshold │ First breach at x │ log₁₀(x) │ Σ|A| needed │ Zeros needed\n");
    printf("  ──────────┼───────────────────┼──────────┼─────────────┼────────────\n");

    for(int t=0;t<M_nth;t++){
        double thresh=M_thresholds[t];
        /* find first x where |M(x)/√x| > thresh */
        long long breach_x=-1;
        for(int i=2;i<=MAX_N;i++){
            if(fabs(M[i])>thresh){breach_x=i;break;}
        }
        if(breach_x>0){
            double log10_x=log10((double)breach_x);
            /* how many zeros needed: find k where M_cum_at[k] > thresh */
            int zeros=30;
            for(int k=1;k<=30;k++){if(M_cum_at[k]>thresh){zeros=k;break;}}
            M_cal[M_ncal++]=(CalPoint){thresh,log10_x,M_cum_at[zeros],zeros};
            printf("  |M/√x|>%.2f│ %17lld │   %6.2f  │    %6.4f   │     %3d\n",
                   thresh,breach_x,log10_x,M_cum_at[zeros],zeros);
        }
    }

    /* ═══ PHASE 2: Same for |L/√x| thresholds ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: ACTUAL |L(x)/√x| THRESHOLDS AND BREACH POINTS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    CalPoint L_cal[50]; int L_ncal=0;
    /* L amplitudes */
    double L_amps[30]; double L_cum_at[31]; L_cum_at[0]=0;
    for(int n=0;n<30;n++){L_amps[n]=2.0/zp[n]; L_cum_at[n+1]=L_cum_at[n]+L_amps[n];}

    double L_thresholds[]={0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,1.1};
    int L_nth=11;

    printf("  Threshold │ First breach at x │ log₁₀(x) │ Σ|A| needed │ Zeros needed\n");
    printf("  ──────────┼───────────────────┼──────────┼─────────────┼────────────\n");

    for(int t=0;t<L_nth;t++){
        double thresh=L_thresholds[t];
        long long breach_x=-1;
        for(int i=2;i<=MAX_N;i++){if(fabs(L[i])>thresh){breach_x=i;break;}}
        if(breach_x>0){
            double log10_x=log10((double)breach_x);
            int zeros=30;
            for(int k=1;k<=30;k++){if(L_cum_at[k]>thresh){zeros=k;break;}}
            L_cal[L_ncal++]=(CalPoint){thresh,log10_x,L_cum_at[zeros],zeros};
            printf("  |L/√x|>%.1f│ %17lld │   %6.2f  │    %6.4f   │     %3d\n",
                   thresh,breach_x,log10_x,L_cum_at[zeros],zeros);
        }
    }

    /* Also: Pólya (L > 0, known at 906150257) */
    printf("\n  Pólya L>0: breach at 906,150,257 (10^8.96), Σ|A| for 30 zeros = %.4f\n", L_cum_at[30]);

    /* ═══ PHASE 3: Fit zeros → breach scale from ALL calibration points ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 3: FIT THE MAPPING — zeros_needed → log₁₀(breach_x)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* combine all calibration points */
    CalPoint all_cal[100]; int n_all=0;
    for(int i=0;i<M_ncal;i++) all_cal[n_all++]=M_cal[i];
    for(int i=0;i<L_ncal;i++) all_cal[n_all++]=L_cal[i];
    /* add Pólya */
    all_cal[n_all++]=(CalPoint){0.67, 8.96, L_cum_at[30], 30};

    printf("  Total calibration points: %d\n\n", n_all);

    /* Model A: log₁₀(x) = a + b × zeros */
    { double sx=0;double sy=0;double sxx=0;double sxy=0;
      for(int i=0;i<n_all;i++){double x=all_cal[i].zeros_needed;double y=all_cal[i].actual_log10_x;sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;}
      double b=(n_all*sxy-sx*sy)/(n_all*sxx-sx*sx);double a=(sy-b*sx)/n_all;
      printf("  Model A: log₁₀(x) = %.3f + %.4f × zeros\n", a, b);
      double err=0;for(int i=0;i<n_all;i++){double p=a+b*all_cal[i].zeros_needed;err+=(p-all_cal[i].actual_log10_x)*(p-all_cal[i].actual_log10_x);}
      printf("  RMS error: %.2f decades\n\n", sqrt(err/n_all));
    }

    /* Model B: log₁₀(x) = a + b × zeros² */
    { double sx=0;double sy=0;double sxx=0;double sxy=0;
      for(int i=0;i<n_all;i++){double x=(double)all_cal[i].zeros_needed*all_cal[i].zeros_needed;double y=all_cal[i].actual_log10_x;sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;}
      double b=(n_all*sxy-sx*sy)/(n_all*sxx-sx*sx);double a=(sy-b*sx)/n_all;
      printf("  Model B: log₁₀(x) = %.3f + %.6f × zeros²\n", a, b);
      double err=0;for(int i=0;i<n_all;i++){double p=a+b*(double)all_cal[i].zeros_needed*all_cal[i].zeros_needed;err+=(p-all_cal[i].actual_log10_x)*(p-all_cal[i].actual_log10_x);}
      printf("  RMS error: %.2f decades\n\n", sqrt(err/n_all));
    }

    /* Model C: log₁₀(x) = a + b × exp(c × zeros) — search c */
    double best_a=0;double best_b=0;double best_c=0;double best_err=1e30;
    for(double c=0.01;c<1.0;c+=0.01){
        double sx=0;double sy=0;double sxx=0;double sxy=0;int valid=1;
        for(int i=0;i<n_all;i++){
            double x=exp(c*all_cal[i].zeros_needed);
            if(x>1e30){valid=0;break;}
            double y=all_cal[i].actual_log10_x;sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;
        }
        if(!valid)continue;
        double b=(n_all*sxy-sx*sy)/(n_all*sxx-sx*sx);double a=(sy-b*sx)/n_all;
        double err=0;
        for(int i=0;i<n_all;i++){double p=a+b*exp(c*all_cal[i].zeros_needed);err+=(p-all_cal[i].actual_log10_x)*(p-all_cal[i].actual_log10_x);}
        err=sqrt(err/n_all);
        if(err<best_err){best_err=err;best_a=a;best_b=b;best_c=c;}
    }
    printf("  Model C: log₁₀(x) = %.3f + %.6f × exp(%.3f × zeros)\n", best_a, best_b, best_c);
    printf("  RMS error: %.2f decades\n\n", best_err);

    /* Model D: log₁₀(x) = a + b × zeros^c — search c */
    double d_best_a=0;double d_best_b=0;double d_best_c=0;double d_best_err=1e30;
    for(double c=0.5;c<5.0;c+=0.05){
        double sx=0;double sy=0;double sxx=0;double sxy=0;
        for(int i=0;i<n_all;i++){double x=pow(all_cal[i].zeros_needed,c);double y=all_cal[i].actual_log10_x;sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;}
        double b=(n_all*sxy-sx*sy)/(n_all*sxx-sx*sx);double a=(sy-b*sx)/n_all;
        double err=0;
        for(int i=0;i<n_all;i++){double p=a+b*pow(all_cal[i].zeros_needed,c);err+=(p-all_cal[i].actual_log10_x)*(p-all_cal[i].actual_log10_x);}
        err=sqrt(err/n_all);
        if(err<d_best_err){d_best_err=err;d_best_a=a;d_best_b=b;d_best_c=c;}
    }
    printf("  Model D: log₁₀(x) = %.3f + %.6f × zeros^%.2f\n", d_best_a, d_best_b, d_best_c);
    printf("  RMS error: %.2f decades\n\n", d_best_err);

    /* print validation for best model */
    double *use_a;double *use_b;double *use_c;const char *use_name;double use_err;
    if(best_err < d_best_err){use_a=&best_a;use_b=&best_b;use_c=&best_c;use_name="C (exponential)";use_err=best_err;}
    else{use_a=&d_best_a;use_b=&d_best_b;use_c=&d_best_c;use_name="D (power)";use_err=d_best_err;}

    printf("  BEST MODEL: %s (RMS %.2f decades)\n\n", use_name, use_err);

    printf("  Validation:\n");
    printf("  Thresh │ Zeros │ Actual 10^ │ Predicted 10^ │ Error\n");
    printf("  ───────┼───────┼────────────┼───────────────┼──────\n");

    for(int i=0;i<n_all;i++){
        double pred;
        if(use_a==&best_a) pred=best_a+best_b*exp(best_c*all_cal[i].zeros_needed);
        else pred=d_best_a+d_best_b*pow(all_cal[i].zeros_needed,d_best_c);
        printf("   %5.2f │   %3d │     %5.2f  │       %5.2f   │ %+.2f\n",
               all_cal[i].threshold,all_cal[i].zeros_needed,
               all_cal[i].actual_log10_x,pred,pred-all_cal[i].actual_log10_x);
    }

    /* ═══ PHASE 4: PREDICT UNKNOWNS WITH BEST MODEL ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("THE NUMBERS (using best model)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* from exp45: zeros needed for each conjecture */
    typedef struct { const char *name; int zeros; const char *known; } Prediction;
    Prediction preds[] = {
        {"Pólya L>0",            30,   "10^9 (known)"},
        {"Mertens |M/√x|>1",   4163,  "10^(10^40) (known)"},
        {"Mertens |M/√x|>2",   298991,"known BROKEN"},
        {"Skewes π>li",          200,   "~10^316 (known)"},
        {"|L/√x| > 10",         4084,  "unknown"},
        {"RH |err/√x|>1",      1000,  "unknown (Littlewood)"},
    };
    int npred=6;

    printf("  Conjecture           │ Zeros │ Predicted 10^    │ Known\n");
    printf("  ─────────────────────┼───────┼──────────────────┼─────────────\n");

    for(int p=0;p<npred;p++){
        double pred;
        if(use_a==&best_a) pred=best_a+best_b*exp(best_c*preds[p].zeros);
        else pred=d_best_a+d_best_b*pow(preds[p].zeros,d_best_c);

        if(pred<1e15)
            printf("  %-21s │ %5d │      10^%-9.1f │ %s\n",preds[p].name,preds[p].zeros,pred,preds[p].known);
        else if(pred<1e100)
            printf("  %-21s │ %5d │      10^%-9.1e │ %s\n",preds[p].name,preds[p].zeros,pred,preds[p].known);
        else
            printf("  %-21s │ %5d │      10^(10^%.1f)│ %s\n",preds[p].name,preds[p].zeros,log10(pred),preds[p].known);
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));
    free(M);free(L);
    return 0;
}
