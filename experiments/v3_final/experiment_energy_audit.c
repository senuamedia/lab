/*
 * experiment_energy_audit.c — Minimal energy conservation test
 *
 * Run at ν=0 (no diffusion). Energy MUST be exactly conserved
 * by the nonlinear term. Any drift = bug in trilinear coupling.
 *
 * Test at multiple N and multiple dt to isolate the source.
 * Also compute the energy directly from modes and compare
 * with c3d_energy() to check for inconsistency.
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
extern int64_t c3d_apply_state(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);
extern int64_t c3d_enstrophy(void);
extern int64_t c3d_energy(void);
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }

/* Compute energy directly from mode coefficients */
static double manual_energy(int nm) {
    double e = 0;
    for (int i = 0; i < nm; i++) {
        double ux = get_ux(i), uy = get_uy(i), uz = get_uz(i);
        e += ux*ux + uy*uy + uz*uz;
    }
    return 0.5 * e;
}

/* Compute enstrophy directly */
static double manual_enstrophy(int nm) {
    double o = 0;
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        double ux = get_ux(i), uy = get_uy(i), uz = get_uz(i);
        o += (double)k2 * (ux*ux + uy*uy + uz*uz);
    }
    return 0.5 * o;
}

int main(void) {
    printf("############################################################\n");
    printf("#  ENERGY CONSERVATION AUDIT                               #\n");
    printf("#                                                          #\n");
    printf("#  ν=0: nonlinear term MUST conserve energy exactly.      #\n");
    printf("#  Any drift = bug in trilinear coupling.                  #\n");
    printf("#                                                          #\n");
    printf("#  Also: ν>0 energy should DECREASE (dE/dt = -2νΩ).      #\n");
    printf("#  If energy increases at ν>0: nonlinear term adds energy.#\n");
    printf("############################################################\n\n");

    double amp = 0.1;

    /* Test 1: ν=0 at different N and dt */
    printf("  === TEST 1: ν=0, energy conservation ===\n\n");
    printf("  %-4s  %-6s  %-10s  %-12s  %-12s  %-12s  %-10s  %-10s\n",
           "N", "dt", "Steps", "E(0)_manual", "E(T)_manual", "E(T)_solver", "ΔE_manual%", "ΔE_solver%");
    printf("  %-4s  %-6s  %-10s  %-12s  %-12s  %-12s  %-10s  %-10s\n",
           "----", "------", "----------", "----------", "----------", "----------", "---------", "---------");

    double dts[] = {0.0001, 0.00005, 0.00002, 0.00001};
    int n_dt = 4;

    for (int n = 3; n <= 8; n++) {
        int nm = (int)c3d_enumerate_modes(n);
        c3d_precompute_triads(n);

        for (int di = 0; di < n_dt; di++) {
            double dt = dts[di];
            int steps = (int)(0.1 / dt);  /* Fixed T=0.1 */

            c3d_zero_state(nm);
            for (int i = 0; i < nm; i++) {
                int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
                double k2 = (double)(kx*kx+ky*ky+kz*kz);
                double km = sqrt(k2); if (km < 0.001) km = 1.0;
                double va = amp / km, phase = (double)i * 0.7 + 0.3;
                double ux = va * sin(M_PI * phase), uy = va * sin(M_PI * (phase + 0.4)), uz = 0;
                if (kz != 0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
                else if (ky != 0) uy = -(double)kx*ux/(double)ky;
                else ux = 0;
                buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
                c3d_apply_state();
            }

            /* ν=0, set dt */
            buf_set(0, 0.0); buf_set(1, dt);

            double E0_manual = manual_energy(nm);
            double E0_solver = bits_to_dbl(c3d_energy());

            for (int step = 0; step < steps; step++)
                c3d_do_step();

            double ET_manual = manual_energy(nm);
            double ET_solver = bits_to_dbl(c3d_energy());

            double drift_manual = (E0_manual > 0) ? (ET_manual - E0_manual) / E0_manual * 100 : 0;
            double drift_solver = (E0_solver > 0) ? (ET_solver - E0_solver) / E0_solver * 100 : 0;

            printf("  %-4d  %-6.5f  %-10d  %12.8f  %12.8f  %12.8f  %+9.4f%%  %+9.4f%%\n",
                   n, dt, steps, E0_manual, ET_manual, ET_solver, drift_manual, drift_solver);
            fflush(stdout);
        }
    }

    /* Test 2: ν>0, check if dE/dt = -2νΩ */
    printf("\n  === TEST 2: ν=0.01, energy should DECREASE ===\n\n");
    printf("  %-4s  %-10s  %-12s  %-12s  %-12s  %-12s  %-12s  %-10s\n",
           "N", "Steps", "E(0)", "E(T)", "ΔE", "-2νΩ·T", "Expected_ΔE", "Match?");
    printf("  %-4s  %-10s  %-12s  %-12s  %-12s  %-12s  %-12s  %-10s\n",
           "----", "----------", "----------", "----------", "----------", "----------", "----------", "---------");

    double nu = 0.01;
    double dt = 0.00005;
    int steps = 2000;  /* T=0.1 */

    for (int n = 3; n <= 8; n++) {
        int nm = (int)c3d_enumerate_modes(n);
        c3d_precompute_triads(n);
        c3d_zero_state(nm);

        for (int i = 0; i < nm; i++) {
            int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
            double k2 = (double)(kx*kx+ky*ky+kz*kz);
            double km = sqrt(k2); if (km < 0.001) km = 1.0;
            double va = amp / km, phase = (double)i * 0.7 + 0.3;
            double ux = va * sin(M_PI * phase), uy = va * sin(M_PI * (phase + 0.4)), uz = 0;
            if (kz != 0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
            else if (ky != 0) uy = -(double)kx*ux/(double)ky;
            else ux = 0;
            buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
            c3d_apply_state();
        }

        buf_set(0, nu); buf_set(1, dt);

        double E0 = manual_energy(nm);
        double Omega_avg = 0;
        int omega_samples = 0;

        for (int step = 0; step < steps; step++) {
            c3d_do_step();
            if (step % 100 == 99) {
                Omega_avg += manual_enstrophy(nm);
                omega_samples++;
            }
        }
        Omega_avg /= omega_samples;

        double ET = manual_energy(nm);
        double actual_dE = ET - E0;
        double T = steps * dt;
        double expected_dE = -2.0 * nu * Omega_avg * T;

        printf("  %-4d  %-10d  %12.8f  %12.8f  %+12.8f  %+12.8f  %+12.8f  %s\n",
               n, steps, E0, ET, actual_dE, -2.0*nu*Omega_avg*T, expected_dE,
               (fabs(actual_dE - expected_dE) < fabs(expected_dE) * 0.1) ? "~YES" : "NO");
        fflush(stdout);
    }

    printf("\n############################################################\n");
    printf("#  If ν=0 drift is dt-INDEPENDENT: trilinear form is wrong#\n");
    printf("#  If ν=0 drift DECREASES with dt: Euler truncation error #\n");
    printf("#  If ν>0 actual ΔE ≠ expected: energy accounting broken  #\n");
    printf("############################################################\n");

    return 0;
}
