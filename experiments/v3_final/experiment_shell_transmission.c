/*
 * experiment_shell_transmission.c — Cross-shell energy transmission profile
 *
 * For each mode p, measure its contribution to each target shell K as
 * a function of shell distance d = |K - shell(p)|.
 *
 * Factor out:
 *   1. Transmission vs distance: how does |contribution| decay with d?
 *   2. Barrier conductance: how many valid triads connect shell(p) to K?
 *   3. Sign pattern: at what distance does the contribution flip sign?
 *
 * Also measure at two viscosities (ν=0.01, ν=0.001) to see how
 * diffusion changes the transmission profile.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_shell_transmission.c \
 *         src/triad_kernel_v3_accessible.c -o build/transmission -lm
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
    double updq_re = ur[p_idx][0]*(double)mkx[q_idx] + ur[p_idx][1]*(double)mky[q_idx] + ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im = ui[p_idx][0]*(double)mkx[q_idx] + ui[p_idx][1]*(double)mky[q_idx] + ui[p_idx][2]*(double)mkz[q_idx];
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
        contrib += ur[k_idx][c]*prod_im + ui[k_idx][c]*(-prod_re);
    }
    return contrib;
}

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < nm_g; i++)
        if (mkx[i]==kx && mky[i]==ky && mkz[i]==kz) return i;
    return -1;
}

/*
 * For modes at source shell S, measure the average contribution to
 * each target shell K. Aggregate by shell distance d = K - S.
 */
static void measure_transmission(int N, double nu_run) {
    int n_max_sq = N * N;

    /* distance from -N to +N, indexed by d+N */
    #define DMAX 20
    double dist_signed[DMAX];     /* Σ signed contributions at distance d */
    double dist_abs[DMAX];        /* Σ |contributions| at distance d */
    long dist_triads[DMAX];       /* count of triads at distance d */
    long dist_n_pos[DMAX], dist_n_neg[DMAX];
    memset(dist_signed, 0, sizeof(dist_signed));
    memset(dist_abs, 0, sizeof(dist_abs));
    memset(dist_triads, 0, sizeof(dist_triads));
    memset(dist_n_pos, 0, sizeof(dist_n_pos));
    memset(dist_n_neg, 0, sizeof(dist_n_neg));

    for (int p_idx = 0; p_idx < nm_g; p_idx++) {
        int px = mkx[p_idx], py = mky[p_idx], pz = mkz[p_idx];
        int p2 = px*px+py*py+pz*pz;
        int p_shell = (int)(sqrt((double)p2)+0.5);

        for (int k_idx = 0; k_idx < nm_g; k_idx++) {
            int kx = mkx[k_idx], ky = mky[k_idx], kz = mkz[k_idx];
            int k2 = kx*kx+ky*ky+kz*kz;
            int k_shell = (int)(sqrt((double)k2)+0.5);

            int qx = kx-px, qy = ky-py, qz = kz-pz;
            int q2 = qx*qx+qy*qy+qz*qz;
            if (q2 <= 0 || q2 > n_max_sq) continue;
            int q_idx = find_mode(qx, qy, qz);
            if (q_idx < 0) continue;

            double c = triad_contrib(k_idx, p_idx, q_idx);

            int d = k_shell - p_shell + N; /* shift to make index positive */
            if (d < 0 || d >= DMAX) continue;

            dist_signed[d] += c;
            dist_abs[d] += fabs(c);
            dist_triads[d]++;
            if (c > 1e-30) dist_n_pos[d]++;
            else if (c < -1e-30) dist_n_neg[d]++;
        }
    }

    printf("  ν = %.4f\n\n", nu_run);
    printf("  dist(K-S)  triads       Σ(signed)    Σ|c|         |Σ|/Σ|c|     %%pos      avg|c|\n");
    printf("  ---------  ----------   ----------   ----------   ---------    ------    ----------\n");

    for (int di = 0; di < DMAX; di++) {
        int d = di - N;
        if (dist_triads[di] == 0) continue;
        if (d < -(N-1) || d > (N-1)) continue;

        double ratio = (dist_abs[di] > 1e-30) ? fabs(dist_signed[di]) / dist_abs[di] : 0;
        double pct_pos = 100.0 * dist_n_pos[di] / (dist_n_pos[di] + dist_n_neg[di] + 1e-10);
        double avg_abs = dist_abs[di] / dist_triads[di];

        printf("  %+4d       %-10ld   %+10.3e   %10.3e   %9.4f    %5.1f%%    %10.3e\n",
               d, dist_triads[di], dist_signed[di], dist_abs[di], ratio, pct_pos, avg_abs);
    }
    printf("\n");
}

int main(void) {
    int N = 8;
    double amp = 0.30;
    int n_base = 3;

    printf("################################################################\n");
    printf("#  SHELL TRANSMISSION PROFILE                                  #\n");
    printf("#                                                              #\n");
    printf("#  How energy flows between shells as a function of distance.  #\n");
    printf("#  Distance d = K(target) - S(source).                        #\n");
    printf("#  d > 0: forward cascade (low → high K)                     #\n");
    printf("#  d < 0: backscatter (high → low K)                         #\n");
    printf("#  d = 0: self-interaction within the shell                    #\n");
    printf("#                                                              #\n");
    printf("#  N=%d, A=%.2f                                               #\n", N, amp);
    printf("################################################################\n\n");
    fflush(stdout);

    double nus[] = {0.01, 0.001};
    for (int vi = 0; vi < 2; vi++) {
        double nu = nus[vi];

        ic_distributed(n_base, amp);
        apply_ic(N);
        nm_g = (int)c3d_get_num_modes();
        buf_set(0, nu); buf_set(1, 0.0001);
        for (int s = 0; s < 500; s++) c3d_do_step();

        for (int i = 0; i < nm_g && i < MAX_MODES; i++) {
            mkx[i] = (int)c3d_get_kx(i); mky[i] = (int)c3d_get_ky(i); mkz[i] = (int)c3d_get_kz(i);
            ur[i][0] = bits_to_dbl(c3d_get_state_ux(i)); ui[i][0] = bits_to_dbl(c3d_get_state_ux_im(i));
            ur[i][1] = bits_to_dbl(c3d_get_state_uy(i)); ui[i][1] = bits_to_dbl(c3d_get_state_uy_im(i));
            ur[i][2] = bits_to_dbl(c3d_get_state_uz(i)); ui[i][2] = bits_to_dbl(c3d_get_state_uz_im(i));
        }

        measure_transmission(N, nu);
    }

    printf("################################################################\n");
    printf("#  If the transmission decays exponentially with |d|:           #\n");
    printf("#    → The cascade is LOCAL in shell space.                    #\n");
    printf("#    → Each shell communicates mainly with its neighbours.     #\n");
    printf("#    → The 50/50 balance is a local conservation law.          #\n");
    printf("#                                                              #\n");
    printf("#  If Σ(signed) flips sign around d=0:                        #\n");
    printf("#    → d < 0: negative (mode loses to lower shells)           #\n");
    printf("#    → d > 0: positive (mode gains from higher shells)        #\n");
    printf("#    → OR vice versa, depending on cascade direction.          #\n");
    printf("#    → The sign flip IS the wave.                             #\n");
    printf("################################################################\n");

    return 0;
}
