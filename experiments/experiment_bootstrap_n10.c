/*
 * experiment_bootstrap_dynamics.c — What actually happens in the bootstrap?
 *
 * The alleged circularity: Ω depends on ||u||_{H^s}, which depends on Ω.
 * But does ||u||_{H^s} actually grow? Or does the energy dissipation
 * identity keep it bounded?
 *
 * This experiment tracks:
 *   1. Ω(t) — enstrophy over time
 *   2. ||u||²_{H^s} = Σ (1+|k|²)^s |û_k|² for s = 2, 3, 4, 5
 *   3. ||∇u||_{L∞} ≈ max_k |k| |û_k| (approximate via Fourier)
 *   4. The stretching S(t) = Σ K² T_K
 *   5. The diffusion 2νΣ
 *   6. The ratio |S|/(2νΣ) — does stretching ever exceed diffusion?
 *   7. The Gronwall integrand: ||∇u||_{L∞}
 *   8. The enstrophy bound prediction: (2C₆ E ||u||²_{Hs}/ν)^{2/3}
 *
 * If ||u||_{H^s} stays bounded (or grows slowly) while Ω stays bounded,
 * then the bootstrap may actually close — the circularity may be a
 * proof artefact, not a genuine obstruction.
 *
 * Key question: does ∫₀ᵀ ||∇u||_{L∞} dt remain finite as T → ∞?
 * If yes, the Gronwall gives ||u||_{H^s} bounded, and the bootstrap closes.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_bootstrap_dynamics.c \
 *         src/triad_kernel_v3_accessible.c -o build/bootstrap -lm
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
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);
extern int64_t c3d_get_state_ux_im(int64_t idx);
extern int64_t c3d_get_state_uy_im(int64_t idx);
extern int64_t c3d_get_state_uz_im(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }

#define MAX_BASE 500
static int bkx_s[MAX_BASE], bky_s[MAX_BASE], bkz_s[MAX_BASE];
static double bux_s[MAX_BASE], buy_s[MAX_BASE], buz_s[MAX_BASE];
static int nbm = 0;

static void ic_spectral(int n_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx_s[i] = (int)c3d_get_kx(i);
        bky_s[i] = (int)c3d_get_ky(i);
        bkz_s[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx_s[i]*bkx_s[i] + bky_s[i]*bky_s[i] + bkz_s[i]*bkz_s[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp * pow(km, -alpha);
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (bkz_s[i] != 0)
            uz = -((double)bkx_s[i]*ux + (double)bky_s[i]*uy) / (double)bkz_s[i];
        else if (bky_s[i] != 0)
            uy = -(double)bkx_s[i]*ux / (double)bky_s[i];
        else ux = 0.0;
        bux_s[i] = ux; buy_s[i] = uy; buz_s[i] = uz;
    }
}

static void apply_ic(int N) {
    int nm = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        for (int j = 0; j < nbm; j++) {
            if (bkx_s[j] == kx && bky_s[j] == ky && bkz_s[j] == kz) {
                buf_set(0, (double)i);
                buf_set(1, bux_s[j]); buf_set(2, buy_s[j]); buf_set(3, buz_s[j]);
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

#define MAX_MODES 5000

int main(void) {
    int N = 10;
    int n_base = 3;
    double dt = 0.0001;

    /* Test at multiple amplitudes and viscosities */
    double amps[]  = {0.30};
    double nus[]   = {0.01, 0.001};
    double alpha   = 1.0;  /* Moderate spectral decay */
    int total_steps = 50000;  /* T = 5.0 */
    int measure_interval = 1000; /* Every 0.1 time units */

    printf("################################################################\n");
    printf("#  BOOTSTRAP DYNAMICS: What actually happens?                  #\n");
    printf("#                                                              #\n");
    printf("#  Track Ω(t), ||u||²_{Hs}, ||∇u||_∞, S(t), 2νΣ            #\n");
    printf("#  over long time to see if the circularity is real.          #\n");
    printf("#                                                              #\n");
    printf("#  Key question: does ||u||_{Hs} grow, or does it decay?      #\n");
    printf("#  If it decays: bootstrap closes. No circularity.            #\n");
    printf("################################################################\n\n");

    for (int ai = 0; ai < 3; ai++) {
        for (int vi = 0; vi < 2; vi++) {
            double amp = amps[ai];
            double nu = nus[vi];

            printf("  === A = %.2f, ν = %.4f, α = %.1f, N = %d ===\n\n", amp, nu, alpha, N);

            ic_spectral(n_base, amp, alpha);
            apply_ic(N);
            int nm = (int)c3d_get_num_modes();
            buf_set(0, nu);
            buf_set(1, dt);

            printf("    t       E          Ω          Σ          ||u||²_H4   ||∇u||∞    |S|/2νΣ    ∫||∇u||dt\n");
            printf("    ------  ---------  ---------  ---------  ----------  ---------  ---------  ---------\n");

            double integral_grad_u = 0.0;
            double Omega_max = 0.0;
            double Hs_max = 0.0;

            for (int step = 0; step <= total_steps; step++) {
                if (step > 0) c3d_do_step();

                if (step % measure_interval == 0) {
                    double t = step * dt;

                    /* Read state and compute norms */
                    double E = 0, Omega = 0, Sigma = 0, Hs4 = 0;
                    double grad_u_inf = 0;

                    for (int i = 0; i < nm; i++) {
                        int kx = (int)c3d_get_kx(i);
                        int ky = (int)c3d_get_ky(i);
                        int kz = (int)c3d_get_kz(i);
                        double k2 = kx*kx + ky*ky + kz*kz;
                        double km = sqrt(k2);

                        double ur0 = bits_to_dbl(c3d_get_state_ux(i));
                        double ui0 = bits_to_dbl(c3d_get_state_ux_im(i));
                        double ur1 = bits_to_dbl(c3d_get_state_uy(i));
                        double ui1 = bits_to_dbl(c3d_get_state_uy_im(i));
                        double ur2 = bits_to_dbl(c3d_get_state_uz(i));
                        double ui2 = bits_to_dbl(c3d_get_state_uz_im(i));

                        double u2 = ur0*ur0 + ui0*ui0 + ur1*ur1 + ui1*ui1 + ur2*ur2 + ui2*ui2;
                        double u_mag = sqrt(u2);

                        E     += 0.5 * u2;
                        Omega += 0.5 * k2 * u2;
                        Sigma += 0.5 * k2 * k2 * u2;

                        /* ||u||²_{H^4} = Σ (1+|k|²)^4 |û_k|² */
                        double w = (1.0 + k2);
                        Hs4 += w * w * w * w * u2;

                        /* ||∇u||_{L∞} ≈ Σ |k| |û_k| (upper bound via triangle ineq) */
                        grad_u_inf += km * u_mag;
                    }

                    /* Accumulate Gronwall integrand */
                    if (step > 0)
                        integral_grad_u += grad_u_inf * dt * measure_interval;

                    /* Stretching-to-diffusion ratio: computed from Ω dynamics */
                    /* dΩ/dt = -2νΣ + S, so if Ω is decreasing, |S| < 2νΣ */
                    double diffusion = 2.0 * nu * Sigma;
                    /* We can't measure S directly without the full triad sum,
                       but we can bound: |S| ≤ |dΩ/dt| + 2νΣ.
                       For a simpler diagnostic: ratio Ω/(Ω bound prediction) */
                    double Omega_bound_pred = pow(2.0 * 1.0 * E * Hs4 / nu, 2.0/3.0);

                    if (Omega > Omega_max) Omega_max = Omega;
                    if (Hs4 > Hs_max) Hs_max = Hs4;

                    printf("    %.4f  %.3e  %.3e  %.3e  %.4e  %.3e  ---        %.3e\n",
                           t, E, Omega, Sigma, Hs4, grad_u_inf, integral_grad_u);
                    fflush(stdout);
                }
            }

            double T_final = total_steps * dt;
            printf("\n    SUMMARY (A=%.2f, ν=%.4f):\n", amp, nu);
            printf("      Ω_max         = %.4e\n", Omega_max);
            printf("      ||u||²_H4 max = %.4e\n", Hs_max);
            printf("      ∫||∇u||dt     = %.4e  (Gronwall integrand over T=%.1f)\n", integral_grad_u, T_final);
            printf("      Gronwall pred:  ||u||²_H4(T) ≤ ||u₀||²_H4 · exp(C·%.4e)\n", integral_grad_u);
            printf("\n      → Does ||u||²_{H4} grow or decay?\n");
            printf("      → Is ∫||∇u|| dt bounded as T → ∞?\n");
            printf("      → If yes: bootstrap closes. No circularity.\n\n");
            fflush(stdout);
        }
    }

    printf("################################################################\n");
    printf("#  The circularity question:                                   #\n");
    printf("#                                                              #\n");
    printf("#  IF ||u||_{Hs} decays (because E decays and all norms are   #\n");
    printf("#  controlled by E for the Galerkin system), THEN:            #\n");
    printf("#    Ω* ≤ (2C₆ E₀ ||u₀||²_{Hs} / ν)^{2/3}                  #\n");
    printf("#  depends only on initial data. No circularity.              #\n");
    printf("#                                                              #\n");
    printf("#  The question is whether ||u||_{Hs} can grow FASTER than    #\n");
    printf("#  E decays. If not, the fixed point is trivially finite.     #\n");
    printf("################################################################\n");

    return 0;
}
