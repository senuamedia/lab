/*
 * experiment_pq_swap.c — Test the p↔q swap symmetry
 *
 * For each triad (p, q, k=p+q), compare the contribution c(p,q)
 * with the swapped contribution c(q,p) — same k, roles exchanged.
 *
 * The coupling is: c(p,q) = Re(conj(û_k) · (-i)(û_p · q) P_k(û_q))
 * The swap gives: c(q,p) = Re(conj(û_k) · (-i)(û_q · p) P_k(û_p))
 *
 * If c(p,q) = -c(q,p): the contributions are antisymmetric under swap.
 * Since every triad (p,q) has a partner (q,p), the 50/50 sign balance
 * follows automatically — and the cancellation is STRUCTURAL.
 *
 * If c(p,q) + c(q,p) = 0: the pair sums to zero exactly.
 * This would mean T_k = Σ c(p,q) = (1/2) Σ [c(p,q) + c(q,p)] = 0...
 * but we know T_k ≠ 0, so perfect antisymmetry can't hold exactly.
 *
 * The question: how close to antisymmetric is the swap?
 * Measure: c(p,q) + c(q,p) vs |c(p,q)| + |c(q,p)|
 *
 * BUILD:
 *   clang -O3 experiments/experiment_pq_swap.c \
 *         src/triad_kernel_v3_accessible.c -o build/pq_swap -lm
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

/* Compute the triad contribution for given (p_idx, q_idx, k_idx) */
static double triad_contrib(int k_idx, int p_idx, int q_idx,
                            int mkx[], int mky[], int mkz[],
                            double ur[][3], double ui[][3]) {
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
    printf("#  p ↔ q SWAP SYMMETRY TEST                                    #\n");
    printf("#                                                              #\n");
    printf("#  For each triad (p,q,k): compare c(p,q) with c(q,p).       #\n");
    printf("#  If antisymmetric: c(p,q) ≈ -c(q,p) → forced cancellation. #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f                                               #\n", N, amp);
    printf("################################################################\n\n");
    fflush(stdout);

    ic_distributed(n_base, amp);
    apply_ic(N);
    int nm = (int)c3d_get_num_modes();
    buf_set(0, nu); buf_set(1, dt);
    for (int s = 0; s < 500; s++) c3d_do_step();

    int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
    double ur[MAX_MODES][3], ui[MAX_MODES][3];
    for (int i = 0; i < nm && i < MAX_MODES; i++) {
        mkx[i] = (int)c3d_get_kx(i); mky[i] = (int)c3d_get_ky(i); mkz[i] = (int)c3d_get_kz(i);
        ur[i][0] = bits_to_dbl(c3d_get_state_ux(i));
        ui[i][0] = bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1] = bits_to_dbl(c3d_get_state_uy(i));
        ui[i][1] = bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2] = bits_to_dbl(c3d_get_state_uz(i));
        ui[i][2] = bits_to_dbl(c3d_get_state_uz_im(i));
    }

    int n_max_sq = N * N;

    /* For each unordered pair {p,q} with p+q=k, compute c(p,q) and c(q,p) */
    double sum_cpq = 0, sum_cqp = 0;
    double sum_abs_cpq = 0, sum_abs_cqp = 0;
    double sum_pair_sum = 0;     /* Σ |c(p,q) + c(q,p)| */
    double sum_pair_abs = 0;     /* Σ (|c(p,q)| + |c(q,p)|) */
    long n_pairs = 0;
    long n_antisym = 0;  /* pairs where c(p,q) and c(q,p) have opposite sign */
    long n_same = 0;     /* pairs where same sign */

    /* Per-shell statistics */
    #define MSH 12
    double shell_pair_sum[MSH], shell_pair_abs[MSH];
    long shell_pairs[MSH], shell_antisym[MSH];
    memset(shell_pair_sum, 0, sizeof(shell_pair_sum));
    memset(shell_pair_abs, 0, sizeof(shell_pair_abs));
    memset(shell_pairs, 0, sizeof(shell_pairs));
    memset(shell_antisym, 0, sizeof(shell_antisym));

    for (int k_idx = 0; k_idx < nm; k_idx++) {
        int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
        int k2 = kx*kx + ky*ky + kz*kz;
        int shell = (int)(sqrt((double)k2) + 0.5);
        if (shell >= MSH) continue;

        for (int p_idx = 0; p_idx < nm; p_idx++) {
            int qx = kx - mkx[p_idx], qy = ky - mky[p_idx], qz = kz - mkz[p_idx];
            int q2 = qx*qx + qy*qy + qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;

            int q_idx = -1;
            for (int qi = 0; qi < nm; qi++) {
                if (mkx[qi]==qx && mky[qi]==qy && mkz[qi]==qz) { q_idx = qi; break; }
            }
            if (q_idx < 0) continue;

            /* Only process each unordered pair once: require p_idx < q_idx */
            if (p_idx >= q_idx) continue;

            double cpq = triad_contrib(k_idx, p_idx, q_idx, mkx, mky, mkz, ur, ui);
            double cqp = triad_contrib(k_idx, q_idx, p_idx, mkx, mky, mkz, ur, ui);

            if (fabs(cpq) < 1e-30 && fabs(cqp) < 1e-30) continue;

            n_pairs++;
            sum_cpq += cpq;
            sum_cqp += cqp;
            sum_abs_cpq += fabs(cpq);
            sum_abs_cqp += fabs(cqp);
            sum_pair_sum += fabs(cpq + cqp);
            sum_pair_abs += fabs(cpq) + fabs(cqp);

            shell_pairs[shell]++;
            shell_pair_sum[shell] += fabs(cpq + cqp);
            shell_pair_abs[shell] += fabs(cpq) + fabs(cqp);

            if (cpq * cqp < 0) { n_antisym++; shell_antisym[shell]++; }
            else n_same++;
        }
    }

    double antisym_frac = (double)n_antisym / (n_antisym + n_same);
    double cancel_frac = 1.0 - sum_pair_sum / sum_pair_abs;

    printf("  === Global p↔q swap statistics ===\n\n");
    printf("  Total unordered pairs:     %ld\n", n_pairs);
    printf("  Opposite sign (antisym):   %ld (%.1f%%)\n", n_antisym, antisym_frac*100);
    printf("  Same sign:                 %ld (%.1f%%)\n", n_same, (1-antisym_frac)*100);
    printf("\n");
    printf("  Σ|c(p,q) + c(q,p)| / Σ(|c(p,q)| + |c(q,p)|) = %.6f\n", sum_pair_sum/sum_pair_abs);
    printf("  → Pair cancellation: %.1f%%\n", cancel_frac*100);
    printf("  → If this = 1.0: perfect antisymmetry (c(p,q) = -c(q,p))\n");
    printf("  → If this = 0.0: no antisymmetry (c(p,q) = c(q,p))\n");
    printf("\n");

    printf("  === Per-shell swap statistics ===\n\n");
    printf("  Shell  pairs      antisym%%   pair_cancel%%\n");
    printf("  -----  --------   --------   -----------\n");
    for (int K = 1; K <= N; K++) {
        if (shell_pairs[K] == 0) continue;
        double af = (double)shell_antisym[K] / shell_pairs[K];
        double cf = 1.0 - shell_pair_sum[K] / shell_pair_abs[K];
        printf("  %-5d  %-8ld   %6.1f%%    %8.1f%%\n", K, shell_pairs[K], af*100, cf*100);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  If antisym%% ≈ 50%% AND pair_cancel ≈ 100%%:                  #\n");
    printf("#    → c(p,q) ≈ -c(q,p) — swap is antisymmetric.             #\n");
    printf("#    → Every triad has a partner with opposite sign.           #\n");
    printf("#    → The 50/50 sign balance is STRUCTURAL.                  #\n");
    printf("#    → The cancellation δ > 0 is PROVABLE from this symmetry. #\n");
    printf("#                                                              #\n");
    printf("#  If antisym%% ≈ 50%% BUT pair_cancel << 100%%:                 #\n");
    printf("#    → The swap DOES flip signs but magnitudes differ.        #\n");
    printf("#    → Cancellation is partial, not complete.                  #\n");
    printf("#    → δ > 0 still holds but depends on magnitude balance.    #\n");
    printf("################################################################\n");

    return 0;
}
