/*
 * experiment_helicity.c — Helicity conservation test for the -i factor
 *
 * The Euler equations (ν=0) conserve TWO quantities:
 *   1. Energy:   E = (1/2) Σ |û_k|²
 *   2. Helicity: H = Σ Re(conj(û_k) · (ik × û_k))
 *
 * With the correct -i trilinear form, BOTH are conserved.
 * Without -i (v2 architecture), BOTH are broken.
 *
 * This experiment measures both E and H over time at ν=0
 * and reports their drift rates. Two broken invariants
 * is stronger evidence than one.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_helicity.c \
 *         src/triad_kernel_v3_accessible.c -o build/helicity -lm
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

/*
 * Compute helicity H = Σ_k Re(conj(û_k) · (ik × û_k))
 *
 * For real field (conjugate symmetric):
 * H = Σ_k Re(conj(û_k) · ω̂_k) where ω̂_k = ik × û_k is vorticity
 *
 * In components: ω̂_k = i(k × û_k)
 *   ω̂_x = i(k_y û_z - k_z û_y)
 *   ω̂_y = i(k_z û_x - k_x û_z)
 *   ω̂_z = i(k_x û_y - k_y û_x)
 *
 * H = Σ_k Re(conj(û_x)·ω̂_x + conj(û_y)·ω̂_y + conj(û_z)·ω̂_z)
 */
static double compute_helicity(int nm) {
    double H = 0.0;
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i);
        int ky = (int)c3d_get_ky(i);
        int kz = (int)c3d_get_kz(i);

        double ur_x = bits_to_dbl(c3d_get_state_ux(i));
        double ui_x = bits_to_dbl(c3d_get_state_ux_im(i));
        double ur_y = bits_to_dbl(c3d_get_state_uy(i));
        double ui_y = bits_to_dbl(c3d_get_state_uy_im(i));
        double ur_z = bits_to_dbl(c3d_get_state_uz(i));
        double ui_z = bits_to_dbl(c3d_get_state_uz_im(i));

        /* ω̂ = i(k × û): multiply k × û by i means (a+bi) → (-b+ai) */
        /* k × û (real part): */
        double cx_r = (double)ky * ur_z - (double)kz * ur_y;
        double cx_i = (double)ky * ui_z - (double)kz * ui_y;
        double cy_r = (double)kz * ur_x - (double)kx * ur_z;
        double cy_i = (double)kz * ui_x - (double)kx * ui_z;
        double cz_r = (double)kx * ur_y - (double)ky * ur_x;
        double cz_i = (double)kx * ui_y - (double)ky * ui_x;

        /* Multiply by i: i(a+bi) = -b + ai */
        double wx_r = -cx_i, wx_i = cx_r;
        double wy_r = -cy_i, wy_i = cy_r;
        double wz_r = -cz_i, wz_i = cz_r;

        /* Re(conj(û) · ω̂) = Re((ur-i·ui)(wr+i·wi)) = ur·wr + ui·wi */
        H += ur_x*wx_r + ui_x*wx_i + ur_y*wy_r + ui_y*wy_i + ur_z*wz_r + ui_z*wz_i;
    }
    return H;
}

#define MAX_BASE 500
static int bkx[MAX_BASE], bky[MAX_BASE], bkz[MAX_BASE];
static double bux[MAX_BASE], buy[MAX_BASE], buz[MAX_BASE];
static int nbm = 0;

static void ic_spectral(int n_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i]=(int)c3d_get_kx(i); bky[i]=(int)c3d_get_ky(i); bkz[i]=(int)c3d_get_kz(i);
        double k2=(double)(bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i]);
        double km=sqrt(k2); if (km<0.001) km=1.0;
        double va=amp*pow(km,-alpha), phase=(double)i*0.7+0.3;
        double ux=va*sin(M_PI*phase), uy=va*sin(M_PI*(phase+0.4)), uz=0.0;
        if (bkz[i]!=0) uz=-((double)bkx[i]*ux+(double)bky[i]*uy)/(double)bkz[i];
        else if (bky[i]!=0) uy=-(double)bkx[i]*ux/(double)bky[i];
        else ux=0.0;
        bux[i]=ux; buy[i]=uy; buz[i]=uz;
    }
}

static void apply_ic(int N) {
    int nm=(int)c3d_enumerate_modes(N); c3d_precompute_triads(N); c3d_zero_state(nm);
    for (int i=0;i<nm;i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        for (int j=0;j<nbm;j++) {
            if (bkx[j]==kx&&bky[j]==ky&&bkz[j]==kz) {
                buf_set(0,(double)i);
                buf_set(1,bux[j]);buf_set(2,buy[j]);buf_set(3,buz[j]);
                c3d_apply_state();break;
            }
        }
    }
    c3d_enforce_symmetry();
}

int main(void) {
    int N = 6;
    int n_base = 3;
    double amp = 0.20;
    double alpha = 1.0;
    double dt = 0.0001;
    int total_steps = 5000;  /* T = 0.5 */
    int log_interval = 500;

    printf("################################################################\n");
    printf("#  HELICITY CONSERVATION TEST                                   #\n");
    printf("#                                                              #\n");
    printf("#  The Euler equations (ν=0) conserve BOTH energy and helicity.#\n");
    printf("#  H = Σ_k Re(conj(û_k) · (ik × û_k))                        #\n");
    printf("#                                                              #\n");
    printf("#  With -i (v3): both E and H conserved.                      #\n");
    printf("#  Without -i: both broken → two broken invariants.           #\n");
    printf("################################################################\n\n");

    /* Test at ν = 0 (Euler) */
    double nu = 0.0;

    ic_spectral(n_base, amp, alpha);
    apply_ic(N);
    int nm = (int)c3d_get_num_modes();
    buf_set(0, nu);
    buf_set(1, dt);

    double E0 = bits_to_dbl(c3d_energy());
    double H0 = compute_helicity(nm);

    printf("  N = %d, ν = %.4f (Euler), A = %.2f, dt = %.4f\n", N, nu, amp, dt);
    printf("  E(0) = %.10f\n", E0);
    printf("  H(0) = %.10f\n\n", H0);

    printf("  %-8s %-14s %-14s %-14s %-14s\n",
           "step", "E(t)", "ΔE/E(0)", "H(t)", "ΔH/H(0)");
    printf("  %-8s %-14s %-14s %-14s %-14s\n",
           "------", "------------", "------------", "------------", "------------");

    printf("  %-8d %-14.8e %-14.6e %-14.8e %-14.6e\n",
           0, E0, 0.0, H0, 0.0);

    for (int step = 1; step <= total_steps; step++) {
        c3d_do_step();
        if (step % log_interval == 0) {
            double E = bits_to_dbl(c3d_energy());
            double H = compute_helicity(nm);
            double dE = (E - E0) / fabs(E0);
            double dH = (H0 != 0) ? (H - H0) / fabs(H0) : H - H0;

            printf("  %-8d %-14.8e %-14.6e %-14.8e %-14.6e\n",
                   step, E, dE, H, dH);
            fflush(stdout);
        }
    }

    double E_final = bits_to_dbl(c3d_energy());
    double H_final = compute_helicity(nm);

    printf("\n  === SUMMARY ===\n");
    printf("  Energy drift:   ΔE/E(0) = %.6e\n", (E_final-E0)/fabs(E0));
    printf("  Helicity drift: ΔH/H(0) = %.6e\n", (H0 != 0) ? (H_final-H0)/fabs(H0) : H_final-H0);
    printf("\n");
    printf("  Both should be ~ O(dt) (Euler truncation) with correct -i.\n");
    printf("  Without -i, both would show large Δt-independent drift.\n");

    /* Now test at ν > 0: helicity should DECREASE (viscous dissipation) */
    printf("\n  --- With viscosity (ν=0.01): helicity should decrease ---\n\n");
    nu = 0.01;
    apply_ic(N);
    nm = (int)c3d_get_num_modes();
    buf_set(0, nu);
    buf_set(1, dt);

    E0 = bits_to_dbl(c3d_energy());
    H0 = compute_helicity(nm);

    printf("  %-8s %-14s %-14s\n", "step", "E(t)", "H(t)");
    printf("  %-8s %-14s %-14s\n", "------", "------------", "------------");
    printf("  %-8d %-14.8e %-14.8e\n", 0, E0, H0);

    for (int step = 1; step <= total_steps; step++) {
        c3d_do_step();
        if (step % log_interval == 0) {
            double E = bits_to_dbl(c3d_energy());
            double H = compute_helicity(nm);
            printf("  %-8d %-14.8e %-14.8e\n", step, E, H);
        }
    }

    printf("\n################################################################\n");
    printf("#  HELICITY CONSERVATION: second invariant of the -i structure #\n");
    printf("#  Together with energy conservation, provides TWO independent #\n");
    printf("#  tests of the Hamiltonian structure.                        #\n");
    printf("################################################################\n");

    return 0;
}
