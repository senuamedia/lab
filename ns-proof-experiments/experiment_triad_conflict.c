/*
 * experiment_triad_conflict.c — Measure the "triad conflict density":
 * for each mode p, how many triads share it, and are their optimal
 * stretching directions non-parallel?
 *
 * The Global Frustration argument: if mode p participates in M triads
 * with non-parallel optimal directions, the best any single û_p can
 * do is average alignment ~ 1/√M (random walk over conflicting demands).
 *
 * BUILD:
 *   clang -O3 experiments/experiment_triad_conflict.c \
 *         src/triad_kernel_v3_accessible.c -o build/triad_conflict -lm
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

#define MAX_MODES 3000
static int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
static int nm_g;

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < nm_g; i++)
        if (mkx[i]==kx && mky[i]==ky && mkz[i]==kz) return i;
    return -1;
}

int main(void) {
    printf("################################################################\n");
    printf("#  TRIAD CONFLICT DENSITY                                       #\n");
    printf("#                                                              #\n");
    printf("#  For each mode p: count triads sharing p, check if their    #\n");
    printf("#  'optimal stretching directions' span 2D in H_p.            #\n");
    printf("#  If yes: geometric frustration prevents alignment.          #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    for (int N = 4; N <= 8; N += 2) {
        nm_g = (int)c3d_enumerate_modes(N);
        c3d_precompute_triads(N);
        int n_max_sq = N * N;

        for (int i = 0; i < nm_g && i < MAX_MODES; i++) {
            mkx[i]=(int)c3d_get_kx(i);
            mky[i]=(int)c3d_get_ky(i);
            mkz[i]=(int)c3d_get_kz(i);
        }

        printf("  === N=%d (%d modes) ===\n\n", N, nm_g);
        printf("  |p|  modes_in_shell  avg_triads_per_mode  min  max   avg_directions  frustrated%%\n");
        printf("  ---  --------------  -------------------  ---  ----  --------------  -----------\n");

        for (int ps = 1; ps <= N; ps++) {
            long total_triads = 0;
            long total_modes = 0;
            long min_triads = 999999, max_triads = 0;
            long frustrated_count = 0;
            long total_distinct_dirs = 0;

            for (int p_idx = 0; p_idx < nm_g; p_idx++) {
                int px=mkx[p_idx], py=mky[p_idx], pz=mkz[p_idx];
                int p2=px*px+py*py+pz*pz;
                if ((int)(sqrt((double)p2)+0.5) != ps) continue;
                total_modes++;

                /* Count triads containing this p as the "source" mode */
                long n_triads_p = 0;

                /* Collect the "pulling directions" — for each triad (k,p,q),
                 * the optimal û_p direction (maximising |û_p · q|) is along
                 * the projection of q onto H_p = {v : p·v = 0}.
                 * Store the projection of q onto H_p for each triad. */
                double dirs[10000][3];
                int n_dirs = 0;

                for (int k_idx = 0; k_idx < nm_g; k_idx++) {
                    int kx=mkx[k_idx], ky=mky[k_idx], kz=mkz[k_idx];
                    int qx=kx-px, qy=ky-py, qz=kz-pz;
                    int q2=qx*qx+qy*qy+qz*qz;
                    if (q2<=0 || q2>n_max_sq) continue;
                    if (find_mode(qx,qy,qz)<0) continue;

                    n_triads_p++;

                    if (n_dirs < 10000) {
                        /* Project q onto H_p: q_perp = q - (p·q/|p|²)p */
                        double pdq = (double)(px*qx+py*qy+pz*qz);
                        double p2d = (double)p2;
                        double qpx = (double)qx - pdq/p2d*(double)px;
                        double qpy = (double)qy - pdq/p2d*(double)py;
                        double qpz = (double)qz - pdq/p2d*(double)pz;
                        double qpn = sqrt(qpx*qpx+qpy*qpy+qpz*qpz);
                        if (qpn > 1e-10) {
                            dirs[n_dirs][0]=qpx/qpn;
                            dirs[n_dirs][1]=qpy/qpn;
                            dirs[n_dirs][2]=qpz/qpn;
                            n_dirs++;
                        }
                    }
                }

                total_triads += n_triads_p;
                if (n_triads_p < min_triads) min_triads = n_triads_p;
                if (n_triads_p > max_triads) max_triads = n_triads_p;

                /* Check if the pulling directions span 2D in H_p.
                 * Compute the "spread" as the rank of the direction matrix.
                 * Simple test: find the maximum angle between any two directions. */
                int is_frustrated = 0;
                int n_distinct = 0;
                if (n_dirs >= 2) {
                    double min_dot = 1.0;
                    /* Sample pairs to find non-parallel directions */
                    int step = (n_dirs > 100) ? n_dirs/100 : 1;
                    for (int i = 0; i < n_dirs && i < 200; i += step) {
                        for (int j = i+1; j < n_dirs && j < 200; j += step) {
                            double dot = fabs(dirs[i][0]*dirs[j][0] +
                                            dirs[i][1]*dirs[j][1] +
                                            dirs[i][2]*dirs[j][2]);
                            if (dot < min_dot) min_dot = dot;
                        }
                    }
                    /* If min_dot < 0.99, directions span 2D */
                    is_frustrated = (min_dot < 0.99);

                    /* Count roughly distinct directions (discretise to 10-degree bins) */
                    /* Simple: count unique signs of the three components */
                    int seen[8]; memset(seen,0,sizeof(seen));
                    for (int i=0; i<n_dirs; i++) {
                        int sx=(dirs[i][0]>0.1)?1:(dirs[i][0]<-0.1)?0:2;
                        int sy=(dirs[i][1]>0.1)?1:(dirs[i][1]<-0.1)?0:2;
                        int sz=(dirs[i][2]>0.1)?1:(dirs[i][2]<-0.1)?0:2;
                        int key=sx*9+sy*3+sz;
                        if(key<27) seen[key/4]|=(1<<(key%4));
                    }
                    for(int i=0;i<8;i++) for(int b=0;b<4;b++) if(seen[i]&(1<<b)) n_distinct++;
                }

                if (is_frustrated) frustrated_count++;
                total_distinct_dirs += n_distinct;
            }

            if (total_modes == 0) continue;

            printf("  %-3d  %-14ld  %19.1f  %-3ld  %-4ld  %14.1f  %10.1f%%\n",
                   ps, total_modes, (double)total_triads/total_modes,
                   min_triads, max_triads,
                   (double)total_distinct_dirs/total_modes,
                   100.0*(double)frustrated_count/total_modes);
        }
        printf("\n");
        fflush(stdout);
    }

    printf("################################################################\n");
    printf("#  INTERPRETATION                                              #\n");
    printf("#                                                              #\n");
    printf("#  frustrated%% = fraction of modes whose triads have          #\n");
    printf("#  non-parallel optimal directions (span 2D in H_p).          #\n");
    printf("#                                                              #\n");
    printf("#  If frustrated%% = 100%% at every shell:                     #\n");
    printf("#  EVERY mode faces conflicting alignment demands.            #\n");
    printf("#  No single û_p can maximise stretching for all its triads.  #\n");
    printf("#  This is the Global Frustration that prevents blow-up.      #\n");
    printf("#                                                              #\n");
    printf("#  If avg_triads_per_mode grows with |p|:                     #\n");
    printf("#  the frustration STRENGTHENS at high frequencies.           #\n");
    printf("################################################################\n");

    return 0;
}
