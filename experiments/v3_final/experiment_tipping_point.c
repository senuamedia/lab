/*
 * experiment_tipping_point.c — Fast tipping-point scanner
 *
 * Runs each amplitude SEQUENTIALLY (not parallel lockstep) but with
 * ADAPTIVE sampling near the tipping point. Much faster than parallel
 * lockstep because no save/restore overhead.
 *
 * Focused: A = 0.26, 0.27, 0.28, 0.29, 0.30, 0.31, 0.32
 * For each A, runs N=2..6, records H(t) trajectory, then computes
 * contraction ratios and identifies the exact crossover.
 *
 * The key output: at what amplitude does ρ cross 1.0?
 * And which array (Energy/Enstrophy/Shell/Spectral) crosses first?
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>
#include <time.h>

#ifndef PARAM_NU
#define PARAM_NU 0.01
#endif
#ifndef PARAM_DT
#define PARAM_DT 0.0001
#endif
#ifndef PARAM_STEPS
#define PARAM_STEPS 5000
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 6
#endif

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_zero_state(int64_t num_modes);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_apply_state(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);
extern int64_t c3d_enstrophy(void);
extern int64_t c3d_energy(void);
extern int64_t c3d_get_state_ux(int64_t idx);
extern int64_t c3d_get_state_uy(int64_t idx);
extern int64_t c3d_get_state_uz(int64_t idx);

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }
static double get_enstrophy(void) { return bits_to_dbl(c3d_enstrophy()); }
static double get_energy(void) { return bits_to_dbl(c3d_energy()); }

#define MAX_BASE_MODES 200
static int base_kx[MAX_BASE_MODES], base_ky[MAX_BASE_MODES], base_kz[MAX_BASE_MODES];
static double base_ux[MAX_BASE_MODES], base_uy[MAX_BASE_MODES], base_uz[MAX_BASE_MODES];
static int num_base_modes = 0;

static void generate_fixed_u0(int n_base, double amp) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    num_base_modes = (nm < MAX_BASE_MODES) ? nm : MAX_BASE_MODES;
    for (int i = 0; i < num_base_modes; i++) {
        base_kx[i] = (int)c3d_get_kx(i);
        base_ky[i] = (int)c3d_get_ky(i);
        base_kz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(base_kx[i]*base_kx[i]+base_ky[i]*base_ky[i]+base_kz[i]*base_kz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (base_kz[i] != 0) uz = -((double)base_kx[i]*ux+(double)base_ky[i]*uy)/(double)base_kz[i];
        else if (base_ky[i] != 0) uy = -(double)base_kx[i]*ux/(double)base_ky[i];
        else ux = 0.0;
        base_ux[i] = ux; base_uy[i] = uy; base_uz[i] = uz;
    }
}

static void apply_projection_and_setup(int n_target, double nu, double dt) {
    int nm = (int)c3d_enumerate_modes(n_target);
    c3d_precompute_triads(n_target);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        for (int j = 0; j < num_base_modes; j++) {
            if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                buf_set(0,(double)i); buf_set(1,base_ux[j]);
                buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                c3d_apply_state(); break;
            }
        }
    }
    buf_set(0, nu); buf_set(1, dt);
}

static double shell_energy(int num_modes, int k_shell) {
    double e = 0.0;
    int k2_lo = k_shell*k_shell, k2_hi = (k_shell+1)*(k_shell+1);
    for (int i = 0; i < num_modes; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        if (k2 >= k2_lo && k2 < k2_hi) {
            double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
            e += ux*ux+uy*uy+uz*uz;
        }
    }
    return 0.5*e;
}

static double participation_ratio(int num_modes) {
    double s2=0, s4=0;
    for (int i = 0; i < num_modes; i++) {
        double ux=get_ux(i), uy=get_uy(i), uz=get_uz(i);
        double e = ux*ux+uy*uy+uz*uz;
        s2 += e; s4 += e*e;
    }
    return (s4 > 1e-30) ? (s2*s2)/s4 : 0;
}

#define MAX_SAMPLES 200
#define MAX_N_LEVELS 8
#define NUM_ARRAYS 4

/* Trajectory storage: arr[array_id][level][sample] */
static double traj[NUM_ARRAYS][MAX_N_LEVELS][MAX_SAMPLES];

static double l2_dist(double *a, double *b, int n) {
    double sum = 0;
    for (int i = 0; i < n; i++) { double d = a[i]-b[i]; sum += d*d; }
    return sqrt(sum);
}

int main(void) {
    double nu = PARAM_NU;
    double dt = PARAM_DT;
    int n_steps = PARAM_STEPS;
    int n_max = PARAM_N_MAX;
    int n_base = 2;
    int sample_interval = 50;
    int n_samples = n_steps / sample_interval;
    if (n_samples > MAX_SAMPLES) n_samples = MAX_SAMPLES;

    const char *arr_names[] = {"ENERGY", "ENSTROPHY", "SHELL_η", "SPECTRAL"};

    printf("############################################################\n");
    printf("#  TIPPING POINT SCANNER                                   #\n");
    printf("#                                                          #\n");
    printf("#  Fine-grained amplitude sweep near the contraction       #\n");
    printf("#  boundary. For each A, run all N sequentially, record    #\n");
    printf("#  trajectories, compute contraction ratios.               #\n");
    printf("#                                                          #\n");
    printf("#  Find exact A where ρ crosses 1.0 for each array.       #\n");
    printf("############################################################\n\n");
    printf("  nu=%.4f, dt=%.6f, steps=%d, N_max=%d, samples=%d\n\n",
           nu, dt, n_steps, n_max, n_samples);

    double amplitudes[] = {0.20, 0.24, 0.26, 0.27, 0.28, 0.285, 0.29, 0.295, 0.30, 0.31, 0.32, 0.35};
    int n_amps = 12;

    /* Summary table header */
    printf("  %-6s  ", "Amp");
    for (int ar = 0; ar < NUM_ARRAYS; ar++)
        printf("ρ_max_%-6s  ", arr_names[ar]);
    printf("First_fail  Crossover?\n");
    printf("  %-6s  ", "------");
    for (int ar = 0; ar < NUM_ARRAYS; ar++)
        printf("-----------  ");
    printf("----------  ----------\n");

    for (int a = 0; a < n_amps; a++) {
        double amp = amplitudes[a];
        generate_fixed_u0(n_base, amp);

        int n_values[MAX_N_LEVELS];
        int n_count = 0;
        for (int n = n_base; n <= n_max && n_count < MAX_N_LEVELS; n++)
            n_values[n_count++] = n;

        /* Run each N level and record all 4 arrays */
        for (int ni = 0; ni < n_count; ni++) {
            int n = n_values[ni];
            apply_projection_and_setup(n, nu, dt);
            int nm = (int)c3d_enumerate_modes(n);
            c3d_precompute_triads(n);
            /* re-apply after enumerate */
            c3d_zero_state(nm);
            for (int i = 0; i < nm; i++) {
                int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
                for (int j = 0; j < num_base_modes; j++) {
                    if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                        buf_set(0,(double)i); buf_set(1,base_ux[j]);
                        buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                        c3d_apply_state(); break;
                    }
                }
            }
            buf_set(0, nu); buf_set(1, dt);

            double prev_shell_e[20];
            memset(prev_shell_e, 0, sizeof(prev_shell_e));
            for (int k = 1; k <= n; k++)
                prev_shell_e[k] = shell_energy(nm, k);

            int s = 0;
            for (int step = 0; step < n_steps; step++) {
                c3d_do_step();
                if (step % sample_interval == (sample_interval-1) && s < n_samples) {
                    traj[0][ni][s] = get_energy();
                    traj[1][ni][s] = get_enstrophy();

                    double max_eta = 0;
                    for (int k = 1; k <= n; k++) {
                        double e_k = shell_energy(nm, k);
                        double k_mid = (double)k+0.5;
                        double D_k = 2.0*nu*k_mid*k_mid*e_k;
                        double dE = (e_k - prev_shell_e[k])/(sample_interval*dt);
                        double T_k = dE + D_k;
                        double eta = (D_k > 1e-20) ? T_k/D_k : 0;
                        if (eta > max_eta) max_eta = eta;
                        prev_shell_e[k] = e_k;
                    }
                    traj[2][ni][s] = max_eta;
                    traj[3][ni][s] = participation_ratio(nm);
                    s++;
                }
            }
        }

        /* Compute contraction ratios for each array */
        double pw[NUM_ARRAYS][MAX_N_LEVELS];
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            for (int ni = 0; ni < n_count-1; ni++)
                pw[ar][ni] = l2_dist(traj[ar][ni], traj[ar][ni+1], n_samples);

        double max_rho[NUM_ARRAYS];
        for (int ar = 0; ar < NUM_ARRAYS; ar++) max_rho[ar] = 0;

        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            for (int ni = 0; ni < n_count-2; ni++) {
                double rho = (pw[ar][ni] > 1e-30) ? pw[ar][ni+1]/pw[ar][ni] : 0;
                if (rho > max_rho[ar]) max_rho[ar] = rho;
            }
        }

        /* Find first array to fail */
        int first_fail = -1;
        double first_fail_rho = 0;
        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            if (max_rho[ar] >= 1.0 && (first_fail < 0 || max_rho[ar] > first_fail_rho)) {
                first_fail = ar;
                first_fail_rho = max_rho[ar];
            }
        }

        int any_fail = 0, all_fail = 1;
        for (int ar = 0; ar < NUM_ARRAYS; ar++) {
            if (max_rho[ar] >= 1.0) any_fail = 1;
            else all_fail = 0;
        }

        printf("  %-6.3f  ", amp);
        for (int ar = 0; ar < NUM_ARRAYS; ar++)
            printf("%11.6f  ", max_rho[ar]);
        printf("%-10s  %s\n",
               first_fail >= 0 ? arr_names[first_fail] : "NONE",
               all_fail ? "ALL FAIL" : (any_fail ? "PARTIAL" : "ALL PASS"));
        fflush(stdout);
    }

    printf("\n");
    printf("############################################################\n");
    printf("#  INTERPRETATION:                                         #\n");
    printf("#                                                          #\n");
    printf("#  The amplitude where ρ first crosses 1.0 is the         #\n");
    printf("#  CONTRACTION BOUNDARY for that array.                    #\n");
    printf("#                                                          #\n");
    printf("#  If all arrays cross at the same A: sharp transition.    #\n");
    printf("#  If arrays cross at different A: cascade of failures.    #\n");
    printf("#  The FIRST array to fail identifies the weakest link.    #\n");
    printf("############################################################\n");

    return 0;
}
