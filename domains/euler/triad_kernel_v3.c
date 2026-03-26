/*
 * triad_kernel_v3.c — Complex Fourier coefficients with correct -i factor
 *
 * v2 bug: treated Fourier coefficients as real and omitted the -i factor
 * in the NS bilinear form. This broke energy conservation.
 *
 * v3 fix: each mode stores complex coefficients (6 doubles: re/im for ux,uy,uz).
 * The nonlinear term correctly includes -i:
 *   dû_k/dt = -ν|k|²û_k - i Σ_{p+q=k} (û_p · q) P_k(û_q)
 *
 * For real velocity fields, we enforce û_{-k} = conj(û_k) at initialization.
 * The evolution preserves this symmetry if the coupling is correct.
 *
 * Energy conservation identity: Σ_k Re(conj(û_k) · NL_k) = 0
 * This must hold EXACTLY (up to floating point) for the solver to be correct.
 *
 * Interface: same buffer-based API as v2 for compatibility.
 * State now: state_data[6*idx + 0..5] = re(ux), im(ux), re(uy), im(uy), re(uz), im(uz)
 * External API still uses real values for set/get (imaginary part accessible via separate calls).
 */

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define MAX_MODES 100000
#define MAX_TRIADS 50000000

/* Complex state: 6 doubles per mode (re_ux, im_ux, re_uy, im_uy, re_uz, im_uz) */
static double state_data[MAX_MODES * 6];
static double rhs_data[MAX_MODES * 6];
static int modes_kx[MAX_MODES];
static int modes_ky[MAX_MODES];
static int modes_kz[MAX_MODES];
static int triad_p_arr[MAX_TRIADS];
static int triad_q_arr[MAX_TRIADS];
static int triad_offsets[MAX_MODES + 1];
static int num_modes_stored = 0;
static int num_triads_stored = 0;

static int64_t dbl_to_bits(double v) {
    int64_t bits; memcpy(&bits, &v, sizeof(double)); return bits;
}

#define BUF_SIZE 16
static double shared_buf[BUF_SIZE];
static int64_t pending_buf_index = 0;

int64_t c3d_buf_idx(int64_t index) { pending_buf_index = index; return 0; }

int64_t c3d_buf_val(int64_t val_bits) {
    if (pending_buf_index >= 0 && pending_buf_index < BUF_SIZE) {
        union { int64_t i; double d; } u; u.i = val_bits;
        shared_buf[pending_buf_index] = u.d;
    }
    return 0;
}

int64_t c3d_buf_read(int64_t index) {
    if (index >= 0 && index < BUF_SIZE) return dbl_to_bits(shared_buf[index]);
    return dbl_to_bits(0.0);
}

/* === Mode enumeration (same as v2) === */

int64_t c3d_count_modes(int64_t n_max) {
    int count = 0, n2 = (int)(n_max * n_max);
    for (int kx = -(int)n_max; kx <= (int)n_max; kx++)
        for (int ky = -(int)n_max; ky <= (int)n_max; ky++)
            for (int kz = -(int)n_max; kz <= (int)n_max; kz++) {
                int r2 = kx*kx + ky*ky + kz*kz;
                if (r2 > 0 && r2 <= n2) count++;
            }
    return (int64_t)count;
}

int64_t c3d_enumerate_modes(int64_t n_max) {
    int idx = 0, n2 = (int)(n_max * n_max);
    for (int kx = -(int)n_max; kx <= (int)n_max; kx++)
        for (int ky = -(int)n_max; ky <= (int)n_max; ky++)
            for (int kz = -(int)n_max; kz <= (int)n_max; kz++) {
                int r2 = kx*kx + ky*ky + kz*kz;
                if (r2 > 0 && r2 <= n2 && idx < MAX_MODES) {
                    modes_kx[idx] = kx; modes_ky[idx] = ky; modes_kz[idx] = kz;
                    idx++;
                }
            }
    num_modes_stored = idx;
    return (int64_t)idx;
}

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < num_modes_stored; i++)
        if (modes_kx[i] == kx && modes_ky[i] == ky && modes_kz[i] == kz) return i;
    return -1;
}

int64_t c3d_get_kx(int64_t idx) { return (int64_t)modes_kx[(int)idx]; }
int64_t c3d_get_ky(int64_t idx) { return (int64_t)modes_ky[(int)idx]; }
int64_t c3d_get_kz(int64_t idx) { return (int64_t)modes_kz[(int)idx]; }
int64_t c3d_get_num_modes(void) { return (int64_t)num_modes_stored; }
int64_t c3d_get_num_triads(void) { return (int64_t)num_triads_stored; }

/* === Triad precomputation (same as v2) === */

int64_t c3d_precompute_triads(int64_t n_max) {
    int n_max_sq = (int)(n_max * n_max);
    int total = 0;
    for (int k_idx = 0; k_idx < num_modes_stored; k_idx++) {
        triad_offsets[k_idx] = total;
        int kx = modes_kx[k_idx], ky = modes_ky[k_idx], kz = modes_kz[k_idx];
        for (int p_idx = 0; p_idx < num_modes_stored; p_idx++) {
            int qx = kx - modes_kx[p_idx], qy = ky - modes_ky[p_idx], qz = kz - modes_kz[p_idx];
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

/* === State management ===
 * External API sets REAL coefficients (for real velocity fields).
 * Internally we store complex, with imaginary part = 0 for the set mode
 * and the conjugate relation û_{-k} = conj(û_k) enforced.
 */

int64_t c3d_apply_state(void) {
    int idx = (int)shared_buf[0];
    if (idx >= 0 && idx < MAX_MODES) {
        double ux = shared_buf[1], uy = shared_buf[2], uz = shared_buf[3];
        /* Set this mode only: real part = value, imaginary part = 0.
         * Do NOT enforce conjugate symmetry here — it causes ordering
         * issues when modes are set sequentially (later modes overwrite
         * earlier conjugates). Instead, call c3d_enforce_symmetry()
         * AFTER all modes are set. */
        state_data[6*idx]   = ux;  state_data[6*idx+1] = 0.0;
        state_data[6*idx+2] = uy;  state_data[6*idx+3] = 0.0;
        state_data[6*idx+4] = uz;  state_data[6*idx+5] = 0.0;
    }
    return 0;
}

/* Enforce conjugate symmetry û_{-k} = conj(û_k) for all modes.
 * Call ONCE after all modes are set via apply_state.
 * Convention: for each pair (k, -k), keep the one with the larger index. */
int64_t c3d_enforce_symmetry(void) {
    for (int i = 0; i < num_modes_stored; i++) {
        int mk = find_mode(-modes_kx[i], -modes_ky[i], -modes_kz[i]);
        if (mk >= 0 && mk > i) {
            /* Set -k to be conjugate of k */
            state_data[6*mk]   =  state_data[6*i];    /* re same */
            state_data[6*mk+1] = -state_data[6*i+1];  /* im negated */
            state_data[6*mk+2] =  state_data[6*i+2];
            state_data[6*mk+3] = -state_data[6*i+3];
            state_data[6*mk+4] =  state_data[6*i+4];
            state_data[6*mk+5] = -state_data[6*i+5];
        }
    }
    return 0;
}

int64_t c3d_zero_state(int64_t num_modes) {
    memset(state_data, 0, 6 * (int)num_modes * sizeof(double));
    return 0;
}

/* Get real part of state (for compatibility with v2 API) */
int64_t c3d_get_state_ux(int64_t idx) { return dbl_to_bits(state_data[6*(int)idx]); }
int64_t c3d_get_state_uy(int64_t idx) { return dbl_to_bits(state_data[6*(int)idx+2]); }
int64_t c3d_get_state_uz(int64_t idx) { return dbl_to_bits(state_data[6*(int)idx+4]); }

/* === Time step with correct complex arithmetic ===
 *
 * The NS nonlinear term in Fourier space:
 *   NL_k = -i Σ_{p+q=k} (û_p · q) P_k(û_q)
 *
 * Where:
 *   û_p · q = Σ_j (û_p)_j * q_j    (complex dot with real q)
 *   P_k(v) = v - (k·v/|k|²)k       (Leray projection, k is real)
 *
 * Multiplication by -i: (a + bi) * (-i) = b - ai
 *   So: re(result) = im(input), im(result) = -re(input)
 */

int64_t c3d_do_step(void) {
    double nu = shared_buf[0];
    double dt = shared_buf[1];
    int nm = num_modes_stored;

    /* Step 1: Exact diffusion */
    for (int k_idx = 0; k_idx < nm; k_idx++) {
        double k2 = (double)(modes_kx[k_idx]*modes_kx[k_idx] +
                             modes_ky[k_idx]*modes_ky[k_idx] +
                             modes_kz[k_idx]*modes_kz[k_idx]);
        double decay = exp(-nu * k2 * dt);
        for (int c = 0; c < 6; c++)
            state_data[6*k_idx + c] *= decay;
    }

    /* Step 2: Compute complex nonlinear RHS */
    memset(rhs_data, 0, 6 * nm * sizeof(double));

    for (int k_idx = 0; k_idx < nm; k_idx++) {
        double kx = (double)modes_kx[k_idx];
        double ky = (double)modes_ky[k_idx];
        double kz = (double)modes_kz[k_idx];
        double k2 = kx*kx + ky*ky + kz*kz;

        /* Accumulate: NL_before_i = Σ (û_p·q) P_k(û_q) */
        double nl_re_ux = 0, nl_im_ux = 0;
        double nl_re_uy = 0, nl_im_uy = 0;
        double nl_re_uz = 0, nl_im_uz = 0;

        int t_start = triad_offsets[k_idx];
        int t_end = triad_offsets[k_idx + 1];
        for (int t = t_start; t < t_end; t++) {
            int p_idx = triad_p_arr[t];
            int q_idx = triad_q_arr[t];

            /* û_p (complex) */
            double up_re_x = state_data[6*p_idx],   up_im_x = state_data[6*p_idx+1];
            double up_re_y = state_data[6*p_idx+2], up_im_y = state_data[6*p_idx+3];
            double up_re_z = state_data[6*p_idx+4], up_im_z = state_data[6*p_idx+5];

            /* û_q (complex) */
            double uq_re_x = state_data[6*q_idx],   uq_im_x = state_data[6*q_idx+1];
            double uq_re_y = state_data[6*q_idx+2], uq_im_y = state_data[6*q_idx+3];
            double uq_re_z = state_data[6*q_idx+4], uq_im_z = state_data[6*q_idx+5];

            /* q wavevector (real) */
            double qxf = (double)modes_kx[q_idx];
            double qyf = (double)modes_ky[q_idx];
            double qzf = (double)modes_kz[q_idx];

            /* û_p · q (complex dot with real vector) */
            double updq_re = up_re_x*qxf + up_re_y*qyf + up_re_z*qzf;
            double updq_im = up_im_x*qxf + up_im_y*qyf + up_im_z*qzf;

            /* P_k(û_q) = û_q - (k·û_q/|k|²)k */
            /* k·û_q (complex dot with real k) */
            double kduq_re = kx*uq_re_x + ky*uq_re_y + kz*uq_re_z;
            double kduq_im = kx*uq_im_x + ky*uq_im_y + kz*uq_im_z;

            double scale_re = 0, scale_im = 0;
            if (k2 > 1e-10) {
                scale_re = kduq_re / k2;
                scale_im = kduq_im / k2;
            }

            /* P_k(û_q) components (complex) */
            double pq_re_x = uq_re_x - scale_re*kx;
            double pq_im_x = uq_im_x - scale_im*kx;
            double pq_re_y = uq_re_y - scale_re*ky;
            double pq_im_y = uq_im_y - scale_im*ky;
            double pq_re_z = uq_re_z - scale_re*kz;
            double pq_im_z = uq_im_z - scale_im*kz;

            /* (û_p·q) * P_k(û_q) — complex multiplication */
            /* (a+bi)(c+di) = (ac-bd) + (ad+bc)i */
            nl_re_ux += updq_re*pq_re_x - updq_im*pq_im_x;
            nl_im_ux += updq_re*pq_im_x + updq_im*pq_re_x;
            nl_re_uy += updq_re*pq_re_y - updq_im*pq_im_y;
            nl_im_uy += updq_re*pq_im_y + updq_im*pq_re_y;
            nl_re_uz += updq_re*pq_re_z - updq_im*pq_im_z;
            nl_im_uz += updq_re*pq_im_z + updq_im*pq_re_z;
        }

        /* Apply -i: (a+bi)*(-i) = b - ai → re = im_old, im = -re_old */
        rhs_data[6*k_idx]   =  nl_im_ux;  rhs_data[6*k_idx+1] = -nl_re_ux;
        rhs_data[6*k_idx+2] =  nl_im_uy;  rhs_data[6*k_idx+3] = -nl_re_uy;
        rhs_data[6*k_idx+4] =  nl_im_uz;  rhs_data[6*k_idx+5] = -nl_re_uz;
    }

    /* Step 3: Euler step for nonlinear term */
    for (int j = 0; j < 6*nm; j++)
        state_data[j] += dt * rhs_data[j];

    return 0;
}

/* === Diagnostics === */

int64_t c3d_energy(void) {
    double e = 0.0;
    for (int i = 0; i < num_modes_stored; i++) {
        double re_x = state_data[6*i],   im_x = state_data[6*i+1];
        double re_y = state_data[6*i+2], im_y = state_data[6*i+3];
        double re_z = state_data[6*i+4], im_z = state_data[6*i+5];
        e += re_x*re_x + im_x*im_x + re_y*re_y + im_y*im_y + re_z*re_z + im_z*im_z;
    }
    return dbl_to_bits(0.5 * e);
}

int64_t c3d_enstrophy(void) {
    double omega = 0.0;
    for (int i = 0; i < num_modes_stored; i++) {
        double k2 = (double)(modes_kx[i]*modes_kx[i] + modes_ky[i]*modes_ky[i] + modes_kz[i]*modes_kz[i]);
        double re_x = state_data[6*i],   im_x = state_data[6*i+1];
        double re_y = state_data[6*i+2], im_y = state_data[6*i+3];
        double re_z = state_data[6*i+4], im_z = state_data[6*i+5];
        omega += k2 * (re_x*re_x + im_x*im_x + re_y*re_y + im_y*im_y + re_z*re_z + im_z*im_z);
    }
    return dbl_to_bits(0.5 * omega);
}

/* Energy rate diagnostic: Σ_k Re(conj(û_k) · NL_k) — must be zero */
int64_t c3d_energy_rate_nl(void) {
    int nm = num_modes_stored;
    /* Compute NL RHS */
    double *nl = (double*)calloc(6 * nm, sizeof(double));
    if (!nl) return dbl_to_bits(0.0);

    for (int k_idx = 0; k_idx < nm; k_idx++) {
        double kx = (double)modes_kx[k_idx];
        double ky = (double)modes_ky[k_idx];
        double kz = (double)modes_kz[k_idx];
        double k2 = kx*kx + ky*ky + kz*kz;

        double nl_re_ux=0,nl_im_ux=0,nl_re_uy=0,nl_im_uy=0,nl_re_uz=0,nl_im_uz=0;

        int t_start = triad_offsets[k_idx];
        int t_end = triad_offsets[k_idx + 1];
        for (int t = t_start; t < t_end; t++) {
            int p_idx = triad_p_arr[t], q_idx = triad_q_arr[t];
            double up_re_x=state_data[6*p_idx],up_im_x=state_data[6*p_idx+1];
            double up_re_y=state_data[6*p_idx+2],up_im_y=state_data[6*p_idx+3];
            double up_re_z=state_data[6*p_idx+4],up_im_z=state_data[6*p_idx+5];
            double uq_re_x=state_data[6*q_idx],uq_im_x=state_data[6*q_idx+1];
            double uq_re_y=state_data[6*q_idx+2],uq_im_y=state_data[6*q_idx+3];
            double uq_re_z=state_data[6*q_idx+4],uq_im_z=state_data[6*q_idx+5];
            double qxf=(double)modes_kx[q_idx],qyf=(double)modes_ky[q_idx],qzf=(double)modes_kz[q_idx];

            double updq_re = up_re_x*qxf+up_re_y*qyf+up_re_z*qzf;
            double updq_im = up_im_x*qxf+up_im_y*qyf+up_im_z*qzf;

            double kduq_re = kx*uq_re_x+ky*uq_re_y+kz*uq_re_z;
            double kduq_im = kx*uq_im_x+ky*uq_im_y+kz*uq_im_z;
            double sc_re=0,sc_im=0;
            if(k2>1e-10){sc_re=kduq_re/k2;sc_im=kduq_im/k2;}

            double pq_re_x=uq_re_x-sc_re*kx, pq_im_x=uq_im_x-sc_im*kx;
            double pq_re_y=uq_re_y-sc_re*ky, pq_im_y=uq_im_y-sc_im*ky;
            double pq_re_z=uq_re_z-sc_re*kz, pq_im_z=uq_im_z-sc_im*kz;

            nl_re_ux += updq_re*pq_re_x - updq_im*pq_im_x;
            nl_im_ux += updq_re*pq_im_x + updq_im*pq_re_x;
            nl_re_uy += updq_re*pq_re_y - updq_im*pq_im_y;
            nl_im_uy += updq_re*pq_im_y + updq_im*pq_re_y;
            nl_re_uz += updq_re*pq_re_z - updq_im*pq_im_z;
            nl_im_uz += updq_re*pq_im_z + updq_im*pq_re_z;
        }
        /* Apply -i */
        nl[6*k_idx]  = nl_im_ux; nl[6*k_idx+1]=-nl_re_ux;
        nl[6*k_idx+2]= nl_im_uy; nl[6*k_idx+3]=-nl_re_uy;
        nl[6*k_idx+4]= nl_im_uz; nl[6*k_idx+5]=-nl_re_uz;
    }

    /* Σ Re(conj(û) · NL) = Σ (re_u*re_nl + im_u*im_nl) */
    double dot = 0;
    for (int i = 0; i < nm; i++) {
        for (int c = 0; c < 6; c += 2) {
            double re_u = state_data[6*i+c], im_u = state_data[6*i+c+1];
            double re_n = nl[6*i+c],         im_n = nl[6*i+c+1];
            dot += re_u*re_n + im_u*im_n;  /* Re(conj(u)*n) = re_u*re_n + im_u*im_n */
        }
    }
    free(nl);
    return dbl_to_bits(dot);
}

/* Debug */
static int64_t debug_stored = 0;
int64_t c3d_debug_store(int64_t val) { debug_stored = val; return 0; }
int64_t c3d_debug_load(void) { return debug_stored; }

static double single_stored_double = 0.0;
int64_t c3d_store_dbl(int64_t bits) {
    union { int64_t i; double d; } u; u.i = bits;
    single_stored_double = u.d; return 0;
}
int64_t c3d_load_dbl(void) { return dbl_to_bits(single_stored_double); }
