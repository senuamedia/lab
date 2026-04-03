/*
 * experiment_cancellation_anatomy.c — Decompose the γ gap into its sources
 *
 * The Lemma predicts γ = 2 - α for spectral index α.
 * The computation gives γ ≈ (2 - α) - 3.4.
 * Where does the 3.4 come from?
 *
 * Three possible sources:
 *   1. Leray factor (sin²θ = 2/3): reduces amplitude by √(2/3) ≈ 0.82
 *   2. Per-shell phase cancellation: triads within a shell cancel due to -i
 *   3. Inter-shell zero-sum: Σ T_K = 0 forces balancing across shells
 *
 * Measurements:
 *   G. Per-shell cancellation ratio: |T_K| / Σ|individual triad contributions|
 *   H. Inter-shell cancellation: |Σ K² T_K| / Σ K² |T_K|
 *   I. Stretching S at ν=0 vs its absolute upper bound
 *
 * BUILD:
 *   clang -O3 experiments/experiment_cancellation_anatomy.c \
 *         src/triad_kernel_v3_final.c -o build/cancellation -lm
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

int main(void) {
    int N = 8;
    double amp = 0.30;
    double nu = 0.01;
    double dt = 0.0001;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  CANCELLATION ANATOMY                                        #\n");
    printf("#                                                              #\n");
    printf("#  Decompose the γ gap into per-shell and inter-shell          #\n");
    printf("#  cancellation sources.                                       #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f                                      #\n", N, amp, nu);
    printf("################################################################\n\n");
    fflush(stdout);

    ic_distributed(n_base, amp);
    apply_ic(N);
    int nm = (int)c3d_get_num_modes();

    /* Evolve to develop cascade */
    buf_set(0, nu); buf_set(1, dt);
    for (int s = 0; s < 500; s++) c3d_do_step();

    /* Now measure at ν=0 so dΩ/dt = S exactly */
    /* Record shell energies before */
    #define MAXSH 12
    double shell_e0[MAXSH];
    memset(shell_e0, 0, sizeof(shell_e0));

    int mode_kx[3000], mode_ky[3000], mode_kz[3000];
    double mode_ux[3000], mode_uy[3000], mode_uz[3000];

    for (int i = 0; i < nm; i++) {
        mode_kx[i] = (int)c3d_get_kx(i);
        mode_ky[i] = (int)c3d_get_ky(i);
        mode_kz[i] = (int)c3d_get_kz(i);
        mode_ux[i] = bits_to_dbl(c3d_get_state_ux(i));
        mode_uy[i] = bits_to_dbl(c3d_get_state_uy(i));
        mode_uz[i] = bits_to_dbl(c3d_get_state_uz(i));

        int k2 = mode_kx[i]*mode_kx[i]+mode_ky[i]*mode_ky[i]+mode_kz[i]*mode_kz[i];
        int shell = (int)(sqrt((double)k2)+0.5);
        if (shell < MAXSH)
            shell_e0[shell] += 0.5*(mode_ux[i]*mode_ux[i]+mode_uy[i]*mode_uy[i]+mode_uz[i]*mode_uz[i]);
    }

    /* Take steps at ν=0 */
    buf_set(0, 0.0); buf_set(1, dt);
    int msteps = 100;
    for (int s = 0; s < msteps; s++) c3d_do_step();

    /* Measure shell energies after */
    double shell_e1[MAXSH];
    memset(shell_e1, 0, sizeof(shell_e1));
    for (int i = 0; i < nm; i++) {
        double ux = bits_to_dbl(c3d_get_state_ux(i));
        double uy = bits_to_dbl(c3d_get_state_uy(i));
        double uz = bits_to_dbl(c3d_get_state_uz(i));
        int k2 = mode_kx[i]*mode_kx[i]+mode_ky[i]*mode_ky[i]+mode_kz[i]*mode_kz[i];
        int shell = (int)(sqrt((double)k2)+0.5);
        if (shell < MAXSH)
            shell_e1[shell] += 0.5*(ux*ux+uy*uy+uz*uz);
    }

    double E = bits_to_dbl(c3d_energy());
    double T = msteps * dt;

    /* Compute per-shell transfer T_K = dE_K/dt at ν=0 */
    double T_K[MAXSH];
    for (int k = 0; k < MAXSH; k++)
        T_K[k] = (shell_e1[k] - shell_e0[k]) / T;

    /* === TEST G: Per-shell cancellation ===
     * We can't directly measure individual triad contributions via the
     * public API (triads are internal). But we CAN measure:
     * - T_K (signed, from shell energy change)
     * - The "worst case" bound from Cauchy-Schwarz: C * E_K^{1/2} * K * E^{1/2} * (K²E+Ω)^{1/2}
     * The ratio |T_K| / (worst case) is the effective cancellation.
     */

    double Omega = bits_to_dbl(c3d_enstrophy());

    printf("  === TEST G: Per-shell cancellation ===\n\n");
    printf("  Shell  E_K        T_K (signed)  |T_K|       CS bound     |T_K|/CS    log ratio\n");
    printf("  -----  --------   -----------   ---------   ----------   --------   ---------\n");

    for (int k = 1; k <= N; k++) {
        /* Cauchy-Schwarz bound from Lemma 9.5 Step 5 (without Sobolev decay):
         * |T_K| ≤ C₃ √E_K · K · √E · √(K²E + Ω)
         * We use C₃ = 1 as normalisation (the ratio is what matters) */
        double cs_bound = sqrt(shell_e0[k]) * (double)k * sqrt(E) * sqrt((double)(k*k)*E + Omega);
        double ratio = (cs_bound > 1e-30) ? fabs(T_K[k]) / cs_bound : 0;

        printf("  %-5d  %8.2e   %+11.2e   %9.2e   %10.2e   %8.4f   %+9.4f\n",
               k, shell_e0[k], T_K[k], fabs(T_K[k]), cs_bound, ratio,
               (ratio > 1e-30) ? log10(ratio) : -99.0);
    }

    printf("\n");

    /* === TEST H: Inter-shell cancellation ===
     * S = Σ K² T_K (actual stretching)
     * S_abs = Σ K² |T_K| (worst case)
     */
    double S = 0, S_abs = 0;
    double sum_TK = 0;
    for (int k = 1; k <= N; k++) {
        S += (double)(k*k) * T_K[k];
        S_abs += (double)(k*k) * fabs(T_K[k]);
        sum_TK += T_K[k];
    }

    printf("  === TEST H: Inter-shell cancellation ===\n\n");
    printf("  Stretching S = Σ K² T_K:      %+12.4e\n", S);
    printf("  Absolute  S_abs = Σ K² |T_K|:  %12.4e\n", S_abs);
    printf("  Cancellation ratio |S|/S_abs:  %12.6f\n", (S_abs > 0) ? fabs(S) / S_abs : 0);
    printf("  Zero-sum check Σ T_K:          %+12.4e  (should be ~0)\n", sum_TK);
    printf("\n");

    /* === TEST I: Effective γ from different bounding strategies === */
    printf("  === TEST I: Effective γ comparison ===\n\n");

    /* Fit γ from actual |T_K| */
    double sx=0,sy=0,sxx=0,sxy=0;
    int npts=0;
    for (int k = 1; k < N-1; k++) {
        if (fabs(T_K[k]) > 1e-30 && E > 1e-30) {
            double lk = log((double)k);
            double lt = log(fabs(T_K[k]) / E);
            sx+=lk; sy+=lt; sxx+=lk*lk; sxy+=lk*lt; npts++;
        }
    }
    double gamma_actual = (npts >= 2) ? (npts*sxy-sx*sy)/(npts*sxx-sx*sx) : 99;

    /* Fit γ from Cauchy-Schwarz bound (no Sobolev, no Leray) */
    sx=sy=sxx=sxy=0; npts=0;
    for (int k = 1; k < N-1; k++) {
        double cs = sqrt(shell_e0[k]) * (double)k * sqrt(E) * sqrt((double)(k*k)*E + Omega);
        if (cs > 1e-30 && E > 1e-30) {
            double lk = log((double)k);
            double lt = log(cs / E);
            sx+=lk; sy+=lt; sxx+=lk*lk; sxy+=lk*lt; npts++;
        }
    }
    double gamma_cs = (npts >= 2) ? (npts*sxy-sx*sy)/(npts*sxx-sx*sx) : 99;

    /* Fit γ from CS bound × 2/3 (with Leray factor) */
    sx=sy=sxx=sxy=0; npts=0;
    for (int k = 1; k < N-1; k++) {
        double cs_leray = (2.0/3.0) * sqrt(shell_e0[k]) * (double)k * sqrt(E) * sqrt((double)(k*k)*E + Omega);
        if (cs_leray > 1e-30 && E > 1e-30) {
            double lk = log((double)k);
            double lt = log(cs_leray / E);
            sx+=lk; sy+=lt; sxx+=lk*lk; sxy+=lk*lt; npts++;
        }
    }
    double gamma_cs_leray = (npts >= 2) ? (npts*sxy-sx*sy)/(npts*sxx-sx*sx) : 99;

    printf("  γ from actual |T_K|:                    %+8.4f\n", gamma_actual);
    printf("  γ from Cauchy-Schwarz bound (no Leray): %+8.4f\n", gamma_cs);
    printf("  γ from CS × 2/3 (with Leray):          %+8.4f\n", gamma_cs_leray);
    printf("  γ from Lemma 9.5 (α=1):                %+8.4f\n", 1.0);
    printf("\n");
    printf("  Gap analysis:\n");
    printf("    CS bound → actual:     %+.4f  (total geometric + phase cancellation)\n", gamma_actual - gamma_cs);
    printf("    Leray factor alone:    %+.4f  (from sin²θ = 2/3)\n", gamma_cs_leray - gamma_cs);
    printf("    Phase cancellation:    %+.4f  (the remaining gap)\n", gamma_actual - gamma_cs_leray);
    printf("\n");

    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  |T_K|/CS << 1 at high K: per-shell phase cancellation.     #\n");
    printf("#  |S|/S_abs << 1: inter-shell cancellation from Σ T_K = 0.   #\n");
    printf("#  Phase cancellation >> Leray factor: -i is the key.         #\n");
    printf("#                                                              #\n");
    printf("#  If phase cancellation scales as K^{-p}:                     #\n");
    printf("#    γ_effective = γ_CS - p                                    #\n");
    printf("#    Need to prove p > 0 analytically to close the bridge.    #\n");
    printf("################################################################\n");

    return 0;
}
