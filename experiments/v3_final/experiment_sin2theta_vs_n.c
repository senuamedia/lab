/*
 * experiment_sin2theta_vs_n.c — Leray cancellation factor as a function of N
 *
 * PURPOSE:
 *   Measure whether the average Leray cancellation ⟨sin²θ⟩ is independent
 *   of the truncation level N. If so, the Leray projection provides an
 *   N-independent multiplicative reduction on the stretching, which combined
 *   with the Bernstein inequality gives |S_N| ≤ C_eff Ω^{3/2} uniformly in N.
 *
 *   This is the Fourier-space analogue of Constantin-Fefferman (1993), who
 *   proved that the physical-space stretching kernel D satisfies |D| ≤ |sin φ|
 *   where φ is the angle between nearby vorticity directions.
 *
 * WHAT WE MEASURE:
 *   For each triad (p, q, k=p+q), the Leray projection removes the
 *   k-component of û_q:
 *     |P_k(û_q)|² = |û_q|² · sin²θ(û_q, k)
 *
 *   We measure:
 *     ⟨sin²θ⟩(N) = energy-weighted average over all triads at truncation N
 *
 *   Run at N = 4, 5, 6, 7, 8, 9, 10 with fixed initial data.
 *
 * KEY QUESTION:
 *   If ⟨sin²θ⟩(N) is constant (N-independent):
 *     → The Leray cancellation factor is a geometric property of divergence-free
 *       fields on Z³, not an artefact of the truncation level.
 *     → The stretching estimate |S_N| ≤ C·N^{3/2}·⟨sin²θ⟩·Ω^{3/2} becomes
 *       |S_N| ≤ C·N^{3/2}·c·Ω^{3/2} where c < 1 is N-independent.
 *     → This alone does NOT cancel the N^{3/2}. BUT: if sin²θ applies to
 *       EACH of the two û factors in the trilinear form (the Cauchy-Schwarz
 *       splits ||ω||²_{L⁴} which involves two copies of û), the total
 *       reduction is (sin²θ)^{some power} at each wavenumber scale, and
 *       the scale-dependent cancellation may account for the R(N) plateau.
 *
 *   The experiment also measures ⟨sin²θ⟩ per shell K at each N, to check
 *   whether the cancellation STRENGTHENS at high K (as the v9 Leray
 *   experiment showed at fixed N=10).
 *
 * ANALYTICAL CONNECTION:
 *   For a divergence-free field û with k · û_k = 0, the vector û_k lies
 *   in the plane perpendicular to k. For a random unit vector in this plane,
 *   the expected value of sin²θ (where θ is the angle between û_q and
 *   a different wavevector k) depends on the angle between k and q.
 *
 *   If k and q are uniformly distributed on the sphere, ⟨sin²θ⟩ = 2/3
 *   (the isotropic random expectation). The divergence-free constraint
 *   can only reduce this (since û_q ⊥ q means û_q avoids the q-direction,
 *   which correlates with the k-direction when triads p+q=k constrain
 *   the geometry).
 *
 *   A self-contained proof that ⟨sin²θ⟩ ≤ 2/3 for divergence-free fields
 *   on Z³ would establish the Leray cancellation without external citation.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_sin2theta_vs_n.c \
 *         src/triad_kernel_v3_final.c -o build/sin2theta_vs_n -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>

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

/* ============================================================ */
#define MAX_LOCAL_MODES 8000
static int loc_kx[MAX_LOCAL_MODES], loc_ky[MAX_LOCAL_MODES], loc_kz[MAX_LOCAL_MODES];
static int loc_nm = 0;

static void snapshot_modes(void) {
    loc_nm = (int)c3d_get_num_modes();
    if (loc_nm > MAX_LOCAL_MODES) loc_nm = MAX_LOCAL_MODES;
    for (int i = 0; i < loc_nm; i++) {
        loc_kx[i] = (int)c3d_get_kx(i);
        loc_ky[i] = (int)c3d_get_ky(i);
        loc_kz[i] = (int)c3d_get_kz(i);
    }
}

static int find_local_mode(int kx, int ky, int kz) {
    for (int i = 0; i < loc_nm; i++)
        if (loc_kx[i] == kx && loc_ky[i] == ky && loc_kz[i] == kz) return i;
    return -1;
}

/* ============================================================ */
#define MAX_BASE_MODES 500
static int base_kx[MAX_BASE_MODES], base_ky[MAX_BASE_MODES], base_kz[MAX_BASE_MODES];
static double base_ux[MAX_BASE_MODES], base_uy[MAX_BASE_MODES], base_uz[MAX_BASE_MODES];
static int num_base_modes = 0;

static void generate_fixed_u0(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    num_base_modes = (nm < MAX_BASE_MODES) ? nm : MAX_BASE_MODES;
    for (int i = 0; i < num_base_modes; i++) {
        base_kx[i] = (int)c3d_get_kx(i);
        base_ky[i] = (int)c3d_get_ky(i);
        base_kz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(base_kx[i]*base_kx[i]+base_ky[i]*base_ky[i]+base_kz[i]*base_kz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (base_kz[i] != 0)
            uz = -((double)base_kx[i]*ux+(double)base_ky[i]*uy)/(double)base_kz[i];
        else if (base_ky[i] != 0)
            uy = -(double)base_kx[i]*ux/(double)base_ky[i];
        else
            ux = 0.0;
        base_ux[i] = ux; base_uy[i] = uy; base_uz[i] = uz;
    }
}

static void apply_fixed_projection(int n_target) {
    int nm = (int)c3d_enumerate_modes(n_target);
    c3d_precompute_triads(n_target);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        for (int j = 0; j < num_base_modes; j++) {
            if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                buf_set(0,(double)i); buf_set(1,base_ux[j]); buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                c3d_apply_state();
                break;
            }
        }
    }
    c3d_enforce_symmetry();
    snapshot_modes();
}

/* ============================================================
 * Measure global ⟨sin²θ⟩ and per-shell ⟨sin²θ⟩_K at a given N
 * Uses real parts only (exact at t=0 for real IC)
 * ============================================================ */
#define MAX_SHELLS 15

static double measure_global_sin2theta(int n_max, double shell_sin2[], int *n_shells_out) {
    int n_max_sq = n_max * n_max;
    double global_sum = 0, global_w = 0;
    double shell_sum[MAX_SHELLS], shell_w[MAX_SHELLS];
    memset(shell_sum, 0, sizeof(shell_sum));
    memset(shell_w, 0, sizeof(shell_w));
    *n_shells_out = 0;

    for (int k_idx = 0; k_idx < loc_nm; k_idx++) {
        double kx = (double)loc_kx[k_idx];
        double ky = (double)loc_ky[k_idx];
        double kz = (double)loc_kz[k_idx];
        double k2 = kx*kx + ky*ky + kz*kz;
        if (k2 < 1e-10) continue;

        int shell = (int)(sqrt(k2) + 0.5);
        if (shell >= MAX_SHELLS) shell = MAX_SHELLS - 1;
        if (shell + 1 > *n_shells_out) *n_shells_out = shell + 1;

        for (int p_idx = 0; p_idx < loc_nm; p_idx++) {
            int qx = loc_kx[k_idx] - loc_kx[p_idx];
            int qy = loc_ky[k_idx] - loc_ky[p_idx];
            int qz = loc_kz[k_idx] - loc_kz[p_idx];
            int q2 = qx*qx + qy*qy + qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;
            int q_idx = find_local_mode(qx, qy, qz);
            if (q_idx < 0) continue;

            double uq_x = bits_to_dbl(c3d_get_state_ux(q_idx));
            double uq_y = bits_to_dbl(c3d_get_state_uy(q_idx));
            double uq_z = bits_to_dbl(c3d_get_state_uz(q_idx));
            double uq2 = uq_x*uq_x + uq_y*uq_y + uq_z*uq_z;
            if (uq2 < 1e-30) continue;

            double kduq = kx*uq_x + ky*uq_y + kz*uq_z;
            double cos2theta = (kduq * kduq) / (k2 * uq2);
            if (cos2theta > 1.0) cos2theta = 1.0;
            double sin2theta = 1.0 - cos2theta;

            double w = uq2;
            global_sum += w * sin2theta;
            global_w += w;
            shell_sum[shell] += w * sin2theta;
            shell_w[shell] += w;
        }
    }

    for (int s = 0; s < MAX_SHELLS; s++)
        shell_sin2[s] = (shell_w[s] > 1e-30) ? shell_sum[s] / shell_w[s] : -1.0;

    return (global_w > 0) ? global_sum / global_w : 0;
}

/* ============================================================ */
int main(void) {
    int n_base = 3;
    int test_Ns[] = {4, 5, 6, 7, 8, 9, 10};
    int n_Ns = 7;
    double amplitudes[] = {0.10, 0.20, 0.30};
    int n_amps = 3;

    printf("################################################################\n");
    printf("#  LERAY CANCELLATION vs TRUNCATION LEVEL                      #\n");
    printf("#                                                              #\n");
    printf("#  Measures ⟨sin²θ⟩(N) at t=0 (exact for real IC).            #\n");
    printf("#  If ⟨sin²θ⟩ is N-independent: the Leray cancellation is a   #\n");
    printf("#  geometric property of divergence-free fields on Z³.         #\n");
    printf("#                                                              #\n");
    printf("#  Isotropic random expectation: ⟨sin²θ⟩ = 2/3 = 0.6667      #\n");
    printf("#  Divergence-free fields: ⟨sin²θ⟩ ≤ 2/3 (constrained)       #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];
        generate_fixed_u0(n_base, amp);

        printf("  ================================================================\n");
        printf("  === Amplitude A = %.2f ===\n", amp);
        printf("  ================================================================\n\n");

        /* Summary table */
        printf("    N      modes    ⟨sin²θ⟩    cancel%%   Δ from N=4    time\n");
        printf("    -----  ------   --------   -------   ----------    -----\n");

        double base_sin2 = 0;

        for (int ni = 0; ni < n_Ns; ni++) {
            int N = test_Ns[ni];
            apply_fixed_projection(N);
            int nm = loc_nm;

            clock_t t_start = clock();
            double shell_sin2[MAX_SHELLS];
            int n_shells = 0;
            double g = measure_global_sin2theta(N, shell_sin2, &n_shells);
            double elapsed = (double)(clock() - t_start) / CLOCKS_PER_SEC;

            if (ni == 0) base_sin2 = g;
            double delta = g - base_sin2;

            printf("    %-5d  %-6d   %8.6f   %5.1f%%    %+.6f     %.1fs\n",
                   N, nm, g, (1.0 - g) * 100.0, delta, elapsed);
            fflush(stdout);
        }

        printf("\n");

        /* Per-shell detail at N=10 */
        {
            int N = 10;
            apply_fixed_projection(N);
            double shell_sin2[MAX_SHELLS];
            int n_shells = 0;
            measure_global_sin2theta(N, shell_sin2, &n_shells);

            printf("    Per-shell detail at N=%d:\n", N);
            printf("    Shell  ⟨sin²θ⟩_K   cancel%%\n");
            printf("    -----  ---------   -------\n");
            for (int s = 1; s < n_shells; s++) {
                if (shell_sin2[s] < 0) continue;
                printf("    %-5d  %9.6f   %5.1f%%\n",
                       s, shell_sin2[s], (1.0 - shell_sin2[s]) * 100.0);
            }
            printf("\n");
        }
        fflush(stdout);
    }

    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  ⟨sin²θ⟩ constant across N:                                 #\n");
    printf("#    → Leray cancellation is N-independent.                    #\n");
    printf("#    → Combined with R(N) plateau (stretching_ratio.c):       #\n");
    printf("#      the N-independent stretching bound holds.               #\n");
    printf("#                                                              #\n");
    printf("#  ⟨sin²θ⟩ ≤ 2/3 at all N:                                   #\n");
    printf("#    → Divergence-free constraint provides geometric reserve.  #\n");
    printf("#    → Matches Constantin-Fefferman (1993): |D| ≤ |sin φ|.    #\n");
    printf("#                                                              #\n");
    printf("#  ⟨sin²θ⟩_K decreasing with K (per-shell):                   #\n");
    printf("#    → Cancellation strengthens at high wavenumbers.           #\n");
    printf("#    → Explains why γ ≈ -1.5 (measured) << γ = 2 (Bernstein). #\n");
    printf("################################################################\n");

    return 0;
}
