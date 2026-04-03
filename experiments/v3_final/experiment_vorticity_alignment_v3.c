/*
 * experiment_vorticity_alignment_v3.c — Universality sweep for ||∇ξ||
 *
 * Runs the physical-space vorticity alignment diagnostic across:
 *   - 3 amplitudes: A = 0.10, 0.20, 0.30
 *   - 2 viscosities: ν = 0.01, 0.001
 *   - 2 truncation levels: N = 6, 8
 *   - Longer time: T = 1.0 (10000 steps)
 *
 * Total: 12 configurations. Each measures ||∇ξ||_{L^∞(R)} at 10 time points.
 *
 * Purpose: Demonstrate that ||∇ξ|| is bounded across the parameter space,
 * not just at the single configuration (A=0.30, ν=0.01, N=8) tested in v2.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_vorticity_alignment_v3.c \
 *         src/triad_kernel_v3_accessible.c -o build/vorticity_v3 -lm
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

#define M 32
#define M3 (M*M*M)

static double omega_phys[M3][3];
static double xi_phys[M3][3];
static double omega_mag_phys[M3];

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

static void reconstruct_omega(void) {
    int nm = (int)c3d_get_num_modes();
    memset(omega_phys, 0, sizeof(omega_phys));
    double dx = 2.0 * M_PI / M;

    for (int mode = 0; mode < nm; mode++) {
        int mkx = (int)c3d_get_kx(mode);
        int mky = (int)c3d_get_ky(mode);
        int mkz = (int)c3d_get_kz(mode);

        double ur_x = bits_to_dbl(c3d_get_state_ux(mode));
        double ui_x = bits_to_dbl(c3d_get_state_ux_im(mode));
        double ur_y = bits_to_dbl(c3d_get_state_uy(mode));
        double ui_y = bits_to_dbl(c3d_get_state_uy_im(mode));
        double ur_z = bits_to_dbl(c3d_get_state_uz(mode));
        double ui_z = bits_to_dbl(c3d_get_state_uz_im(mode));

        double cx_re = (double)mky * ur_z - (double)mkz * ur_y;
        double cx_im = (double)mky * ui_z - (double)mkz * ui_y;
        double cy_re = (double)mkz * ur_x - (double)mkx * ur_z;
        double cy_im = (double)mkz * ui_x - (double)mkx * ui_z;
        double cz_re = (double)mkx * ur_y - (double)mky * ur_x;
        double cz_im = (double)mkx * ui_y - (double)mky * ui_x;

        double wr_x = -cx_im, wi_x = cx_re;
        double wr_y = -cy_im, wi_y = cy_re;
        double wr_z = -cz_im, wi_z = cz_re;

        for (int ix = 0; ix < M; ix++) {
            double x = ix * dx;
            for (int iy = 0; iy < M; iy++) {
                double y = iy * dx;
                for (int iz = 0; iz < M; iz++) {
                    double z = iz * dx;
                    int idx = ix*M*M + iy*M + iz;
                    double phase = mkx*x + mky*y + mkz*z;
                    double cp = cos(phase), sp = sin(phase);
                    omega_phys[idx][0] += wr_x*cp - wi_x*sp;
                    omega_phys[idx][1] += wr_y*cp - wi_y*sp;
                    omega_phys[idx][2] += wr_z*cp - wi_z*sp;
                }
            }
        }
    }

    for (int idx = 0; idx < M3; idx++)
        omega_mag_phys[idx] = sqrt(omega_phys[idx][0]*omega_phys[idx][0]
                                 + omega_phys[idx][1]*omega_phys[idx][1]
                                 + omega_phys[idx][2]*omega_phys[idx][2]);
}

static double compute_max_grad_xi(double threshold_frac) {
    double max_omag = 0;
    for (int i = 0; i < M3; i++)
        if (omega_mag_phys[i] > max_omag) max_omag = omega_mag_phys[i];
    double threshold = max_omag * threshold_frac;

    for (int i = 0; i < M3; i++) {
        if (omega_mag_phys[i] > threshold) {
            xi_phys[i][0] = omega_phys[i][0] / omega_mag_phys[i];
            xi_phys[i][1] = omega_phys[i][1] / omega_mag_phys[i];
            xi_phys[i][2] = omega_phys[i][2] / omega_mag_phys[i];
        } else {
            xi_phys[i][0] = xi_phys[i][1] = xi_phys[i][2] = 0;
        }
    }

    double dx = 2.0 * M_PI / M;
    double max_grad = 0;

    for (int ix = 0; ix < M; ix++)
    for (int iy = 0; iy < M; iy++)
    for (int iz = 0; iz < M; iz++) {
        int idx = ix*M*M + iy*M + iz;
        if (omega_mag_phys[idx] <= threshold) continue;

        int nbrs[6] = {
            ((ix+1)%M)*M*M + iy*M + iz, ((ix-1+M)%M)*M*M + iy*M + iz,
            ix*M*M + ((iy+1)%M)*M + iz, ix*M*M + ((iy-1+M)%M)*M + iz,
            ix*M*M + iy*M + ((iz+1)%M), ix*M*M + iy*M + ((iz-1+M)%M)
        };

        for (int n = 0; n < 6; n += 2) {
            int ip = nbrs[n], im = nbrs[n+1];
            if (omega_mag_phys[ip] <= threshold || omega_mag_phys[im] <= threshold) continue;
            double grad_sq = 0;
            for (int c = 0; c < 3; c++) {
                double dxi = (xi_phys[ip][c] - xi_phys[im][c]) / (2.0 * dx);
                grad_sq += dxi * dxi;
            }
            double grad = sqrt(grad_sq);
            if (grad > max_grad) max_grad = grad;
        }
    }
    return max_grad;
}

int main(void) {
    int n_base = 3;
    double dt = 0.0001;
    int n_steps = 10000;
    int sample_every = 1000;

    double amps[] = {0.10, 0.20, 0.30};
    double nus[] = {0.01, 0.001};
    int Ns[] = {6, 8};
    int n_amps = 3, n_nus = 2, n_Ns = 2;

    printf("################################################################\n");
    printf("#  VORTICITY ALIGNMENT UNIVERSALITY SWEEP                      #\n");
    printf("#                                                              #\n");
    printf("#  Physical-space ||∇ξ|| across 12 configurations:             #\n");
    printf("#    A = 0.10, 0.20, 0.30                                      #\n");
    printf("#    ν = 0.01, 0.001                                           #\n");
    printf("#    N = 6, 8                                                   #\n");
    printf("#    T = 1.0 (10000 steps)                                     #\n");
    printf("#  Grid: 32³, threshold: 10%% of max|ω|                        #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    /* Summary table header */
    printf("  SUMMARY: sup_t ||∇ξ|| across all configurations\n\n");
    printf("  A      ν        N    sup||∇ξ||  Ω(0)      Ω(T)      Ω_max     bounded?  time\n");
    printf("  -----  -------  ---  ---------  --------  --------  --------  --------  ------\n");
    fflush(stdout);

    for (int ai = 0; ai < n_amps; ai++)
    for (int ni = 0; ni < n_nus; ni++)
    for (int Ni = 0; Ni < n_Ns; Ni++) {
        double amp = amps[ai];
        double nu = nus[ni];
        int N = Ns[Ni];

        generate_fixed_u0(n_base, amp);
        apply_fixed_projection(N);
        buf_set(0, nu); buf_set(1, dt);

        double Omega_0 = get_enstrophy();
        double sup_grad_xi = 0;
        double Omega_max = 0;
        double Omega_T = 0;

        clock_t t_start = clock();

        for (int step = 0; step <= n_steps; step++) {
            if (step > 0) c3d_do_step();

            double Omega = get_enstrophy();
            if (Omega > Omega_max) Omega_max = Omega;

            if (step % sample_every == 0) {
                reconstruct_omega();
                double g = compute_max_grad_xi(0.1);
                if (g > sup_grad_xi) sup_grad_xi = g;
            }

            if (step == n_steps) Omega_T = Omega;
        }

        double elapsed = (double)(clock() - t_start) / CLOCKS_PER_SEC;
        int bounded = (sup_grad_xi < 20.0) ? 1 : 0;

        printf("  %.2f   %.4f   %-3d  %9.4f  %8.4f  %8.4f  %8.4f  %s     %.0fs\n",
               amp, nu, N, sup_grad_xi, Omega_0, Omega_T, Omega_max,
               bounded ? "YES" : "NO", elapsed);
        fflush(stdout);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  If sup||∇ξ|| is bounded across ALL configurations:          #\n");
    printf("#    → Constantin-Fefferman criterion satisfied universally.    #\n");
    printf("#    → The geometric regularity mechanism is not parameter-     #\n");
    printf("#      dependent; it is structural.                             #\n");
    printf("################################################################\n");

    return 0;
}
