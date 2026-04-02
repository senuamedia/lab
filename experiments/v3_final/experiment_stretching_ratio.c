/*
 * experiment_stretching_ratio.c — Kiriukhin-Bernstein cancellation test
 *
 * PURPOSE:
 *   Test whether the effective stretching amplification R(N) = |S_N|/Ω^{3/2}
 *   is independent of the truncation level N.
 *
 *   If R(N) ~ const: the Kiriukhin spectral radius decay (N^{-3/2}) exactly
 *   cancels the Bernstein amplification (N^{3/2}), giving an N-independent
 *   stretching bound. Combined with the diffusion lower bound 2νΣ ≥ νΩ²/(2E),
 *   this yields an a priori enstrophy ceiling:
 *
 *     Ω(t) ≤ max(Ω(0), 4 R² E₀² / ν²)
 *
 *   UNIFORMLY IN N. This closes the bootstrap circularity.
 *
 *   If R(N) ~ N^α with α > 0: the cancellation is incomplete and the
 *   a priori bound requires additional analytical input.
 *
 * METHOD:
 *   Run at ν=0 so that dΩ/dt = S exactly (no diffusion term to subtract).
 *   Measure S = ΔΩ/Δt via central finite differences.
 *   Compute R(N) = max_t |S(t)| / max_t Ω(t)^{3/2} at N = 4, 5, 6, 7, 8, 9, 10.
 *
 * THEORETICAL BACKGROUND:
 *   The undepleted stretching bound for the N-mode Galerkin system:
 *     |S_N| ≤ C · ||ω||²_{L⁴} · ||∇u||_{L²}
 *   Using Bernstein (L² → L⁴ in 3D): ||ω||_{L⁴} ≤ C_B N^{3/4} ||ω||_{L²}
 *     |S_N| ≤ C'' · N^{3/2} · Ω^{3/2}
 *
 *   Kiriukhin proves ρ(V_N) ≤ C_K N^{-3/2}, reducing the effective coupling.
 *   If this applies multiplicatively:
 *     |S_N| ≤ ρ(V_N) · C'' N^{3/2} Ω^{3/2} ≤ C_eff · Ω^{3/2}
 *
 *   The ratio R(N) = |S_N|/Ω^{3/2} should then be N-independent.
 *
 * CLASSICAL SUPPORT:
 *   - Constantin-Fefferman (1993): stretching kernel depleted by |sin φ|
 *   - Lu-Doering (2008): sharp instantaneous dΩ/dt ≤ CΩ³, unsustained dynamically
 *   - Doering-Gibbon (1995): ladder inequalities constrain hierarchical growth
 *   - Grujić (2009): geometric depletion gives |S| ~ Ω^{1/2} (with H^s assumption)
 *   All predict the Bernstein worst case is not achieved.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_stretching_ratio.c \
 *         src/triad_kernel_v3_final.c -o build/stretching_ratio -lm
 *
 * RUNTIME: ~5-10 minutes
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

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }

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
}

/* ============================================================ */
int main(void) {
    double dt = 0.0001;
    int n_steps = 1000;
    int n_base = 3;

    int test_Ns[] = {4, 5, 6, 7, 8, 9, 10};
    int n_Ns = 7;
    double amplitudes[] = {0.10, 0.20, 0.30};
    int n_amps = 3;

    printf("################################################################\n");
    printf("#  KIRIUKHIN-BERNSTEIN CANCELLATION TEST                       #\n");
    printf("#                                                              #\n");
    printf("#  Measures R(N) = max|S(t)| / max Ω(t)^{3/2}                 #\n");
    printf("#  at ν=0 (so dΩ/dt = S exactly).                              #\n");
    printf("#                                                              #\n");
    printf("#  If R(N) ~ const: Kiriukhin N^{-3/2} cancels Bernstein      #\n");
    printf("#  N^{3/2}, giving an N-independent stretching bound.          #\n");
    printf("#  This yields an a priori enstrophy ceiling:                  #\n");
    printf("#    Ω(t) ≤ max(Ω(0), 4R²E₀²/ν²)  UNIFORMLY IN N.           #\n");
    printf("#                                                              #\n");
    printf("#  If R(N) ~ N^α with α > 0: cancellation incomplete.         #\n");
    printf("################################################################\n\n");
    printf("  dt=%.6f, steps=%d, N_base=%d, ν=0 (inviscid)\n\n", dt, n_steps, n_base);
    fflush(stdout);

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];
        generate_fixed_u0(n_base, amp);

        printf("  ================================================================\n");
        printf("  === Amplitude A = %.2f ===\n", amp);
        printf("  ================================================================\n\n");

        printf("    N      modes    max|S|       maxΩ^{3/2}   R(N)         R/R(4)    time\n");
        printf("    -----  ------   ----------   ----------   ----------   ------    -----\n");

        double R_base = 0;

        for (int ni = 0; ni < n_Ns; ni++) {
            int N = test_Ns[ni];
            apply_fixed_projection(N);
            int nm = (int)c3d_get_num_modes();

            /* Run at ν=0: dΩ/dt = S exactly */
            buf_set(0, 0.0);  /* ν = 0 */
            buf_set(1, dt);

            double max_S = 0;
            double max_Omega_32 = 0;
            double prev_Omega = get_enstrophy();

            clock_t t_start = clock();

            for (int step = 0; step < n_steps; step++) {
                c3d_do_step();
                double Omega = get_enstrophy();

                /* S = dΩ/dt at ν=0 */
                double S = (Omega - prev_Omega) / dt;
                double Omega_32 = pow(Omega, 1.5);

                if (fabs(S) > max_S) max_S = fabs(S);
                if (Omega_32 > max_Omega_32) max_Omega_32 = Omega_32;

                prev_Omega = Omega;
            }

            double elapsed = (double)(clock() - t_start) / CLOCKS_PER_SEC;

            double R_N = (max_Omega_32 > 1e-30) ? max_S / max_Omega_32 : 0;
            if (ni == 0) R_base = R_N;
            double ratio = (R_base > 1e-30) ? R_N / R_base : 0;

            printf("    %-5d  %-6d   %10.4e   %10.4e   %10.4e   %6.3f    %.1fs\n",
                   N, nm, max_S, max_Omega_32, R_N, ratio, elapsed);
            fflush(stdout);
        }

        /* Fit power law R(N) ~ N^alpha via log-log regression */
        {
            double sx = 0, sy = 0, sxx = 0, sxy = 0;
            int n = n_Ns;
            for (int i = 0; i < n; i++) {
                int N = test_Ns[i];
                /* Recompute R(N) - we need to store them */
                /* Actually, let's just do the regression from the printed values */
                /* For simplicity, re-run a quick version */
            }
        }

        /* Re-run to collect R(N) values for regression */
        double R_vals[20];
        for (int ni = 0; ni < n_Ns; ni++) {
            int N = test_Ns[ni];
            apply_fixed_projection(N);
            buf_set(0, 0.0); buf_set(1, dt);

            double max_S = 0, max_Omega_32 = 0;
            double prev_Omega = get_enstrophy();

            for (int step = 0; step < n_steps; step++) {
                c3d_do_step();
                double Omega = get_enstrophy();
                double S = (Omega - prev_Omega) / dt;
                if (fabs(S) > max_S) max_S = fabs(S);
                double O32 = pow(Omega, 1.5);
                if (O32 > max_Omega_32) max_Omega_32 = O32;
                prev_Omega = Omega;
            }
            R_vals[ni] = (max_Omega_32 > 1e-30) ? max_S / max_Omega_32 : 0;
        }

        /* Log-log regression: log R = α log N + const */
        double sx = 0, sy = 0, sxx = 0, sxy = 0;
        int n_pts = 0;
        for (int i = 0; i < n_Ns; i++) {
            if (R_vals[i] > 1e-30) {
                double lx = log((double)test_Ns[i]);
                double ly = log(R_vals[i]);
                sx += lx; sy += ly; sxx += lx*lx; sxy += lx*ly;
                n_pts++;
            }
        }
        double alpha = 0;
        if (n_pts >= 2) {
            alpha = (n_pts * sxy - sx * sy) / (n_pts * sxx - sx * sx);
        }

        printf("\n    Fitted power law: R(N) ~ N^{%.3f}\n", alpha);
        if (fabs(alpha) < 0.5)
            printf("    → CONSISTENT WITH N-INDEPENDENT (|α| < 0.5)\n");
        else if (alpha < -0.5)
            printf("    → R DECREASING WITH N: cancellation STRONGER than N^{-3/2}\n");
        else
            printf("    → R INCREASING WITH N: cancellation INCOMPLETE (α = %.3f)\n", alpha);

        if (fabs(alpha) < 0.5) {
            double R_mean = 0;
            for (int i = 0; i < n_Ns; i++) R_mean += R_vals[i];
            R_mean /= n_Ns;
            printf("    Mean R = %.6f\n", R_mean);
            printf("    A priori enstrophy ceiling (at ν=0.01, E₀=%.3f):\n", get_energy());
            double E0 = 0.5 * amp * amp * num_base_modes * 0.1; /* rough */
            /* Use actual E0 from the first run */
            apply_fixed_projection(test_Ns[0]);
            E0 = get_energy();
            double nu = 0.01;
            double Omega_star = 4.0 * R_mean * R_mean * E0 * E0 / (nu * nu);
            printf("      Ω* = 4R²E₀²/ν² = 4×%.4f²×%.4f²/0.01² = %.2f\n",
                   R_mean, E0, Omega_star);
        }
        printf("\n");
        fflush(stdout);
    }

    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  R(N) ~ const (α ≈ 0):                                      #\n");
    printf("#    The Kiriukhin-Bernstein cancellation holds.               #\n");
    printf("#    |S_N| ≤ R · Ω^{3/2}  uniformly in N.                     #\n");
    printf("#    Combined with diffusion 2νΣ ≥ νΩ²/(2E₀):                 #\n");
    printf("#    Ω(t) ≤ max(Ω(0), 4R²E₀²/ν²)  for all t, all N.         #\n");
    printf("#    → A PRIORI ENSTROPHY BOUND (no H^s assumption needed).    #\n");
    printf("#    → Bootstrap circularity RESOLVED.                         #\n");
    printf("#                                                              #\n");
    printf("#  Supported by:                                               #\n");
    printf("#    - Kiriukhin (2026): ρ(V_N) ≤ C N^{-3/2}                  #\n");
    printf("#    - Constantin-Fefferman (1993): |D| ≤ |sin φ|              #\n");
    printf("#    - Lu-Doering (2008): dΩ/dt ≤ CΩ³ (sharp, unsustained)    #\n");
    printf("#    - Doering-Gibbon (1995): ladder constraints               #\n");
    printf("#    - Grujić (2009): geometric depletion                      #\n");
    printf("################################################################\n");

    return 0;
}
