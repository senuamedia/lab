/*
 * experiment_sign_rule.c — Find the lattice property that determines sign
 *
 * For each triad (p, q, k=p+q), compute its contribution to T_k
 * and test which geometric property predicts the sign.
 *
 * Candidates:
 *   A. parity of |p|² - |q|²  (which mode is "larger")
 *   B. sign of (p × q) · k    (handedness of the triad)
 *   C. sign of p · q           (angle between p and q)
 *   D. |p|² > |q|² vs |p|² < |q|²  (energy ordering)
 *   E. sign of (k × p) · û_k  (orientation relative to flow)
 *
 * For each candidate, measure the correlation with the contribution sign.
 * If one candidate predicts the sign with >90% accuracy, that's the rule.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_sign_rule.c \
 *         src/triad_kernel_v3_accessible.c -o build/sign_rule -lm
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

int main(void) {
    int N = 8;
    double amp = 0.30;
    double nu = 0.01;
    double dt = 0.0001;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  SIGN RULE DISCOVERY                                         #\n");
    printf("#                                                              #\n");
    printf("#  For each triad, compute the contribution sign and test      #\n");
    printf("#  which lattice property predicts it.                         #\n");
    printf("#                                                              #\n");
    printf("#  Candidates:                                                 #\n");
    printf("#    A. sign(|p|² - |q|²)  (which mode is larger)            #\n");
    printf("#    B. sign((p × q) · k)  (triad handedness)                #\n");
    printf("#    C. sign(p · q)        (angle between p and q)           #\n");
    printf("#    D. sign(|p| - |k|/2)  (p above/below midpoint)          #\n");
    printf("#    E. parity of |p|² + |q|²                                #\n");
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

    /* For each candidate rule, count agreements with sign(contribution) */
    long agree_A = 0, disagree_A = 0;  /* |p|² - |q|² */
    long agree_B = 0, disagree_B = 0;  /* (p × q) · k */
    long agree_C = 0, disagree_C = 0;  /* p · q */
    long agree_D = 0, disagree_D = 0;  /* |p| - |k|/2 */
    long agree_E = 0, disagree_E = 0;  /* parity of |p|²+|q|² */
    long total = 0, skipped = 0;

    /* Also track: for the BEST rule, what is the energy-weighted accuracy? */
    double wt_agree[5] = {0}, wt_total = 0;

    for (int k_idx = 0; k_idx < nm; k_idx++) {
        int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
        int k2 = kx*kx + ky*ky + kz*kz;

        for (int p_idx = 0; p_idx < nm; p_idx++) {
            int px = mkx[p_idx], py = mky[p_idx], pz = mkz[p_idx];
            int qx = kx-px, qy = ky-py, qz = kz-pz;
            int q2 = qx*qx + qy*qy + qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;

            int q_idx = -1;
            for (int qi = 0; qi < nm; qi++) {
                if (mkx[qi]==qx && mky[qi]==qy && mkz[qi]==qz) { q_idx = qi; break; }
            }
            if (q_idx < 0) continue;

            /* Compute contribution with full complex arithmetic + -i */
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
                double nl_re = prod_im;   /* -i applied */
                double nl_im = -prod_re;
                contrib += ur[k_idx][c]*nl_re + ui[k_idx][c]*nl_im;
            }

            if (fabs(contrib) < 1e-25) { skipped++; continue; }
            total++;

            int sign_c = (contrib > 0) ? 1 : -1;
            double wt = fabs(contrib);
            wt_total += wt;

            /* Rule A: sign(|p|² - |q|²) */
            int p2 = px*px+py*py+pz*pz;
            int sign_A = (p2 > q2) ? 1 : (p2 < q2) ? -1 : 0;
            if (sign_A != 0) {
                if (sign_A == sign_c) { agree_A++; wt_agree[0] += wt; }
                else disagree_A++;
            }

            /* Rule B: sign((p × q) · k) — triad handedness */
            int cross_x = py*qz - pz*qy;
            int cross_y = pz*qx - px*qz;
            int cross_z = px*qy - py*qx;
            int dot_cross_k = cross_x*kx + cross_y*ky + cross_z*kz;
            int sign_B = (dot_cross_k > 0) ? 1 : (dot_cross_k < 0) ? -1 : 0;
            if (sign_B != 0) {
                if (sign_B == sign_c) { agree_B++; wt_agree[1] += wt; }
                else disagree_B++;
            }

            /* Rule C: sign(p · q) */
            int pdq = px*qx + py*qy + pz*qz;
            int sign_C = (pdq > 0) ? 1 : (pdq < 0) ? -1 : 0;
            if (sign_C != 0) {
                if (sign_C == sign_c) { agree_C++; wt_agree[2] += wt; }
                else disagree_C++;
            }

            /* Rule D: sign(|p| - |k|/2) */
            double pm = sqrt((double)p2);
            double km_half = sqrt((double)k2) / 2.0;
            int sign_D = (pm > km_half) ? 1 : -1;
            if (sign_D == sign_c) { agree_D++; wt_agree[3] += wt; }
            else disagree_D++;

            /* Rule E: parity of |p|²+|q|² */
            int sign_E = ((p2 + q2) % 2 == 0) ? 1 : -1;
            if (sign_E == sign_c) { agree_E++; wt_agree[4] += wt; }
            else disagree_E++;
        }
    }

    printf("  Total triads analysed: %ld  (skipped %ld near-zero)\n\n", total, skipped);

    printf("  Rule                      agree       disagree    accuracy    wt_accuracy\n");
    printf("  ------------------------  ----------  ----------  ---------   -----------\n");

    long pairs[5][2] = {
        {agree_A, disagree_A}, {agree_B, disagree_B}, {agree_C, disagree_C},
        {agree_D, disagree_D}, {agree_E, disagree_E}
    };
    const char *names[5] = {
        "A: sign(|p|²-|q|²)",
        "B: sign((p×q)·k)",
        "C: sign(p·q)",
        "D: sign(|p|-|k|/2)",
        "E: parity(|p|²+|q|²)"
    };

    double best_acc = 0;
    int best_rule = -1;

    for (int r = 0; r < 5; r++) {
        long a = pairs[r][0], d = pairs[r][1];
        double acc = (a+d > 0) ? (double)a/(a+d) : 0;
        double wacc = (wt_total > 0) ? wt_agree[r]/wt_total : 0;
        /* Also check if ANTI-correlation is better */
        double acc_best = (acc > 0.5) ? acc : 1.0 - acc;
        if (acc_best > best_acc) { best_acc = acc_best; best_rule = r; }

        printf("  %-24s  %-10ld  %-10ld  %8.4f    %8.4f\n",
               names[r], a, d, acc, wacc);
    }

    printf("\n  Best predictor: %s (%.1f%% accuracy)\n\n", names[best_rule], best_acc*100);

    if (best_acc > 0.85)
        printf("  → STRONG SIGN RULE FOUND. This may be provable from lattice geometry.\n");
    else if (best_acc > 0.65)
        printf("  → MODERATE correlation. The sign depends partly on this property.\n");
    else
        printf("  → WEAK correlation. The sign is not determined by simple lattice properties.\n");

    printf("\n");
    printf("################################################################\n");
    printf("#  If a rule has >85%% accuracy:                                #\n");
    printf("#    → The sign is determined by a discrete geometric property.#\n");
    printf("#    → This property is provable from the triad structure.     #\n");
    printf("#    → Combined with the sign balance (50/50 count):           #\n");
    printf("#      the cancellation δ > 0 follows algebraically.           #\n");
    printf("#    → This would close the analytical bridge.                 #\n");
    printf("################################################################\n");

    return 0;
}
