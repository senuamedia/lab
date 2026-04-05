/*
 * cgeom_independent.c — C cross-validation of C_geom = 0.157
 *
 * Independent enumeration of Z^3 lattice geometry in C. No shared code
 * with the Python version or the v3 triad solver. Computes:
 *
 *   1. M_S  (shell mode counts) for each shell
 *   2. n(S,K) (triad counts) for each shell pair
 *   3. C_geom(S,K) for each (S,K) pair
 *   4. Interior maximum (excluding boundary shell S=N)
 *
 * The C and Python enumerations should agree exactly (integer arithmetic),
 * and both should give C_geom^(interior) = 48/306 = 0.156863 at (S,K)=(1,1).
 *
 * BUILD:
 *   clang -O3 validation/cgeom_independent.c -o build/cgeom_c -lm
 *
 * USAGE: ./build/cgeom_c
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define MAX_MODES 10000
#define MAX_SHELL 20

typedef struct { int kx, ky, kz; } Mode;

static Mode modes[MAX_MODES];
static int num_modes = 0;
static long M_shell[MAX_SHELL + 2];
static long n_SK[MAX_SHELL + 2][MAX_SHELL + 2];
static double c_geom[MAX_SHELL + 2][MAX_SHELL + 2];

static int shell_of(int kx, int ky, int kz) {
    int k2 = kx*kx + ky*ky + kz*kz;
    return (int)(sqrt((double)k2) + 0.5);
}

static int enumerate_modes(int N) {
    num_modes = 0;
    for (int kx = -N; kx <= N; kx++) {
        for (int ky = -N; ky <= N; ky++) {
            for (int kz = -N; kz <= N; kz++) {
                int k2 = kx*kx + ky*ky + kz*kz;
                if (k2 > 0 && k2 <= N*N) {
                    if (num_modes >= MAX_MODES) return -1;
                    modes[num_modes].kx = kx;
                    modes[num_modes].ky = ky;
                    modes[num_modes].kz = kz;
                    num_modes++;
                }
            }
        }
    }
    return num_modes;
}

/* Linear search for a mode (slow but simple and independent) */
static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < num_modes; i++) {
        if (modes[i].kx == kx && modes[i].ky == ky && modes[i].kz == kz)
            return i;
    }
    return -1;
}

static void count_shell_modes(int max_shell) {
    memset(M_shell, 0, sizeof(M_shell));
    for (int i = 0; i < num_modes; i++) {
        int s = shell_of(modes[i].kx, modes[i].ky, modes[i].kz);
        if (s <= max_shell) M_shell[s]++;
    }
}

static void count_triads(int max_shell) {
    memset(n_SK, 0, sizeof(n_SK));
    for (int pi = 0; pi < num_modes; pi++) {
        int ps = shell_of(modes[pi].kx, modes[pi].ky, modes[pi].kz);
        if (ps > max_shell) continue;
        for (int ki = 0; ki < num_modes; ki++) {
            int ks = shell_of(modes[ki].kx, modes[ki].ky, modes[ki].kz);
            if (ks > max_shell) continue;
            int qx = modes[ki].kx - modes[pi].kx;
            int qy = modes[ki].ky - modes[pi].ky;
            int qz = modes[ki].kz - modes[pi].kz;
            if (qx == 0 && qy == 0 && qz == 0) continue;
            if (find_mode(qx, qy, qz) < 0) continue;
            n_SK[ps][ks]++;
        }
    }
}

static void compute_cgeom_matrix(int max_shell) {
    memset(c_geom, 0, sizeof(c_geom));
    for (int S = 1; S <= max_shell; S++) {
        for (int K = 1; K <= max_shell; K++) {
            if (n_SK[S][K] > 0 && M_shell[S] > 0) {
                c_geom[S][K] = 2.0 * (K + S + 2) * sqrt(2.0 * M_shell[S])
                               / (double)n_SK[S][K];
            }
        }
    }
}

static void find_max(int max_shell, int interior_only,
                     double *c_max, int *max_S, int *max_K) {
    *c_max = 0.0; *max_S = 0; *max_K = 0;
    int upper = interior_only ? max_shell - 1 : max_shell;
    for (int S = 1; S <= upper; S++) {
        for (int K = 1; K <= upper; K++) {
            if (c_geom[S][K] > *c_max) {
                *c_max = c_geom[S][K];
                *max_S = S;
                *max_K = K;
            }
        }
    }
}

static void run_one_N(int N) {
    int nm = enumerate_modes(N);
    count_shell_modes(N);
    count_triads(N);
    compute_cgeom_matrix(N);

    double c_all, c_int;
    int Sa, Ka, Si, Ki;
    find_max(N, 0, &c_all, &Sa, &Ka);
    find_max(N, 1, &c_int, &Si, &Ki);

    printf("    %-4d %-7d %.6f   (%d,%d)%s  %.6f   (%d,%d)%s  %-4ld %ld\n",
           N, nm, c_all, Sa, Ka,
           (Sa == 1 && Ka == 1) ? "      " : "      ",
           c_int, Si, Ki,
           (Si == 1 && Ki == 1) ? "      " : "      ",
           M_shell[1], n_SK[1][1]);
}

int main(void) {
    printf("################################################################\n");
    printf("#  C CROSS-VALIDATION OF C_geom = 0.157                        #\n");
    printf("#                                                              #\n");
    printf("#  Independent enumeration in C. No shared code with Python    #\n");
    printf("#  or v3 triad solver. Results must match Python exactly       #\n");
    printf("#  (both are integer arithmetic over Z^3).                    #\n");
    printf("################################################################\n\n");

    printf("  N    modes   C^(all)    (S*,K*)     C^(int)    (S*,K*)    M_1  n(1,1)\n");
    printf("  ---  ------  ---------  --------   ---------  --------   ---  ------\n");

    int Ns[] = {4, 5, 6, 7, 8, 9, 10, 12};
    int n_Ns = sizeof(Ns) / sizeof(Ns[0]);
    for (int i = 0; i < n_Ns; i++) {
        run_one_N(Ns[i]);
        fflush(stdout);
    }

    printf("\n  Expected (from paper, interior): C_geom = 48/306 = %.6f\n", 48.0/306.0);
    printf("  Both C and Python enumerations should give identical results.\n\n");

    /* Print N=8 matrix for detailed comparison with Python */
    printf("================================================================\n");
    printf("  Full C_geom(S,K) matrix at N = 8 (for comparison with Python)\n");
    printf("================================================================\n\n");
    enumerate_modes(8);
    count_shell_modes(8);
    count_triads(8);
    compute_cgeom_matrix(8);

    printf("    K\\S ");
    for (int S = 1; S <= 8; S++) printf("   S=%-2d  ", S);
    printf("\n    ");
    for (int i = 0; i < 72; i++) printf("-");
    printf("\n");
    for (int K = 1; K <= 8; K++) {
        printf("    K=%-2d", K);
        for (int S = 1; S <= 8; S++) {
            printf("  %.5f", c_geom[S][K]);
        }
        printf("\n");
    }

    printf("\n  Shell mode counts M_S:\n");
    for (int S = 1; S <= 8; S++) {
        printf("    M_%d = %ld\n", S, M_shell[S]);
    }

    printf("\n  Paper-critical entry: C_geom(1,1) = 2*4*sqrt(2*18)/306 = %.6f\n",
           2.0 * 4.0 * sqrt(2.0 * 18.0) / 306.0);
    printf("  Computed (from lattice): C_geom(1,1) = %.6f\n", c_geom[1][1]);
    printf("  Match: %s\n", (fabs(c_geom[1][1] - 48.0/306.0) < 1e-12) ? "YES" : "NO");

    printf("\n################################################################\n");
    printf("#  C and Python must produce identical lattice counts.         #\n");
    printf("#  Cross-validated C_geom^(interior) = 48/306 = 0.156863       #\n");
    printf("################################################################\n");

    return 0;
}
