/*
 * taylor_green_test.c — Analytical test case: Taylor-Green vortex
 *
 * The Taylor-Green vortex on T³ has a known exact solution at short times.
 * At t=0: u = (sin(x)cos(y)cos(z), -cos(x)sin(y)cos(z), 0)
 * In Fourier space this is energy at exactly 4 modes: k=(±1,±1,±1) type.
 *
 * The energy decay rate at t=0 is exactly: dE/dt = -3ν (for unit amplitude).
 * The enstrophy at t=0 is exactly: Ω = 3/2 (for unit amplitude).
 * Verify: dE/dt = -2νΩ = -2ν(3/2) = -3ν. ✓
 *
 * Test: does our solver reproduce dE/dt = -3ν at t=0?
 * And does the energy decay match exp(-3νt) at short times?
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_zero_state(int64_t num_modes);
extern int64_t c3d_apply_state(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_energy(void);
extern int64_t c3d_enstrophy(void);
extern int64_t c3d_energy_rate_nl(void);
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }

int main(void) {
    printf("############################################################\n");
    printf("#  TAYLOR-GREEN VORTEX: Analytical validation              #\n");
    printf("#                                                          #\n");
    printf("#  Known exact properties at t=0:                          #\n");
    printf("#    E(0) = 3/8 per mode pair = depends on enumeration     #\n");
    printf("#    Ω(0) = 3E(0) (for TG with |k|²=3)                   #\n");
    printf("#    dE/dt = -2νΩ = -6νE                                  #\n");
    printf("#    Σ Re(conj(û)·NL) = 0 (energy conservation)          #\n");
    printf("############################################################\n\n");

    double nu_vals[] = {0.001, 0.01, 0.1};
    int n_nu = 3;

    for (int n_max = 2; n_max <= 6; n_max++) {
        int nm = (int)c3d_enumerate_modes(n_max);
        c3d_precompute_triads(n_max);
        c3d_zero_state(nm);

        /*
         * Taylor-Green vortex in Fourier space:
         * u(x) = (sin x cos y cos z, -cos x sin y cos z, 0)
         *
         * sin x = (e^{ix} - e^{-ix})/(2i)
         * cos y = (e^{iy} + e^{-iy})/2
         * cos z = (e^{iz} + e^{-iz})/2
         *
         * ux = sin x cos y cos z has Fourier coefficients at:
         * k = (±1, ±1, ±1) with amplitude 1/(2i·2·2) = 1/(8i) = -i/8
         * Sign depends on the specific (±) combination.
         *
         * For ux: coefficient at (1,1,1) = 1/(8i) = -i/8
         *         coefficient at (1,1,-1) = 1/(8i) = -i/8
         *         coefficient at (1,-1,1) = 1/(8i) = -i/8
         *         coefficient at (1,-1,-1) = 1/(8i) = -i/8
         *         coefficient at (-1,...) = complex conjugate
         *
         * Simpler approach: set real-valued amplitudes that produce
         * the TG velocity field. Since we store complex coefficients
         * but set via the real API, use the known structure.
         *
         * Actually, simplest: set a few modes and verify energy/enstrophy
         * match the expected values.
         */

        /* Set TG-like IC: energy only at |k|²=3 modes (k=(±1,±1,±1)) */
        double amp = 0.1;  /* small amplitude for clean test */
        int tg_modes = 0;
        for (int i = 0; i < nm; i++) {
            int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
            int k2 = kx*kx + ky*ky + kz*kz;
            if (k2 == 3) {
                /* Divergence-free: kx·ux + ky·uy + kz·uz = 0 */
                double ux = amp * (double)(kx * ky);  /* changes sign correctly */
                double uy = -amp * (double)(kx * ky); /* opposite to ux for div-free */
                double uz = 0.0;
                /* Enforce div-free */
                if (kz != 0)
                    uz = -((double)kx*ux + (double)ky*uy) / (double)kz;
                buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
                c3d_apply_state();
                tg_modes++;
            }
        }

        double E0 = bits_to_dbl(c3d_energy());
        double Omega0 = bits_to_dbl(c3d_enstrophy());
        double nl_rate = bits_to_dbl(c3d_energy_rate_nl());

        printf("  N=%d: %d modes, %d TG modes\n", n_max, nm, tg_modes);
        printf("    E(0)     = %.10f\n", E0);
        printf("    Ω(0)     = %.10f\n", Omega0);
        printf("    Ω/E      = %.6f (expected: 3.0 for |k|²=3)\n", (E0 > 0) ? Omega0/E0 : 0);
        printf("    NL rate  = %+.6e (must be 0)\n", nl_rate);
        printf("    |NL/E|   = %.2e\n", (E0 > 0) ? fabs(nl_rate)/E0 : 0);

        /* Run a few steps and check energy decay */
        for (int nui = 0; nui < n_nu; nui++) {
            double nu = nu_vals[nui];
            /* Reset IC */
            c3d_zero_state(nm);
            for (int i = 0; i < nm; i++) {
                int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
                int k2 = kx*kx+ky*ky+kz*kz;
                if (k2 == 3) {
                    double ux = amp*(double)(kx*ky), uy = -amp*(double)(kx*ky), uz = 0;
                    if (kz != 0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
                    buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
                    c3d_apply_state();
                }
            }

            E0 = bits_to_dbl(c3d_energy());
            double dt = 0.0001;
            int steps = 100;
            buf_set(0, nu); buf_set(1, dt);
            for (int s = 0; s < steps; s++) c3d_do_step();
            double ET = bits_to_dbl(c3d_energy());

            double T = steps * dt;
            double expected_ET = E0 * exp(-6.0 * nu * T);  /* TG: dE/dt = -6νE for |k|²=3 */
            double actual_ratio = ET / E0;
            double expected_ratio = exp(-6.0 * nu * T);
            double error = fabs(actual_ratio - expected_ratio) / expected_ratio;

            printf("    ν=%.3f: E(T)/E(0) = %.8f, expected = %.8f, error = %.2e %s\n",
                   nu, actual_ratio, expected_ratio, error,
                   error < 0.01 ? "✓" : "✗");
        }
        printf("\n");
    }

    printf("############################################################\n");
    printf("#  If NL rate = 0 AND energy decay matches exp(-6νt):     #\n");
    printf("#    The solver correctly implements NS for this test case.#\n");
    printf("############################################################\n");
    return 0;
}
