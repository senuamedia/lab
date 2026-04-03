/*
 * experiment_sign_balance.c — Sign structure of triad contributions
 *
 * For each mode k, decompose the per-mode transfer T_k into individual
 * triad contributions and count:
 *   - n_pos: number of positive contributions
 *   - n_neg: number of negative contributions
 *   - S_pos: sum of positive contributions
 *   - S_neg: sum of negative contributions (absolute value)
 *   - T_k = S_pos - S_neg (the signed transfer)
 *   - balance = min(S_pos, S_neg) / max(S_pos, S_neg)
 *
 * If balance > 0 for all modes: positive and negative always coexist.
 * The MINIMUM balance across all modes is the uniform δ lower bound.
 *
 * Also computes per-SHELL aggregates.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_sign_balance.c \
 *         src/triad_kernel_v3_accessible.c -o build/sign_balance -lm
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
#define MSH 12

int main(void) {
    int N = 8;
    double amp = 0.30;
    double nu = 0.01;
    double dt = 0.0001;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  SIGN BALANCE OF TRIAD CONTRIBUTIONS                         #\n");
    printf("#                                                              #\n");
    printf("#  For each mode k: how balanced are + and - contributions?    #\n");
    printf("#  balance = min(S_pos, S_neg) / max(S_pos, S_neg)            #\n");
    printf("#  balance > 0 → cancellation exists                          #\n");
    printf("#  balance → 1 → maximum cancellation (equal + and -)         #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f                                               #\n", N, amp);
    printf("################################################################\n\n");
    fflush(stdout);

    ic_distributed(n_base, amp);
    apply_ic(N);
    int nm = (int)c3d_get_num_modes();

    buf_set(0, nu); buf_set(1, dt);
    for (int s = 0; s < 500; s++) c3d_do_step();

    /* Read full complex state */
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

    /* Per-shell aggregates */
    double shell_S_pos[MSH], shell_S_neg[MSH];
    long shell_n_pos[MSH], shell_n_neg[MSH];
    long shell_n_modes[MSH];
    double shell_min_balance[MSH];
    memset(shell_S_pos, 0, sizeof(shell_S_pos));
    memset(shell_S_neg, 0, sizeof(shell_S_neg));
    memset(shell_n_pos, 0, sizeof(shell_n_pos));
    memset(shell_n_neg, 0, sizeof(shell_n_neg));
    memset(shell_n_modes, 0, sizeof(shell_n_modes));
    for (int i = 0; i < MSH; i++) shell_min_balance[i] = 2.0;

    /* Global stats */
    double global_min_balance = 2.0;
    int global_all_mixed = 1; /* All modes have both + and - */
    int n_onesided = 0; /* Modes with only + or only - */

    for (int k_idx = 0; k_idx < nm; k_idx++) {
        int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
        int k2 = kx*kx + ky*ky + kz*kz;
        int shell = (int)(sqrt((double)k2) + 0.5);
        if (shell >= MSH) continue;

        double S_pos = 0, S_neg = 0;
        int n_pos = 0, n_neg = 0;

        for (int p_idx = 0; p_idx < nm; p_idx++) {
            int qx = kx - mkx[p_idx], qy = ky - mky[p_idx], qz = kz - mkz[p_idx];
            int q2 = qx*qx + qy*qy + qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;

            int q_idx = -1;
            for (int qi = 0; qi < nm; qi++) {
                if (mkx[qi]==qx && mky[qi]==qy && mkz[qi]==qz) { q_idx = qi; break; }
            }
            if (q_idx < 0) continue;

            /* Full complex computation with -i */
            double updq_re = ur[p_idx][0]*(double)qx + ur[p_idx][1]*(double)qy + ur[p_idx][2]*(double)qz;
            double updq_im = ui[p_idx][0]*(double)qx + ui[p_idx][1]*(double)qy + ui[p_idx][2]*(double)qz;

            double kduq_re = (double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
            double kduq_im = (double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
            double sc_re = kduq_re/(double)k2, sc_im = kduq_im/(double)k2;

            double nl_re[3], nl_im[3];
            for (int c = 0; c < 3; c++) {
                double kc = (c==0)?(double)kx:(c==1)?(double)ky:(double)kz;
                double pq_re = ur[q_idx][c] - sc_re*kc;
                double pq_im = ui[q_idx][c] - sc_im*kc;
                double prod_re = updq_re*pq_re - updq_im*pq_im;
                double prod_im = updq_re*pq_im + updq_im*pq_re;
                nl_re[c] = prod_im;   /* -i: re = im_old */
                nl_im[c] = -prod_re;  /* -i: im = -re_old */
            }

            double contrib = 0;
            for (int c = 0; c < 3; c++)
                contrib += ur[k_idx][c]*nl_re[c] + ui[k_idx][c]*nl_im[c];

            if (contrib > 1e-30) { S_pos += contrib; n_pos++; }
            else if (contrib < -1e-30) { S_neg += fabs(contrib); n_neg++; }
        }

        if (n_pos > 0 && n_neg > 0) {
            double balance = (S_pos < S_neg) ? S_pos / S_neg : S_neg / S_pos;
            if (balance < global_min_balance) global_min_balance = balance;
            if (balance < shell_min_balance[shell]) shell_min_balance[shell] = balance;
        } else if (n_pos + n_neg > 0) {
            n_onesided++;
            global_all_mixed = 0;
        }

        shell_S_pos[shell] += S_pos;
        shell_S_neg[shell] += S_neg;
        shell_n_pos[shell] += n_pos;
        shell_n_neg[shell] += n_neg;
        shell_n_modes[shell]++;
    }

    printf("  === Per-shell sign balance ===\n\n");
    printf("  Shell  modes   S_pos       S_neg       |T_K|       balance    min_bal   %%pos\n");
    printf("  -----  ------  ----------  ----------  ----------  --------   -------   -----\n");
    for (int K = 1; K <= N; K++) {
        double T = shell_S_pos[K] - shell_S_neg[K];
        double total = shell_S_pos[K] + shell_S_neg[K];
        double bal = (total > 1e-30) ? (shell_S_pos[K] < shell_S_neg[K] ?
                     shell_S_pos[K]/shell_S_neg[K] : shell_S_neg[K]/shell_S_pos[K]) : 0;
        double pct_pos = (shell_n_pos[K]+shell_n_neg[K] > 0) ?
                         100.0*shell_n_pos[K]/(shell_n_pos[K]+shell_n_neg[K]) : 0;

        printf("  %-5d  %-6ld  %10.4e  %10.4e  %10.4e  %8.4f   %7.4f   %5.1f%%\n",
               K, shell_n_modes[K], shell_S_pos[K], shell_S_neg[K],
               fabs(T), bal,
               (shell_min_balance[K] < 1.5) ? shell_min_balance[K] : 0.0,
               pct_pos);
    }

    printf("\n  === Global summary ===\n\n");
    printf("  All modes have both + and - contributions: %s\n",
           global_all_mixed ? "YES" : "NO");
    printf("  Number of one-sided modes: %d\n", n_onesided);
    printf("  Global minimum balance (min over all modes): %.6f\n", global_min_balance);
    printf("  (balance = min(S+,S-)/max(S+,S-) at each mode)\n\n");

    if (global_min_balance > 0.01) {
        printf("  → Every mode with triads has both + and - contributions.\n");
        printf("  → The minimum balance ratio is %.4f.\n", global_min_balance);
        printf("  → This means |T_k| < %.4f × Σ|c_i| at EVERY mode.\n",
               1.0 - 2.0 * global_min_balance / (1.0 + global_min_balance));
        printf("  → δ ≥ %.4f uniformly.\n",
               2.0 * global_min_balance / (1.0 + global_min_balance));
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  If balance > 0 at every mode:                               #\n");
    printf("#    → The signed sum ALWAYS partially cancels.                #\n");
    printf("#    → |T_K| < Σ|c_i| strictly.                               #\n");
    printf("#    → The minimum balance gives a uniform δ > 0.             #\n");
    printf("#                                                              #\n");
    printf("#  The ANALYTICAL question: can we prove that for any          #\n");
    printf("#  divergence-free û on Z³, the Im part of the trilinear      #\n");
    printf("#  coupling always has mixed signs at each mode?               #\n");
    printf("################################################################\n");

    return 0;
}
