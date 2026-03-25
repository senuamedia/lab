/*
 * experiment_cascade.c — Cascade Efficiency η measurement
 *
 * Computes η_cascade = (energy transferred to |k|>1) / (energy dissipated at |k|>1)
 * at each timestep, for each IC type and N_max.
 *
 * If η > 1: cascade building (energy arrives faster than diffusion removes it)
 * If η < 1: cascade dying (diffusion wins)
 * If η ≈ 1: cascade equilibrium
 *
 * The hypothesis: η_cascade correlates with α.
 * Distributed IC → η > 1 → α ≈ 2.4
 * Concentrated IC → η < 1 → α ≈ 0.5
 *
 * If confirmed, η_cascade is the missing dial in the scaffold.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#ifndef PARAM_NU
#define PARAM_NU 0.01
#endif
#ifndef PARAM_DT
#define PARAM_DT 0.0001
#endif
#ifndef PARAM_STEPS
#define PARAM_STEPS 5000
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 6
#endif

/* External from triad_kernel_v2.c */
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
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);
extern int64_t c3d_energy(void);
extern int64_t c3d_enstrophy(void);

static void buf_set(int idx, double val) {
    int64_t bits;
    memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx);
    c3d_buf_val(bits);
}

static double bits_to_dbl(int64_t bits) {
    double val;
    memcpy(&val, &bits, sizeof(double));
    return val;
}

static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }

/* Compute energy at modes with |k|^2 > threshold */
static double energy_above(int num_modes, int k2_threshold) {
    double e = 0.0;
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 > k2_threshold) {
            double ux = get_ux(i), uy = get_uy(i), uz = get_uz(i);
            e += ux*ux + uy*uy + uz*uz;
        }
    }
    return 0.5 * e;
}

/* Compute energy at modes with |k|^2 <= threshold */
static double energy_at_or_below(int num_modes, int k2_threshold) {
    double e = 0.0;
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 <= k2_threshold) {
            double ux = get_ux(i), uy = get_uy(i), uz = get_uz(i);
            e += ux*ux + uy*uy + uz*uz;
        }
    }
    return 0.5 * e;
}

/* Compute dissipation rate at modes with |k|^2 > threshold */
/* Dissipation = 2ν Σ |k|^2 |û_k|^2 for modes above threshold */
static double dissipation_above(int num_modes, int k2_threshold, double nu) {
    double d = 0.0;
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 > k2_threshold) {
            double ux = get_ux(i), uy = get_uy(i), uz = get_uz(i);
            d += (double)k2 * (ux*ux + uy*uy + uz*uz);
        }
    }
    return 2.0 * nu * 0.5 * d;  /* 2ν × enstrophy_above */
}

/* Compute H''' = (Σ|û|²)² / (Σ|û|⁴) */
static double compute_hppp(int num_modes) {
    double sum2 = 0.0, sum4 = 0.0;
    for (int i = 0; i < num_modes; i++) {
        double ux = get_ux(i), uy = get_uy(i), uz = get_uz(i);
        double e = ux*ux + uy*uy + uz*uz;
        sum2 += e;
        sum4 += e * e;
    }
    if (sum4 < 1e-30) return 1.0;
    return (sum2 * sum2) / sum4;
}

/* Setup ICs */
static void setup_ic_distributed(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        double k2 = (double)(kx*kx + ky*ky + kz*kz);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0.0;
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
}

static void setup_ic_concentrated(int num_modes, double amp) {
    c3d_zero_state(num_modes);
    for (int i = 0; i < num_modes; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 != 1) continue;
        double phase = (double)i * 1.3;
        double ux = amp * sin(M_PI * phase);
        double uy = amp * sin(M_PI * (phase + 0.5));
        double uz = 0.0;
        if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0.0;
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
}

static void setup_ic(int num_modes, double amp, int ic_type) {
    if (ic_type == 0) setup_ic_distributed(num_modes, amp);
    else setup_ic_concentrated(num_modes, amp);
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max = PARAM_N_MAX;
    double amp = 0.3;  /* Below A* for both IC types */

    printf("############################################################\n");
    printf("#  CASCADE EFFICIENCY: η = transfer / dissipation          #\n");
    printf("#                                                          #\n");
    printf("#  η > 1: cascade building                                 #\n");
    printf("#  η < 1: cascade dying                                    #\n");
    printf("#  η ≈ 1: cascade equilibrium                              #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, N_max=%d, amp=%.2f\n\n", nu, dt, n_steps, n_max, amp);

    int num_modes = (int)c3d_enumerate_modes(n_max);
    int num_triads = (int)c3d_precompute_triads(n_max);
    printf("  Modes: %d, Triads: %d\n\n", num_modes, num_triads);

    /* k2_threshold = 1: measure energy transfer from |k|=1 to |k|>1 */
    int k2_threshold = 1;

    for (int ic_type = 0; ic_type <= 1; ic_type++) {
        const char* ic_names[] = {"Distributed", "Concentrated"};
        printf("  === %s IC (amp=%.2f) ===\n\n", ic_names[ic_type], amp);
        printf("  Step    E_low     E_high    Dissip_hi  η_cascade  H'''     Transfer\n");
        printf("  ------  --------  --------  ---------  ---------  -------  --------\n");

        setup_ic(num_modes, amp, ic_type);
        buf_set(0, nu); buf_set(1, dt);

        double prev_e_high = energy_above(num_modes, k2_threshold);

        for (int step = 0; step < n_steps; step++) {
            c3d_do_step();

            if (step % 200 == 199) {
                double e_low = energy_at_or_below(num_modes, k2_threshold);
                double e_high = energy_above(num_modes, k2_threshold);
                double dissip = dissipation_above(num_modes, k2_threshold, nu);
                double hppp = compute_hppp(num_modes);

                /* Energy transfer rate to high-k modes:
                 * dE_high/dt = transfer_in - dissipation
                 * So: transfer_in = dE_high/dt + dissipation
                 * η = transfer_in / dissipation */
                double de_high_dt = (e_high - prev_e_high) / (200.0 * dt);
                double transfer = de_high_dt + dissip;
                double eta = (dissip > 1e-15) ? transfer / dissip : 0.0;

                printf("  %-6d  %8.5f  %8.5f  %9.6f  %9.4f  %7.2f  %8.5f\n",
                       step + 1, e_low, e_high, dissip, eta, hppp, transfer);
                fflush(stdout);

                prev_e_high = e_high;
            }
        }

        /* Summary statistics */
        printf("\n");

        /* Rerun to compute mean η over the trajectory */
        setup_ic(num_modes, amp, ic_type);
        buf_set(0, nu); buf_set(1, dt);
        prev_e_high = energy_above(num_modes, k2_threshold);
        double sum_eta = 0.0;
        int eta_count = 0;

        for (int step = 0; step < n_steps; step++) {
            c3d_do_step();
            if (step % 100 == 99) {
                double e_high = energy_above(num_modes, k2_threshold);
                double dissip = dissipation_above(num_modes, k2_threshold, nu);
                double de_high_dt = (e_high - prev_e_high) / (100.0 * dt);
                double transfer = de_high_dt + dissip;
                double eta = (dissip > 1e-15) ? transfer / dissip : 0.0;
                if (eta > 0 && eta < 1000) { sum_eta += eta; eta_count++; }
                prev_e_high = e_high;
            }
        }

        double mean_eta = (eta_count > 0) ? sum_eta / eta_count : 0.0;
        printf("  Mean η_cascade = %.4f (%s)\n", mean_eta,
               mean_eta > 1.0 ? "CASCADE ACTIVE" : "CASCADE INACTIVE");
        printf("\n");
    }

    /* Phase 2: η vs N_max */
    printf("  === η_cascade vs N_max (both IC types) ===\n\n");
    printf("  N_max  η(distributed)  η(concentrated)  Ratio\n");
    printf("  -----  --------------  ---------------  -----\n");

    for (int n = 2; n <= n_max; n++) {
        int nm = (int)c3d_enumerate_modes(n);
        c3d_precompute_triads(n);

        double mean_etas[2] = {0, 0};

        for (int ic = 0; ic <= 1; ic++) {
            setup_ic(nm, amp, ic);
            buf_set(0, nu); buf_set(1, dt);
            double prev_eh = energy_above(nm, k2_threshold);
            double se = 0.0;
            int sc = 0;

            for (int step = 0; step < 2000; step++) {
                c3d_do_step();
                if (step % 100 == 99) {
                    double eh = energy_above(nm, k2_threshold);
                    double di = dissipation_above(nm, k2_threshold, nu);
                    double de = (eh - prev_eh) / (100.0 * dt);
                    double tr = de + di;
                    double eta = (di > 1e-15) ? tr / di : 0.0;
                    if (eta > 0 && eta < 1000) { se += eta; sc++; }
                    prev_eh = eh;
                }
            }
            mean_etas[ic] = (sc > 0) ? se / sc : 0.0;
        }

        double ratio = (mean_etas[1] > 1e-10) ? mean_etas[0] / mean_etas[1] : 0.0;
        printf("  %-5d  %14.4f  %15.4f  %5.2f\n", n, mean_etas[0], mean_etas[1], ratio);
        fflush(stdout);
    }

    /* Phase 3: Assessment */
    printf("\n");
    printf("  === Assessment ===\n\n");
    printf("  If η(distributed) > 1 and η(concentrated) < 1:\n");
    printf("    → η_cascade explains the α difference\n");
    printf("    → Feed η into H as a new weighted component\n");
    printf("    → The scaffold can distinguish IC types\n\n");
    printf("  If η correlates with α across N_max values:\n");
    printf("    → η is the CAUSAL mechanism behind the scaling law\n");
    printf("    → Proving η > 1 for H^s data = proving regularity\n\n");
    printf("############################################################\n");

    return 0;
}
