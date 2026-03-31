/*
 * Experiment 44: γ-to-Scale Mapping — Calibrate from Known Breaches
 *
 * We know:
 *   - Pólya breaches at x = 10^9, needs γ ≈ 195 (from exp43)
 *   - |M/√x| > 0.5 at x ≈ 10^0.5 = 3, needs γ ≈ 14 (just γ₁)
 *   - |M/√x| > 0.3 at x ≈ 10^2, needs γ ≈ 14
 *   - |L/√x| > 0.5 at x ≈ 10^1.3, needs γ ≈ 14
 *   - |L/√x| > 1.0 at x ≈ 10^7.7, needs γ ≈ ~100
 *
 * From these data points: fit the relationship
 *   log₁₀(x_breach) = f(γ_needed, Σ|A|, threshold)
 *
 * Then apply to unknowns.
 *
 * The physics: breach happens when enough waves ALIGN.
 * Alignment probability decreases exponentially with wave count.
 * More waves needed → exponentially larger scale for alignment.
 * So: log(x) ∝ γ_needed^α for some α > 1.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 5000000
#define MAX_WAVES 100

typedef struct { double freq, amp, phase; } Wave;

static int big_omega(long long n){int c=0;for(long long p=2;p*p<=n;p++)while(n%p==0){c++;n/=p;}if(n>1)c++;return c;}
static int mobius_val(long long n){int f=0;for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}}if(n>1)f++;return(f%2==0)?1:-1;}

static int extract(const double *func, int n, Wave *waves, int max_w) {
    int dft_n=4096;
    double *v=malloc(dft_n*sizeof(double));double *lx=malloc(dft_n*sizeof(double));
    double lmin=log(10.0);double lmax=log((double)n);double ls=(lmax-lmin)/(dft_n-1);
    for(int i=0;i<dft_n;i++){double l=lmin+i*ls;int idx=(int)exp(l);if(idx<1)idx=1;if(idx>n)idx=n;v[i]=func[idx];lx[i]=l;}
    double sx=0;double sy=0;double sxx=0;double sxy=0;
    for(int i=0;i<dft_n;i++){sx+=lx[i];sy+=v[i];sxx+=lx[i]*lx[i];sxy+=lx[i]*v[i];}
    double sl=(dft_n*sxy-sx*sy)/(dft_n*sxx-sx*sx);double ic=(sy-sl*sx)/dft_n;
    for(int i=0;i<dft_n;i++)v[i]-=(sl*lx[i]+ic);
    Wave all[1000];int na=0;double pp=0;double ppp=0;
    for(int fi=0;fi<4000;fi++){
        double g=5.0+fi*0.05;double a=0;double b=0;
        for(int i=0;i<dft_n;i++){double ph=g*lx[i];a+=v[i]*cos(ph);b+=v[i]*sin(ph);}
        a*=2.0/dft_n;b*=2.0/dft_n;double p=a*a+b*b;
        if(fi>=2&&ppp<pp&&pp>p&&pp>1e-9&&na<1000)all[na++]=(Wave){5.0+(fi-1)*0.05,sqrt(pp),atan2(b,a)};
        ppp=pp;pp=p;
    }
    for(int i=0;i<na-1;i++)for(int j=i+1;j<na;j++)if(all[j].amp>all[i].amp){Wave t=all[i];all[i]=all[j];all[j]=t;}
    int nw=na<max_w?na:max_w;for(int i=0;i<nw;i++)waves[i]=all[i];
    free(v);free(lx);return nw;
}

/* zero counting */
static double N_zeros(double T){if(T<10)return 0;return T/(2*M_PI)*log(T/(2*M_PI))-T/(2*M_PI);}

int main(void) {
    setvbuf(stdout,NULL,_IONBF,0);
    printf("=== Experiment 44: γ-to-Scale Mapping ===\n\n");
    time_t t0=time(NULL);

    double *M=calloc(MAX_N+2,sizeof(double));
    double *L=calloc(MAX_N+2,sizeof(double));
    double msum=0;double lsum=0;
    for(int i=1;i<=MAX_N;i++){msum+=mobius_val(i);M[i]=msum/sqrt(i);lsum+=(big_omega(i)%2==0)?1:-1;L[i]=lsum/sqrt(i);}

    Wave M_w[MAX_WAVES]; int M_nw=extract(M,MAX_N,M_w,MAX_WAVES);
    Wave L_w[MAX_WAVES]; int L_nw=extract(L,MAX_N,L_w,MAX_WAVES);

    /* sort by frequency */
    for(int i=0;i<M_nw-1;i++)for(int j=i+1;j<M_nw;j++)if(M_w[j].freq<M_w[i].freq){Wave t=M_w[i];M_w[i]=M_w[j];M_w[j]=t;}
    for(int i=0;i<L_nw-1;i++)for(int j=i+1;j<L_nw;j++)if(L_w[j].freq<L_w[i].freq){Wave t=L_w[i];L_w[i]=L_w[j];L_w[j]=t;}

    /* ═══ PHASE 1: Known calibration points ═══ */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: CALIBRATION DATA — known breaches\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* for each known breach: compute how many waves are needed (Σ|A| > threshold) */
    typedef struct {
        const char *name;
        double log10_x_actual;  /* known breach scale */
        double threshold;       /* value that was breached */
        double dc;              /* DC offset of function */
        Wave *waves;
        int nw;
        int waves_needed;       /* how many waves to reach Σ|A| > threshold+|DC| */
        double gamma_needed;    /* max γ of those waves */
    } CalPoint;

    /* compute DC */
    double M_dc=0;for(int i=1;i<=MAX_N;i++)M_dc+=M[i];M_dc/=MAX_N;
    double L_dc=0;for(int i=1;i<=MAX_N;i++)L_dc+=L[i];L_dc/=MAX_N;

    CalPoint cal[] = {
        {"|M/√x|>0.3",   2.0,  0.3, M_dc, M_w, M_nw, 0, 0},
        {"|M/√x|>0.5",   0.5,  0.5, M_dc, M_w, M_nw, 0, 0},
        {"|L/√x|>0.5",   1.3,  0.5, L_dc, L_w, L_nw, 0, 0},
        {"Pólya L>0",    8.96, fabs(L_dc), L_dc, L_w, L_nw, 0, 0},
        {"|L/√x|>1.0",   7.7,  1.0, L_dc, L_w, L_nw, 0, 0},
    };
    int ncal = 5;

    printf("  Conjecture     │ log₁₀(x) │ Threshold+|DC| │ Waves needed │ γ_max  \n");
    printf("  ───────────────┼──────────┼────────────────┼──────────────┼────────\n");

    for (int c = 0; c < ncal; c++) {
        double need = cal[c].threshold;
        double cumA = 0;
        int k;
        for (k = 0; k < cal[c].nw; k++) {
            cumA += cal[c].waves[k].amp;
            if (cumA >= need) break;
        }
        cal[c].waves_needed = k + 1;
        cal[c].gamma_needed = k < cal[c].nw ? cal[c].waves[k].freq : 999;

        printf("  %-15s │   %5.2f  │     %5.2f       │     %4d     │ %6.1f\n",
               cal[c].name, cal[c].log10_x_actual, need,
               cal[c].waves_needed, cal[c].gamma_needed);
    }

    /* ═══ PHASE 2: Fit the relationship ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: FIT log₁₀(x) vs waves_needed and γ_needed\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* Model 1: log₁₀(x) = a + b × log₁₀(waves_needed) */
    { double sx=0;double sy=0;double sxx=0;double sxy=0;int n=0;
      for(int c=0;c<ncal;c++){if(cal[c].waves_needed>0&&cal[c].log10_x_actual>0){
        double x=log10(cal[c].waves_needed);double y=cal[c].log10_x_actual;
        sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;n++;}}
      double b=(n*sxy-sx*sy)/(n*sxx-sx*sx);double a=(sy-b*sx)/n;
      printf("  Model 1: log₁₀(x) = %.2f + %.2f × log₁₀(waves)\n", a, b);
      printf("           x = 10^%.2f × waves^%.2f\n\n", a, b);

      /* validate */
      printf("  Validation:\n");
      printf("  Conjecture     │ Actual 10^ │ Predicted 10^ │ Error\n");
      printf("  ───────────────┼────────────┼───────────────┼──────\n");
      for(int c=0;c<ncal;c++){
        double pred=a+b*log10(cal[c].waves_needed>0?cal[c].waves_needed:1);
        printf("  %-15s │    %5.2f   │     %5.2f     │ %+.2f\n",
               cal[c].name,cal[c].log10_x_actual,pred,pred-cal[c].log10_x_actual);
      }
    }

    /* Model 2: log₁₀(x) = a + b × γ_needed */
    printf("\n");
    double fit_a2=0;double fit_b2=0;
    { double sx=0;double sy=0;double sxx=0;double sxy=0;int n=0;
      for(int c=0;c<ncal;c++){if(cal[c].gamma_needed<500&&cal[c].log10_x_actual>0){
        double x=cal[c].gamma_needed;double y=cal[c].log10_x_actual;
        sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;n++;}}
      fit_b2=(n*sxy-sx*sy)/(n*sxx-sx*sx);fit_a2=(sy-fit_b2*sx)/n;
      printf("  Model 2: log₁₀(x) = %.2f + %.4f × γ\n", fit_a2, fit_b2);

      printf("  Validation:\n");
      printf("  Conjecture     │ Actual 10^ │ Predicted 10^ │ Error\n");
      printf("  ───────────────┼────────────┼───────────────┼──────\n");
      for(int c=0;c<ncal;c++){
        double pred=fit_a2+fit_b2*cal[c].gamma_needed;
        printf("  %-15s │    %5.2f   │     %5.2f     │ %+.2f\n",
               cal[c].name,cal[c].log10_x_actual,pred,pred-cal[c].log10_x_actual);
      }
    }

    /* Model 3: log₁₀(x) = a + b × γ^c (power law) */
    printf("\n");
    { /* try c = 1.5, 2.0, 2.5 and pick best */
      double best_err=1e30;double best_a=0;double best_b=0;double best_c=0;
      for(double c=0.5;c<=3.0;c+=0.1){
        double sx=0;double sy=0;double sxx=0;double sxy=0;int n=0;
        for(int cc=0;cc<ncal;cc++){if(cal[cc].gamma_needed<500&&cal[cc].log10_x_actual>0){
          double x=pow(cal[cc].gamma_needed,c);double y=cal[cc].log10_x_actual;
          sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;n++;}}
        if(n<2)continue;
        double b=(n*sxy-sx*sy)/(n*sxx-sx*sx);double a=(sy-b*sx)/n;
        double err=0;
        for(int cc=0;cc<ncal;cc++){if(cal[cc].gamma_needed<500){
          double pred=a+b*pow(cal[cc].gamma_needed,c);
          err+=(pred-cal[cc].log10_x_actual)*(pred-cal[cc].log10_x_actual);}}
        if(err<best_err){best_err=err;best_a=a;best_b=b;best_c=c;}
      }
      printf("  Model 3: log₁₀(x) = %.2f + %.6f × γ^%.1f  (best fit)\n", best_a, best_b, best_c);

      printf("  Validation:\n");
      printf("  Conjecture     │ Actual 10^ │ Predicted 10^ │ Error\n");
      printf("  ───────────────┼────────────┼───────────────┼──────\n");
      for(int c=0;c<ncal;c++){
        double pred=best_a+best_b*pow(cal[c].gamma_needed,best_c);
        printf("  %-15s │    %5.2f   │     %5.2f     │ %+.2f\n",
               cal[c].name,cal[c].log10_x_actual,pred,pred-cal[c].log10_x_actual);
      }

      /* ═══ PHASE 3: PREDICT UNKNOWNS ═══ */
      printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
      printf("PHASE 3: THE NUMBERS — predicted breach scales\n");
      printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

      printf("  Using Model 3: log₁₀(x) = %.2f + %.6f × γ^%.1f\n\n", best_a, best_b, best_c);

      /* compute Σ|A| growth for M and find γ where it crosses each threshold */
      /* use measured decay: A(γ) = C × γ^b */
      /* M: C=38.06, b=-2.08 */
      double M_C=38.06;double M_b_decay=-2.08;
      double L_C=0.022;double L_b_decay=-0.14;

      typedef struct { const char *name; double threshold; double decay_C; double decay_b;
                        double measured_sum; double last_g; } Predict;
      Predict preds[] = {
        {"Pólya L>0",            fabs(L_dc), L_C, L_b_decay, 1.994, 186},
        {"Mertens |M/√x|>1",   1.0, M_C, M_b_decay, 1.579, 186},
        {"Mertens |M/√x|>2",   2.0, M_C, M_b_decay, 1.579, 186},
        {"Skewes π>li",          0.1, M_C*0.3, M_b_decay, 0.414, 186},
        {"RH |err/√x|>1",      1.0, M_C*0.3, M_b_decay, 0.414, 186},
        {"RH |err/√x|>2",      2.0, M_C*0.3, M_b_decay, 0.414, 186},
      };
      int npred=6;

      printf("  Conjecture         │ Threshold │ γ needed  │ # zeros  │ Predicted 10^     │ Known\n");
      printf("  ───────────────────┼───────────┼───────────┼──────────┼───────────────────┼──────\n");

      for(int p=0;p<npred;p++){
        double cumA=preds[p].measured_sum;
        double g;int found=0;
        for(g=preds[p].last_g;g<1e15;g*=1.001){
          double density=log(g)/(2*M_PI);
          double dg_step=g*0.001;
          cumA+=preds[p].decay_C*pow(g,preds[p].decay_b)*density*dg_step;
          if(cumA>preds[p].threshold){found=1;break;}
        }

        if(found){
          int nz=(int)N_zeros(g);
          double pred_log10=best_a+best_b*pow(g,best_c);
          printf("  %-19s │   %5.2f   │ %9.0f │ %8d │     10^%-11.1f │",
                 preds[p].name,preds[p].threshold,g,nz,pred_log10);
          if(strcmp(preds[p].name,"Pólya L>0")==0) printf(" 10^9");
          if(strcmp(preds[p].name,"Mertens |M/√x|>1")==0) printf(" 10^(10^40)");
          if(strcmp(preds[p].name,"Skewes π>li")==0) printf(" ~10^316");
          printf("\n");
        } else {
          /* sum converges — find the limit */
          printf("  %-19s │   %5.2f   │ Σ|A|→%.2f  │ converges│ NEVER (30-wave)    │",
                 preds[p].name,preds[p].threshold,cumA);
          if(strcmp(preds[p].name,"Mertens |M/√x|>2")==0) printf(" known BROKEN");
          printf("\n");
        }
      }
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));
    free(M);free(L);
    return 0;
}
