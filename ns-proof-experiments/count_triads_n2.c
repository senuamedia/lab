/*
 * count_triads_n2.c — Count modes and triads at N=2 for the Gröbner basis setup.
 * Reports: total modes, modes at each shell, triads at K=1, triad details.
 *
 * BUILD: clang -O3 experiments/count_triads_n2.c src/triad_kernel_v3_accessible.c -o build/count_n2 -lm
 */
#include <stdio.h>
#include <stdint.h>
#include <math.h>

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_get_num_modes(void);

static int find_mode(int nm, int kx, int ky, int kz) {
    for (int i = 0; i < nm; i++)
        if ((int)c3d_get_kx(i)==kx && (int)c3d_get_ky(i)==ky && (int)c3d_get_kz(i)==kz) return i;
    return -1;
}

int main(void) {
    int N = 2;
    int nm = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);

    printf("N = %d, total modes = %d\n\n", N, nm);

    /* Count modes per shell */
    int shell_count[10] = {0};
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        int s = (int)(sqrt((double)k2)+0.5);
        if (s < 10) shell_count[s]++;
    }
    for (int s = 0; s < 5; s++)
        printf("Shell %d: %d modes\n", s, shell_count[s]);

    /* Count and list triads at K=1 */
    printf("\nTriads at K=1:\n");
    int n_triads = 0;
    int n_max_sq = N*N;

    for (int k_idx = 0; k_idx < nm; k_idx++) {
        int kx=(int)c3d_get_kx(k_idx), ky=(int)c3d_get_ky(k_idx), kz=(int)c3d_get_kz(k_idx);
        int k2 = kx*kx+ky*ky+kz*kz;
        if ((int)(sqrt((double)k2)+0.5) != 1) continue;

        for (int p_idx = 0; p_idx < nm; p_idx++) {
            int px=(int)c3d_get_kx(p_idx), py=(int)c3d_get_ky(p_idx), pz=(int)c3d_get_kz(p_idx);
            int qx=kx-px, qy=ky-py, qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if (q2<=0 || q2>n_max_sq) continue;
            int q_idx = find_mode(nm, qx, qy, qz);
            if (q_idx < 0) continue;

            if (n_triads < 20)
                printf("  T%d: k=(%d,%d,%d) p=(%d,%d,%d) q=(%d,%d,%d)\n",
                    n_triads, kx,ky,kz, px,py,pz, qx,qy,qz);
            n_triads++;
        }
    }
    printf("  ... total triads at K=1: %d\n", n_triads);
    printf("\nFor Gröbner basis: %d constraints on %d real unknowns (2 per mode)\n",
           n_triads - 1, 2 * nm);
    printf("Overdetermination ratio: %.1f : 1\n",
           (double)(n_triads-1) / (double)(2*nm));

    return 0;
}
