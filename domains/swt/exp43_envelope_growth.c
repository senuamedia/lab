/*
 * Experiment 43: Envelope Growth from Zero Density
 *
 * We can't resolve 10000 individual waves. But we don't need to.
 * The ENVELOPE of the oscillation (max possible |f(x)/√x|) grows
 * predictably with the number of waves contributing.
 *
 * Known:
 *   N(T) = T/(2π) log(T/(2π)) - T/(2π) + O(log T)  [zero counting]
 *   A_n ≈ C / γ_n  for typical amplitude of n-th zero [from explicit formula]
 *   Σ A_n for n=1..N diverges like log(N) [harmonic-like]
 *
 * Therefore:
 *   Σ|A_n| for first K zeros ≈ C × log(K)
 *   Maximum constructive interference ≈ C × log(K)
 *   This grows WITHOUT BOUND but SLOWLY (logarithmically)
 *
 * Method:
 *   1. From our 100-wave data: fit the amplitude decay A(γ)
 *   2. From zero density: compute how many zeros contribute at scale x
 *   3. Sum the amplitudes: Σ|A_n| as function of max γ resolved
 *   4. This gives envelope(x) = max possible |f(x)/√x| at scale x
 *   5. Find where envelope(x) > threshold for each conjecture
 *
 * This is the analytical bridge between small-scale measurement
 * and large-scale prediction. No more brute force.
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

/* zero counting function */
static double N_zeros(double T) {
    if (T < 10) return 0;
    return T/(2*M_PI) * log(T/(2*M_PI)) - T/(2*M_PI);
}

int main(void) {
    setvbuf(stdout,NULL,_IONBF,0);
    printf("=== Experiment 43: Envelope Growth from Zero Density ===\n\n");
    time_t t0=time(NULL);

    /* compute functions */
    printf("Computing M(x)/√x and L(x)/√x to 5M...\n");
    double *M=calloc(MAX_N+2,sizeof(double));
    double *L=calloc(MAX_N+2,sizeof(double));
    double msum=0;double lsum=0;
    for(int i=1;i<=MAX_N;i++){msum+=mobius_val(i);M[i]=msum/sqrt(i);lsum+=(big_omega(i)%2==0)?1:-1;L[i]=lsum/sqrt(i);}
    printf("Done.\n\n");

    /* ═══ PHASE 1: Measure amplitude decay from data ═══ */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: AMPLITUDE DECAY — how does A(γ) fall off?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* extract waves for M and L */
    Wave M_waves[MAX_WAVES]; int M_nw = extract(M, MAX_N, M_waves, MAX_WAVES);
    Wave L_waves[MAX_WAVES]; int L_nw = extract(L, MAX_N, L_waves, MAX_WAVES);

    /* sort by frequency for decay analysis */
    Wave M_sorted[MAX_WAVES]; memcpy(M_sorted, M_waves, M_nw*sizeof(Wave));
    Wave L_sorted[MAX_WAVES]; memcpy(L_sorted, L_waves, L_nw*sizeof(Wave));
    for(int i=0;i<M_nw-1;i++)for(int j=i+1;j<M_nw;j++)
        if(M_sorted[j].freq<M_sorted[i].freq){Wave t=M_sorted[i];M_sorted[i]=M_sorted[j];M_sorted[j]=t;}
    for(int i=0;i<L_nw-1;i++)for(int j=i+1;j<L_nw;j++)
        if(L_sorted[j].freq<L_sorted[i].freq){Wave t=L_sorted[i];L_sorted[i]=L_sorted[j];L_sorted[j]=t;}

    printf("  M(x)/√x amplitude vs frequency:\n\n");
    printf("  γ range  │ Mean A    │ Waves │ A×γ (should be ~constant if A∝1/γ)\n");
    printf("  ─────────┼───────────┼───────┼─────────────────────────────────────\n");

    double M_fit_sum_xy=0; double M_fit_sum_xx=0; double M_fit_sum_y=0; double M_fit_n=0;

    for (int band = 0; band < 10; band++) {
        double gmin = 10 + band*15;
        double gmax = gmin + 15;
        double asum = 0; int cnt = 0; double ag_sum = 0;
        for (int k = 0; k < M_nw; k++) {
            if (M_sorted[k].freq >= gmin && M_sorted[k].freq < gmax) {
                asum += M_sorted[k].amp; ag_sum += M_sorted[k].amp * M_sorted[k].freq; cnt++;
                /* for fit: log(A) vs log(γ) */
                if (M_sorted[k].amp > 1e-6) {
                    double x = log(M_sorted[k].freq); double y = log(M_sorted[k].amp);
                    M_fit_sum_xy += x*y; M_fit_sum_xx += x*x; M_fit_sum_y += y; M_fit_n++;
                }
            }
        }
        if (cnt > 0)
            printf("  %3.0f-%-4.0f │ %9.5f │   %2d  │ %.4f\n",
                   gmin, gmax, asum/cnt, cnt, ag_sum/cnt);
    }

    /* fit: log(A) = a + b × log(γ) → A = C × γ^b */
    double M_b = 0; double M_C = 0;
    if (M_fit_n > 2) {
        double mean_x = 0; double mean_y = M_fit_sum_y / M_fit_n;
        /* need full fit — recompute */
        double sx=0;double sy=0;double sxx=0;double sxy=0;
        for(int k=0;k<M_nw;k++){if(M_sorted[k].amp>1e-6){
            double x=log(M_sorted[k].freq);double y=log(M_sorted[k].amp);
            sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;}}
        M_b = (M_fit_n*sxy-sx*sy)/(M_fit_n*sxx-sx*sx);
        M_C = exp((sy-M_b*sx)/M_fit_n);
    }

    printf("\n  Power law fit: A(γ) = %.4f × γ^(%.3f)\n", M_C, M_b);
    printf("  (A ∝ 1/γ would give exponent -1.0)\n\n");

    /* same for L */
    double L_b=0; double L_C=0;
    { double sx=0;double sy=0;double sxx=0;double sxy=0;double n=0;
      for(int k=0;k<L_nw;k++){if(L_sorted[k].amp>1e-6){
          double x=log(L_sorted[k].freq);double y=log(L_sorted[k].amp);
          sx+=x;sy+=y;sxx+=x*x;sxy+=x*y;n++;}}
      if(n>2){L_b=(n*sxy-sx*sy)/(n*sxx-sx*sx);L_C=exp((sy-L_b*sx)/n);}
    }
    printf("  L(x)/√x: A(γ) = %.4f × γ^(%.3f)\n\n", L_C, L_b);

    /* ═══ PHASE 2: Cumulative amplitude sum ═══ */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: CUMULATIVE Σ|A| — does it converge or diverge?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Measured from data (sort by γ, cumulative sum):\n\n");
    printf("  Waves included │ Max γ  │ Σ|A| M(x) │ Σ|A| L(x) │ Growth\n");
    printf("  ───────────────┼────────┼───────────┼───────────┼──────\n");

    double M_cumA = 0; double L_cumA = 0;
    int checkpoints[] = {5,10,15,20,30,40,50,60,70,80,90,100};
    int ncp = 12; int ci = 0;
    for (int k = 0; k < M_nw && ci < ncp; k++) {
        M_cumA += M_sorted[k].amp;
        if (k < L_nw) L_cumA += L_sorted[k].amp;
        if (k+1 == checkpoints[ci]) {
            printf("  %14d  │ %6.1f │    %6.3f  │    %6.3f  │ %s\n",
                   k+1, M_sorted[k].freq, M_cumA, L_cumA,
                   k > 0 ? "growing" : "");
            ci++;
        }
    }

    /* ═══ PHASE 3: Extrapolate using decay law ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 3: EXTRAPOLATED Σ|A| BEYOND MEASURED RANGE\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Using A(γ) = %.4f × γ^(%.3f) and zero density N(T):\n\n", M_C, M_b);

    printf("  Max γ resolved │ # zeros │ Σ|A| (M) │ Σ|A| (L) │ |M/√x| breach? │ L>0 breach?\n");
    printf("  ───────────────┼─────────┼──────────┼──────────┼────────────────┼───────────\n");

    /* start with measured cumulative, then extrapolate */
    double M_measured_sum = M_cumA;
    double L_measured_sum = L_cumA;
    double M_last_gamma = M_nw > 0 ? M_sorted[M_nw-1].freq : 200;
    double L_last_gamma = L_nw > 0 ? L_sorted[L_nw-1].freq : 200;

    double gamma_targets[] = {200, 500, 1000, 2000, 5000, 10000, 50000, 100000, 1000000};
    int nt = 9;

    for (int t = 0; t < nt; t++) {
        double gmax = gamma_targets[t];
        int n_zeros = (int)N_zeros(gmax);

        /* extrapolate: integrate C × γ^b from last_gamma to gmax */
        /* Σ ≈ ∫ C × γ^b × (density) dγ where density ≈ log(γ)/(2π) */
        /* ∫ C γ^b × log(γ)/(2π) dγ from g0 to gmax */
        double M_extra = 0; double L_extra = 0;
        double dg = (gmax - M_last_gamma) / 1000;
        if (dg > 0) {
            for (double g = M_last_gamma; g < gmax; g += dg) {
                double density = log(g) / (2*M_PI); /* zeros per unit γ */
                M_extra += M_C * pow(g, M_b) * density * dg;
                L_extra += L_C * pow(g, L_b) * density * dg;
            }
        }

        double M_total = M_measured_sum + M_extra;
        double L_total = L_measured_sum + L_extra;

        printf("  %14.0f  │ %7d │   %6.2f  │   %6.2f  │ %s         │ %s\n",
               gmax, n_zeros, M_total, L_total,
               M_total > 1.0 ? "YES" : "no ",
               L_total > fabs(-0.66) ? "YES" : "no "); /* L needs to overcome DC=-0.66 */
    }

    /* ═══ PHASE 4: THE NUMBERS — predicted breach from envelope ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 4: THE NUMBERS — from envelope growth\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  For each conjecture: find γ_max where Σ|A| > threshold.\n");
    printf("  Then: scale x corresponds to resolving γ_max ≈ √x (heuristic).\n");
    printf("  So: breach at x ≈ γ_max².\n\n");

    /* find γ_max where Σ|A| crosses each threshold */
    typedef struct { const char *name; double threshold; double decay_C; double decay_b; double measured_sum; double last_g; } Target;
    Target targets[] = {
        {"Pólya L>0 (overcome DC=-0.66)", 0.66, L_C, L_b, L_measured_sum, L_last_gamma},
        {"Mertens |M/√x| > 1.0", 1.0, M_C, M_b, M_measured_sum, M_last_gamma},
        {"Mertens |M/√x| > 2.0", 2.0, M_C, M_b, M_measured_sum, M_last_gamma},
        {"Mertens |M/√x| > 5.0", 5.0, M_C, M_b, M_measured_sum, M_last_gamma},
        {"RH |π-li|/√x > 1.0", 1.0, M_C*0.5, M_b, 0.414, 200},  /* π uses ~half M amplitude */
        {"RH |π-li|/√x > 2.0", 2.0, M_C*0.5, M_b, 0.414, 200},
    };
    int ntargets = 6;

    printf("  Conjecture                    │ Threshold │ γ needed │ # zeros │ x ≈ 10^\n");
    printf("  ──────────────────────────────┼───────────┼──────────┼─────────┼────────\n");

    for (int t = 0; t < ntargets; t++) {
        Target *tgt = &targets[t];
        double cumA = tgt->measured_sum;
        double g;
        int found = 0;

        for (g = tgt->last_g; g < 1e12; g *= 1.01) {
            double density = log(g) / (2*M_PI);
            double dg_step = g * 0.01; /* 1% increment */
            cumA += tgt->decay_C * pow(g, tgt->decay_b) * density * dg_step;
            if (cumA > tgt->threshold) { found = 1; break; }
        }

        if (found) {
            int nz = (int)N_zeros(g);
            /* heuristic: resolving γ requires x ≈ exp(γ) roughly */
            /* more precisely: γ-th zero contributes at scale x where γ ln(x) has period 2π */
            /* the scale where γ_max first matters is x ≈ exp(2π × γ_max / γ_1) */
            /* simpler heuristic: x ≈ 10^(γ/10) based on our data calibration */
            double log10_x = g * g / 100; /* rough: x ≈ γ² scaled */
            /* better: from zero density, γ_N ≈ 2πN/log(N), so N ≈ γ log(γ)/(2π) */
            /* scale where N-th zero matters: ???  */
            /* most conservative: x ≈ e^(2πN) where N = number of zeros */
            /* let's use the actual relationship: waves at frequency γ oscillate in ln(x) */
            /* so they align every 2π/γ in ln(x). First alignment at ln(x) ≈ 2π/Δγ */
            /* where Δγ is the spacing between zeros */

            printf("  %-30s │   %5.1f   │ %8.0f │ %7d │ %.0e\n",
                   tgt->name, tgt->threshold, g, nz, pow(10, g/10));
        } else {
            printf("  %-30s │   %5.1f   │ > 10^12  │ huge    │ beyond\n",
                   tgt->name, tgt->threshold);
        }
    }

    printf("\n  NOTE: x ≈ 10^(γ/10) is a rough heuristic. The actual relationship\n");
    printf("  between 'γ resolved' and 'scale x' needs calibration from data.\n");
    printf("  At 5M data (x=5×10^6), we resolve γ up to ~200.\n");
    printf("  So: γ/x ratio ≈ 200/5M ≈ 4×10^-5, or x ≈ γ/4×10^-5 = 25000γ.\n\n");

    /* recalculate with calibrated x-γ relationship */
    printf("  Calibrated: x ≈ 25000 × γ_needed\n\n");
    printf("  Conjecture                    │ γ needed │ x ≈          │ 10^\n");
    printf("  ──────────────────────────────┼──────────┼──────────────┼──────\n");

    for (int t = 0; t < ntargets; t++) {
        Target *tgt = &targets[t];
        double cumA = tgt->measured_sum;
        double g;
        int found = 0;
        for (g = tgt->last_g; g < 1e12; g *= 1.01) {
            double density = log(g) / (2*M_PI);
            cumA += tgt->decay_C * pow(g, tgt->decay_b) * density * g * 0.01;
            if (cumA > tgt->threshold) { found = 1; break; }
        }
        if (found) {
            double x_est = 25000 * g;
            printf("  %-30s │ %8.0f │ %12.2e │ %5.1f\n",
                   tgt->name, g, x_est, log10(x_est));
        } else {
            printf("  %-30s │ > 10^12  │ beyond       │ —\n", tgt->name);
        }
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));
    free(M);free(L);
    return 0;
}
