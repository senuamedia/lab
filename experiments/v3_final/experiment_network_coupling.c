/*
 * experiment_network_coupling.c — Network structure of triadic coupling
 *
 * For a selected set of "hub" modes (modes that participate in many triads),
 * measure how their contribution signs distribute across different shells.
 *
 * Specifically: for hub mode p, it participates in triads (p, q, k) at
 * many different k-shells. Does mode p contribute positively at some
 * shells and negatively at others? If so, the mode is acting as a
 * "bridge" that transfers energy between shells — positive at the source
 * shell, negative at the sink shell.
 *
 * Also: measure the CORRELATION between a mode's contribution sign at
 * shell K₁ and its contribution sign at shell K₂. If anticorrelated:
 * the mode transfers energy FROM K₁ TO K₂ (or vice versa).
 *
 * This would explain the 50/50 balance: each mode contributes positively
 * at shells it's feeding INTO and negatively at shells it's drawing FROM.
 * The balance is forced by energy conservation at the mode level.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_network_coupling.c \
 *         src/triad_kernel_v3_accessible.c -o build/network -lm
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
    printf("#  NETWORK COUPLING — How modes bridge shells                   #\n");
    printf("#                                                              #\n");
    printf("#  For each mode p, measure its contribution (as the 'p' in   #\n");
    printf("#  triads (p,q,k)) across different k-shells.                 #\n");
    printf("#  Does mode p give +energy to some shells and -energy to     #\n");
    printf("#  others? If so: the mode is a bridge, and the 50/50 balance #\n");
    printf("#  comes from the conservation network.                        #\n");
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
        ur[i][0] = bits_to_dbl(c3d_get_state_ux(i)); ui[i][0] = bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1] = bits_to_dbl(c3d_get_state_uy(i)); ui[i][1] = bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2] = bits_to_dbl(c3d_get_state_uz(i)); ui[i][2] = bits_to_dbl(c3d_get_state_uz_im(i));
    }

    int n_max_sq = N * N;

    /*
     * For each mode p, compute its total contribution to T_K at each
     * target shell K (summing over all triads where this mode acts as p).
     *
     * Also track: contribution as the q role (the "projected" mode).
     */

    printf("  === Per-mode contribution to each shell (as p-role) ===\n\n");
    printf("  Showing modes with |û| in top 20 by energy.\n\n");

    /* Find the 20 most energetic modes */
    double mode_energy[MAX_MODES];
    int mode_order[MAX_MODES];
    for (int i = 0; i < nm_g; i++) {
        mode_energy[i] = ur[i][0]*ur[i][0]+ui[i][0]*ui[i][0]
                       + ur[i][1]*ur[i][1]+ui[i][1]*ui[i][1]
                       + ur[i][2]*ur[i][2]+ui[i][2]*ui[i][2];
        mode_order[i] = i;
    }
    /* Simple selection of top 20 */
    for (int i = 0; i < 20 && i < nm_g; i++) {
        for (int j = i+1; j < nm_g; j++) {
            if (mode_energy[mode_order[j]] > mode_energy[mode_order[i]]) {
                int tmp = mode_order[i]; mode_order[i] = mode_order[j]; mode_order[j] = tmp;
            }
        }
    }

    printf("  mode   k            |û|²       shell  S1        S2        S3        S4        S5        S6        Σ(signed)  +shells  -shells\n");
    printf("  -----  -----------  --------   -----  --------  --------  --------  --------  --------  --------  ---------  -------  -------\n");

    /* Global stats: how many modes bridge (have both + and - across shells)? */
    int n_bridges = 0, n_one_way = 0;

    for (int mi = 0; mi < 20 && mi < nm_g; mi++) {
        int p_idx = mode_order[mi];
        int px = mkx[p_idx], py = mky[p_idx], pz = mkz[p_idx];
        int p2 = px*px+py*py+pz*pz;
        int p_shell = (int)(sqrt((double)p2)+0.5);

        /* Sum this mode's contribution as p to each target shell */
        double shell_contrib[MSH];
        memset(shell_contrib, 0, sizeof(shell_contrib));

        for (int k_idx = 0; k_idx < nm_g; k_idx++) {
            int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
            int k2 = kx*kx+ky*ky+kz*kz;
            int k_shell = (int)(sqrt((double)k2)+0.5);
            if (k_shell >= MSH) continue;

            int qx = kx-px, qy = ky-py, qz = kz-pz;
            int q2 = qx*qx+qy*qy+qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;

            int q_idx = -1;
            for (int qi = 0; qi < nm_g; qi++) {
                if (mkx[qi]==qx && mky[qi]==qy && mkz[qi]==qz) { q_idx = qi; break; }
            }
            if (q_idx < 0) continue;

            double c = triad_contrib(k_idx, p_idx, q_idx);
            shell_contrib[k_shell] += c;
        }

        /* Count positive and negative shells */
        int n_pos_sh = 0, n_neg_sh = 0;
        double total_signed = 0;
        for (int K = 1; K <= 6; K++) {
            if (shell_contrib[K] > 1e-20) n_pos_sh++;
            else if (shell_contrib[K] < -1e-20) n_neg_sh++;
            total_signed += shell_contrib[K];
        }

        if (n_pos_sh > 0 && n_neg_sh > 0) n_bridges++;
        else n_one_way++;

        printf("  %-5d  (%+d,%+d,%+d)  %8.2e   %-5d  %+8.1e  %+8.1e  %+8.1e  %+8.1e  %+8.1e  %+8.1e  %+9.1e  %7d  %7d\n",
               p_idx, px, py, pz, mode_energy[p_idx], p_shell,
               shell_contrib[1], shell_contrib[2], shell_contrib[3],
               shell_contrib[4], shell_contrib[5], shell_contrib[6],
               total_signed, n_pos_sh, n_neg_sh);
    }

    printf("\n  Of top 20 modes: %d are bridges (+ and - shells), %d are one-way\n", n_bridges, n_one_way);

    /* Do the same for ALL modes, just count bridges */
    n_bridges = 0; n_one_way = 0;
    int n_zero = 0;

    for (int p_idx = 0; p_idx < nm_g; p_idx++) {
        int px = mkx[p_idx], py = mky[p_idx], pz = mkz[p_idx];
        double shell_c[MSH];
        memset(shell_c, 0, sizeof(shell_c));

        for (int k_idx = 0; k_idx < nm_g; k_idx++) {
            int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
            int k2 = kx*kx+ky*ky+kz*kz;
            int ks = (int)(sqrt((double)k2)+0.5);
            if (ks >= MSH) continue;

            int qx = kx-px, qy = ky-py, qz = kz-pz;
            int q2 = qx*qx+qy*qy+qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;

            int q_idx = -1;
            for (int qi = 0; qi < nm_g; qi++) {
                if (mkx[qi]==qx && mky[qi]==qy && mkz[qi]==qz) { q_idx = qi; break; }
            }
            if (q_idx < 0) continue;

            shell_c[ks] += triad_contrib(k_idx, p_idx, q_idx);
        }

        int np = 0, nn = 0;
        for (int K = 1; K <= N; K++) {
            if (shell_c[K] > 1e-25) np++;
            else if (shell_c[K] < -1e-25) nn++;
        }
        if (np > 0 && nn > 0) n_bridges++;
        else if (np > 0 || nn > 0) n_one_way++;
        else n_zero++;
    }

    printf("\n  === ALL %d modes ===\n", nm_g);
    printf("  Bridges (+ and - shells): %d (%.1f%%)\n", n_bridges, 100.0*n_bridges/nm_g);
    printf("  One-way (all + or all -): %d (%.1f%%)\n", n_one_way, 100.0*n_one_way/nm_g);
    printf("  Zero contribution:        %d (%.1f%%)\n", n_zero, 100.0*n_zero/nm_g);

    printf("\n");
    printf("################################################################\n");
    printf("#  If most modes are BRIDGES:                                   #\n");
    printf("#    → Each mode transfers energy between shells.              #\n");
    printf("#    → The +/- balance at each shell comes from the network.   #\n");
    printf("#    → Energy conservation at the mode level forces the        #\n");
    printf("#      balance: what a mode gives to one shell, it takes       #\n");
    printf("#      from another. The 50/50 is a CONSERVATION LAW.         #\n");
    printf("################################################################\n");

    return 0;
}
