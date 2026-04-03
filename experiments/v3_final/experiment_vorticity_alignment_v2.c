/*
 * experiment_vorticity_alignment_v2.c — Physical-space ||∇ξ|| measurement
 *
 * CORRECTED VERSION: The v1 experiment measured Fourier-mode direction
 * differences, which always gives the trivial bound 2.0. This version
 * reconstructs the velocity and vorticity fields on a physical-space grid
 * and computes ||∇ξ||_{L^∞} via finite differences — the actual quantity
 * required by the Constantin-Fefferman criterion.
 *
 * Algorithm:
 *   1. Reconstruct u(x) = Σ_k û_k e^{ik·x} on a 32³ grid
 *   2. Compute ω(x) = ∇ × u(x) = Σ_k (ik × û_k) e^{ik·x}
 *   3. Identify high-vorticity region R = {x : |ω(x)| > Λ}
 *   4. Compute ξ(x) = ω(x)/|ω(x)| on R
 *   5. Compute |∇ξ| via central finite differences on the grid
 *   6. Report max|∇ξ| over R at each time sample
 *
 * BUILD:
 *   clang -O3 experiments/experiment_vorticity_alignment_v2.c \
 *         src/triad_kernel_v3_accessible.c -o build/vorticity_v2 -lm
 *
 * NOTE: Uses triad_kernel_v3_accessible.c (adds imaginary part accessors)
 *       rather than triad_kernel_v3_final.c. The solver logic is identical;
 *       only the read-only accessor functions differ.
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
extern int64_t c3d_get_state_ux_im(int64_t idx);
extern int64_t c3d_get_state_uy_im(int64_t idx);
extern int64_t c3d_get_state_uz_im(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }

/* Grid size for physical-space reconstruction */
#define M 32
#define M3 (M*M*M)

/* Physical-space fields */
static double omega_phys[M3][3];  /* ω(x) at each grid point */
static double xi_phys[M3][3];    /* ξ(x) = ω/|ω| */
static double omega_mag_phys[M3]; /* |ω(x)| */

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
 * Reconstruct ω(x) on the M³ grid from Fourier coefficients.
 *
 * ω_k = ik × û_k, so:
 *   ω_k^x = i(k_y û_z - k_z û_y)
 *   ω_k^y = i(k_z û_x - k_x û_z)
 *   ω_k^z = i(k_x û_y - k_y û_x)
 *
 * For complex û = (re + i·im): i·û = (-im + i·re)
 * So Re(ω_k e^{ik·x}) = Re((ω_re + i·ω_im)(cos(k·x) + i·sin(k·x)))
 *                      = ω_re cos(k·x) - ω_im sin(k·x)
 */
static void reconstruct_omega(void) {
    int nm = (int)c3d_get_num_modes();

    memset(omega_phys, 0, sizeof(omega_phys));
    memset(omega_mag_phys, 0, sizeof(omega_mag_phys));

    /* Precompute cos/sin tables for efficiency */
    double dx = 2.0 * M_PI / M;

    for (int mode = 0; mode < nm; mode++) {
        int mkx = (int)c3d_get_kx(mode);
        int mky = (int)c3d_get_ky(mode);
        int mkz = (int)c3d_get_kz(mode);

        /* Get complex û_k = (re, im) for each component */
        double ur_x = bits_to_dbl(c3d_get_state_ux(mode));
        double ui_x = bits_to_dbl(c3d_get_state_ux_im(mode));
        double ur_y = bits_to_dbl(c3d_get_state_uy(mode));
        double ui_y = bits_to_dbl(c3d_get_state_uy_im(mode));
        double ur_z = bits_to_dbl(c3d_get_state_uz(mode));
        double ui_z = bits_to_dbl(c3d_get_state_uz_im(mode));

        /* ω_k = ik × û_k (complex cross product with imaginary i factor)
         * (ik × û)_x = i(k_y û_z - k_z û_y)
         * For complex multiplication by i: i(a+bi) = -b + ai
         *
         * Let c_x = k_y û_z - k_z û_y (complex)
         * c_x_re = k_y ur_z - k_z ur_y
         * c_x_im = k_y ui_z - k_z ui_y
         * Then (i·c)_re = -c_x_im, (i·c)_im = c_x_re
         */
        double cx_re = (double)mky * ur_z - (double)mkz * ur_y;
        double cx_im = (double)mky * ui_z - (double)mkz * ui_y;
        double cy_re = (double)mkz * ur_x - (double)mkx * ur_z;
        double cy_im = (double)mkz * ui_x - (double)mkx * ui_z;
        double cz_re = (double)mkx * ur_y - (double)mky * ur_x;
        double cz_im = (double)mkx * ui_y - (double)mky * ui_x;

        /* Apply i factor */
        double wr_x = -cx_im, wi_x = cx_re;
        double wr_y = -cy_im, wi_y = cy_re;
        double wr_z = -cz_im, wi_z = cz_re;

        /* Add contribution to each grid point */
        for (int ix = 0; ix < M; ix++) {
            double x = ix * dx;
            for (int iy = 0; iy < M; iy++) {
                double y = iy * dx;
                for (int iz = 0; iz < M; iz++) {
                    double z = iz * dx;
                    int idx = ix * M * M + iy * M + iz;

                    double phase = mkx * x + mky * y + mkz * z;
                    double cp = cos(phase);
                    double sp = sin(phase);

                    /* Re(ω_k e^{ik·x}) = ω_re cos - ω_im sin */
                    omega_phys[idx][0] += wr_x * cp - wi_x * sp;
                    omega_phys[idx][1] += wr_y * cp - wi_y * sp;
                    omega_phys[idx][2] += wr_z * cp - wi_z * sp;
                }
            }
        }
    }

    /* Compute magnitudes */
    for (int idx = 0; idx < M3; idx++) {
        omega_mag_phys[idx] = sqrt(omega_phys[idx][0]*omega_phys[idx][0]
                                 + omega_phys[idx][1]*omega_phys[idx][1]
                                 + omega_phys[idx][2]*omega_phys[idx][2]);
    }
}

/*
 * Compute ξ(x) = ω(x)/|ω(x)| and measure max|∇ξ| on the high-vorticity region.
 * Returns max|∇ξ| using central finite differences on the periodic grid.
 */
static double compute_grad_xi(double threshold_frac, double *mean_cos2_out, int *n_hv_out) {
    /* Find threshold */
    double max_omag = 0;
    for (int i = 0; i < M3; i++)
        if (omega_mag_phys[i] > max_omag) max_omag = omega_mag_phys[i];
    double threshold = max_omag * threshold_frac;

    /* Compute ξ at high-vorticity points */
    int n_hv = 0;
    for (int i = 0; i < M3; i++) {
        if (omega_mag_phys[i] > threshold) {
            xi_phys[i][0] = omega_phys[i][0] / omega_mag_phys[i];
            xi_phys[i][1] = omega_phys[i][1] / omega_mag_phys[i];
            xi_phys[i][2] = omega_phys[i][2] / omega_mag_phys[i];
            n_hv++;
        } else {
            xi_phys[i][0] = xi_phys[i][1] = xi_phys[i][2] = 0;
        }
    }

    /* Compute |∇ξ| via central finite differences */
    double dx = 2.0 * M_PI / M;
    double max_grad_xi = 0;
    double sum_cos2 = 0;
    int n_pairs = 0;

    for (int ix = 0; ix < M; ix++)
    for (int iy = 0; iy < M; iy++)
    for (int iz = 0; iz < M; iz++) {
        int idx = ix*M*M + iy*M + iz;
        if (omega_mag_phys[idx] <= threshold) continue;

        /* Check all 6 neighbours (periodic) */
        int nbrs[6] = {
            ((ix+1)%M)*M*M + iy*M + iz,
            ((ix-1+M)%M)*M*M + iy*M + iz,
            ix*M*M + ((iy+1)%M)*M + iz,
            ix*M*M + ((iy-1+M)%M)*M + iz,
            ix*M*M + iy*M + ((iz+1)%M),
            ix*M*M + iy*M + ((iz-1+M)%M)
        };

        for (int n = 0; n < 6; n += 2) {
            int ip = nbrs[n];    /* forward neighbour */
            int im = nbrs[n+1];  /* backward neighbour */

            /* Only compute gradient if BOTH neighbours are in high-vorticity region */
            if (omega_mag_phys[ip] <= threshold || omega_mag_phys[im] <= threshold) continue;

            /* Central difference: dξ/dx_j ≈ (ξ(x+h) - ξ(x-h)) / (2h) */
            double grad_sq = 0;
            for (int c = 0; c < 3; c++) {
                double dxi = (xi_phys[ip][c] - xi_phys[im][c]) / (2.0 * dx);
                grad_sq += dxi * dxi;
            }
            double grad = sqrt(grad_sq);
            if (grad > max_grad_xi) max_grad_xi = grad;
        }

        /* Also compute cos²φ between this point and neighbours for alignment */
        for (int n = 0; n < 6; n++) {
            int in2 = nbrs[n];
            if (omega_mag_phys[in2] <= threshold) continue;
            double dot = xi_phys[idx][0]*xi_phys[in2][0]
                       + xi_phys[idx][1]*xi_phys[in2][1]
                       + xi_phys[idx][2]*xi_phys[in2][2];
            sum_cos2 += dot * dot;
            n_pairs++;
        }
    }

    *mean_cos2_out = (n_pairs > 0) ? sum_cos2 / n_pairs : 0;
    *n_hv_out = n_hv;
    return max_grad_xi;
}

/* ============================================================ */
int main(void) {
    double nu = 0.01;
    double dt = 0.0001;
    int n_steps = 5000;
    int N = 8;
    int n_base = 3;
    double amp = 0.30;
    int sample_every = 500;

    generate_fixed_u0(n_base, amp);
    apply_fixed_projection(N);

    printf("################################################################\n");
    printf("#  VORTICITY ALIGNMENT v2 — Physical-space ||∇ξ|| measurement  #\n");
    printf("#                                                              #\n");
    printf("#  Reconstructs ω(x) on a %d³ grid, computes ξ = ω/|ω|,      #\n", M);
    printf("#  and measures max|∇ξ| via central finite differences.        #\n");
    printf("#                                                              #\n");
    printf("#  Constantin-Fefferman: regularity if sup_t ||∇ξ|| < ∞       #\n");
    printf("#  on the high-vorticity region R = {|ω| > Λ}.                #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f, grid=%d³, threshold=10%% of max|ω|  #\n", N, amp, nu, M);
    printf("################################################################\n\n");
    fflush(stdout);

    buf_set(0, nu); buf_set(1, dt);

    printf("  step   time     E         Ω         max|ω|     max|∇ξ|    ⟨cos²φ⟩   #HV pts\n");
    printf("  -----  ------   -------   --------   --------   --------   -------   -------\n");

    for (int step = 0; step <= n_steps; step++) {
        if (step > 0) c3d_do_step();
        if (step % sample_every != 0) continue;

        double E = get_energy();
        double Omega = get_enstrophy();

        /* Reconstruct ω(x) on the physical-space grid */
        reconstruct_omega();

        /* Find max |ω| for reference */
        double max_omag = 0;
        for (int i = 0; i < M3; i++)
            if (omega_mag_phys[i] > max_omag) max_omag = omega_mag_phys[i];

        /* Compute ||∇ξ|| on high-vorticity region */
        double mean_cos2;
        int n_hv;
        double max_grad_xi = compute_grad_xi(0.1, &mean_cos2, &n_hv);

        printf("  %-5d  %6.4f   %7.4f   %8.4f   %8.4f   %8.4f   %7.4f   %7d\n",
               step, step*dt, E, Omega, max_omag, max_grad_xi, mean_cos2, n_hv);
        fflush(stdout);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  max|∇ξ| bounded: ξ is Lipschitz on R → CF criterion holds  #\n");
    printf("#  max|∇ξ| growing: ξ developing kinks → potential singularity #\n");
    printf("#                                                              #\n");
    printf("#  ⟨cos²φ⟩ near 1: strong alignment (vortex tubes)            #\n");
    printf("#  ⟨cos²φ⟩ near 1/3: isotropic (random directions)            #\n");
    printf("################################################################\n");

    return 0;
}
