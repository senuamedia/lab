/*
 * Wave Plotter — Output CSV data for plotting each conjecture's waves
 *
 * For each conjecture: outputs a CSV file with columns:
 *   log10_x, actual_value, reconstruction, wave1, wave2, wave3, ..., envelope
 *
 * These can be plotted to show:
 *   - The actual function oscillation
 *   - The wave decomposition
 *   - Individual waves building toward the breach
 *   - The envelope growing with scale
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define MAX_ZEROS 100000

typedef struct {
    double gamma;
    double amp;
    double phase;
} Zero;

static Zero zeros[MAX_ZEROS];
static int n_zeros = 0;

static double estimate_zeta_prime(double gamma) {
    return 1.8 * sqrt(log(gamma > 2 ? gamma : 2));
}

static int load_zeros(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) return 0;
    char line[256];
    n_zeros = 0;
    while (fgets(line, sizeof(line), f) && n_zeros < MAX_ZEROS) {
        double g;
        if (sscanf(line, "%lf", &g) == 1 && g > 0) {
            zeros[n_zeros].gamma = g;
            double rho_abs = sqrt(0.25 + g*g);
            double zp = estimate_zeta_prime(g);
            zeros[n_zeros].amp = 2.0 / (rho_abs * zp);
            zeros[n_zeros].phase = -atan2(g, 0.5);
            n_zeros++;
        }
    }
    fclose(f);
    return n_zeros;
}

/* evaluate sum of first nw waves at log_x */
static double eval_waves(int nw, double log_x) {
    if (nw > n_zeros) nw = n_zeros;
    double sum = 0;
    for (int i = 0; i < nw; i++)
        sum += zeros[i].amp * cos(zeros[i].gamma * log_x + zeros[i].phase);
    return sum;
}

/* compute envelope: max |eval| using all waves up to nw */
static double eval_envelope(int nw, double log_x, double window) {
    double max_val = 0;
    for (double lx = log_x - window; lx <= log_x + window; lx += window/50) {
        double val = fabs(eval_waves(nw, lx));
        if (val > max_val) max_val = val;
    }
    return max_val;
}

static void plot_mertens(const char *outfile, int use_zeros) {
    FILE *f = fopen(outfile, "w");
    if (!f) { printf("Cannot open %s\n", outfile); return; }

    if (use_zeros > n_zeros) use_zeros = n_zeros;

    /* header */
    fprintf(f, "log10_x,M_reconstructed,wave1,wave2,wave3,wave4,wave5,envelope_pos,envelope_neg\n");

    /* plot from 10^1 to 10^200 */
    for (double log10_x = 1.0; log10_x <= 200.0; log10_x += 0.05) {
        double lx = log10_x * log(10); /* convert to ln(x) */

        double recon = eval_waves(use_zeros, lx);

        /* individual top 5 waves */
        double w[5];
        for (int i = 0; i < 5 && i < use_zeros; i++)
            w[i] = zeros[i].amp * cos(zeros[i].gamma * lx + zeros[i].phase);

        /* envelope */
        double env = eval_envelope(use_zeros, lx, 0.5 * log(10));

        fprintf(f, "%.2f,%.6f", log10_x, recon);
        for (int i = 0; i < 5; i++)
            fprintf(f, ",%.6f", i < use_zeros ? w[i] : 0);
        fprintf(f, ",%.6f,%.6f\n", env, -env);
    }

    fclose(f);
    printf("  Written: %s (%d zeros, 10^1 to 10^200)\n", outfile, use_zeros);
}

/* Liouville L(x)/√x — same formula, different weighting */
static void plot_liouville(const char *outfile, int use_zeros) {
    FILE *f = fopen(outfile, "w");
    if (!f) return;

    if (use_zeros > n_zeros) use_zeros = n_zeros;

    /* L(x) weights are different: A_n ≈ 2/|ζ'(ρ)| (no 1/γ factor) */
    /* temporarily override amplitudes */
    double *orig_amp = malloc(use_zeros * sizeof(double));
    for (int i = 0; i < use_zeros; i++) {
        orig_amp[i] = zeros[i].amp;
        double zp = estimate_zeta_prime(zeros[i].gamma);
        zeros[i].amp = 2.0 / zp;  /* L weighting: no γ in denominator */
    }

    fprintf(f, "log10_x,L_reconstructed,wave1,wave2,wave3,wave4,wave5,envelope_pos,envelope_neg,dc_offset\n");

    double dc = -0.67; /* approximate DC for L(x)/√x */

    for (double log10_x = 1.0; log10_x <= 50.0; log10_x += 0.02) {
        double lx = log10_x * log(10);
        double recon = dc + eval_waves(use_zeros, lx);

        double w[5];
        for (int i = 0; i < 5 && i < use_zeros; i++) {
            double zp = estimate_zeta_prime(zeros[i].gamma);
            w[i] = (2.0/zp) * cos(zeros[i].gamma * lx + zeros[i].phase);
        }

        double env = fabs(dc) + eval_envelope(use_zeros, lx, 0.5 * log(10));

        fprintf(f, "%.2f,%.6f", log10_x, recon);
        for (int i = 0; i < 5; i++) fprintf(f, ",%.6f", i < use_zeros ? w[i] : 0);
        fprintf(f, ",%.6f,%.6f,%.6f\n", env, -env, dc);
    }

    /* restore */
    for (int i = 0; i < use_zeros; i++) zeros[i].amp = orig_amp[i];
    free(orig_amp);
    fclose(f);
    printf("  Written: %s (%d zeros, Liouville weighting)\n", outfile, use_zeros);
}

/* envelope growth plot: Σ|A| vs number of zeros */
static void plot_envelope_growth(const char *outfile) {
    FILE *f = fopen(outfile, "w");
    if (!f) return;

    fprintf(f, "n_zeros,gamma_max,sum_A_mertens,sum_A_liouville,max_envelope_mertens\n");

    double M_sum = 0, L_sum = 0;

    for (int n = 1; n <= n_zeros; n++) {
        M_sum += zeros[n-1].amp;
        double zp = estimate_zeta_prime(zeros[n-1].gamma);
        L_sum += 2.0 / zp;

        /* output at selected points */
        if (n <= 20 || n % 10 == 0 && n <= 200 ||
            n % 100 == 0 && n <= 2000 ||
            n % 1000 == 0 && n <= 20000 ||
            n % 10000 == 0) {
            fprintf(f, "%d,%.3f,%.6f,%.6f,%.6f\n",
                    n, zeros[n-1].gamma, M_sum, L_sum, M_sum);
        }
    }

    fclose(f);
    printf("  Written: %s (Σ|A| growth curve)\n", outfile);
}

/* wave decomposition: show individual waves at a fixed scale */
static void plot_wave_decomposition(const char *outfile, double center_log10, int top_n) {
    FILE *f = fopen(outfile, "w");
    if (!f) return;

    if (top_n > n_zeros) top_n = n_zeros;
    if (top_n > 20) top_n = 20;

    /* header */
    fprintf(f, "log10_x,total");
    for (int i = 0; i < top_n; i++)
        fprintf(f, ",wave_%d_gamma_%.1f", i+1, zeros[i].gamma);
    fprintf(f, "\n");

    /* plot ±5 decades around center */
    for (double log10_x = center_log10 - 5; log10_x <= center_log10 + 5; log10_x += 0.01) {
        double lx = log10_x * log(10);
        double total = eval_waves(top_n, lx);
        fprintf(f, "%.3f,%.6f", log10_x, total);
        for (int i = 0; i < top_n; i++)
            fprintf(f, ",%.6f", zeros[i].amp * cos(zeros[i].gamma * lx + zeros[i].phase));
        fprintf(f, "\n");
    }

    fclose(f);
    printf("  Written: %s (%d waves around 10^%.0f)\n", outfile, top_n, center_log10);
}

/* convergence plot: reconstruction with 5, 10, 20, 50, 100 waves */
static void plot_convergence(const char *outfile) {
    FILE *f = fopen(outfile, "w");
    if (!f) return;

    fprintf(f, "log10_x,5_waves,10_waves,20_waves,50_waves,100_waves,500_waves\n");

    for (double log10_x = 1.0; log10_x <= 50.0; log10_x += 0.05) {
        double lx = log10_x * log(10);
        fprintf(f, "%.2f,%.6f,%.6f,%.6f,%.6f,%.6f,%.6f\n",
                log10_x,
                eval_waves(5, lx),
                eval_waves(10, lx),
                eval_waves(20, lx),
                eval_waves(50, lx),
                eval_waves(100, lx),
                eval_waves(500, lx));
    }

    fclose(f);
    printf("  Written: %s (convergence with wave count)\n", outfile);
}

int main(void) {
    printf("=== Wave Plotter — CSV output for paper figures ===\n\n");

    /* load zeros */
    int loaded = load_zeros("zero_tables/zeros.txt");
    if (!loaded) loaded = load_zeros("zero_tables/zeros1.txt");
    if (!loaded) { printf("No zeros found!\n"); return 1; }
    printf("Loaded %d zeros (γ_max = %.2f)\n\n", n_zeros, zeros[n_zeros-1].gamma);

    /* create plots directory */
    system("mkdir -p plots");

    printf("Generating plot data...\n\n");

    /* 1. Mertens M(x)/√x reconstruction */
    plot_mertens("plots/mertens_30.csv", 30);
    plot_mertens("plots/mertens_100.csv", 100);
    plot_mertens("plots/mertens_1000.csv", 1000);

    /* 2. Liouville L(x)/√x with DC offset */
    plot_liouville("plots/liouville_30.csv", 30);
    plot_liouville("plots/liouville_100.csv", 100);

    /* 3. Envelope growth: Σ|A| vs zero count */
    plot_envelope_growth("plots/envelope_growth.csv");

    /* 4. Wave decomposition at Pólya breach (10^9) */
    plot_wave_decomposition("plots/waves_at_polya.csv", 9.0, 10);

    /* 5. Wave decomposition at Skewes scale (10^316) */
    plot_wave_decomposition("plots/waves_at_skewes.csv", 316.0, 10);

    /* 6. Convergence: how reconstruction improves with more waves */
    plot_convergence("plots/convergence.csv");

    /* 7. The four conjectures overlaid */
    { FILE *f = fopen("plots/four_conjectures.csv", "w");
      fprintf(f, "log10_x,mertens_30,mertens_100,mertens_1000,threshold_1,threshold_neg1\n");
      for (double l = 1; l <= 200; l += 0.1) {
          double lx = l * log(10);
          fprintf(f, "%.1f,%.6f,%.6f,%.6f,1.0,-1.0\n",
                  l, eval_waves(30, lx), eval_waves(100, lx), eval_waves(1000, lx));
      }
      fclose(f);
      printf("  Written: plots/four_conjectures.csv\n");
    }

    printf("\nAll plots generated in plots/ directory.\n");
    printf("Use any plotting tool (gnuplot, python/matplotlib, R) to visualise.\n\n");

    /* quick gnuplot script for convenience */
    { FILE *f = fopen("plots/plot_all.gp", "w");
      fprintf(f, "# Gnuplot script for SWT paper figures\n\n");
      fprintf(f, "set terminal png size 1200,800\n");
      fprintf(f, "set datafile separator ','\n\n");

      fprintf(f, "# Figure 1: Mertens with envelope\n");
      fprintf(f, "set output 'fig1_mertens.png'\n");
      fprintf(f, "set title 'M(x)/√x — Mertens Function (1000 zeros)'\n");
      fprintf(f, "set xlabel 'log_{10}(x)'\n");
      fprintf(f, "set ylabel 'M(x)/√x'\n");
      fprintf(f, "plot 'mertens_1000.csv' using 1:2 with lines title 'Reconstruction', \\\n");
      fprintf(f, "     '' using 1:8 with lines lc 'red' title 'Envelope', \\\n");
      fprintf(f, "     '' using 1:9 with lines lc 'red' notitle, \\\n");
      fprintf(f, "     1.0 with lines lc 'black' dt 2 title 'Mertens bound'\n\n");

      fprintf(f, "# Figure 2: Envelope growth\n");
      fprintf(f, "set output 'fig2_envelope_growth.png'\n");
      fprintf(f, "set title 'Amplitude Sum Growth — Σ|A_n| vs Number of Zeros'\n");
      fprintf(f, "set xlabel 'Number of zeros'\n");
      fprintf(f, "set ylabel 'Σ|A_n|'\n");
      fprintf(f, "set logscale x\n");
      fprintf(f, "plot 'envelope_growth.csv' using 1:3 with linespoints title 'Mertens', \\\n");
      fprintf(f, "     '' using 1:4 with linespoints title 'Liouville', \\\n");
      fprintf(f, "     1.0 with lines lc 'black' dt 2 title '|M|>1 threshold'\n\n");

      fprintf(f, "# Figure 3: Wave decomposition at Pólya breach\n");
      fprintf(f, "set output 'fig3_waves_polya.png'\n");
      fprintf(f, "unset logscale\n");
      fprintf(f, "set title 'Wave Decomposition at Pólya Breach (10^9)'\n");
      fprintf(f, "set xlabel 'log_{10}(x)'\n");
      fprintf(f, "set ylabel 'Contribution'\n");
      fprintf(f, "plot 'waves_at_polya.csv' using 1:2 with lines lw 2 title 'Total', \\\n");
      fprintf(f, "     '' using 1:3 with lines title 'γ_1=14.1', \\\n");
      fprintf(f, "     '' using 1:4 with lines title 'γ_2=21.0', \\\n");
      fprintf(f, "     '' using 1:5 with lines title 'γ_3=25.0', \\\n");
      fprintf(f, "     0 with lines lc 'black' dt 2 notitle\n\n");

      fprintf(f, "# Figure 4: Convergence\n");
      fprintf(f, "set output 'fig4_convergence.png'\n");
      fprintf(f, "set title 'Reconstruction Convergence with Wave Count'\n");
      fprintf(f, "plot 'convergence.csv' using 1:2 with lines title '5 waves', \\\n");
      fprintf(f, "     '' using 1:4 with lines title '20 waves', \\\n");
      fprintf(f, "     '' using 1:6 with lines title '100 waves', \\\n");
      fprintf(f, "     '' using 1:7 with lines title '500 waves'\n");

      fclose(f);
      printf("  Written: plots/plot_all.gp (gnuplot script)\n");
    }

    return 0;
}
