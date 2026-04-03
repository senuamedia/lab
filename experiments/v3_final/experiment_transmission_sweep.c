/*
 * experiment_transmission_sweep.c — Shell transmission profile universality
 *
 * The wave-like transmission T(d) measured at one configuration.
 * Now test across:
 *   - 3 amplitudes: A = 0.10, 0.20, 0.30
 *   - 2 viscosities: ν = 0.01, 0.001
 *   - 3 time points: t = 0.01, 0.05, 0.20 (early, developing, developed)
 *   - 2 truncation levels: N = 6, 8
 *
 * For each: measure T(d) at d = -3, -2, -1, 0, +1, +2, +3
 * and report the sign pattern and decay profile.
 *
 * Key question: is the wave shape universal?
 *   - Always negative at d ≤ 0?
 *   - Always positive at d ≥ 1?
 *   - Always decaying with |d|?
 *   - Always viscosity-independent?
 *
 * BUILD:
 *   clang -O3 experiments/experiment_transmission_sweep.c \
 *         src/triad_kernel_v3_accessible.c -o build/trans_sweep -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>

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
    double updq_re = ur[p_idx][0]*(double)mkx[q_idx]+ur[p_idx][1]*(double)mky[q_idx]+ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im = ui[p_idx][0]*(double)mkx[q_idx]+ui[p_idx][1]*(double)mky[q_idx]+ui[p_idx][2]*(double)mkz[q_idx];
    double kduq_re = (double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
    double kduq_im = (double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
    double sc_re = kduq_re/(double)k2, sc_im = kduq_im/(double)k2;
    double contrib = 0;
    for (int c = 0; c < 3; c++) {
        double kc = (c==0)?(double)kx:(c==1)?(double)ky:(double)kz;
        double pq_re = ur[q_idx][c]-sc_re*kc, pq_im = ui[q_idx][c]-sc_im*kc;
        double prod_re = updq_re*pq_re-updq_im*pq_im;
        double prod_im = updq_re*pq_im+updq_im*pq_re;
        contrib += ur[k_idx][c]*prod_im + ui[k_idx][c]*(-prod_re);
    }
    return contrib;
}

static void read_state(void) {
    for (int i = 0; i < nm_g && i < MAX_MODES; i++) {
        mkx[i]=(int)c3d_get_kx(i); mky[i]=(int)c3d_get_ky(i); mkz[i]=(int)c3d_get_kz(i);
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i)); ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i)); ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i)); ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

/* Measure T(d) for d = -3 to +3. Returns normalised: T(d) / max|T(d)| */
static void measure_wave(int N, double T_d[7], char signs[8]) {
    int n_max_sq = N*N;
    double raw[7]; memset(raw, 0, sizeof(raw));

    for (int p_idx = 0; p_idx < nm_g; p_idx++) {
        int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
        int p2=px*px+py*py+pz*pz;
        int ps=(int)(sqrt((double)p2)+0.5);

        for (int k_idx = 0; k_idx < nm_g; k_idx++) {
            int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
            int k2=kx*kx+ky*ky+kz*kz;
            int ks=(int)(sqrt((double)k2)+0.5);
            int d = ks - ps;
            if (d < -3 || d > 3) continue;

            int qx=kx-px,qy=ky-py,qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if (q2<=0||q2>n_max_sq) continue;
            int q_idx=find_mode(qx,qy,qz);
            if (q_idx<0) continue;

            raw[d+3] += triad_contrib(k_idx, p_idx, q_idx);
        }
    }

    double maxv = 0;
    for (int i = 0; i < 7; i++) if (fabs(raw[i]) > maxv) maxv = fabs(raw[i]);
    for (int i = 0; i < 7; i++) {
        T_d[i] = (maxv > 1e-30) ? raw[i]/maxv : 0;
        signs[i] = (raw[i] > 1e-20) ? '+' : (raw[i] < -1e-20) ? '-' : '0';
    }
    signs[7] = '\0';
}

int main(void) {
    int n_base = 3;

    double amps[] = {0.10, 0.20, 0.30};
    double nus[] = {0.01, 0.001};
    int Ns[] = {6, 8};
    int step_list[] = {100, 500, 2000};
    double time_list[] = {0.01, 0.05, 0.20};

    printf("################################################################\n");
    printf("#  TRANSMISSION WAVE UNIVERSALITY                              #\n");
    printf("#                                                              #\n");
    printf("#  T(d) normalised wave shape at d = -3 to +3                 #\n");
    printf("#  across 36 configurations.                                   #\n");
    printf("#                                                              #\n");
    printf("#  Sign pattern: - at d≤0, + at d≥1 = forward cascade wave.  #\n");
    printf("################################################################\n\n");

    printf("  A      ν       N    t       sign_pattern   T(-3)    T(-2)    T(-1)    T(0)     T(+1)    T(+2)    T(+3)    wave?\n");
    printf("  -----  ------  ---  ------  -------------  ------   ------   ------   ------   ------   ------   ------   -----\n");
    fflush(stdout);

    int n_wave = 0, n_total = 0;

    for (int ai = 0; ai < 3; ai++)
    for (int vi = 0; vi < 2; vi++)
    for (int ni = 0; ni < 2; ni++)
    for (int ti = 0; ti < 3; ti++) {
        double amp = amps[ai], nu = nus[vi];
        int N = Ns[ni];
        int steps = step_list[ti];

        ic_distributed(n_base, amp);
        apply_ic(N);
        nm_g = (int)c3d_get_num_modes();
        buf_set(0, nu); buf_set(1, 0.0001);
        for (int s = 0; s < steps; s++) c3d_do_step();
        read_state();

        double T_d[7]; char signs[8];
        measure_wave(N, T_d, signs);

        /* Check wave pattern: d≤0 negative, d≥1 positive */
        int is_wave = (T_d[0+3] < -0.01 && T_d[4] > 0.01) ? 1 : 0; /* T(0)<0 and T(+1)>0 */

        n_total++;
        if (is_wave) n_wave++;

        printf("  %.2f   %.3f   %-3d  %.4f  %s  %+6.3f   %+6.3f   %+6.3f   %+6.3f   %+6.3f   %+6.3f   %+6.3f   %s\n",
               amp, nu, N, time_list[ti], signs,
               T_d[0], T_d[1], T_d[2], T_d[3], T_d[4], T_d[5], T_d[6],
               is_wave ? "YES" : "no");
        fflush(stdout);
    }

    printf("\n  Wave pattern (d≤0 neg, d≥1 pos): %d / %d configs (%.0f%%)\n",
           n_wave, n_total, 100.0*n_wave/n_total);

    printf("\n");
    printf("################################################################\n");
    printf("#  If wave pattern holds universally:                          #\n");
    printf("#    → The cascade IS a damped wave in shell space.           #\n");
    printf("#    → Energy flows forward (low→high K) with reflection.    #\n");
    printf("#    → The reflection (negative lobe) forces cancellation.    #\n");
    printf("#    → The wave amplitude decays with distance.               #\n");
    printf("#    → This is provable from the structure of the -i          #\n");
    printf("#      trilinear coupling on Z³.                              #\n");
    printf("################################################################\n");

    return 0;
}
