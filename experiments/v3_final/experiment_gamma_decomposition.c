/*
 * experiment_gamma_decomposition.c — Decompose γ into its sources
 *
 * Test E: Measure γ as a function of IC spectral index
 * Test F: Decompose per-shell transfer into magnitude, Leray, and phase factors
 *
 * The goal: understand WHERE γ ≈ -1.5 comes from. Is it:
 *   (a) Sobolev decay of E_K (spectral structure)
 *   (b) The sin²θ = 2/3 Leray factor (geometric cancellation)
 *   (c) Phase cancellation from the -i factor
 *
 * BUILD:
 *   clang -O3 experiments/experiment_gamma_decomposition.c \
 *         src/triad_kernel_v3_final.c -o build/gamma_decomp -lm
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

/* IC with controllable spectral index: E_K ~ K^{-2α}
 * α = 0: flat spectrum
 * α = 1: E_K ~ K^{-2} (1/k velocity)
 * α = 2: E_K ~ K^{-4} (steep decay)
 */
#define MAX_BASE 500
static int bkx[MAX_BASE], bky[MAX_BASE], bkz[MAX_BASE];
static double bux[MAX_BASE], buy[MAX_BASE], buz[MAX_BASE];
static int nbm = 0;

static void ic_spectral_index(int n_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i] = (int)c3d_get_kx(i); bky[i] = (int)c3d_get_ky(i); bkz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        /* û ~ amp * k^{-alpha} for spectral index alpha */
        double va = amp * pow(km, -alpha);
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

/* Measure γ from shell energy changes at ν=0 */
static double measure_gamma(int N, int nm) {
    /* Record shell energies */
    #define MAXSH 15
    double shell_e0[MAXSH];
    memset(shell_e0, 0, sizeof(shell_e0));

    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        int shell = (int)(sqrt((double)k2) + 0.5);
        if (shell >= MAXSH) shell = MAXSH-1;
        double ux = bits_to_dbl(c3d_get_state_ux(i));
        double uy = bits_to_dbl(c3d_get_state_uy(i));
        double uz = bits_to_dbl(c3d_get_state_uz(i));
        shell_e0[shell] += 0.5 * (ux*ux + uy*uy + uz*uz);
    }

    /* Take steps at ν=0 */
    double dt = 0.0001;
    int msteps = 100;
    buf_set(0, 0.0); buf_set(1, dt);
    for (int s = 0; s < msteps; s++) c3d_do_step();

    /* Measure shell energies after */
    double shell_e1[MAXSH];
    memset(shell_e1, 0, sizeof(shell_e1));
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        int shell = (int)(sqrt((double)k2) + 0.5);
        if (shell >= MAXSH) shell = MAXSH-1;
        double ux = bits_to_dbl(c3d_get_state_ux(i));
        double uy = bits_to_dbl(c3d_get_state_uy(i));
        double uz = bits_to_dbl(c3d_get_state_uz(i));
        shell_e1[shell] += 0.5 * (ux*ux + uy*uy + uz*uz);
    }

    double E_total = bits_to_dbl(c3d_energy());

    /* Compute |T_K| = |dE_K/dt| at ν=0 and fit log-log */
    double logk[MAXSH], logT[MAXSH];
    int npts = 0;
    for (int k = 1; k < N-1; k++) {
        double T_k = (shell_e1[k] - shell_e0[k]) / (msteps * dt);
        if (fabs(T_k) > 1e-20 && E_total > 1e-20) {
            double Cs = fabs(T_k) / E_total;
            if (Cs > 1e-20) {
                logk[npts] = log((double)k);
                logT[npts] = log(Cs);
                npts++;
            }
        }
    }

    if (npts < 3) return 99.0;
    double sx=0,sy=0,sxx=0,sxy=0;
    for (int i = 0; i < npts; i++) {
        sx += logk[i]; sy += logT[i]; sxx += logk[i]*logk[i]; sxy += logk[i]*logT[i];
    }
    return (npts*sxy - sx*sy) / (npts*sxx - sx*sx);
}

int main(void) {
    int N = 8;
    double amp = 0.30;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  γ DECOMPOSITION                                             #\n");
    printf("#                                                              #\n");
    printf("#  E: γ as function of IC spectral index α (E_K ~ K^{-2α})   #\n");
    printf("#  F: Shell-by-shell transfer magnitude analysis               #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f                                               #\n", N, amp);
    printf("################################################################\n\n");
    fflush(stdout);

    /* ============================================================
     * TEST E: γ vs spectral index α
     * ============================================================ */
    printf("  === TEST E: γ vs IC spectral index α ===\n");
    printf("  (IC: û ~ k^{-α}, so E_K ~ K^{2-2α} per mode, K^{4-2α} per shell)\n\n");
    printf("  α       E(0)       Ω(0)       γ (measured)    γ predicted (3/2 - (2α-1)/2)\n");
    printf("  ------  --------   --------   ------------    ---------------------------\n");
    fflush(stdout);

    double alphas[] = {0.0, 0.5, 1.0, 1.5, 2.0, 3.0};
    int n_alphas = 6;

    for (int ai = 0; ai < n_alphas; ai++) {
        double alpha = alphas[ai];
        ic_spectral_index(n_base, amp, alpha);
        apply_ic(N);
        int nm = (int)c3d_get_num_modes();

        double E0 = bits_to_dbl(c3d_energy());
        double Omega0 = bits_to_dbl(c3d_enstrophy());

        /* Evolve briefly to develop the cascade */
        buf_set(0, 0.01); buf_set(1, 0.0001);
        for (int s = 0; s < 500; s++) c3d_do_step();

        /* Measure γ at ν=0 */
        ic_spectral_index(n_base, amp, alpha);
        apply_ic(N);
        buf_set(0, 0.01); buf_set(1, 0.0001);
        for (int s = 0; s < 500; s++) c3d_do_step();

        double gamma = measure_gamma(N, nm);

        /* Predicted γ from Lemma 9.5: γ = 3/2 - δ/2 where δ = 2s-1
         * For E_K ~ K^{-2s}: s = α (the spectral index of û)
         * gives δ = 2α - 1, γ_pred = 3/2 - (2α-1)/2 = 2 - α */
        double gamma_pred = 2.0 - alpha;

        printf("  %6.1f  %8.4f   %8.4f   %+12.4f    %+.4f\n",
               alpha, E0, Omega0, gamma, gamma_pred);
        fflush(stdout);
    }

    printf("\n  If γ_measured ≈ γ_predicted: Sobolev decay explains γ.\n");
    printf("  If γ_measured << γ_predicted: geometric cancellation dominates.\n");
    printf("  If γ_measured is constant regardless of α: geometry is everything.\n\n");

    /* ============================================================
     * TEST F: Per-shell transfer decomposition
     * ============================================================ */
    printf("  === TEST F: Per-shell |T_K| at each shell (distributed IC, ν=0) ===\n\n");

    ic_spectral_index(n_base, amp, 1.0); /* Standard distributed: α=1 */
    apply_ic(N);
    int nm = (int)c3d_get_num_modes();

    buf_set(0, 0.01); buf_set(1, 0.0001);
    for (int s = 0; s < 500; s++) c3d_do_step();

    /* Record shell energies before */
    double shell_e0[MAXSH];
    memset(shell_e0, 0, sizeof(shell_e0));
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        int shell = (int)(sqrt((double)k2)+0.5);
        if (shell >= MAXSH) shell = MAXSH-1;
        double ux = bits_to_dbl(c3d_get_state_ux(i));
        double uy = bits_to_dbl(c3d_get_state_uy(i));
        double uz = bits_to_dbl(c3d_get_state_uz(i));
        shell_e0[shell] += 0.5*(ux*ux+uy*uy+uz*uz);
    }

    buf_set(0, 0.0); buf_set(1, 0.0001);
    for (int s = 0; s < 100; s++) c3d_do_step();

    double shell_e1[MAXSH];
    memset(shell_e1, 0, sizeof(shell_e1));
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        int shell = (int)(sqrt((double)k2)+0.5);
        if (shell >= MAXSH) shell = MAXSH-1;
        double ux = bits_to_dbl(c3d_get_state_ux(i));
        double uy = bits_to_dbl(c3d_get_state_uy(i));
        double uz = bits_to_dbl(c3d_get_state_uz(i));
        shell_e1[shell] += 0.5*(ux*ux+uy*uy+uz*uz);
    }

    double E_total = bits_to_dbl(c3d_energy());

    printf("  Shell  E_K        |T_K|       |T_K|/E     log(k)   log(|T_K|/E)\n");
    printf("  -----  --------   ---------   --------   ------   ------------\n");
    for (int k = 1; k <= N; k++) {
        double T_k = (shell_e1[k] - shell_e0[k]) / (100 * 0.0001);
        double Cs = (E_total > 0) ? fabs(T_k) / E_total : 0;
        printf("  %-5d  %8.2e   %9.2e   %8.2e   %6.3f   %+12.4f\n",
               k, shell_e0[k], fabs(T_k), Cs,
               log((double)k), (Cs > 1e-30) ? log(Cs) : -99.0);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  The slope of log(|T_K|/E) vs log(k) is γ.                  #\n");
    printf("#  Compare with sin²θ = 2/3 (Leray factor) and the spectral   #\n");
    printf("#  decay E_K to identify the dominant source of cancellation.  #\n");
    printf("################################################################\n");

    return 0;
}
