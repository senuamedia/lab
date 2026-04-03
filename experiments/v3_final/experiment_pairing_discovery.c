/*
 * experiment_pairing_discovery.c — Find the structural pairing that forces 50/50
 *
 * Three candidate pairings:
 *
 *   1. CONJUGATE PAIRING: (p,q,k) paired with (-p,-q,-k)
 *      The reality condition û_{-k} = conj(û_k) means these are related.
 *      If c(p,q,k) = -c(-p,-q,-k): perfect structural antisymmetry.
 *
 *   2. OCTAHEDRAL PAIRING: (p,q,k) paired with (Rp,Rq,Rk) for R in O_h
 *      The 48-element symmetry group of Z³. Triad contributions under
 *      rotation/reflection may cancel in symmetric groups.
 *
 *   3. SCALE-DEPENDENT CANCELLATION: measure the cancellation ratio
 *      as a function of K, and test if it correlates with the number
 *      of triads (more triads → more cancellation → cascade self-destructs).
 *
 * BUILD:
 *   clang -O3 experiments/experiment_pairing_discovery.c \
 *         src/triad_kernel_v3_accessible.c -o build/pairing -lm
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
static int bkx_s[MAX_BASE], bky_s[MAX_BASE], bkz_s[MAX_BASE];
static double bux_s[MAX_BASE], buy_s[MAX_BASE], buz_s[MAX_BASE];
static int nbm = 0;

static void ic_distributed(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx_s[i] = (int)c3d_get_kx(i); bky_s[i] = (int)c3d_get_ky(i); bkz_s[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx_s[i]*bkx_s[i]+bky_s[i]*bky_s[i]+bkz_s[i]*bkz_s[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (bkz_s[i] != 0) uz = -((double)bkx_s[i]*ux+(double)bky_s[i]*uy)/(double)bkz_s[i];
        else if (bky_s[i] != 0) uy = -(double)bkx_s[i]*ux/(double)bky_s[i];
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
            if (bkx_s[j]==kx && bky_s[j]==ky && bkz_s[j]==kz) {
                buf_set(0,(double)i); buf_set(1,bux_s[j]); buf_set(2,buy_s[j]); buf_set(3,buz_s[j]);
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

#define MAX_MODES 3000
#define MSH 12

static int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
static double ur[MAX_MODES][3], ui[MAX_MODES][3];
static int nm_g;

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < nm_g; i++)
        if (mkx[i]==kx && mky[i]==ky && mkz[i]==kz) return i;
    return -1;
}

static double triad_contrib(int k_idx, int p_idx, int q_idx) {
    int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
    int k2 = kx*kx + ky*ky + kz*kz;
    int qx = mkx[q_idx], qy = mky[q_idx], qz = mkz[q_idx];

    double updq_re = ur[p_idx][0]*(double)qx + ur[p_idx][1]*(double)qy + ur[p_idx][2]*(double)qz;
    double updq_im = ui[p_idx][0]*(double)qx + ui[p_idx][1]*(double)qy + ui[p_idx][2]*(double)qz;

    double kduq_re = (double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
    double kduq_im = (double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
    double sc_re = kduq_re/(double)k2, sc_im = kduq_im/(double)k2;

    double contrib = 0;
    for (int c = 0; c < 3; c++) {
        double kc = (c==0)?(double)kx:(c==1)?(double)ky:(double)kz;
        double pq_re = ur[q_idx][c] - sc_re*kc;
        double pq_im = ui[q_idx][c] - sc_im*kc;
        double prod_re = updq_re*pq_re - updq_im*pq_im;
        double prod_im = updq_re*pq_im + updq_im*pq_re;
        double nl_re = prod_im;
        double nl_im = -prod_re;
        contrib += ur[k_idx][c]*nl_re + ui[k_idx][c]*nl_im;
    }
    return contrib;
}

int main(void) {
    int N = 8;
    double amp = 0.30;
    double nu = 0.01;
    double dt = 0.0001;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  PAIRING DISCOVERY                                           #\n");
    printf("#                                                              #\n");
    printf("#  1. Conjugate: (p,q,k) vs (-p,-q,-k)                       #\n");
    printf("#  2. Scale-dependent cancellation vs triad count              #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f                                               #\n", N, amp);
    printf("################################################################\n\n");
    fflush(stdout);

    ic_distributed(n_base, amp);
    apply_ic(N);
    nm_g = (int)c3d_get_num_modes();

    buf_set(0, nu); buf_set(1, dt);
    for (int s = 0; s < 500; s++) c3d_do_step();

    for (int i = 0; i < nm_g && i < MAX_MODES; i++) {
        mkx[i] = (int)c3d_get_kx(i); mky[i] = (int)c3d_get_ky(i); mkz[i] = (int)c3d_get_kz(i);
        ur[i][0] = bits_to_dbl(c3d_get_state_ux(i));
        ui[i][0] = bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1] = bits_to_dbl(c3d_get_state_uy(i));
        ui[i][1] = bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2] = bits_to_dbl(c3d_get_state_uz(i));
        ui[i][2] = bits_to_dbl(c3d_get_state_uz_im(i));
    }

    int n_max_sq = N * N;

    /* ============================================================
     * TEST 1: CONJUGATE PAIRING
     * For triad (p,q,k) at mode k, the conjugate triad is
     * (-p,-q,-k) at mode -k.
     * Due to reality: û_{-k} = conj(û_k)
     * Does c(p,q,k) = -c(-p,-q,-k)?
     * ============================================================ */
    printf("  === TEST 1: Conjugate pairing (p,q,k) vs (-p,-q,-k) ===\n\n");

    long conj_pairs = 0, conj_exact_anti = 0;
    double conj_sum_ratio = 0;
    double conj_sum_pair_sum = 0, conj_sum_pair_abs = 0;

    for (int k_idx = 0; k_idx < nm_g; k_idx++) {
        int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
        int k2 = kx*kx + ky*ky + kz*kz;

        /* Find the conjugate mode -k */
        int mk_idx = find_mode(-kx, -ky, -kz);
        if (mk_idx < 0 || mk_idx <= k_idx) continue; /* avoid double-counting */

        for (int p_idx = 0; p_idx < nm_g; p_idx++) {
            int qx = kx-mkx[p_idx], qy = ky-mky[p_idx], qz = kz-mkz[p_idx];
            int q2 = qx*qx+qy*qy+qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;
            int q_idx = find_mode(qx, qy, qz);
            if (q_idx < 0) continue;

            /* Find conjugate triad: -p, -q at mode -k */
            int mp_idx = find_mode(-mkx[p_idx], -mky[p_idx], -mkz[p_idx]);
            int mq_idx = find_mode(-qx, -qy, -qz);
            if (mp_idx < 0 || mq_idx < 0) continue;

            double c_orig = triad_contrib(k_idx, p_idx, q_idx);
            double c_conj = triad_contrib(mk_idx, mp_idx, mq_idx);

            if (fabs(c_orig) < 1e-30 && fabs(c_conj) < 1e-30) continue;

            conj_pairs++;
            double pair_sum = fabs(c_orig + c_conj);
            double pair_abs = fabs(c_orig) + fabs(c_conj);
            conj_sum_pair_sum += pair_sum;
            conj_sum_pair_abs += pair_abs;

            if (pair_abs > 1e-30) {
                double ratio = pair_sum / pair_abs;
                conj_sum_ratio += ratio;
                if (ratio < 0.01) conj_exact_anti++;
            }
        }
    }

    double conj_cancel = (conj_sum_pair_abs > 0) ? 1.0 - conj_sum_pair_sum/conj_sum_pair_abs : 0;
    printf("  Conjugate pairs found:   %ld\n", conj_pairs);
    printf("  Near-exact antisymmetric (|c+c'|/|c|+|c'| < 0.01): %ld (%.1f%%)\n",
           conj_exact_anti, (conj_pairs>0) ? 100.0*conj_exact_anti/conj_pairs : 0);
    printf("  Pair cancellation:       %.1f%%\n", conj_cancel*100);
    printf("  Avg |c+c'|/(|c|+|c'|):  %.6f\n",
           (conj_pairs>0) ? conj_sum_ratio/conj_pairs : 0);

    if (conj_cancel > 0.95)
        printf("\n  → CONJUGATE ANTISYMMETRY: c(p,q,k) ≈ -c(-p,-q,-k).\n");
    else if (conj_cancel > 0.5)
        printf("\n  → PARTIAL conjugate antisymmetry (%.0f%% cancellation).\n", conj_cancel*100);
    else
        printf("\n  → WEAK conjugate antisymmetry.\n");

    printf("\n");

    /* ============================================================
     * TEST 2: SCALE-DEPENDENT CANCELLATION
     * How does the cancellation ratio correlate with n(K)?
     * ============================================================ */
    printf("  === TEST 2: Cancellation ratio vs triad count per shell ===\n\n");

    printf("  Shell  triads      |T_K|/Σ|c|    n(K)       1/√n(K)    |T|/Σ|c| × √n\n");
    printf("  -----  ----------  ----------    --------    -------    -----------\n");

    for (int K = 1; K <= N; K++) {
        double T_signed = 0, T_abs = 0;
        long n_triads = 0;

        for (int k_idx = 0; k_idx < nm_g; k_idx++) {
            int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
            int k2 = kx*kx+ky*ky+kz*kz;
            if ((int)(sqrt((double)k2)+0.5) != K) continue;

            for (int p_idx = 0; p_idx < nm_g; p_idx++) {
                int qx = kx-mkx[p_idx], qy = ky-mky[p_idx], qz = kz-mkz[p_idx];
                int q2 = qx*qx+qy*qy+qz*qz;
                if (q2 <= 0 || q2 > n_max_sq) continue;
                int q_idx = find_mode(qx, qy, qz);
                if (q_idx < 0) continue;

                double c = triad_contrib(k_idx, p_idx, q_idx);
                T_signed += c;
                T_abs += fabs(c);
                n_triads++;
            }
        }

        if (n_triads == 0 || T_abs < 1e-30) continue;
        double ratio = fabs(T_signed) / T_abs;
        double inv_sqrt_n = 1.0 / sqrt((double)n_triads);
        double normalized = ratio * sqrt((double)n_triads);

        printf("  %-5d  %-10ld  %10.6f    %-8ld    %7.5f    %11.4f\n",
               K, n_triads, ratio, n_triads, inv_sqrt_n, normalized);
    }

    printf("\n  If |T|/Σ|c| × √n ≈ constant: CLT-type cancellation (phase diversity ~ √n).\n");
    printf("  If |T|/Σ|c| × √n decreases with K: STRONGER than CLT at high K.\n");
    printf("  If |T|/Σ|c| × √n increases with K: WEAKER than CLT at high K.\n");

    printf("\n");
    printf("################################################################\n");
    printf("#  SYNTHESIS:                                                   #\n");
    printf("#                                                              #\n");
    printf("#  If conjugate antisymmetry holds:                            #\n");
    printf("#    c(p,q,k) = -c(-p,-q,-k) is provable from û_{-k}=conj(û_k)#\n");
    printf("#    This pairs every triad with a sign-flipped partner.       #\n");
    printf("#    The 50/50 balance follows algebraically.                   #\n");
    printf("#    δ > 0 is then a theorem, not a computation.              #\n");
    printf("################################################################\n");

    return 0;
}
