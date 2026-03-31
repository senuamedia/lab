/*
 * Experiment 39: Mertens Deep — Maximum wave extraction
 *
 * M(x)/√x scored 5/5 at 100% match rate. Now push to 5M scale
 * to extract 50+ waves and project the breach to |M/√x| > 1.
 *
 * Known: breach at ~10^(10^40). Our model with 20 waves maxes at 0.48.
 * Need: enough waves that Σ|Aᵢ| > 1.0, then find when they align.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_N 5000000
#define DFT_N 4096
#define MAX_WAVES 100

typedef struct { double freq, amp, phase; } Wave;

static int mobius_val(long long n) {
    int f=0; for(long long p=2;p*p<=n;p++){if(n%p==0){n/=p;f++;if(n%p==0)return 0;}} if(n>1)f++; return(f%2==0)?1:-1;
}

static double rz[] = {
    14.13,21.02,25.01,30.42,32.94,37.59,40.92,43.33,48.01,49.77,
    52.97,56.45,59.35,60.83,65.11,67.08,69.55,72.07,75.70,77.14,
    79.34,82.91,84.74,87.43,88.81,92.49,94.65,95.87,98.83,101.32
};

int main(void) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== Experiment 39: Mertens Deep — 5M scale, 100 waves ===\n\n");
    time_t start = time(NULL);

    /* compute M(x)/√x */
    printf("Computing M(x)/√x to %dM...\n", MAX_N/1000000);
    double *func = calloc(MAX_N+2, sizeof(double));
    double sum = 0;
    for (int i = 1; i <= MAX_N; i++) { sum += mobius_val(i); func[i] = sum / sqrt(i); }
    printf("Done in %.0fs. M(%d)/√%d = %.4f\n\n", difftime(time(NULL),start), MAX_N, MAX_N, func[MAX_N]);

    /* DFT sampling in log space */
    double *vals = malloc(DFT_N * sizeof(double));
    double *logx = malloc(DFT_N * sizeof(double));
    double log_min = log(100.0), log_max = log((double)MAX_N);
    double log_step = (log_max - log_min) / (DFT_N - 1);
    for (int i = 0; i < DFT_N; i++) {
        double lx = log_min + i * log_step;
        int idx = (int)exp(lx); if (idx<1) idx=1; if (idx>MAX_N) idx=MAX_N;
        vals[i] = func[idx]; logx[i] = lx;
    }

    double dc = 0;
    for (int i = 0; i < DFT_N; i++) dc += vals[i];
    dc /= DFT_N;
    printf("DC offset: %+.6f\n\n", dc);

    /* fine DFT scan: γ = 5.0 to 150.0 in steps of 0.05 */
    printf("Scanning γ = 5.0 to 150.0 (step 0.05, 2900 frequencies)...\n");
    int n_freqs = 2900;
    double *powers = malloc(n_freqs * sizeof(double));
    double *freqs = malloc(n_freqs * sizeof(double));
    double *phases = malloc(n_freqs * sizeof(double));

    for (int fi = 0; fi < n_freqs; fi++) {
        double gamma = 5.0 + fi * 0.05;
        double a=0, b=0;
        for (int i = 0; i < DFT_N; i++) {
            double ph = gamma * logx[i];
            a += vals[i]*cos(ph); b += vals[i]*sin(ph);
        }
        a *= 2.0/DFT_N; b *= 2.0/DFT_N;
        powers[fi] = a*a + b*b; freqs[fi] = gamma; phases[fi] = atan2(b,a);
    }
    printf("Scan done in %.0fs.\n\n", difftime(time(NULL),start));

    /* extract ALL local maxima */
    Wave all_waves[500]; int n_all = 0;
    for (int fi = 1; fi < n_freqs-1; fi++) {
        if (powers[fi] > powers[fi-1] && powers[fi] > powers[fi+1] && powers[fi] > 1e-8) {
            if (n_all < 500) all_waves[n_all++] = (Wave){freqs[fi], sqrt(powers[fi]), phases[fi]};
        }
    }

    /* sort by amplitude */
    for (int i=0;i<n_all-1;i++) for(int j=i+1;j<n_all;j++)
        if(all_waves[j].amp>all_waves[i].amp){Wave t=all_waves[i];all_waves[i]=all_waves[j];all_waves[j]=t;}

    int nw = n_all < MAX_WAVES ? n_all : MAX_WAVES;
    printf("Local maxima found: %d. Using top %d.\n\n", n_all, nw);

    /* report waves and match to zeta zeros */
    printf("  Rank │ γ        │ Amplitude │ Phase   │ Nearest ζ zero │ Match\n");
    printf("  ─────┼──────────┼───────────┼─────────┼────────────────┼──────\n");

    int matches = 0;
    double amp_sum = 0;
    for (int k = 0; k < nw; k++) {
        amp_sum += all_waves[k].amp;
        double nearest = 0, dist = 999;
        for (int z = 0; z < 30; z++) {
            double d = fabs(all_waves[k].freq - rz[z]);
            if (d < dist) { dist = d; nearest = rz[z]; }
        }
        int match = dist < 0.5;
        if (match) matches++;

        if (k < 30 || match) { /* print top 30 + any zero matches */
            printf("  %4d │ %8.3f │  %8.5f │ %+6.3f  │   γ=%7.2f     │ %s\n",
                   k+1, all_waves[k].freq, all_waves[k].amp, all_waves[k].phase,
                   nearest, match ? "*** YES" : "");
        }
    }

    printf("\n  Waves: %d  Matches to ζ zeros: %d/%d (%.0f%%)\n", nw, matches, nw < 30 ? nw : 30, 100.0*matches/(nw<30?nw:30));
    printf("  Σ|Aᵢ| (all %d waves): %.4f\n", nw, amp_sum);
    printf("  Maximum possible constructive interference: %.4f\n", amp_sum);
    printf("  Mertens bound: 1.0\n");
    printf("  Can %d waves breach 1.0? %s\n\n", nw,
           amp_sum > 1.0 ? "*** YES — amplitude sum exceeds bound" :
           amp_sum > 0.8 ? "Almost — need more waves" : "No — need many more waves");

    /* reconstruct and scan forward */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PROJECTION: M(x)/√x envelope at large scale\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Scale     │ Max |M/√x| │ Envelope │ Status\n");
    printf("  ──────────┼────────────┼──────────┼──────────\n");

    double prev_max = 0;
    double scales[] = {7,10,15,20,30,40,50,60,70,80,90,100,150,200,300,500,1000};
    int n_scales = 17;

    for (int s = 0; s < n_scales; s++) {
        double lx_center = scales[s] * log(10);
        double best = 0;
        /* scan ±2 decades around center */
        for (double lx = lx_center - 2*log(10); lx <= lx_center + 2*log(10); lx += 0.001) {
            double val = dc;
            for (int k = 0; k < nw; k++)
                val += all_waves[k].amp * cos(all_waves[k].freq * lx + all_waves[k].phase);
            if (fabs(val) > best) best = fabs(val);
        }
        const char *status = best > 1.0 ? "*** BREACH" : best > prev_max ? "↑ growing" : "↓";
        printf("  10^%-6.0f │   %8.4f │ %s     │ %s\n",
               scales[s], best, best > prev_max ? "GROWING" : "shrink ", status);
        if (best > prev_max) prev_max = best;
    }

    /* extrapolate: when does the envelope cross 1.0? */
    printf("\n  Current envelope max: %.4f\n", prev_max);
    if (prev_max < 1.0) {
        /* how many more waves needed? */
        /* average amplitude of waves 50-100 (if we had them) */
        double avg_tail = nw > 20 ? all_waves[nw-1].amp : 0.001;
        int waves_needed = (int)((1.0 - amp_sum) / avg_tail) + 1;
        printf("  Need %.4f more amplitude to breach 1.0\n", 1.0 - amp_sum);
        printf("  Tail wave amplitude: ~%.5f\n", avg_tail);
        printf("  Estimated waves needed for breach: ~%d\n", waves_needed);
        printf("  At 1M scale we resolve ~%d waves. Need ~%d → scale ~10^%.0f\n",
               nw, waves_needed, log10((double)waves_needed * waves_needed));
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL), start));
    free(func);free(vals);free(logx);free(powers);free(freqs);free(phases);
    return 0;
}
