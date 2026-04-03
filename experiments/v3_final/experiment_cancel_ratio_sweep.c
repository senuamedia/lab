/*
 * experiment_cancel_ratio_sweep.c — Pin down the ~35% cancellation ratio
 *
 * Measures the per-shell cancellation ratio |T_K| / Σ|contrib_i|
 * across multiple conditions to determine:
 *   1. Is the ~35% universal?
 *   2. Does it depend on the -i factor? (compare with/without)
 *   3. Does it depend on the Leray projection? (compare with/without)
 *   4. How does it depend on A, ν, α, t?
 *
 * The experiment computes T_K three ways:
 *   (a) Full: with -i factor and Leray projection P_k (the correct NS)
 *   (b) No -i: without -i (real coupling, like the v2 bug)
 *   (c) No Leray: without P_k (identity instead of projection)
 *
 * BUILD:
 *   clang -O3 experiments/experiment_cancel_ratio_sweep.c \
 *         src/triad_kernel_v3_accessible.c -o build/cancel_sweep -lm
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

#define MAX_BASE 500
static int bkx[MAX_BASE], bky[MAX_BASE], bkz[MAX_BASE];
static double bux_s[MAX_BASE], buy_s[MAX_BASE], buz_s[MAX_BASE];
static int nbm = 0;

static void ic_spectral(int n_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i] = (int)c3d_get_kx(i); bky[i] = (int)c3d_get_ky(i); bkz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp * pow(km, -alpha);
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (bkz[i] != 0) uz = -((double)bkx[i]*ux+(double)bky[i]*uy)/(double)bkz[i];
        else if (bky[i] != 0) uy = -(double)bkx[i]*ux/(double)bky[i];
        else ux = 0.0;
        bux_s[i] = ux; buy_s[i] = uy; buz_s[i] = uz;
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
                buf_set(0,(double)i); buf_set(1,bux_s[j]); buf_set(2,buy_s[j]); buf_set(3,buz_s[j]);
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

#define MAX_MODES 3000

/*
 * Compute cancellation ratio at interior shells (K=3..N-2) for three variants:
 *   mode=0: Full (with -i and Leray) — the correct NS
 *   mode=1: No -i (real coupling)
 *   mode=2: No Leray (P_k = identity)
 *
 * Returns the average cancellation ratio across interior shells.
 */
static double measure_cancel_ratio(int N, int nm, int mode, double *per_shell, int n_shells) {
    int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
    double ur[MAX_MODES][3], ui[MAX_MODES][3];

    for (int i = 0; i < nm && i < MAX_MODES; i++) {
        mkx[i] = (int)c3d_get_kx(i);
        mky[i] = (int)c3d_get_ky(i);
        mkz[i] = (int)c3d_get_kz(i);
        ur[i][0] = bits_to_dbl(c3d_get_state_ux(i));
        ui[i][0] = bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1] = bits_to_dbl(c3d_get_state_uy(i));
        ui[i][1] = bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2] = bits_to_dbl(c3d_get_state_uz(i));
        ui[i][2] = bits_to_dbl(c3d_get_state_uz_im(i));
    }

    int n_max_sq = N * N;
    double total_ratio = 0;
    int n_counted = 0;

    for (int K = 3; K <= N-2 && K <= n_shells; K++) {
        double T_signed = 0, T_abs = 0;

        for (int k_idx = 0; k_idx < nm; k_idx++) {
            int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
            int k2 = kx*kx + ky*ky + kz*kz;
            int shell = (int)(sqrt((double)k2) + 0.5);
            if (shell != K) continue;

            for (int p_idx = 0; p_idx < nm; p_idx++) {
                int qx = kx - mkx[p_idx], qy = ky - mky[p_idx], qz = kz - mkz[p_idx];
                int q2 = qx*qx + qy*qy + qz*qz;
                if (q2 <= 0 || q2 > n_max_sq) continue;

                int q_idx = -1;
                for (int qi = 0; qi < nm; qi++) {
                    if (mkx[qi]==qx && mky[qi]==qy && mkz[qi]==qz) { q_idx = qi; break; }
                }
                if (q_idx < 0) continue;

                /* û_p · q */
                double updq_re = ur[p_idx][0]*(double)qx + ur[p_idx][1]*(double)qy + ur[p_idx][2]*(double)qz;
                double updq_im = ui[p_idx][0]*(double)qx + ui[p_idx][1]*(double)qy + ui[p_idx][2]*(double)qz;

                /* P_k(û_q) or just û_q depending on mode */
                double pq_re[3], pq_im[3];
                if (mode == 2) {
                    /* No Leray: P_k = identity */
                    for (int c = 0; c < 3; c++) {
                        pq_re[c] = ur[q_idx][c];
                        pq_im[c] = ui[q_idx][c];
                    }
                } else {
                    /* With Leray projection */
                    double kduq_re = (double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
                    double kduq_im = (double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
                    double sc_re = kduq_re/(double)k2, sc_im = kduq_im/(double)k2;
                    for (int c = 0; c < 3; c++) {
                        double kc = (c==0)?(double)kx:(c==1)?(double)ky:(double)kz;
                        pq_re[c] = ur[q_idx][c] - sc_re*kc;
                        pq_im[c] = ui[q_idx][c] - sc_im*kc;
                    }
                }

                /* (updq) * (pq) complex mult per component, then apply -i (or not) */
                double nl_re[3], nl_im[3];
                for (int c = 0; c < 3; c++) {
                    double prod_re = updq_re*pq_re[c] - updq_im*pq_im[c];
                    double prod_im = updq_re*pq_im[c] + updq_im*pq_re[c];
                    if (mode == 1) {
                        /* No -i: skip the -i multiplication */
                        nl_re[c] = prod_re;
                        nl_im[c] = prod_im;
                    } else {
                        /* With -i: (a+bi)(-i) = b - ai */
                        nl_re[c] = prod_im;
                        nl_im[c] = -prod_re;
                    }
                }

                /* Re(conj(û_k) · NL) */
                double contrib = 0;
                for (int c = 0; c < 3; c++)
                    contrib += ur[k_idx][c]*nl_re[c] + ui[k_idx][c]*nl_im[c];

                T_signed += contrib;
                T_abs += fabs(contrib);
            }
        }

        double r = (T_abs > 1e-30) ? fabs(T_signed) / T_abs : 0;
        if (K-3 < n_shells) per_shell[K-3] = r;
        total_ratio += r;
        n_counted++;
    }

    return (n_counted > 0) ? total_ratio / n_counted : 0;
}

int main(void) {
    int N = 8;
    int n_base = 3;
    double nu = 0.01;
    double dt = 0.0001;

    printf("################################################################\n");
    printf("#  CANCELLATION RATIO DECOMPOSITION                            #\n");
    printf("#                                                              #\n");
    printf("#  Measures |T_K|/Σ|contrib| with three coupling variants:    #\n");
    printf("#    Full:     -i factor + Leray projection (correct NS)      #\n");
    printf("#    No -i:    real coupling only (v2 bug equivalent)         #\n");
    printf("#    No Leray: identity instead of P_k                        #\n");
    printf("#                                                              #\n");
    printf("#  Also sweeps A, α, time.                                    #\n");
    printf("#  Interior shells K=3..%d only (avoid boundary effects).     #\n", N-2);
    printf("################################################################\n\n");
    fflush(stdout);

    /* === Part 1: Decompose by coupling variant === */
    printf("  === PART 1: Coupling variant decomposition (A=0.30, α=1, t=0.05) ===\n\n");

    double amp = 0.30, alpha = 1.0;
    ic_spectral(n_base, amp, alpha);
    apply_ic(N);
    int nm = (int)c3d_get_num_modes();
    buf_set(0, nu); buf_set(1, dt);
    for (int s = 0; s < 500; s++) c3d_do_step();

    double ps[10];
    const char *mode_names[] = {"Full (-i + Leray)", "No -i (real)", "No Leray (P=I)"};

    printf("  Variant              avg ratio   K=3      K=4      K=5      K=6\n");
    printf("  -------------------  ---------   ------   ------   ------   ------\n");

    for (int mode = 0; mode < 3; mode++) {
        double avg = measure_cancel_ratio(N, nm, mode, ps, 10);
        printf("  %-19s  %9.4f   %6.4f   %6.4f   %6.4f   %6.4f\n",
               mode_names[mode], avg, ps[0], ps[1], ps[2], ps[3]);
        fflush(stdout);
    }
    printf("\n");

    /* === Part 2: Universality across A, α, time === */
    printf("  === PART 2: Universality (Full coupling, interior shells K=3..6) ===\n\n");
    printf("  A      α     t       avg ratio    K=3      K=4      K=5      K=6\n");
    printf("  -----  ----  ------  ---------    ------   ------   ------   ------\n");

    double amps[] = {0.10, 0.20, 0.30};
    double alphas[] = {0.0, 1.0, 2.0};
    int steps_list[] = {500, 2000};
    double times[] = {0.05, 0.20};

    for (int ai = 0; ai < 3; ai++)
    for (int si = 0; si < 3; si++)
    for (int ti = 0; ti < 2; ti++) {
        ic_spectral(n_base, amps[ai], alphas[si]);
        apply_ic(N);
        nm = (int)c3d_get_num_modes();
        buf_set(0, nu); buf_set(1, dt);
        for (int s = 0; s < steps_list[ti]; s++) c3d_do_step();

        double avg = measure_cancel_ratio(N, nm, 0, ps, 10);
        printf("  %.2f   %.1f   %.4f  %9.4f    %6.4f   %6.4f   %6.4f   %6.4f\n",
               amps[ai], alphas[si], times[ti], avg, ps[0], ps[1], ps[2], ps[3]);
        fflush(stdout);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  INTERPRETATION:                                             #\n");
    printf("#                                                              #\n");
    printf("#  If 'Full' ratio < 'No -i': the -i factor provides cancel.  #\n");
    printf("#  If 'Full' ratio < 'No Leray': Leray provides cancel.       #\n");
    printf("#  If ratio is constant across A,α,t: it's universal.         #\n");
    printf("#                                                              #\n");
    printf("#  The ratio = 1 - (fraction cancelled).                       #\n");
    printf("#  ratio ≈ 0.35 means 65%% of energy cancels within shell.    #\n");
    printf("################################################################\n");

    return 0;
}
