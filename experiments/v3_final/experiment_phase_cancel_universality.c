/*
 * experiment_phase_cancel_universality.c — Validate r(K) ~ K^{-p} universality
 *
 * Measures the per-shell cancellation ratio r(K) = |T_K| / CS_bound
 * across multiple conditions to determine if p ≈ 1 is universal.
 *
 * Sweep:
 *   A = 0.10, 0.20, 0.30 (3 amplitudes)
 *   α = 0.0, 1.0, 2.0 (3 spectral indices)
 *   N = 6, 8 (2 truncation levels)
 *   t = 0.05, 0.20 (2 time points)
 *
 * For each: fit p from log(r(K)) vs log(K) regression.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_phase_cancel_universality.c \
 *         src/triad_kernel_v3_final.c -o build/phase_univ -lm
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

#define MAX_BASE 500
static int bkx[MAX_BASE], bky[MAX_BASE], bkz[MAX_BASE];
static double bux[MAX_BASE], buy[MAX_BASE], buz[MAX_BASE];
static int nbm = 0;

static void ic_spectral(int n_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i] = (int)c3d_get_kx(i); bky[i] = (int)c3d_get_ky(i); bkz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
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

/* Measure r(K) at interior shells, fit p from log-log regression */
static double measure_p(int N, double *r_vals, int *n_shells) {
    int nm = (int)c3d_get_num_modes();
    double dt = 0.0001;
    int msteps = 100;

    #define MSH 12
    double se0[MSH], se1[MSH];
    memset(se0, 0, sizeof(se0));

    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        int sh = (int)(sqrt((double)k2)+0.5);
        if (sh < MSH) {
            double ux = bits_to_dbl(c3d_get_state_ux(i));
            double uy = bits_to_dbl(c3d_get_state_uy(i));
            double uz = bits_to_dbl(c3d_get_state_uz(i));
            se0[sh] += 0.5*(ux*ux+uy*uy+uz*uz);
        }
    }

    double E = bits_to_dbl(c3d_energy());
    double Omega = bits_to_dbl(c3d_enstrophy());

    buf_set(0, 0.0); buf_set(1, dt); /* ν=0 for pure stretching */
    for (int s = 0; s < msteps; s++) c3d_do_step();

    memset(se1, 0, sizeof(se1));
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        int sh = (int)(sqrt((double)k2)+0.5);
        if (sh < MSH) {
            double ux = bits_to_dbl(c3d_get_state_ux(i));
            double uy = bits_to_dbl(c3d_get_state_uy(i));
            double uz = bits_to_dbl(c3d_get_state_uz(i));
            se1[sh] += 0.5*(ux*ux+uy*uy+uz*uz);
        }
    }

    /* Compute r(K) for interior shells */
    double sx=0,sy=0,sxx=0,sxy=0;
    int npts=0;
    *n_shells = 0;

    for (int k = 2; k < N-1; k++) { /* Skip boundary and k=1 */
        double T_k = (se1[k] - se0[k]) / (msteps * dt);
        double cs = sqrt(se0[k]) * (double)k * sqrt(E) * sqrt((double)(k*k)*E + Omega);
        double r = (cs > 1e-30) ? fabs(T_k) / cs : 0;

        if (r > 1e-30 && k > 1) {
            r_vals[npts] = r;
            double lk = log((double)k);
            double lr = log(r);
            sx += lk; sy += lr; sxx += lk*lk; sxy += lk*lr;
            npts++;
        }
    }

    *n_shells = npts;
    if (npts < 2) return 0;
    /* p = -slope (since r ~ K^{-p}, log r = -p log K + const) */
    double slope = (npts*sxy - sx*sy) / (npts*sxx - sx*sx);
    return -slope;
}

int main(void) {
    int n_base = 3;
    double nu = 0.01;
    double dt = 0.0001;

    double amps[] = {0.10, 0.20, 0.30};
    double alphas[] = {0.0, 1.0, 2.0};
    int Ns[] = {6, 8};
    int evolve_steps[] = {500, 2000}; /* t=0.05, t=0.20 */
    double evolve_times[] = {0.05, 0.20};

    printf("################################################################\n");
    printf("#  PHASE CANCELLATION UNIVERSALITY                             #\n");
    printf("#                                                              #\n");
    printf("#  Tests r(K) ~ K^{-p}: is p ≈ 1 universal?                   #\n");
    printf("#  Sweep: 3 amplitudes × 3 spectral indices × 2 N × 2 times  #\n");
    printf("#  = 36 configurations                                        #\n");
    printf("################################################################\n\n");

    printf("  A      α     N    t       p         #shells   time\n");
    printf("  -----  ----  ---  ------  --------   -------   -----\n");
    fflush(stdout);

    double p_min = 999, p_max = -999, p_sum = 0;
    int p_count = 0;

    for (int ai = 0; ai < 3; ai++)
    for (int si = 0; si < 3; si++)
    for (int ni = 0; ni < 2; ni++)
    for (int ti = 0; ti < 2; ti++) {
        double amp = amps[ai];
        double alpha = alphas[si];
        int N = Ns[ni];
        int esteps = evolve_steps[ti];

        ic_spectral(n_base, amp, alpha);
        apply_ic(N);
        buf_set(0, nu); buf_set(1, dt);
        for (int s = 0; s < esteps; s++) c3d_do_step();

        /* Now re-apply IC and evolve again for clean measurement
         * (the first evolution develops the cascade; we measure from the developed state) */
        /* Actually, just measure from current state */
        double r_vals[20];
        int n_sh;
        clock_t t0 = clock();
        double p = measure_p(N, r_vals, &n_sh);
        double elapsed = (double)(clock() - t0) / CLOCKS_PER_SEC;

        if (p > p_max) p_max = p;
        if (p < p_min) p_min = p;
        p_sum += p;
        p_count++;

        printf("  %.2f   %.1f   %-3d  %.4f  %+8.4f   %7d   %.1fs\n",
               amp, alpha, N, evolve_times[ti], p, n_sh, elapsed);
        fflush(stdout);
    }

    printf("\n");
    printf("  === SUMMARY ===\n");
    printf("  p range: [%.4f, %.4f]\n", p_min, p_max);
    printf("  p mean:  %.4f\n", p_sum / p_count);
    printf("  p std:   (see range)\n");
    printf("  Configs: %d\n\n", p_count);

    if (p_min > 0.5)
        printf("  → p > 0.5 across ALL configs: phase cancellation is UNIVERSAL.\n");
    else
        printf("  → p < 0.5 in some configs: cancellation is NOT universal.\n");

    if (p_min > 0.8 && p_max < 1.2)
        printf("  → p ≈ 1.0 ± 0.2: consistent with K^{-1} scaling.\n");

    printf("\n");
    printf("################################################################\n");
    printf("#  If p ≈ 1 universally:                                       #\n");
    printf("#    r(K) ~ K^{-1} → |T_K| ~ CS_bound / K                    #\n");
    printf("#    → γ_effective = γ_CS - 1                                  #\n");
    printf("#    → For flat spectrum (α=0): γ_eff ≈ 2 - 1 = 1 < 2        #\n");
    printf("#    → Regularity holds even without Sobolev decay.            #\n");
    printf("#                                                              #\n");
    printf("#  This would close the analytical bridge if proved.           #\n");
    printf("################################################################\n");

    return 0;
}
