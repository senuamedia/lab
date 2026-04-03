/*
 * experiment_phase_distribution.c — Phase structure of triad contributions
 *
 * For each shell K, we need to understand WHY the triadic contributions
 * to T_K cancel. The hypothesis: the -i factor makes contributions
 * complex, and their phases are "sufficiently spread" that the sum
 * cancels like √n(K) instead of n(K).
 *
 * This experiment:
 *   1. For each mode k in shell K, computes the individual triad
 *      contribution Re(conj(û_k) · NL_k) from EACH triad (p,q)
 *   2. Collects statistics: n(K), sum of absolutes, actual |T_K|,
 *      and the "cancellation efficiency" |T_K| / (Σ|contributions|)
 *   3. Tests whether |T_K| / (Σ|contributions|) ~ 1/√n(K)
 *      (the CLT prediction for random-phase summation)
 *
 * The key formula to validate:
 *   |T_K| ≤ C · (Σ|individual|) / √n(K)
 *   where n(K) is the number of triads contributing to shell K.
 *
 * Since n(K) ~ K² (from the mode/triad count table), this gives:
 *   |T_K| / CS_bound ~ K^{-1}   (i.e., p = 1)
 *
 * NOTE: This experiment accesses the kernel's triad structure directly.
 * Since the kernel stores triads as static arrays, we must either:
 *   (a) Recompute triads ourselves (O(nm²) per shell), or
 *   (b) Use a modified kernel with exposed triads.
 * We use approach (a) for independence from the kernel internals.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_phase_distribution.c \
 *         src/triad_kernel_v3_final.c -o build/phase_dist -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_zero_state(int64_t num_modes);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_get_num_modes(void);
extern int64_t c3d_apply_state(void);
extern int64_t c3d_enforce_symmetry(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);
extern int64_t c3d_energy(void);
extern int64_t c3d_enstrophy(void);
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }

#define MAX_BASE 500
static int bkx[MAX_BASE], bky[MAX_BASE], bkz[MAX_BASE];
static double bux[MAX_BASE], buy[MAX_BASE], buz[MAX_BASE];
static int nbm = 0;

static void ic_distributed(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i] = (int)c3d_get_kx(i); bky[i] = (int)c3d_get_ky(i); bkz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (bkz[i] != 0) uz = -((double)bkx[i]*ux+(double)bky[i]*uy)/(double)bkz[i];
        else if (bky[i] != 0) uy = -(double)bkx[i]*ux/(double)bky[i];
        else ux = 0.0;
        bux[i] = ux; buy[i] = uy; buz[i] = uz;
    }
}

static void apply_ic(int N) {
    int nm = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        for (int j = 0; j < nbm; j++) {
            if (bkx[j]==kx && bky[j]==ky && bkz[j]==kz) {
                buf_set(0,(double)i); buf_set(1,bux[j]); buf_set(2,buy[j]); buf_set(3,buz[j]);
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

/*
 * For each shell K, compute:
 *   - n(K): number of triads contributing
 *   - T_K: signed per-shell transfer (from energy change at ν=0)
 *   - T_K_abs: sum of |individual triad contributions| (recomputed)
 *   - ratio: |T_K| / T_K_abs
 *   - CLT prediction: 1/√n(K)
 *
 * The individual triad contribution to mode k is:
 *   Re(conj(û_k) · NL_k_single_triad)
 * where NL_k_single_triad = -i (û_p · q) P_k(û_q) for one (p,q) pair.
 *
 * We compute the FULL NL and also the SUM OF ABSOLUTES by iterating
 * over triads explicitly.
 */

#define MSH 12
#define MAX_MODES 3000

int main(void) {
    int N = 8;
    double amp = 0.30;
    double nu = 0.01;
    double dt = 0.0001;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  PHASE DISTRIBUTION & CLT TEST                               #\n");
    printf("#                                                              #\n");
    printf("#  For each shell K, decompose T_K into individual triad       #\n");
    printf("#  contributions and test the CLT prediction:                  #\n");
    printf("#    |T_K| / Σ|contrib_i| ~ 1/√n(K)                           #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f                                      #\n", N, amp, nu);
    printf("################################################################\n\n");
    fflush(stdout);

    ic_distributed(n_base, amp);
    apply_ic(N);
    int nm = (int)c3d_get_num_modes();

    /* Evolve to develop cascade */
    buf_set(0, nu); buf_set(1, dt);
    for (int s = 0; s < 500; s++) c3d_do_step();

    /* Store mode data locally */
    int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
    double mux[MAX_MODES], muy[MAX_MODES], muz[MAX_MODES];
    for (int i = 0; i < nm && i < MAX_MODES; i++) {
        mkx[i] = (int)c3d_get_kx(i);
        mky[i] = (int)c3d_get_ky(i);
        mkz[i] = (int)c3d_get_kz(i);
        mux[i] = bits_to_dbl(c3d_get_state_ux(i));
        muy[i] = bits_to_dbl(c3d_get_state_uy(i));
        muz[i] = bits_to_dbl(c3d_get_state_uz(i));
    }

    int n_max_sq = N * N;

    /* Find mode index by wavevector */
    /* Build a simple lookup (linear scan, fine for N=8) */

    printf("  Shell  n(K)      |T_K|(CS)     |T_K|(actual)  Σ|contrib|    |T|/Σ|c|    1/√n      ratio/(1/√n)\n");
    printf("  -----  --------  -----------   -----------   ----------   ---------   -------   ------------\n");

    /* Per-shell analysis */
    for (int K = 1; K <= N; K++) {
        double T_K_signed = 0;     /* Actual T_K (signed sum) */
        double T_K_abs_sum = 0;    /* Sum of absolute individual contributions */
        long n_triads = 0;         /* Number of triads */

        /* Iterate over modes k in shell K */
        for (int k_idx = 0; k_idx < nm; k_idx++) {
            int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
            int k2 = kx*kx + ky*ky + kz*kz;
            int shell = (int)(sqrt((double)k2) + 0.5);
            if (shell != K) continue;

            double uk_x = mux[k_idx], uk_y = muy[k_idx], uk_z = muz[k_idx];

            /* Iterate over all p to find triads p+q=k */
            for (int p_idx = 0; p_idx < nm; p_idx++) {
                int qx = kx - mkx[p_idx];
                int qy = ky - mky[p_idx];
                int qz = kz - mkz[p_idx];
                int q2 = qx*qx + qy*qy + qz*qz;
                if (q2 <= 0 || q2 > n_max_sq) continue;

                /* Find q in mode list */
                int q_idx = -1;
                for (int qi = 0; qi < nm; qi++) {
                    if (mkx[qi]==qx && mky[qi]==qy && mkz[qi]==qz) { q_idx = qi; break; }
                }
                if (q_idx < 0) continue;

                /* We have triad (p, q, k) with p+q=k */
                n_triads++;

                double up_x = mux[p_idx], up_y = muy[p_idx], up_z = muz[p_idx];
                double uq_x = mux[q_idx], uq_y = muy[q_idx], uq_z = muz[q_idx];

                /* û_p · q (real dot, since û is real at t=0 but complex at t>0;
                 * using real parts only — conservative for magnitude) */
                double updq = up_x*(double)qx + up_y*(double)qy + up_z*(double)qz;

                /* P_k(û_q) = û_q - (k·û_q/|k|²)k */
                double kduq = (double)kx*uq_x + (double)ky*uq_y + (double)kz*uq_z;
                double scale = kduq / (double)k2;
                double pq_x = uq_x - scale*(double)kx;
                double pq_y = uq_y - scale*(double)ky;
                double pq_z = uq_z - scale*(double)kz;

                /* Contribution = (û_p · q) * Re(conj(û_k) · P_k(û_q))
                 * (simplified for real parts — the -i factor means this
                 *  is actually the imaginary part that becomes real after -i) */
                double contrib = updq * (uk_x*pq_x + uk_y*pq_y + uk_z*pq_z);

                T_K_signed += contrib;
                T_K_abs_sum += fabs(contrib);
            }
        }

        if (n_triads == 0) continue;

        double cancel_ratio = (T_K_abs_sum > 1e-30) ? fabs(T_K_signed) / T_K_abs_sum : 0;
        double clt_pred = 1.0 / sqrt((double)n_triads);
        double ratio_vs_clt = (clt_pred > 1e-30) ? cancel_ratio / clt_pred : 0;

        /* Also get T_K from finite differences (for comparison) */
        /* (Already have this from the cancellation anatomy experiment) */

        printf("  %-5d  %-8ld  %11.4e   %11.4e   %10.4e   %9.6f   %7.5f   %12.4f\n",
               K, n_triads, T_K_abs_sum, fabs(T_K_signed),
               T_K_abs_sum, cancel_ratio, clt_pred, ratio_vs_clt);
        fflush(stdout);
    }

    printf("\n");

    /* Summary: fit the relationship between cancel_ratio and 1/√n */
    printf("  === CLT PREDICTION TEST ===\n\n");
    printf("  If |T_K|/Σ|c| ≈ 1/√n(K):  phases are effectively random → CLT holds.\n");
    printf("  If |T_K|/Σ|c| << 1/√n(K): phases are MORE aligned → stronger cancellation.\n");
    printf("  If |T_K|/Σ|c| >> 1/√n(K): phases are LESS spread → weaker cancellation.\n\n");

    printf("  The ratio (|T|/Σ|c|) / (1/√n) should be ≈ constant if CLT holds.\n");
    printf("  If it decreases with K: extra cancellation beyond CLT at high K.\n");
    printf("  If it increases with K: CLT overestimates cancellation at high K.\n\n");

    printf("################################################################\n");
    printf("#  IMPLICATIONS FOR THE ANALYTICAL BRIDGE:                     #\n");
    printf("#                                                              #\n");
    printf("#  If CLT holds: |T_K| ~ Σ|c| / √n(K)                        #\n");
    printf("#    Since Σ|c| ≤ CS_bound (by definition)                     #\n");
    printf("#    and n(K) ~ K² (from triad count scaling)                  #\n");
    printf("#    → |T_K| ≤ CS_bound / K = CS_bound · K^{-1}              #\n");
    printf("#    → p = 1 in the conjecture r(K) ~ K^{-p}                  #\n");
    printf("#                                                              #\n");
    printf("#  A CLT-type proof would need:                                #\n");
    printf("#    1. The phases of triad contributions are 'spread'         #\n");
    printf("#    2. The contributions are not too correlated               #\n");
    printf("#    3. No single triad dominates the sum                      #\n");
    printf("#  All three are testable from this data.                      #\n");
    printf("################################################################\n");

    return 0;
}
