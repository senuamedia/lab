/*
 * experiment_grad_xi_sensitivity.c — Reverse-engineering ||∇ξ||
 *
 * Tests what ||∇ξ|| depends on by varying:
 *   B: IC family (distributed, Taylor-Green, concentrated)
 *   C: Grid resolution (M = 16, 32, 64)
 *   D: Threshold fraction (5%, 10%, 20%, 50%)
 *
 * All measured at t=0 (pure IC geometry, no dynamics) AND at t=0.2
 * (after cascade develops) to separate IC contribution from dynamics.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_grad_xi_sensitivity.c \
 *         src/triad_kernel_v3_accessible.c -o build/grad_xi_sens -lm
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

/* Variable grid size — max 64 */
#define MMAX 64
#define M3MAX (MMAX*MMAX*MMAX)

static double omega_phys[M3MAX][3];
static double xi_phys[M3MAX][3];
static double omega_mag_phys[M3MAX];

/* Reconstruct omega on an MxMxM grid */
static void reconstruct_omega(int M) {
    int nm = (int)c3d_get_num_modes();
    int M3 = M*M*M;
    memset(omega_phys, 0, M3 * sizeof(omega_phys[0]));
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

        double cx_re = (double)mky*ur_z - (double)mkz*ur_y;
        double cx_im = (double)mky*ui_z - (double)mkz*ui_y;
        double cy_re = (double)mkz*ur_x - (double)mkx*ur_z;
        double cy_im = (double)mkz*ui_x - (double)mkx*ui_z;
        double cz_re = (double)mkx*ur_y - (double)mky*ur_x;
        double cz_im = (double)mkx*ui_y - (double)mky*ui_x;

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

    for (int idx = 0; idx < M*M*M; idx++)
        omega_mag_phys[idx] = sqrt(omega_phys[idx][0]*omega_phys[idx][0]
                                 + omega_phys[idx][1]*omega_phys[idx][1]
                                 + omega_phys[idx][2]*omega_phys[idx][2]);
}

static double compute_max_grad_xi(int M, double threshold_frac) {
    int M3 = M*M*M;
    double max_omag = 0;
    for (int i = 0; i < M3; i++)
        if (omega_mag_phys[i] > max_omag) max_omag = omega_mag_phys[i];
    double threshold = max_omag * threshold_frac;

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

/* IC families */
#define MAX_BASE 500
static int bkx[MAX_BASE], bky[MAX_BASE], bkz[MAX_BASE];
static double bux[MAX_BASE], buy[MAX_BASE], buz[MAX_BASE];
static int nbm = 0;

static void ic_distributed(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i] = (int)c3d_get_kx(i); bky[i] = (int)c3d_get_ky(i); bkz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
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

static void ic_taylor_green(int n_base, double amp) {
    /* Taylor-Green: u = (sin x cos y cos z, -cos x sin y cos z, 0) */
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = 0;
    for (int i = 0; i < nm && nbm < MAX_BASE; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        double ux = 0, uy = 0, uz = 0;
        /* sin x cos y cos z has Fourier modes at (±1,±1,±1) */
        if (abs(kx)==1 && abs(ky)==1 && abs(kz)==1) {
            double s = amp / 8.0;  /* normalisation for 8 contributing modes */
            ux = s * (kx == 1 ? 1.0 : -1.0) * 0.5;
            uy = -s * (ky == 1 ? 1.0 : -1.0) * 0.5;
            uz = 0.0;
            /* Ensure div-free: k·u = 0 */
            double kdu = (double)kx*ux + (double)ky*uy + (double)kz*uz;
            double k2 = (double)(kx*kx+ky*ky+kz*kz);
            ux -= kdu*kx/k2; uy -= kdu*ky/k2; uz -= kdu*kz/k2;
        }
        bkx[nbm]=kx; bky[nbm]=ky; bkz[nbm]=kz;
        bux[nbm]=ux; buy[nbm]=uy; buz[nbm]=uz;
        nbm++;
    }
}

static void ic_concentrated(int n_base, double amp) {
    /* All energy in shell |k|=2 */
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i] = (int)c3d_get_kx(i); bky[i] = (int)c3d_get_ky(i); bkz[i] = (int)c3d_get_kz(i);
        int k2 = bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i];
        int shell = (int)(sqrt((double)k2)+0.5);
        double ux = 0, uy = 0, uz = 0;
        if (shell == 2) {
            double va = amp;
            double phase = (double)i * 0.7 + 0.3;
            ux = va * sin(M_PI * phase);
            uy = va * sin(M_PI * (phase + 0.4));
            uz = 0.0;
            if (bkz[i] != 0) uz = -((double)bkx[i]*ux+(double)bky[i]*uy)/(double)bkz[i];
            else if (bky[i] != 0) uy = -(double)bkx[i]*ux/(double)bky[i];
            else ux = 0.0;
        }
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

int main(void) {
    int N = 8;
    double amp = 0.30;
    double nu = 0.01;
    double dt = 0.0001;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  ||∇ξ|| SENSITIVITY ANALYSIS                                 #\n");
    printf("#                                                              #\n");
    printf("#  B: IC family (distributed, Taylor-Green, concentrated)      #\n");
    printf("#  C: Grid resolution (M = 16, 32, 64)                        #\n");
    printf("#  D: Threshold (5%%, 10%%, 20%%, 50%%)                          #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f, nu=%.4f                                      #\n", N, amp, nu);
    printf("################################################################\n\n");
    fflush(stdout);

    /* ============================================================
     * TEST B: IC family dependence
     * ============================================================ */
    printf("  === TEST B: IC family dependence (M=32, threshold=10%%) ===\n\n");
    printf("  IC family       ||∇ξ||(t=0)   ||∇ξ||(t=0.2)   Ω(0)      Ω(0.2)\n");
    printf("  --------------  -----------   -------------   --------  --------\n");
    fflush(stdout);

    const char *ic_names[] = {"Distributed", "Taylor-Green", "Concentrated"};
    for (int ic = 0; ic < 3; ic++) {
        if (ic == 0) ic_distributed(n_base, amp);
        else if (ic == 1) ic_taylor_green(n_base, amp);
        else ic_concentrated(n_base, amp);

        apply_ic(N);
        buf_set(0, nu); buf_set(1, dt);

        double Omega_0 = bits_to_dbl(c3d_enstrophy());
        reconstruct_omega(32);
        double g0 = compute_max_grad_xi(32, 0.1);

        /* Evolve to t=0.2 */
        for (int s = 0; s < 2000; s++) c3d_do_step();

        double Omega_02 = bits_to_dbl(c3d_enstrophy());
        reconstruct_omega(32);
        double g02 = compute_max_grad_xi(32, 0.1);

        printf("  %-14s  %11.4f   %13.4f   %8.4f  %8.4f\n",
               ic_names[ic], g0, g02, Omega_0, Omega_02);
        fflush(stdout);
    }
    printf("\n");

    /* ============================================================
     * TEST C: Grid resolution dependence
     * ============================================================ */
    printf("  === TEST C: Grid resolution (distributed IC, threshold=10%%) ===\n\n");
    printf("  Grid    ||∇ξ||(t=0)   ||∇ξ||(t=0.2)\n");
    printf("  ------  -----------   -------------\n");
    fflush(stdout);

    int grids[] = {16, 32, 64};
    for (int gi = 0; gi < 3; gi++) {
        int M = grids[gi];
        if (M*M*M > M3MAX) { printf("  %d³     SKIPPED (too large)\n", M); continue; }

        ic_distributed(n_base, amp);
        apply_ic(N);
        buf_set(0, nu); buf_set(1, dt);

        reconstruct_omega(M);
        double g0 = compute_max_grad_xi(M, 0.1);

        for (int s = 0; s < 2000; s++) c3d_do_step();

        reconstruct_omega(M);
        double g02 = compute_max_grad_xi(M, 0.1);

        printf("  %d³     %11.4f   %13.4f\n", M, g0, g02);
        fflush(stdout);
    }
    printf("\n");

    /* ============================================================
     * TEST D: Threshold dependence
     * ============================================================ */
    printf("  === TEST D: Threshold dependence (distributed IC, M=32) ===\n\n");
    printf("  Threshold   ||∇ξ||(t=0)   ||∇ξ||(t=0.2)   #HV(t=0)   #HV(t=0.2)\n");
    printf("  ----------  -----------   -------------   ---------   ----------\n");
    fflush(stdout);

    double thresholds[] = {0.05, 0.10, 0.20, 0.50};
    /* Run once, measure at multiple thresholds */
    ic_distributed(n_base, amp);
    apply_ic(N);
    buf_set(0, nu); buf_set(1, dt);

    reconstruct_omega(32);
    /* Count HV points and measure at each threshold for t=0 */
    double g0_vals[4];
    int nhv0_vals[4];
    for (int ti = 0; ti < 4; ti++) {
        double thr = thresholds[ti];
        g0_vals[ti] = compute_max_grad_xi(32, thr);
        /* Count HV points */
        double max_omag = 0;
        for (int i = 0; i < 32*32*32; i++)
            if (omega_mag_phys[i] > max_omag) max_omag = omega_mag_phys[i];
        int nhv = 0;
        for (int i = 0; i < 32*32*32; i++)
            if (omega_mag_phys[i] > max_omag * thr) nhv++;
        nhv0_vals[ti] = nhv;
    }

    for (int s = 0; s < 2000; s++) c3d_do_step();

    reconstruct_omega(32);
    for (int ti = 0; ti < 4; ti++) {
        double thr = thresholds[ti];
        double g02 = compute_max_grad_xi(32, thr);
        double max_omag = 0;
        for (int i = 0; i < 32*32*32; i++)
            if (omega_mag_phys[i] > max_omag) max_omag = omega_mag_phys[i];
        int nhv = 0;
        for (int i = 0; i < 32*32*32; i++)
            if (omega_mag_phys[i] > max_omag * thr) nhv++;

        printf("  %5.0f%%       %11.4f   %13.4f   %9d   %10d\n",
               thresholds[ti]*100, g0_vals[ti], g02, nhv0_vals[ti], nhv);
    }
    printf("\n");

    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  If ||∇ξ|| varies with IC: it's IC-dependent (geometric).   #\n");
    printf("#  If ||∇ξ|| is constant across ICs: it's universal.          #\n");
    printf("#  If ||∇ξ|| varies with grid: M=32 is insufficient.          #\n");
    printf("#  If ||∇ξ|| varies with threshold: the region def matters.   #\n");
    printf("#  If ||∇ξ|| is stable across all: it's structural.           #\n");
    printf("################################################################\n");

    return 0;
}
