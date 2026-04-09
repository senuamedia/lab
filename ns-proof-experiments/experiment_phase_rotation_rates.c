/*
 * experiment_phase_rotation_rates.c — Measure the RATE at which each triad's
 * phase rotates under NS evolution.
 *
 * For Lemma B (phase mixing), we need to show that different triads at the
 * same shell K have DIFFERENT phase rotation rates, so the phases spread.
 *
 * For each triad i contributing to shell K:
 *   z_i(t) = (û_p·q)(P_k(û_q)·conj(û_k))  at time t
 *   theta_i(t) = arg(z_i(t))
 *   omega_i = d(theta_i)/dt  (instantaneous rotation rate)
 *
 * If the omega_i are spread (not all equal), the phases mix and R_K decreases.
 * The VARIANCE of omega_i across triads at shell K quantifies the mixing rate.
 *
 * Also measures:
 *   - Whether phase spread increases over time (R_K(t) decreasing)
 *   - The timescale for mixing (how fast R_K drops)
 *   - Whether the rotation rates depend on the triad geometry (|p|,|q|,angle)
 *
 * BUILD:
 *   clang -O3 experiments/experiment_phase_rotation_rates.c \
 *         src/triad_kernel_v3_accessible.c -o build/phase_rates -lm
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

static void read_state(void) {
    for (int i = 0; i < nm_g && i < MAX_MODES; i++) {
        mkx[i]=(int)c3d_get_kx(i); mky[i]=(int)c3d_get_ky(i); mkz[i]=(int)c3d_get_kz(i);
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i)); ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i)); ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i)); ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

static void triad_complex(int k_idx, int p_idx, int q_idx, double *re_out, double *im_out) {
    int kx=mkx[k_idx], ky=mky[k_idx], kz=mkz[k_idx];
    int k2=kx*kx+ky*ky+kz*kz;
    double updq_re = ur[p_idx][0]*(double)mkx[q_idx] + ur[p_idx][1]*(double)mky[q_idx] + ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im = ui[p_idx][0]*(double)mkx[q_idx] + ui[p_idx][1]*(double)mky[q_idx] + ui[p_idx][2]*(double)mkz[q_idx];
    double kduq_re = (double)kx*ur[q_idx][0] + (double)ky*ur[q_idx][1] + (double)kz*ur[q_idx][2];
    double kduq_im = (double)kx*ui[q_idx][0] + (double)ky*ui[q_idx][1] + (double)kz*ui[q_idx][2];
    double sc_re = kduq_re/(double)k2, sc_im = kduq_im/(double)k2;
    double dot_re=0, dot_im=0;
    for (int c=0; c<3; c++) {
        double kc = (c==0)?(double)kx:(c==1)?(double)ky:(double)kz;
        double pq_re = ur[q_idx][c] - sc_re*kc, pq_im = ui[q_idx][c] - sc_im*kc;
        dot_re += pq_re*ur[k_idx][c] + pq_im*ui[k_idx][c];
        dot_im += pq_im*ur[k_idx][c] - pq_re*ui[k_idx][c];
    }
    *re_out = updq_re*dot_re - updq_im*dot_im;
    *im_out = updq_re*dot_im + updq_im*dot_re;
}

static void ic_spectral(int N, double amp, double alpha, double phase_seed) {
    nm_g = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm_g);
    for (int i = 0; i < nm_g; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        double k2=(double)(kx*kx+ky*ky+kz*kz);
        double km=sqrt(k2); if(km<0.5) continue;
        double va = amp * pow(km, -alpha);
        double phase = phase_seed + (double)i * 0.7;
        double ux = va*sin(M_PI*phase), uy = va*cos(M_PI*phase*0.6), uz=0;
        if(kz!=0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
        else if(ky!=0) uy = -(double)kx*ux/(double)ky;
        else ux=0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

/* Store triad phases at current state for a specific shell K */
#define MAX_TRIADS_PER_SHELL 600000
static double triad_phases[MAX_TRIADS_PER_SHELL];
static double triad_magnitudes[MAX_TRIADS_PER_SHELL];
/* Triad geometry: |p|, |q|, cos(angle between p and q) */
static double triad_p_mag[MAX_TRIADS_PER_SHELL];
static double triad_q_mag[MAX_TRIADS_PER_SHELL];
static int n_stored;

static void store_triad_phases(int K, int N) {
    int n_max_sq = N*N;
    n_stored = 0;
    for (int k_idx = 0; k_idx < nm_g && n_stored < MAX_TRIADS_PER_SHELL; k_idx++) {
        int kx=mkx[k_idx], ky=mky[k_idx], kz=mkz[k_idx];
        int k2=kx*kx+ky*ky+kz*kz;
        if ((int)(sqrt((double)k2)+0.5) != K) continue;
        for (int p_idx = 0; p_idx < nm_g && n_stored < MAX_TRIADS_PER_SHELL; p_idx++) {
            int px=mkx[p_idx], py=mky[p_idx], pz=mkz[p_idx];
            int qx=kx-px, qy=ky-py, qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if (q2<=0 || q2>n_max_sq) continue;
            int q_idx = find_mode(qx, qy, qz);
            if (q_idx < 0) continue;
            double zr, zi;
            triad_complex(k_idx, p_idx, q_idx, &zr, &zi);
            double mag = sqrt(zr*zr + zi*zi);
            if (mag < 1e-30) continue;
            triad_phases[n_stored] = atan2(zi, zr);
            triad_magnitudes[n_stored] = mag;
            int p2 = px*px+py*py+pz*pz;
            triad_p_mag[n_stored] = sqrt((double)p2);
            triad_q_mag[n_stored] = sqrt((double)q2);
            n_stored++;
        }
    }
}

/* Compute resultant length from stored phases */
static double compute_R(void) {
    double sx=0, sy=0, sa=0;
    for (int i = 0; i < n_stored; i++) {
        sx += triad_magnitudes[i] * cos(triad_phases[i]);
        sy += triad_magnitudes[i] * sin(triad_phases[i]);
        sa += triad_magnitudes[i];
    }
    return (sa > 1e-30) ? sqrt(sx*sx+sy*sy)/sa : 0;
}

int main(void) {
    printf("################################################################\n");
    printf("#  PHASE ROTATION RATES AND MIXING DYNAMICS                    #\n");
    printf("#                                                              #\n");
    printf("#  Measures how triad phases evolve under NS dynamics.         #\n");
    printf("#  If phases rotate at DIFFERENT rates, they spread (mix).     #\n");
    printf("#  The variance of rotation rates = mixing strength.           #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    int N = 6;
    double nu = 0.01, dt = 0.0001;

    /* === Part 1: R_K(t) over time — does phase spread increase? === */
    printf("  === Part 1: R_K(t) over time (does mixing increase?) ===\n\n");
    printf("  t        ");
    for (int K=1; K<=N && K<MSH; K++) printf("R(K=%d)    ", K);
    printf("\n  -------  ");
    for (int K=1; K<=N && K<MSH; K++) printf("--------  ");
    printf("\n");
    fflush(stdout);

    ic_spectral(N, 0.30, 1.0, 0.3);
    nm_g = (int)c3d_get_num_modes();

    /* Measure at t=0 and every 50 steps (dt=0.005) */
    for (int step = 0; step <= 2000; step++) {
        if (step > 0) { buf_set(0,nu); buf_set(1,dt); c3d_do_step(); }
        if (step % 50 != 0) continue;

        read_state();
        double t = step * dt;
        printf("  %.5f  ", t);

        for (int K=1; K<=N && K<MSH; K++) {
            store_triad_phases(K, N);
            double R = compute_R();
            printf("%.6f  ", R);
        }
        printf("\n");
        if (step % 500 == 0) fflush(stdout);
    }
    printf("\n");

    /* === Part 2: Phase rotation rates at a specific time === */
    printf("  === Part 2: Phase rotation rates (finite difference) ===\n\n");

    ic_spectral(N, 0.30, 1.0, 0.3);
    nm_g = (int)c3d_get_num_modes();
    buf_set(0,nu); buf_set(1,dt);
    for (int s=0; s<500; s++) c3d_do_step();  /* evolve to t=0.05 */

    for (int K = 1; K <= N && K < MSH; K++) {
        /* Store phases at t */
        read_state();
        store_triad_phases(K, N);
        int nt = n_stored;
        double *phases_t = malloc(nt * sizeof(double));
        double *mags_t = malloc(nt * sizeof(double));
        double *p_mags = malloc(nt * sizeof(double));
        double *q_mags = malloc(nt * sizeof(double));
        memcpy(phases_t, triad_phases, nt*sizeof(double));
        memcpy(mags_t, triad_magnitudes, nt*sizeof(double));
        memcpy(p_mags, triad_p_mag, nt*sizeof(double));
        memcpy(q_mags, triad_q_mag, nt*sizeof(double));

        /* Step forward by 10 steps (dt_total = 0.001) */
        for (int s=0; s<10; s++) c3d_do_step();
        double dt_total = 10.0 * dt;

        /* Store phases at t + dt */
        read_state();
        store_triad_phases(K, N);

        /* Compute rotation rates omega_i = (theta(t+dt) - theta(t)) / dt */
        int n_rates = (nt < n_stored) ? nt : n_stored;
        double sum_omega = 0, sum_omega2 = 0;
        double min_omega = 1e30, max_omega = -1e30;
        int n_valid = 0;

        for (int i = 0; i < n_rates; i++) {
            double dtheta = triad_phases[i] - phases_t[i];
            /* Unwrap phase */
            while (dtheta > M_PI) dtheta -= 2*M_PI;
            while (dtheta < -M_PI) dtheta += 2*M_PI;
            double omega = dtheta / dt_total;

            sum_omega += omega;
            sum_omega2 += omega*omega;
            if (omega < min_omega) min_omega = omega;
            if (omega > max_omega) max_omega = omega;
            n_valid++;
        }

        double mean_omega = sum_omega / n_valid;
        double var_omega = sum_omega2/n_valid - mean_omega*mean_omega;
        double std_omega = sqrt(fabs(var_omega));

        printf("  Shell K=%d: %d triads\n", K, n_valid);
        printf("    Rotation rate omega: mean=%+.4f, std=%.4f, min=%+.4f, max=%+.4f\n",
               mean_omega, std_omega, min_omega, max_omega);
        printf("    Spread ratio (std/|mean|): %.4f\n",
               (fabs(mean_omega) > 1e-10) ? std_omega/fabs(mean_omega) : 999.0);
        printf("    Range/std: %.4f\n", (std_omega>1e-10) ? (max_omega-min_omega)/std_omega : 0);
        printf("\n");

        /* Step back to original time for next K */
        /* (Can't step back, so we accept the small time offset for subsequent K) */

        free(phases_t); free(mags_t); free(p_mags); free(q_mags);
    }

    /* === Part 3: Does rotation rate depend on triad geometry? === */
    printf("  === Part 3: Rotation rate vs triad geometry (|p|, |q|) ===\n\n");
    printf("  (Measures whether triads with different |p|,|q| rotate at different rates)\n\n");

    ic_spectral(N, 0.30, 1.0, 0.3);
    nm_g = (int)c3d_get_num_modes();
    buf_set(0,nu); buf_set(1,dt);
    for (int s=0; s<500; s++) c3d_do_step();

    int K_test = 3;

    /* Get phases at t */
    read_state();
    store_triad_phases(K_test, N);
    int nt2 = n_stored;
    double *ph_before = malloc(nt2 * sizeof(double));
    double *pm_before = malloc(nt2 * sizeof(double));
    double *qm_before = malloc(nt2 * sizeof(double));
    memcpy(ph_before, triad_phases, nt2*sizeof(double));
    memcpy(pm_before, triad_p_mag, nt2*sizeof(double));
    memcpy(qm_before, triad_q_mag, nt2*sizeof(double));

    /* Step forward */
    for (int s=0; s<10; s++) c3d_do_step();
    read_state();
    store_triad_phases(K_test, N);

    printf("  Shell K=%d: rotation rate by source shell |p|\n\n", K_test);
    printf("  |p|  n_triads  mean_omega    std_omega   spread_ratio\n");
    printf("  ---  --------  ----------  ----------  ------------\n");

    for (int ps = 1; ps <= N; ps++) {
        double sw=0, sw2=0; int nc=0;
        int nmin = (nt2 < n_stored) ? nt2 : n_stored;
        for (int i = 0; i < nmin; i++) {
            if ((int)(pm_before[i]+0.5) != ps) continue;
            double dth = triad_phases[i] - ph_before[i];
            while (dth > M_PI) dth -= 2*M_PI;
            while (dth < -M_PI) dth += 2*M_PI;
            double w = dth / (10.0*dt);
            sw += w; sw2 += w*w; nc++;
        }
        if (nc < 2) continue;
        double m = sw/nc, v = sw2/nc - m*m;
        printf("  %-3d  %-8d  %+10.4f  %10.4f  %12.4f\n",
               ps, nc, m, sqrt(fabs(v)),
               (fabs(m)>1e-10) ? sqrt(fabs(v))/fabs(m) : 999.0);
    }

    free(ph_before); free(pm_before); free(qm_before);

    printf("\n");
    printf("################################################################\n");
    printf("#  INTERPRETATION FOR LEMMA B                                   #\n");
    printf("#                                                              #\n");
    printf("#  If std(omega) >> 0: rotation rates are spread.             #\n");
    printf("#  If spread_ratio >> 1: rates are diverse (not synchronized). #\n");
    printf("#  If R_K(t) decreases over time: mixing is active.           #\n");
    printf("#                                                              #\n");
    printf("#  For Lemma B we need: the -i factor creates rotation rates  #\n");
    printf("#  that are INCOMMENSURATE across triads at each shell,       #\n");
    printf("#  leading to phase mixing and R_K <= C/sqrt(n_K).            #\n");
    printf("#                                                              #\n");
    printf("#  Key: if mean rotation rate DIFFERS by source shell |p|,    #\n");
    printf("#  then the geometric structure of the triads (determined by  #\n");
    printf("#  the lattice Z^3) creates the diversity that drives mixing. #\n");
    printf("################################################################\n");

    return 0;
}
