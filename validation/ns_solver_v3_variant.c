/*
 * ns_solver_v3_variant.c — Independent v3 solver variant
 *
 * Deliberately different architecture from triad_kernel_v3.c:
 *   - No precomputed triads (direct O(N^3) summation per step)
 *   - Flat array storage (interleaved re/im per component)
 *   - RK4 time integration (vs Lie-Trotter in primary solver)
 *   - Mode lookup via hash table (vs linear scan)
 *
 * Same mathematics: 3D Galerkin NS on T^3 with correct -i factor.
 * If this variant agrees with triad_kernel_v3.c and ns_galerkin_3d.py,
 * then the results are implementation-independent.
 *
 * Build: cc -O3 -o ns_solver_v3_variant ns_solver_v3_variant.c -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

/* ================================================================
 * Configuration
 * ================================================================ */
#define MAX_MODES  5000
#define HASH_SIZE  65536  /* must be power of 2 */

/* Mode storage */
static int mode_kx[MAX_MODES], mode_ky[MAX_MODES], mode_kz[MAX_MODES];
static int n_modes = 0;

/* State: u[i][c] where c=0..5 is (re_x, im_x, re_y, im_y, re_z, im_z) */
static double u[MAX_MODES][6];

/* RK4 temporaries */
static double k1[MAX_MODES][6], k2_rk[MAX_MODES][6];
static double k3[MAX_MODES][6], k4[MAX_MODES][6];
static double u_tmp[MAX_MODES][6];

/* Hash table for mode lookup */
static int hash_table[HASH_SIZE];
static int hash_next[MAX_MODES];

/* ================================================================
 * Hash-based mode lookup (replaces linear scan)
 * ================================================================ */
static unsigned int mode_hash(int kx, int ky, int kz) {
    unsigned int h = (unsigned int)(kx * 73856093u ^ ky * 19349669u ^ kz * 83492791u);
    return h & (HASH_SIZE - 1);
}

static void hash_init(void) {
    memset(hash_table, -1, sizeof(hash_table));
    memset(hash_next, -1, sizeof(hash_next));
}

static void hash_insert(int idx) {
    unsigned int h = mode_hash(mode_kx[idx], mode_ky[idx], mode_kz[idx]);
    hash_next[idx] = hash_table[h];
    hash_table[h] = idx;
}

static int hash_find(int kx, int ky, int kz) {
    unsigned int h = mode_hash(kx, ky, kz);
    int idx = hash_table[h];
    while (idx >= 0) {
        if (mode_kx[idx] == kx && mode_ky[idx] == ky && mode_kz[idx] == kz)
            return idx;
        idx = hash_next[idx];
    }
    return -1;
}

/* ================================================================
 * Mode enumeration
 * ================================================================ */
static int enumerate(int n_max) {
    hash_init();
    int idx = 0, n2 = n_max * n_max;
    for (int kx = -n_max; kx <= n_max; kx++)
        for (int ky = -n_max; ky <= n_max; ky++)
            for (int kz = -n_max; kz <= n_max; kz++) {
                int r2 = kx*kx + ky*ky + kz*kz;
                if (r2 > 0 && r2 <= n2 && idx < MAX_MODES) {
                    mode_kx[idx] = kx; mode_ky[idx] = ky; mode_kz[idx] = kz;
                    hash_insert(idx);
                    idx++;
                }
            }
    n_modes = idx;
    return idx;
}

/* ================================================================
 * Compute NL RHS: direct summation (no precomputed triads)
 *
 *   NL_k = -i * sum_{p: q=k-p in modes} (u_p . q) * P_k(u_q)
 *
 * Input:  src[n_modes][6] — current state
 * Output: dst[n_modes][6] — nonlinear RHS (no diffusion)
 * ================================================================ */
static void compute_nl_direct(double src[][6], double dst[][6], int n_max) {
    int n2 = n_max * n_max;
    memset(dst, 0, sizeof(double) * MAX_MODES * 6);

    for (int ki = 0; ki < n_modes; ki++) {
        double kx = mode_kx[ki], ky = mode_ky[ki], kz = mode_kz[ki];
        double kk = kx*kx + ky*ky + kz*kz;

        double acc_re[3] = {0}, acc_im[3] = {0};

        /* Direct summation over all p in modes */
        for (int pi = 0; pi < n_modes; pi++) {
            int qx = (int)kx - mode_kx[pi];
            int qy = (int)ky - mode_ky[pi];
            int qz = (int)kz - mode_kz[pi];
            int q2 = qx*qx + qy*qy + qz*qz;
            if (q2 <= 0 || q2 > n2) continue;

            int qi = hash_find(qx, qy, qz);
            if (qi < 0) continue;

            /* u_p . q (complex dot with real vector) */
            double updq_re = src[pi][0]*(double)qx + src[pi][2]*(double)qy + src[pi][4]*(double)qz;
            double updq_im = src[pi][1]*(double)qx + src[pi][3]*(double)qy + src[pi][5]*(double)qz;

            /* Leray projection P_k(u_q) = u_q - (k.u_q / |k|^2) k */
            double kduq_re = kx*src[qi][0] + ky*src[qi][2] + kz*src[qi][4];
            double kduq_im = kx*src[qi][1] + ky*src[qi][3] + kz*src[qi][5];
            double sr = 0, si = 0;
            if (kk > 1e-10) { sr = kduq_re / kk; si = kduq_im / kk; }

            double pq_re[3], pq_im[3];
            pq_re[0] = src[qi][0] - sr*kx; pq_im[0] = src[qi][1] - si*kx;
            pq_re[1] = src[qi][2] - sr*ky; pq_im[1] = src[qi][3] - si*ky;
            pq_re[2] = src[qi][4] - sr*kz; pq_im[2] = src[qi][5] - si*kz;

            /* Complex multiply: (updq) * P_k(u_q) */
            for (int c = 0; c < 3; c++) {
                acc_re[c] += updq_re * pq_re[c] - updq_im * pq_im[c];
                acc_im[c] += updq_re * pq_im[c] + updq_im * pq_re[c];
            }
        }

        /* Apply -i: (a+bi)(-i) = b - ai */
        dst[ki][0] =  acc_im[0]; dst[ki][1] = -acc_re[0];
        dst[ki][2] =  acc_im[1]; dst[ki][3] = -acc_re[1];
        dst[ki][4] =  acc_im[2]; dst[ki][5] = -acc_re[2];
    }
}

/* ================================================================
 * Full RHS: diffusion + nonlinear
 * ================================================================ */
static void compute_rhs(double src[][6], double dst[][6], double nu, int n_max) {
    compute_nl_direct(src, dst, n_max);
    for (int i = 0; i < n_modes; i++) {
        double k2 = mode_kx[i]*mode_kx[i] + mode_ky[i]*mode_ky[i] +
                     mode_kz[i]*mode_kz[i];
        for (int c = 0; c < 6; c++)
            dst[i][c] -= nu * k2 * src[i][c]; /* diffusion: -nu|k|^2 u_k */
    }
}

/* ================================================================
 * RK4 time step (different from primary solver's Lie-Trotter)
 * ================================================================ */
static void rk4_step(double nu, double dt, int n_max) {
    int N6 = n_modes * 6;

    /* k1 = f(u) */
    compute_rhs(u, k1, nu, n_max);

    /* k2 = f(u + dt/2 * k1) */
    for (int i = 0; i < N6; i++)
        ((double*)u_tmp)[i] = ((double*)u)[i] + 0.5*dt*((double*)k1)[i];
    compute_rhs(u_tmp, k2_rk, nu, n_max);

    /* k3 = f(u + dt/2 * k2) */
    for (int i = 0; i < N6; i++)
        ((double*)u_tmp)[i] = ((double*)u)[i] + 0.5*dt*((double*)k2_rk)[i];
    compute_rhs(u_tmp, k3, nu, n_max);

    /* k4 = f(u + dt * k3) */
    for (int i = 0; i < N6; i++)
        ((double*)u_tmp)[i] = ((double*)u)[i] + dt*((double*)k3)[i];
    compute_rhs(u_tmp, k4, nu, n_max);

    /* u += dt/6 * (k1 + 2*k2 + 2*k3 + k4) */
    for (int i = 0; i < N6; i++)
        ((double*)u)[i] += (dt/6.0) * (((double*)k1)[i] + 2*((double*)k2_rk)[i] +
                                         2*((double*)k3)[i] + ((double*)k4)[i]);
}

/* ================================================================
 * Diagnostics
 * ================================================================ */
static double energy(void) {
    double e = 0;
    for (int i = 0; i < n_modes; i++)
        for (int c = 0; c < 6; c++) e += u[i][c] * u[i][c];
    return 0.5 * e;
}

static double enstrophy(void) {
    double om = 0;
    for (int i = 0; i < n_modes; i++) {
        double k2 = mode_kx[i]*mode_kx[i] + mode_ky[i]*mode_ky[i] +
                     mode_kz[i]*mode_kz[i];
        double m2 = 0;
        for (int c = 0; c < 6; c++) m2 += u[i][c] * u[i][c];
        om += k2 * m2;
    }
    return 0.5 * om;
}

static double nl_energy_rate(int n_max) {
    double nl[MAX_MODES][6];
    compute_nl_direct(u, nl, n_max);
    double dot = 0;
    for (int i = 0; i < n_modes; i++)
        for (int c = 0; c < 6; c += 2) {
            dot += u[i][c]*nl[i][c] + u[i][c+1]*nl[i][c+1];
        }
    return dot;
}

static double divergence_max(void) {
    double mx = 0;
    for (int i = 0; i < n_modes; i++) {
        double d_re = mode_kx[i]*u[i][0] + mode_ky[i]*u[i][2] + mode_kz[i]*u[i][4];
        double d_im = mode_kx[i]*u[i][1] + mode_ky[i]*u[i][3] + mode_kz[i]*u[i][5];
        double d = sqrt(d_re*d_re + d_im*d_im);
        if (d > mx) mx = d;
    }
    return mx;
}

/* ================================================================
 * Initial conditions
 * ================================================================ */
static void set_distributed_ic(double amp) {
    memset(u, 0, sizeof(u));
    for (int i = 0; i < n_modes; i++) {
        double kx = mode_kx[i], ky = mode_ky[i], kz = mode_kz[i];
        double k = sqrt(kx*kx + ky*ky + kz*kz);
        double a = amp / k;
        /* Divergence-free: u perpendicular to k */
        double cx = 0, cy = kz, cz = -ky;
        double cn = sqrt(cy*cy + cz*cz);
        if (cn < 1e-10) { cx = -kz; cy = 0; cz = kx; cn = sqrt(cx*cx + cz*cz); }
        if (cn < 1e-10) continue;
        u[i][0] = a * cx / cn;
        u[i][2] = a * cy / cn;
        u[i][4] = a * cz / cn;
    }
    /* Conjugate symmetry */
    for (int i = 0; i < n_modes; i++) {
        int mk = hash_find(-mode_kx[i], -mode_ky[i], -mode_kz[i]);
        if (mk >= 0 && mk > i) {
            u[mk][0] =  u[i][0]; u[mk][1] = -u[i][1];
            u[mk][2] =  u[i][2]; u[mk][3] = -u[i][3];
            u[mk][4] =  u[i][4]; u[mk][5] = -u[i][5];
        }
    }
}

/* ================================================================
 * Main: run and compare with primary solver
 * ================================================================ */
int main(void) {
    printf("##############################################################\n");
    printf("#  V3 VARIANT SOLVER — Independent Implementation            #\n");
    printf("#                                                            #\n");
    printf("#  Architecture differences from primary v3:                  #\n");
    printf("#    - No precomputed triads (direct O(N^3) summation)        #\n");
    printf("#    - Hash-based mode lookup (vs linear scan)                #\n");
    printf("#    - RK4 integrator (vs Lie-Trotter splitting)              #\n");
    printf("#    - Flat 2D array storage (vs interleaved 1D)              #\n");
    printf("#  Same mathematics: 3D Galerkin NS with correct -i factor.  #\n");
    printf("##############################################################\n\n");

    int n_max_vals[] = {2, 3, 4};
    double nu_vals[] = {0.01, 0.001};
    double amp = 0.3;
    double dt = 0.0001;
    int nsteps = 2000; /* T = 0.2 */

    for (int ni = 0; ni < 3; ni++) {
        int n_max = n_max_vals[ni];
        int nm = enumerate(n_max);
        printf("=== N=%d (%d modes) ===\n\n", n_max, nm);

        for (int vi = 0; vi < 2; vi++) {
            double nu = nu_vals[vi];
            set_distributed_ic(amp);

            double E0 = energy();
            double Om0 = enstrophy();
            double nl0 = nl_energy_rate(n_max);
            double div0 = divergence_max();

            printf("  nu=%.4f, A=%.2f, dt=%.6f, T=%.4f\n", nu, amp, dt, dt*nsteps);
            printf("  Initial: E=%.8f, Om=%.8f\n", E0, Om0);
            printf("  NL rate(0) = %+.4e, max|k.u|(0) = %.4e\n", nl0, div0);

            /* Evolve with RK4 */
            for (int s = 0; s < nsteps; s++)
                rk4_step(nu, dt, n_max);

            double E1 = energy();
            double Om1 = enstrophy();
            double nl1 = nl_energy_rate(n_max);
            double div1 = divergence_max();

            printf("  Final:   E=%.8f, Om=%.8f\n", E1, Om1);
            printf("  E(T)/E(0) = %.8f\n", E1/E0);
            printf("  Om(T)/Om(0) = %.8f\n", Om1/Om0);
            printf("  NL rate(T) = %+.4e\n", nl1);
            printf("  max|k.u|(T) = %.4e\n", div1);
            printf("  Energy %s (ratio %.6f)\n",
                   E1 <= E0 * 1.001 ? "DECREASING [OK]" : "INCREASING [BAD]", E1/E0);
            printf("  Enstrophy %s\n\n",
                   Om1 < Om0 * 50 ? "BOUNDED [OK]" : "BLOW-UP [BAD]");
        }
    }

    printf("##############################################################\n");
    printf("#  CROSS-VALIDATION SUMMARY                                  #\n");
    printf("#                                                            #\n");
    printf("#  If these values match the primary v3 solver and the       #\n");
    printf("#  Python reference, the results are implementation-         #\n");
    printf("#  independent. Three solvers, three architectures,          #\n");
    printf("#  same mathematics, same conclusions.                       #\n");
    printf("##############################################################\n");

    return 0;
}
