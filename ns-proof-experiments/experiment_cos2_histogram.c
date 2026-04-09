/*
 * experiment_cos2_histogram.c — Generate histogram of cos²(alpha) values
 * at specific shells for visualisation in the paper.
 *
 * Outputs data suitable for plotting: bin edges and counts for cos²α
 * at shells K=1, 4, 7, 10 at N=10.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_cos2_histogram.c \
 *         src/triad_kernel_v3_accessible.c -o build/cos2_hist -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_get_num_modes(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);

#define MAX_MODES 3000
#define NBINS 50
static int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
static int nm_g;

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < nm_g; i++)
        if (mkx[i]==kx && mky[i]==ky && mkz[i]==kz) return i;
    return -1;
}

int main(void) {
    int N = 10;
    nm_g = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    int n_max_sq = N * N;

    for (int i = 0; i < nm_g && i < MAX_MODES; i++) {
        mkx[i]=(int)c3d_get_kx(i);
        mky[i]=(int)c3d_get_ky(i);
        mkz[i]=(int)c3d_get_kz(i);
    }

    printf("# cos²(alpha_T) histograms at N=%d\n", N);
    printf("# Pure lattice geometry — no solution dependence\n");
    printf("# Columns: bin_center  K=1  K=2  K=3  K=4  K=5  K=6  K=7  K=8  K=9  K=10\n\n");

    long hist[11][NBINS];
    long totals[11];
    double mean[11], var[11];
    memset(hist, 0, sizeof(hist));
    memset(totals, 0, sizeof(totals));
    memset(mean, 0, sizeof(mean));
    memset(var, 0, sizeof(var));

    /* Collect all cos²α values */
    for (int k_idx = 0; k_idx < nm_g; k_idx++) {
        int kx=mkx[k_idx], ky=mky[k_idx], kz=mkz[k_idx];
        int k2=kx*kx+ky*ky+kz*kz;
        int K=(int)(sqrt((double)k2)+0.5);
        if (K < 1 || K > 10) continue;

        for (int p_idx = 0; p_idx < nm_g; p_idx++) {
            int qx=kx-mkx[p_idx], qy=ky-mky[p_idx], qz=kz-mkz[p_idx];
            int q2=qx*qx+qy*qy+qz*qz;
            if (q2<=0 || q2>n_max_sq) continue;
            if (find_mode(qx,qy,qz)<0) continue;

            double kdq = (double)(kx*qx+ky*qy+kz*qz);
            double cos2 = (kdq*kdq) / ((double)k2 * (double)q2);
            if (cos2 > 1.0) cos2 = 1.0;
            if (cos2 < 0.0) cos2 = 0.0;

            int bin = (int)(cos2 * NBINS);
            if (bin >= NBINS) bin = NBINS - 1;
            hist[K][bin]++;
            totals[K]++;
            mean[K] += cos2;
            var[K] += cos2 * cos2;
        }
    }

    /* Print statistics */
    printf("# Shell statistics:\n");
    for (int K = 1; K <= 10; K++) {
        if (totals[K] == 0) continue;
        double m = mean[K] / totals[K];
        double v = var[K] / totals[K] - m * m;
        printf("#   K=%2d: n=%8ld  <cos²α>=%.6f  Var=%.8f  <sin²α>=%.6f\n",
               K, totals[K], m, v, 1.0 - m);
    }
    printf("#\n");

    /* Print histogram data (normalised to density) */
    printf("# bin_center");
    for (int K = 1; K <= 10; K++) printf("  K=%-2d      ", K);
    printf("\n");

    for (int b = 0; b < NBINS; b++) {
        double center = ((double)b + 0.5) / NBINS;
        printf("  %.4f   ", center);
        for (int K = 1; K <= 10; K++) {
            double density = (totals[K] > 0) ?
                (double)hist[K][b] / (double)totals[K] * NBINS : 0;
            printf("  %9.5f", density);
        }
        printf("\n");
    }

    /* Also print ASCII art histogram for K=7 (for the paper) */
    printf("\n# ASCII histogram of cos²(alpha) at K=7 (N=10)\n");
    printf("# %ld triads, Var = %.8f\n\n", totals[7], var[7]/totals[7] - (mean[7]/totals[7])*(mean[7]/totals[7]));

    double max_density = 0;
    for (int b = 0; b < NBINS; b++) {
        double d = (double)hist[7][b] / (double)totals[7] * NBINS;
        if (d > max_density) max_density = d;
    }

    for (int b = 0; b < NBINS; b++) {
        double center = ((double)b + 0.5) / NBINS;
        double density = (double)hist[7][b] / (double)totals[7] * NBINS;
        int bar = (int)(60.0 * density / max_density);
        printf("  %5.3f | ", center);
        for (int j = 0; j < bar; j++) printf("#");
        printf(" (%.3f)\n", density);
    }

    printf("\n# If the distribution were uniform: density = 1.0 everywhere.\n");
    printf("# The observed spread across [0,1] with NO concentration at\n");
    printf("# any single value is what prevents phase alignment.\n");

    return 0;
}
