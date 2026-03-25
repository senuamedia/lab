/*
 * experiment_shell_balance.c — Per-shell cascade-diffusion dual number
 *
 * For each wavenumber shell k, compute:
 *   η_k(t) = T_k(t) / D_k(t)   (cascade/diffusion ratio)
 *   dη_k/dt                      (rate of change)
 *
 * Where:
 *   T_k = energy transfer INTO shell k from all triads
 *   D_k = ν|k|² × E_k  (diffusion rate at shell k)
 *   E_k = Σ_{|j|∈[k,k+1)} |û_j|²  (energy in shell k)
 *
 * Track max_k η_k over time for different amplitudes and N values.
 * If max_k η_k < 1 for all t → diffusion dominates everywhere → regular.
 * If max_k η_k > 1 → cascade wins at some shell → enstrophy spike.
 *
 * Uses FIXED PROJECTION (not fresh IC) for correctness.
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
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }

/* Fixed u₀ storage */
#define MAX_BASE_MODES 200
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
        if (base_kz[i] != 0) uz = -((double)base_kx[i]*ux+(double)base_ky[i]*uy)/(double)base_kz[i];
        else if (base_ky[i] != 0) uy = -(double)base_kx[i]*ux/(double)base_ky[i];
        else ux = 0.0;
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
}

/* Compute energy in wavenumber shell [k², (k+1)²) */
static double shell_energy(int num_modes, int k_shell) {
    double e = 0.0;
    int k2_lo = k_shell * k_shell;
    int k2_hi = (k_shell + 1) * (k_shell + 1);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 >= k2_lo && k2 < k2_hi) {
            double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
            e += ux*ux + uy*uy + uz*uz;
        }
    }
    return 0.5 * e;
}

/* Compute enstrophy in shell */
static double shell_enstrophy(int num_modes, int k_shell) {
    double o = 0.0;
    int k2_lo = k_shell * k_shell;
    int k2_hi = (k_shell + 1) * (k_shell + 1);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx + ky*ky + kz*kz;
        if (k2 >= k2_lo && k2 < k2_hi) {
            double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
            o += (double)k2 * (ux*ux + uy*uy + uz*uz);
        }
    }
    return 0.5 * o;
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max = PARAM_N_MAX;
    int n_base = 2;

    printf("############################################################\n");
    printf("#  SHELL BALANCE: Per-shell cascade/diffusion dual number   #\n");
    printf("#                                                          #\n");
    printf("#  η_k = T_k/D_k  (state: cascade vs diffusion at shell k)#\n");
    printf("#  dη_k/dt         (derivative: getting better or worse?)   #\n");
    printf("#                                                          #\n");
    printf("#  Fixed projection u₀ from N_base=%d                     #\n", n_base);
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, N_max=%d\n\n", nu, dt, n_steps, n_max);

    double amplitudes[] = {0.1, 0.3, 0.5, 1.0};
    int n_amps = 4;

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];
        generate_fixed_u0(n_base, amp);

        for (int n = 3; n <= n_max; n++) {
            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);
            c3d_zero_state(nm);

            /* Apply fixed projection */
            for (int i = 0; i < nm; i++) {
                int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
                for (int j = 0; j < num_base_modes; j++) {
                    if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                        buf_set(0,(double)i); buf_set(1,base_ux[j]); buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                        c3d_apply_state(); break;
                    }
                }
            }

            printf("  === amp=%.1f, N=%d (modes=%d) ===\n\n", amp, n, nm);
            printf("  Step   ");
            for (int k = 1; k <= n; k++) printf(" η_k=%d    ", k);
            printf(" max_η   dmax/dt   Ω_total\n");
            printf("  -----  ");
            for (int k = 1; k <= n; k++) printf("---------");
            printf(" -------- --------- ----------\n");

            buf_set(0, nu); buf_set(1, dt);

            double prev_max_eta = 0.0;
            double prev_shell_e[20]; /* energy per shell at previous step */
            memset(prev_shell_e, 0, sizeof(prev_shell_e));

            /* Initial shell energies */
            for (int k = 1; k <= n; k++) {
                prev_shell_e[k] = shell_energy(nm, k);
            }

            for (int step = 0; step < n_steps; step++) {
                c3d_do_step();

                if (step % 200 == 199) {
                    double max_eta = 0.0;
                    int max_eta_shell = 0;

                    printf("  %-5d  ", step+1);

                    for (int k = 1; k <= n; k++) {
                        double e_k = shell_energy(nm, k);
                        double k_mid = (double)k + 0.5;

                        /* Diffusion rate at shell k: ν × k² × E_k × 2 */
                        double D_k = 2.0 * nu * k_mid * k_mid * e_k;

                        /* Transfer rate: dE_k/dt + D_k (from energy balance) */
                        /* dE_k/dt ≈ (E_k - prev_E_k) / (200*dt) */
                        double dE_dt = (e_k - prev_shell_e[k]) / (200.0 * dt);
                        double T_k = dE_dt + D_k;

                        /* η_k = T_k / D_k */
                        double eta_k = (D_k > 1e-20) ? T_k / D_k : 0.0;

                        if (eta_k > max_eta) { max_eta = eta_k; max_eta_shell = k; }

                        printf("%8.4f ", eta_k);
                        prev_shell_e[k] = e_k;
                    }

                    double d_max_eta = (max_eta - prev_max_eta) / (200.0 * dt);
                    double omega = get_enstrophy();

                    printf(" %8.4f %+9.2f %10.4f\n", max_eta, d_max_eta, omega);
                    fflush(stdout);

                    prev_max_eta = max_eta;
                }
            }

            /* Final summary for this (amp, N) */
            double omega_final = get_enstrophy();
            printf("\n  Ω_final = %.6f\n\n", omega_final);
        }
    }

    printf("############################################################\n");
    printf("#  KEY: If max_η < 1 at all times and all N:               #\n");
    printf("#    Diffusion dominates at every shell → enstrophy bounded #\n");
    printf("#    If max_η > 1 but dmax/dt < 0: transient, self-corrects#\n");
    printf("#    If max_η > 1 and dmax/dt > 0: cascade winning, danger #\n");
    printf("############################################################\n");

    return 0;
}
