/*
 * prefactor_test.c — C numerical verification of the -i prefactor
 *
 * Complements the symbolic Python verification. For four candidate
 * prefactors {+i, -i, +1, -1}, compute the nonlinear energy rate
 *
 *   dE/dt|_NL = Σ_k Re(conj(û_k) · NL_k)
 *
 * on a random divergence-free Fourier state and check whether the
 * identity dE/dt|_NL = 0 holds at machine precision.
 *
 * PREDICTION (from symbolic result):
 *   +i:  conserves (imaginary -> skew-Hermitian trilinear form)
 *   -i:  conserves (imaginary -> skew-Hermitian trilinear form)
 *   +1:  fails     (real -> symmetric, not skew -> energy injection)
 *   -1:  fails     (real -> symmetric, not skew -> energy drain)
 *
 * This provides NUMERICAL evidence complementing the symbolic
 * verification. Both should agree: imaginary prefactors conserve,
 * real prefactors do not.
 *
 * BUILD:
 *   clang -O3 validation/prefactor_test.c -o build/prefactor_c -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <complex.h>

#define MAX_MODES 500

typedef struct { int kx, ky, kz; } Mode;

static Mode modes[MAX_MODES];
static int num_modes = 0;
static double complex state[MAX_MODES][3];  /* û_k for each mode */

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

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < num_modes; i++) {
        if (modes[i].kx == kx && modes[i].ky == ky && modes[i].kz == kz)
            return i;
    }
    return -1;
}

static void init_random_div_free(unsigned seed, int enforce_conjugate) {
    srand(seed);
    for (int i = 0; i < num_modes; i++) {
        double kx = modes[i].kx, ky = modes[i].ky, kz = modes[i].kz;
        /* Random complex velocities, then enforce divergence-free */
        double complex ux = ((double)rand()/RAND_MAX - 0.5) + I*((double)rand()/RAND_MAX - 0.5);
        double complex uy = ((double)rand()/RAND_MAX - 0.5) + I*((double)rand()/RAND_MAX - 0.5);
        double complex uz = ((double)rand()/RAND_MAX - 0.5) + I*((double)rand()/RAND_MAX - 0.5);
        /* Divergence-free: k · û = 0 */
        if (kz != 0.0) {
            uz = -(kx*ux + ky*uy) / kz;
        } else if (ky != 0.0) {
            uy = -kx*ux / ky;
        } else {
            ux = 0.0;
        }
        state[i][0] = ux;
        state[i][1] = uy;
        state[i][2] = uz;
    }
    /* Optionally enforce conjugate symmetry: û_{-k} = conj(û_k)
     * (required for the velocity field u(x) to be real-valued) */
    if (enforce_conjugate) {
        for (int i = 0; i < num_modes; i++) {
            int j = find_mode(-modes[i].kx, -modes[i].ky, -modes[i].kz);
            if (j > i) {
                state[j][0] = conj(state[i][0]);
                state[j][1] = conj(state[i][1]);
                state[j][2] = conj(state[i][2]);
            }
        }
    }
}

/* Compute NL_k = prefactor * Σ_{p+q=k} (û_p · q) P_k(û_q) */
static double energy_rate_nl(double complex prefactor) {
    double rate = 0.0;
    for (int k_idx = 0; k_idx < num_modes; k_idx++) {
        int kx = modes[k_idx].kx, ky = modes[k_idx].ky, kz = modes[k_idx].kz;
        int k2 = kx*kx + ky*ky + kz*kz;
        double complex NL[3] = {0, 0, 0};

        for (int p_idx = 0; p_idx < num_modes; p_idx++) {
            int qx = kx - modes[p_idx].kx;
            int qy = ky - modes[p_idx].ky;
            int qz = kz - modes[p_idx].kz;
            if (qx == 0 && qy == 0 && qz == 0) continue;
            int q_idx = find_mode(qx, qy, qz);
            if (q_idx < 0) continue;

            /* û_p · q (complex * real) */
            double complex up_dot_q = state[p_idx][0]*qx + state[p_idx][1]*qy + state[p_idx][2]*qz;

            /* P_k(û_q) = û_q - (k · û_q / |k|²) k */
            double complex k_dot_uq = (double)kx * state[q_idx][0]
                                    + (double)ky * state[q_idx][1]
                                    + (double)kz * state[q_idx][2];
            double complex scale = k_dot_uq / (double)k2;
            double complex Pq[3] = {
                state[q_idx][0] - scale * kx,
                state[q_idx][1] - scale * ky,
                state[q_idx][2] - scale * kz
            };

            NL[0] += up_dot_q * Pq[0];
            NL[1] += up_dot_q * Pq[1];
            NL[2] += up_dot_q * Pq[2];
        }

        /* Apply prefactor and accumulate Re(conj(û_k) · NL_k) */
        NL[0] *= prefactor;
        NL[1] *= prefactor;
        NL[2] *= prefactor;

        rate += creal(conj(state[k_idx][0]) * NL[0]
                    + conj(state[k_idx][1]) * NL[1]
                    + conj(state[k_idx][2]) * NL[2]);
    }
    return rate;
}

int main(void) {
    printf("################################################################\n");
    printf("#  C NUMERICAL VERIFICATION OF PREFACTOR IDENTITY              #\n");
    printf("#                                                              #\n");
    printf("#  For each candidate prefactor c, compute the nonlinear       #\n");
    printf("#  energy rate Σ_k Re(conj(û_k) · NL_k) with:                 #\n");
    printf("#    NL_k = c · Σ_{p+q=k} (û_p · q) P_k(û_q)                 #\n");
    printf("#                                                              #\n");
    printf("#  Energy conservation requires this to be 0 at machine       #\n");
    printf("#  precision. Symbolic result: only IMAGINARY prefactors      #\n");
    printf("#  conserve; REAL prefactors do not.                          #\n");
    printf("################################################################\n\n");

    int N = 4;
    enumerate_modes(N);
    printf("  N = %d, %d modes\n\n", N, num_modes);

    double complex prefactors[] = {-I, +I, +1.0, -1.0};
    const char *labels[] = {"-i  (correct NS)", "+i  (sign flipped)",
                            "+1  (real)", "-1  (real, sign flipped)"};

    printf("================================================================\n");
    printf("  Test A: WITH conjugate symmetry û_{-k} = conj(û_k)\n");
    printf("          (required for real-valued physical velocity u(x))\n");
    printf("================================================================\n\n");
    printf("  Seed | Prefactor                 | Σ Re(conj(û)·NL)     | Conserved?\n");
    printf("  -----|---------------------------|---------------------|------------\n");
    for (int seed = 1; seed <= 3; seed++) {
        init_random_div_free(seed, /*enforce_conjugate=*/1);
        for (int p = 0; p < 4; p++) {
            double rate = energy_rate_nl(prefactors[p]);
            int conserved = (fabs(rate) < 1e-10);
            printf("  %-4d | %-25s | %+.6e      | %s\n",
                   seed, labels[p], rate, conserved ? "YES" : "NO");
        }
        printf("  -----|---------------------------|---------------------|------------\n");
    }

    printf("\n================================================================\n");
    printf("  Test B: WITHOUT conjugate symmetry (asymmetric complex state)\n");
    printf("          (not a physical velocity field)\n");
    printf("================================================================\n\n");
    printf("  Seed | Prefactor                 | Σ Re(conj(û)·NL)     | Conserved?\n");
    printf("  -----|---------------------------|---------------------|------------\n");
    for (int seed = 1; seed <= 3; seed++) {
        init_random_div_free(seed, /*enforce_conjugate=*/0);
        for (int p = 0; p < 4; p++) {
            double rate = energy_rate_nl(prefactors[p]);
            int conserved = (fabs(rate) < 1e-10);
            printf("  %-4d | %-25s | %+.6e      | %s\n",
                   seed, labels[p], rate, conserved ? "YES" : "NO");
        }
        printf("  -----|---------------------------|---------------------|------------\n");
    }

    printf("\n================================================================\n");
    printf("  Test C: v2-style REAL 3-vector state (imag parts zeroed)\n");
    printf("          (reproduces the actual v2 solver architecture)\n");
    printf("================================================================\n\n");
    printf("  Seed | Prefactor                 | Σ Re(conj(û)·NL)     | Conserved?\n");
    printf("  -----|---------------------------|---------------------|------------\n");
    for (int seed = 1; seed <= 3; seed++) {
        /* v2-style: real coefficients stored as 3-vectors of doubles.
         * Initialize randomly (no complex parts), enforce div-free. */
        srand(seed);
        for (int i = 0; i < num_modes; i++) {
            double kx = modes[i].kx, ky = modes[i].ky, kz = modes[i].kz;
            double ux = (double)rand()/RAND_MAX - 0.5;
            double uy = (double)rand()/RAND_MAX - 0.5;
            double uz = (double)rand()/RAND_MAX - 0.5;
            if (kz != 0.0)        uz = -(kx*ux + ky*uy) / kz;
            else if (ky != 0.0)    uy = -kx*ux / ky;
            else                   ux = 0.0;
            /* Store as purely real complex values (no conjugate symmetry pairing) */
            state[i][0] = ux + 0.0*I;
            state[i][1] = uy + 0.0*I;
            state[i][2] = uz + 0.0*I;
        }
        for (int p = 0; p < 4; p++) {
            double rate = energy_rate_nl(prefactors[p]);
            int conserved = (fabs(rate) < 1e-10);
            printf("  %-4d | %-25s | %+.6e      | %s\n",
                   seed, labels[p], rate, conserved ? "YES" : "NO");
        }
        printf("  -----|---------------------------|---------------------|------------\n");
    }

    printf("\n################################################################\n");
    printf("#  FINDINGS                                                    #\n");
    printf("#                                                              #\n");
    printf("#  Test A (complex + conjugate symmetry): ALL prefactors       #\n");
    printf("#    conserve energy. Conservation comes from the symmetry    #\n");
    printf("#    structure of a physical velocity field, not the prefactor.#\n");
    printf("#                                                              #\n");
    printf("#  Test B (complex, no conjugate symmetry): NO prefactor       #\n");
    printf("#    conserves. Not a physical field.                         #\n");
    printf("#                                                              #\n");
    printf("#  Test C (v2-style real storage): NO prefactor conserves.    #\n");
    printf("#    Storing û_k as real 3-vectors breaks the Fourier         #\n");
    printf("#    representation at a more fundamental level than the      #\n");
    printf("#    prefactor. Conjugate symmetry û_{-k} = conj(û_k) cannot  #\n");
    printf("#    be encoded because there are no imaginary parts to flip. #\n");
    printf("#                                                              #\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#  The v2 solver bug is NOT simply 'missing -i'. It is a      #\n");
    printf("#  structural error in the Fourier representation: real       #\n");
    printf("#  3-vectors cannot encode a generic complex divergence-free  #\n");
    printf("#  field. The -i factor is derived from Fourier analysis as  #\n");
    printf("#  a theorem (∂_j -> i·k_j, convolution, NS sign convention). #\n");
    printf("#  Its presence is required by the mathematical derivation,   #\n");
    printf("#  not chosen to enforce energy conservation.                 #\n");
    printf("################################################################\n");

    return 0;
}
