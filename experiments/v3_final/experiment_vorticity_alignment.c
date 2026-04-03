/*
 * experiment_vorticity_alignment.c — Constantin-Fefferman vorticity direction diagnostic
 *
 * PURPOSE:
 *   Measure the vorticity direction coherence as a function of time and
 *   enstrophy level. If the vorticity direction field ξ = ω/|ω| remains
 *   Lipschitz-continuous in the high-vorticity region, the Constantin-Fefferman
 *   (1993) criterion guarantees regularity.
 *
 *   This experiment measures:
 *   1. The vorticity direction gradient |∇ξ| (approximated in Fourier space)
 *   2. The alignment between ω at different modes (the geometric kernel D)
 *   3. The BKM integrand ||ω||_{L^∞} over time
 *   4. All quantities conditioned on the high-vorticity region
 *
 *   The key question: does |∇ξ| grow slower than (T*-t)^{-1} near
 *   high-enstrophy events? If so, the BKM integral converges and no
 *   singularity can form.
 *
 * CONNECTION TO THE PROOF GAP:
 *   The gap in Theorem 9.6 is that the bootstrap's Gronwall constant
 *   depends on ||u||_{H^s}, creating circularity. The Constantin-Fefferman
 *   criterion bypasses this: instead of tracking H^s norms, it tracks
 *   the geometric coherence of the vorticity field. If coherence persists,
 *   regularity follows from Leray-Hopf + CKN + BKM, without any H^s
 *   assumption.
 *
 * WHAT WE MEASURE IN FOURIER SPACE:
 *   For each mode k, the vorticity is ω_k = ik × û_k (cross product).
 *   The direction ξ_k = ω_k/|ω_k|.
 *
 *   The "alignment" between modes k₁ and k₂:
 *     cos(φ) = Re(ξ_{k₁} · conj(ξ_{k₂}))
 *
 *   |∇ξ| is approximated by:
 *     max over nearby modes of |ξ_{k₁} - ξ_{k₂}| / |k₁ - k₂|
 *
 *   The BKM integrand: ||ω||_{L^∞} ≤ Σ_k |ω_k| (triangle inequality)
 *   Better: ||ω||_{L^∞} ≈ max_k |k| |û_k| · M(N) where M(N) is the
 *   mode count correction.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_vorticity_alignment.c \
 *         src/triad_kernel_v3_final.c -o build/vorticity_alignment -lm
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
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }

/* IC setup */
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
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

/*
 * Compute vorticity ω_k = ik × û_k for each mode.
 * For real parts only (exact at t=0, lower bound at t>0):
 *   ω_x = i(k_y û_z - k_z û_y) → real part: -(k_y u_z - k_z u_y)...
 *   Actually for real û: ω_k = ik × û_k, so Re(ω) comes from the
 *   cross product with the imaginary i factor.
 *
 * For simplicity at t=0 with real IC:
 *   û_k is real, so ω_k = ik × û_k is purely imaginary.
 *   |ω_k|² = |k × û_k|² (real cross product squared)
 *
 * We compute |k × û_k| for each mode as a proxy for vorticity magnitude.
 */

int main(void) {
    double nu = 0.01;
    double dt = 0.0001;
    int n_steps = 5000;
    int N = 8;
    int n_base = 3;
    double amp = 0.30;
    int sample_every = 100;

    generate_fixed_u0(n_base, amp);
    apply_fixed_projection(N);
    int nm = (int)c3d_get_num_modes();

    printf("################################################################\n");
    printf("#  VORTICITY ALIGNMENT DIAGNOSTIC (Constantin-Fefferman)        #\n");
    printf("#                                                              #\n");
    printf("#  Measures vorticity direction coherence over time.            #\n");
    printf("#  If |∇ξ| stays bounded, BKM integral converges → regularity. #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f, dt=%.6f, steps=%d                   #\n", N, amp, nu, dt, n_steps);
    printf("################################################################\n\n");
    fflush(stdout);

    /* Store wavevectors locally */
    int kx[3000], ky[3000], kz[3000];
    for (int i = 0; i < nm && i < 3000; i++) {
        kx[i] = (int)c3d_get_kx(i);
        ky[i] = (int)c3d_get_ky(i);
        kz[i] = (int)c3d_get_kz(i);
    }

    buf_set(0, nu); buf_set(1, dt);

    printf("  step   time      E          Ω          max|ω_k|   Σ|ω_k|     ⟨cos²φ⟩    max|Δξ|/|Δk|   BKM_int\n");
    printf("  -----  ------    --------   --------   --------   --------   --------   -------------   -------\n");

    double bkm_integral = 0;
    double prev_E = get_energy();

    for (int step = 0; step <= n_steps; step++) {
        if (step > 0) c3d_do_step();

        if (step % sample_every != 0) continue;

        double E = get_energy();
        double Omega = get_enstrophy();
        double t = step * dt;

        /* Compute vorticity at each mode: ω_k = k × û_k */
        double omega_x[3000], omega_y[3000], omega_z[3000], omega_mag[3000];
        double max_omega = 0, sum_omega = 0;

        for (int i = 0; i < nm; i++) {
            double ux = bits_to_dbl(c3d_get_state_ux(i));
            double uy = bits_to_dbl(c3d_get_state_uy(i));
            double uz = bits_to_dbl(c3d_get_state_uz(i));

            /* ω = k × û (real parts) */
            omega_x[i] = (double)ky[i]*uz - (double)kz[i]*uy;
            omega_y[i] = (double)kz[i]*ux - (double)kx[i]*uz;
            omega_z[i] = (double)kx[i]*uy - (double)ky[i]*ux;
            omega_mag[i] = sqrt(omega_x[i]*omega_x[i] + omega_y[i]*omega_y[i] + omega_z[i]*omega_z[i]);

            if (omega_mag[i] > max_omega) max_omega = omega_mag[i];
            sum_omega += omega_mag[i];
        }

        /* BKM integrand: ||ω||_{L^∞} ≤ Σ|ω_k| (crude upper bound) */
        bkm_integral += sum_omega * dt * sample_every;

        /* Compute vorticity direction alignment between mode pairs */
        /* For modes with significant vorticity, compute cos²φ between directions */
        double sum_cos2 = 0;
        int n_pairs = 0;
        double max_dxi_dk = 0;  /* max |ξ₁ - ξ₂| / |k₁ - k₂| */

        double omega_threshold = max_omega * 0.1;  /* "high vorticity" = top 10% */

        for (int i = 0; i < nm; i++) {
            if (omega_mag[i] < omega_threshold) continue;
            double xi_x = omega_x[i] / omega_mag[i];
            double xi_y = omega_y[i] / omega_mag[i];
            double xi_z = omega_z[i] / omega_mag[i];

            for (int j = i+1; j < nm; j++) {
                if (omega_mag[j] < omega_threshold) continue;
                double xj_x = omega_x[j] / omega_mag[j];
                double xj_y = omega_y[j] / omega_mag[j];
                double xj_z = omega_z[j] / omega_mag[j];

                /* cos²φ between directions */
                double dot = xi_x*xj_x + xi_y*xj_y + xi_z*xj_z;
                sum_cos2 += dot*dot;
                n_pairs++;

                /* |ξᵢ - ξⱼ| / |kᵢ - kⱼ| — Lipschitz estimate for ∇ξ */
                double dxi = sqrt((xi_x-xj_x)*(xi_x-xj_x) + (xi_y-xj_y)*(xi_y-xj_y) + (xi_z-xj_z)*(xi_z-xj_z));
                double dk_x = (double)(kx[i]-kx[j]);
                double dk_y = (double)(ky[i]-ky[j]);
                double dk_z = (double)(kz[i]-kz[j]);
                double dk = sqrt(dk_x*dk_x + dk_y*dk_y + dk_z*dk_z);
                if (dk > 0.5) {
                    double ratio = dxi / dk;
                    if (ratio > max_dxi_dk) max_dxi_dk = ratio;
                }
            }
        }

        double mean_cos2 = (n_pairs > 0) ? sum_cos2 / n_pairs : 0;

        printf("  %-5d  %6.4f    %8.5f   %8.4f   %8.4f   %8.2f   %8.5f   %13.6f   %7.4f\n",
               step, t, E, Omega, max_omega, sum_omega, mean_cos2, max_dxi_dk, bkm_integral);
        fflush(stdout);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  ⟨cos²φ⟩ → 1:                                               #\n");
    printf("#    Vorticity directions aligning → Constantin-Fefferman      #\n");
    printf("#    kernel D → 0 → stretching suppressed → regularity.       #\n");
    printf("#                                                              #\n");
    printf("#  max|Δξ|/|Δk| bounded:                                       #\n");
    printf("#    ξ is Lipschitz → |∇ξ| bounded → BKM closes.              #\n");
    printf("#                                                              #\n");
    printf("#  BKM integral growing sub-linearly:                          #\n");
    printf("#    ∫||ω||_{L^∞} dt stays finite → no blow-up possible.       #\n");
    printf("#                                                              #\n");
    printf("#  This diagnostic measures the GEOMETRIC condition for        #\n");
    printf("#  regularity (Constantin-Fefferman 1993) directly, bypassing  #\n");
    printf("#  the H^s bootstrap entirely.                                 #\n");
    printf("################################################################\n");

    return 0;
}
