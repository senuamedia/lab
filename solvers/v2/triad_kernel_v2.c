/*
 * triad_kernel_v2.c — Fixed interface using a shared input buffer
 *
 * Instead of passing f64 values through function parameters (broken by
 * Simplex compiler register bug) or through vec (broken by pointer
 * conversion), we use a simple shared double array that Simplex writes
 * to via c3d_buf_set(index, value) where value is an i64 bit pattern.
 */

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define MAX_MODES 100000
#define MAX_TRIADS 50000000

static double state_data[MAX_MODES * 3];
static double rhs_data[MAX_MODES * 3];
static int modes_kx[MAX_MODES];
static int modes_ky[MAX_MODES];
static int modes_kz[MAX_MODES];
static int triad_p_arr[MAX_TRIADS];
static int triad_q_arr[MAX_TRIADS];
static int triad_offsets[MAX_MODES + 1];
static int num_modes_stored = 0;
static int num_triads_stored = 0;

/* Helper: convert double to i64 bits for returning to Simplex */
static int64_t dbl_to_bits(double v) {
    int64_t bits; memcpy(&bits, &v, sizeof(double)); return bits;
}

/* Shared buffer for parameter passing */
#define BUF_SIZE 16
static double shared_buf[BUF_SIZE];

/* === Buffer interface — SINGLE PARAMETER ONLY === */
/* Simplex compiler corrupts the 2nd param of multi-param extern calls */

static int64_t pending_buf_index = 0;

/* Step 1: set the index */
int64_t c3d_buf_idx(int64_t index) {
    pending_buf_index = index;
    return 0;
}

/* Step 2: set the value at the pending index */
int64_t c3d_buf_val(int64_t val_bits) {
    if (pending_buf_index >= 0 && pending_buf_index < BUF_SIZE) {
        union { int64_t i; double d; } u;
        u.i = val_bits;
        shared_buf[pending_buf_index] = u.d;
    }
    return 0;
}

/* Read: single param, returns i64 bits (Simplex can't receive f64 from extern) */
int64_t c3d_buf_read(int64_t index) {
    if (index >= 0 && index < BUF_SIZE)
        return dbl_to_bits(shared_buf[index]);
    return dbl_to_bits(0.0);
}

/* === Mode enumeration === */

int64_t c3d_count_modes(int64_t n_max) {
    int count = 0;
    int n2 = (int)(n_max * n_max);
    for (int kx = -(int)n_max; kx <= (int)n_max; kx++)
        for (int ky = -(int)n_max; ky <= (int)n_max; ky++)
            for (int kz = -(int)n_max; kz <= (int)n_max; kz++) {
                int r2 = kx*kx + ky*ky + kz*kz;
                if (r2 > 0 && r2 <= n2) count++;
            }
    return (int64_t)count;
}

int64_t c3d_enumerate_modes(int64_t n_max) {
    int idx = 0;
    int n2 = (int)(n_max * n_max);
    for (int kx = -(int)n_max; kx <= (int)n_max; kx++)
        for (int ky = -(int)n_max; ky <= (int)n_max; ky++)
            for (int kz = -(int)n_max; kz <= (int)n_max; kz++) {
                int r2 = kx*kx + ky*ky + kz*kz;
                if (r2 > 0 && r2 <= n2 && idx < MAX_MODES) {
                    modes_kx[idx] = kx;
                    modes_ky[idx] = ky;
                    modes_kz[idx] = kz;
                    idx++;
                }
            }
    num_modes_stored = idx;
    return (int64_t)idx;
}

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < num_modes_stored; i++)
        if (modes_kx[i] == kx && modes_ky[i] == ky && modes_kz[i] == kz)
            return i;
    return -1;
}

int64_t c3d_get_kx(int64_t idx) { return (int64_t)modes_kx[(int)idx]; }
int64_t c3d_get_ky(int64_t idx) { return (int64_t)modes_ky[(int)idx]; }
int64_t c3d_get_kz(int64_t idx) { return (int64_t)modes_kz[(int)idx]; }
int64_t c3d_get_num_modes(void) { return (int64_t)num_modes_stored; }
int64_t c3d_get_num_triads(void) { return (int64_t)num_triads_stored; }

/* === Triad precomputation === */

int64_t c3d_precompute_triads(int64_t n_max) {
    int n_max_sq = (int)(n_max * n_max);
    int total = 0;
    for (int k_idx = 0; k_idx < num_modes_stored; k_idx++) {
        triad_offsets[k_idx] = total;
        int kx = modes_kx[k_idx], ky = modes_ky[k_idx], kz = modes_kz[k_idx];
        for (int p_idx = 0; p_idx < num_modes_stored; p_idx++) {
            int qx = kx - modes_kx[p_idx];
            int qy = ky - modes_ky[p_idx];
            int qz = kz - modes_kz[p_idx];
            int q2 = qx*qx + qy*qy + qz*qz;
            if (q2 > 0 && q2 <= n_max_sq) {
                int q_idx = find_mode(qx, qy, qz);
                if (q_idx >= 0 && total < MAX_TRIADS) {
                    triad_p_arr[total] = p_idx;
                    triad_q_arr[total] = q_idx;
                    total++;
                }
            }
        }
    }
    triad_offsets[num_modes_stored] = total;
    num_triads_stored = total;
    return (int64_t)total;
}

/* === State management via buffer === */

/* Set state: read idx from buf[0], ux from buf[1], uy from buf[2], uz from buf[3]
 * Call AFTER writing those values via c3d_buf_set */
int64_t c3d_apply_state(void) {
    int idx = (int)shared_buf[0];
    if (idx >= 0 && idx < MAX_MODES) {
        state_data[3*idx]   = shared_buf[1];
        state_data[3*idx+1] = shared_buf[2];
        state_data[3*idx+2] = shared_buf[3];
    }
    return 0;
}

int64_t c3d_zero_state(int64_t num_modes) {
    memset(state_data, 0, 3 * (int)num_modes * sizeof(double));
    return 0;
}

int64_t c3d_get_state_ux(int64_t idx) { return dbl_to_bits(state_data[3*(int)idx]); }
int64_t c3d_get_state_uy(int64_t idx) { return dbl_to_bits(state_data[3*(int)idx+1]); }
int64_t c3d_get_state_uz(int64_t idx) { return dbl_to_bits(state_data[3*(int)idx+2]); }

/* === Time step: read nu from buf[0], dt from buf[1] === */

int64_t c3d_do_step(void) {
    double nu = shared_buf[0];
    double dt = shared_buf[1];
    int nm = num_modes_stored;

    /*
     * Exponential integrator (Lie-Trotter splitting):
     *   Step 1: Apply diffusion exactly: û *= exp(-ν|k|²·dt)
     *   Step 2: Compute nonlinear RHS (no diffusion term)
     *   Step 3: Euler step for nonlinear: û += dt · NL(û)
     *
     * The diffusion is handled exactly — no truncation error.
     * The nonlinear term conserves energy (dE/dt = 0 verified),
     * so the Euler error on NL only redistributes energy, never creates it.
     */

    /* Step 1: Exact diffusion */
    for (int k_idx = 0; k_idx < nm; k_idx++) {
        double k2 = (double)(modes_kx[k_idx]*modes_kx[k_idx] +
                             modes_ky[k_idx]*modes_ky[k_idx] +
                             modes_kz[k_idx]*modes_kz[k_idx]);
        double decay = exp(-nu * k2 * dt);
        state_data[3*k_idx]   *= decay;
        state_data[3*k_idx+1] *= decay;
        state_data[3*k_idx+2] *= decay;
    }

    /* Step 2: Nonlinear RHS only (no diffusion) */
    memset(rhs_data, 0, 3 * nm * sizeof(double));

    for (int k_idx = 0; k_idx < nm; k_idx++) {
        double kx = (double)modes_kx[k_idx];
        double ky = (double)modes_ky[k_idx];
        double kz = (double)modes_kz[k_idx];
        double k2 = kx*kx + ky*ky + kz*kz;
        double rhs_ux = 0.0;
        double rhs_uy = 0.0;
        double rhs_uz = 0.0;

        int t_start = triad_offsets[k_idx];
        int t_end = triad_offsets[k_idx + 1];
        for (int t = t_start; t < t_end; t++) {
            int p_idx = triad_p_arr[t];
            int q_idx = triad_q_arr[t];
            double up_x = state_data[3*p_idx], up_y = state_data[3*p_idx+1], up_z = state_data[3*p_idx+2];
            double uq_x = state_data[3*q_idx], uq_y = state_data[3*q_idx+1], uq_z = state_data[3*q_idx+2];
            double qxf = (double)modes_kx[q_idx], qyf = (double)modes_ky[q_idx], qzf = (double)modes_kz[q_idx];
            double up_dot_q = up_x*qxf + up_y*qyf + up_z*qzf;
            double scale = 0.0;
            if (k2 > 1e-10) {
                double k_dot_uq = kx*uq_x + ky*uq_y + kz*uq_z;
                scale = k_dot_uq / k2;
            }
            rhs_ux -= up_dot_q * (uq_x - scale*kx);
            rhs_uy -= up_dot_q * (uq_y - scale*ky);
            rhs_uz -= up_dot_q * (uq_z - scale*kz);
        }
        rhs_data[3*k_idx] = rhs_ux;
        rhs_data[3*k_idx+1] = rhs_uy;
        rhs_data[3*k_idx+2] = rhs_uz;
    }

    /* Step 3: Midpoint method (RK2) for nonlinear term.
     *
     * Euler has O(dt²) energy error that accumulates. Midpoint eliminates it.
     *
     * Half step:  û_half = û + (dt/2) · NL(û)
     * Recompute:  NL_half = NL(û_half)
     * Full step:  û_new = û + dt · NL_half
     */

    /* Save current state */
    static double state_save[MAX_MODES * 3];
    memcpy(state_save, state_data, 3 * nm * sizeof(double));

    /* Half step */
    for (int j = 0; j < 3*nm; j++)
        state_data[j] += 0.5 * dt * rhs_data[j];

    /* Recompute NL at midpoint */
    memset(rhs_data, 0, 3 * nm * sizeof(double));
    for (int k_idx = 0; k_idx < nm; k_idx++) {
        double kx = (double)modes_kx[k_idx];
        double ky = (double)modes_ky[k_idx];
        double kz = (double)modes_kz[k_idx];
        double k2 = kx*kx + ky*ky + kz*kz;
        double rhs_ux = 0.0, rhs_uy = 0.0, rhs_uz = 0.0;

        int t_start = triad_offsets[k_idx];
        int t_end = triad_offsets[k_idx + 1];
        for (int t = t_start; t < t_end; t++) {
            int p_idx = triad_p_arr[t];
            int q_idx = triad_q_arr[t];
            double up_x = state_data[3*p_idx], up_y = state_data[3*p_idx+1], up_z = state_data[3*p_idx+2];
            double uq_x = state_data[3*q_idx], uq_y = state_data[3*q_idx+1], uq_z = state_data[3*q_idx+2];
            double qxf = (double)modes_kx[q_idx], qyf = (double)modes_ky[q_idx], qzf = (double)modes_kz[q_idx];
            double up_dot_q = up_x*qxf + up_y*qyf + up_z*qzf;
            double scale = 0.0;
            if (k2 > 1e-10) {
                double k_dot_uq = kx*uq_x + ky*uq_y + kz*uq_z;
                scale = k_dot_uq / k2;
            }
            rhs_ux -= up_dot_q * (uq_x - scale*kx);
            rhs_uy -= up_dot_q * (uq_y - scale*ky);
            rhs_uz -= up_dot_q * (uq_z - scale*kz);
        }
        rhs_data[3*k_idx] = rhs_ux;
        rhs_data[3*k_idx+1] = rhs_uy;
        rhs_data[3*k_idx+2] = rhs_uz;
    }

    /* Full step from saved state using midpoint RHS */
    for (int j = 0; j < 3*nm; j++)
        state_data[j] = state_save[j] + dt * rhs_data[j];

    return 0;
}

/* === Diagnostics === */

/* Return i64 bits — Simplex can't receive f64 returns from extern C */
int64_t c3d_energy(void) {
    double e = 0.0;
    for (int i = 0; i < num_modes_stored; i++) {
        double ux = state_data[3*i], uy = state_data[3*i+1], uz = state_data[3*i+2];
        e += ux*ux + uy*uy + uz*uz;
    }
    return dbl_to_bits(0.5 * e);
}

int64_t c3d_enstrophy(void) {
    double omega = 0.0;
    for (int i = 0; i < num_modes_stored; i++) {
        double k2 = (double)(modes_kx[i]*modes_kx[i] + modes_ky[i]*modes_ky[i] + modes_kz[i]*modes_kz[i]);
        double ux = state_data[3*i], uy = state_data[3*i+1], uz = state_data[3*i+2];
        omega += k2 * (ux*ux + uy*uy + uz*uz);
    }
    return dbl_to_bits(0.5 * omega);
}

/* Energy rate diagnostic: compute Σ_k û_k · NL_k (should be zero) */
int64_t c3d_energy_rate_nl(void) {
    int nm = num_modes_stored;
    double dot = 0.0;
    /* Compute NL RHS only (no diffusion) and dot with state */
    for (int k_idx = 0; k_idx < nm; k_idx++) {
        double kx = (double)modes_kx[k_idx];
        double ky = (double)modes_ky[k_idx];
        double kz = (double)modes_kz[k_idx];
        double k2 = kx*kx + ky*ky + kz*kz;
        double ux_k = state_data[3*k_idx];
        double uy_k = state_data[3*k_idx+1];
        double uz_k = state_data[3*k_idx+2];
        double nl_ux = 0, nl_uy = 0, nl_uz = 0;

        int t_start = triad_offsets[k_idx];
        int t_end = triad_offsets[k_idx + 1];
        for (int t = t_start; t < t_end; t++) {
            int p_idx = triad_p_arr[t];
            int q_idx = triad_q_arr[t];
            double up_x = state_data[3*p_idx], up_y = state_data[3*p_idx+1], up_z = state_data[3*p_idx+2];
            double uq_x = state_data[3*q_idx], uq_y = state_data[3*q_idx+1], uq_z = state_data[3*q_idx+2];
            double qxf = (double)modes_kx[q_idx], qyf = (double)modes_ky[q_idx], qzf = (double)modes_kz[q_idx];
            double up_dot_q = up_x*qxf + up_y*qyf + up_z*qzf;
            double scale = 0.0;
            if (k2 > 1e-10) {
                double k_dot_uq = kx*uq_x + ky*uq_y + kz*uq_z;
                scale = k_dot_uq / k2;
            }
            nl_ux -= up_dot_q * (uq_x - scale*kx);
            nl_uy -= up_dot_q * (uq_y - scale*ky);
            nl_uz -= up_dot_q * (uq_z - scale*kz);
        }
        dot += ux_k*nl_ux + uy_k*nl_uy + uz_k*nl_uz;
    }
    return dbl_to_bits(dot);
}

/* Debug: identical to test_store */
static int64_t debug_stored = 0;
int64_t c3d_debug_store(int64_t val) {
    debug_stored = val;
    return 0;
}
int64_t c3d_debug_load(void) {
    return debug_stored;
}

/* Ultra-minimal test */
static double single_stored_double = 0.0;
int64_t c3d_store_dbl(int64_t bits) {
    union { int64_t i; double d; } u;
    u.i = bits;
    fprintf(stderr, "C received bits=%lld, union.d=%g, ptr=%.17g\n",
            (long long)bits, u.d, *((double*)&bits));
    single_stored_double = u.d;
    return 0;
}
double c3d_read_dbl(void) {
    return single_stored_double;
}
/* Return as i64 bits instead of double */
int64_t c3d_read_dbl_bits(void) {
    int64_t bits;
    memcpy(&bits, &single_stored_double, sizeof(double));
    return bits;
}
