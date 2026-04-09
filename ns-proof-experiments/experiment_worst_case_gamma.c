/*
 * experiment_worst_case_gamma.c — Search for the worst-case γ across
 * diverse initial conditions at each truncation level N.
 *
 * For the computer-assisted proof, we need:
 *   γ*(N) = max over all div-free û of the effective scaling exponent
 * If γ*(N) < 2 for all N, the per-shell transfer is subcritical.
 *
 * Strategy: sample many different IC classes (spectral decay, flat,
 * concentrated, random phases, adversarial) and measure γ for each.
 * Report the WORST (maximum) γ found at each N.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_worst_case_gamma.c \
 *         src/triad_kernel_v3_accessible.c -o build/worst_case_gamma -lm
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
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i));    ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i));    ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i));    ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

static double triad_contrib(int k_idx, int p_idx, int q_idx) {
    int kx=mkx[k_idx], ky=mky[k_idx], kz=mkz[k_idx], k2=kx*kx+ky*ky+kz*kz;
    double updq_re=ur[p_idx][0]*(double)mkx[q_idx]+ur[p_idx][1]*(double)mky[q_idx]+ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im=ui[p_idx][0]*(double)mkx[q_idx]+ui[p_idx][1]*(double)mky[q_idx]+ui[p_idx][2]*(double)mkz[q_idx];
    double kduq_re=(double)kx*ur[q_idx][0]+(double)ky*ur[q_idx][1]+(double)kz*ur[q_idx][2];
    double kduq_im=(double)kx*ui[q_idx][0]+(double)ky*ui[q_idx][1]+(double)kz*ui[q_idx][2];
    double sc_re=kduq_re/(double)k2, sc_im=kduq_im/(double)k2;
    double c=0;
    for (int cc=0; cc<3; cc++) {
        double kc=(cc==0)?(double)kx:(cc==1)?(double)ky:(double)kz;
        double pq_re=ur[q_idx][cc]-sc_re*kc, pq_im=ui[q_idx][cc]-sc_im*kc;
        double pr=updq_re*pq_re-updq_im*pq_im, pi_v=updq_re*pq_im+updq_im*pq_re;
        c += ur[k_idx][cc]*pi_v + ui[k_idx][cc]*(-pr);
    }
    return c;
}

/* Simple PRNG for reproducibility */
static unsigned long rng_state = 12345678901ULL;
static double rng_double(void) {
    rng_state = rng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    return (double)(rng_state >> 33) / (double)(1ULL << 31);
}

/*
 * IC generators: diverse initial conditions to search for worst-case gamma
 */

/* Type 1: Standard spectral decay |û_k| ~ A * |k|^{-alpha} */
static void ic_spectral_decay(int N, double amp, double alpha, double phase_seed) {
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

/* Type 2: Flat spectrum — all modes equal amplitude (worst case for Sobolev) */
static void ic_flat_spectrum(int N, double amp, double phase_seed) {
    nm_g = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm_g);
    for (int i = 0; i < nm_g; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        double k2=(double)(kx*kx+ky*ky+kz*kz);
        if(k2<0.5) continue;
        double phase = phase_seed + (double)i * 1.13;
        double ux = amp*sin(M_PI*phase), uy = amp*cos(M_PI*phase*0.8), uz=0;
        if(kz!=0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
        else if(ky!=0) uy = -(double)kx*ux/(double)ky;
        else ux=0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

/* Type 3: Concentrated at a single shell (worst case for phase cancellation) */
static void ic_single_shell(int N, int target_shell, double amp, double phase_seed) {
    nm_g = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm_g);
    for (int i = 0; i < nm_g; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2=kx*kx+ky*ky+kz*kz;
        int sh = (int)(sqrt((double)k2)+0.5);
        if (sh != target_shell) continue;
        double phase = phase_seed + (double)i * 0.9;
        double ux = amp*sin(M_PI*phase), uy = amp*cos(M_PI*phase*0.5), uz=0;
        if(kz!=0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
        else if(ky!=0) uy = -(double)kx*ux/(double)ky;
        else ux=0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

/* Type 4: Random phases (Monte Carlo search for worst case) */
static void ic_random_phases(int N, double amp, double alpha) {
    nm_g = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm_g);
    for (int i = 0; i < nm_g; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        double k2=(double)(kx*kx+ky*ky+kz*kz);
        double km=sqrt(k2); if(km<0.5) continue;
        double va = amp * pow(km, -alpha);
        double ph1 = rng_double()*2*M_PI, ph2 = rng_double()*2*M_PI;
        double ux = va*sin(ph1), uy = va*cos(ph2), uz=0;
        if(kz!=0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
        else if(ky!=0) uy = -(double)kx*ux/(double)ky;
        else ux=0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

/*
 * Measure gamma: fit |T_K| / (E * Omega^{1/2}) ~ K^{gamma-1}
 * via log-log regression across shells
 */
static double measure_gamma(int N) {
    int n_max_sq = N*N;

    /* Compute shell energies and total E, Omega */
    double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
    double E_tot=0, Omega=0;
    for (int i=0; i<nm_g; i++) {
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        double e=0; for(int c=0;c<3;c++) e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];
        e *= 0.5;
        E_tot += e; Omega += (double)k2 * e;
        if(sh<MSH) E_sh[sh]+=e;
    }
    if (E_tot<1e-30 || Omega<1e-30) return -999.0;

    /* Compute per-shell transfer |T_K| */
    double T_K[MSH]; memset(T_K,0,sizeof(T_K));
    for (int p_idx=0; p_idx<nm_g; p_idx++) {
        int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
        for (int k_idx=0; k_idx<nm_g; k_idx++) {
            int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
            int k2=kx*kx+ky*ky+kz*kz;
            int ks=(int)(sqrt((double)k2)+0.5);
            if(ks>=MSH||ks<1) continue;
            int qx=kx-px,qy=ky-py,qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if(q2<=0||q2>n_max_sq) continue;
            int q_idx=find_mode(qx,qy,qz);
            if(q_idx<0) continue;
            T_K[ks] += triad_contrib(k_idx,p_idx,q_idx);
        }
    }

    /* Normalize: r_K = |T_K| / (E * Omega^{1/2}) */
    double norm = E_tot * sqrt(Omega);
    if (norm<1e-30) return -999.0;

    /* Log-log regression: log(r_K) = (gamma-1)*log(K) + const */
    double sx=0,sy=0,sxx=0,sxy=0;
    int npts=0;
    for (int K=1; K<=N && K<MSH; K++) {
        double absT = fabs(T_K[K]);
        if (absT < 1e-30) continue;
        double lK = log((double)K);
        double lr = log(absT / norm);
        sx += lK; sy += lr; sxx += lK*lK; sxy += lK*lr;
        npts++;
    }
    if (npts < 2) return -999.0;

    double slope = (npts*sxy - sx*sy) / (npts*sxx - sx*sx);
    return slope + 1.0; /* gamma = slope + 1 */
}

/*
 * Measure eta_K = |T_K| / (nu * K^2 * E_K) at each shell
 * Returns max eta across all shells
 */
static double measure_max_eta(int N, double nu) {
    int n_max_sq = N*N;
    double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
    for (int i=0; i<nm_g; i++) {
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        double e=0; for(int c=0;c<3;c++) e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];
        if(sh<MSH) E_sh[sh]+=0.5*e;
    }

    double T_K[MSH]; memset(T_K,0,sizeof(T_K));
    for (int p_idx=0; p_idx<nm_g; p_idx++) {
        int px=mkx[p_idx],py=mky[p_idx],pz=mkz[p_idx];
        for (int k_idx=0; k_idx<nm_g; k_idx++) {
            int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
            int k2=kx*kx+ky*ky+kz*kz;
            int ks=(int)(sqrt((double)k2)+0.5);
            if(ks>=MSH||ks<1) continue;
            int qx=kx-px,qy=ky-py,qz=kz-pz;
            int q2=qx*qx+qy*qy+qz*qz;
            if(q2<=0||q2>n_max_sq) continue;
            int q_idx=find_mode(qx,qy,qz);
            if(q_idx<0) continue;
            T_K[ks] += triad_contrib(k_idx,p_idx,q_idx);
        }
    }

    double max_eta = 0;
    for (int K=1; K<=N && K<MSH; K++) {
        if (E_sh[K]<1e-30) continue;
        double eta = fabs(T_K[K]) / (nu * (double)(K*K) * E_sh[K]);
        if (eta > max_eta) max_eta = eta;
    }
    return max_eta;
}

int main(void) {
    printf("################################################################\n");
    printf("#  WORST-CASE GAMMA SEARCH                                     #\n");
    printf("#                                                              #\n");
    printf("#  For each N: sample diverse IC classes, measure gamma.       #\n");
    printf("#  Report the MAXIMUM gamma found.                             #\n");
    printf("#  If max gamma < 2 at all N: subcritical transfer.            #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    double nu = 0.01, dt = 0.0001;
    int time_steps[] = {0, 100, 500};  /* t=0, t=0.01, t=0.05 */
    int n_time = 3;
    int N_values[] = {3, 4, 5, 6, 7, 8};
    int n_N = 6;

    printf("  N     IC_type          alpha  phase   t      gamma    max_eta   E_tot     Omega\n");
    printf("  ----  ---------------  -----  -----  ------  -------  --------  --------  --------\n");
    fflush(stdout);

    for (int ni = 0; ni < n_N; ni++) {
        int N = N_values[ni];
        double worst_gamma = -999.0;
        double worst_eta = 0;
        char worst_desc[80] = "";

        /* === Type 1: Spectral decay with various alpha and phases === */
        double alphas[] = {0.0, 0.5, 1.0, 1.5, 2.0, 3.0};
        double phases[] = {0.3, 0.7, 1.1, 2.3, 3.7};
        for (int ai=0; ai<6; ai++) {
            for (int pi=0; pi<5; pi++) {
                ic_spectral_decay(N, 0.3, alphas[ai], phases[pi]);
                nm_g = (int)c3d_get_num_modes();
                for (int ti=0; ti<n_time; ti++) {
                    if (ti>0) { buf_set(0,nu); buf_set(1,dt); for(int s=0;s<time_steps[ti];s++) c3d_do_step(); }
                    read_state();
                    double E = bits_to_dbl(c3d_energy());
                    double Om = bits_to_dbl(c3d_enstrophy());
                    double g = measure_gamma(N);
                    double eta = measure_max_eta(N, nu);
                    if (g > worst_gamma) {
                        worst_gamma = g;
                        snprintf(worst_desc,80,"spectral a=%.1f p=%.1f t=%.2f",alphas[ai],phases[pi],time_steps[ti]*dt);
                    }
                    if (eta > worst_eta) worst_eta = eta;
                    printf("  %-4d  spectral_decay   %.1f    %.1f    %.4f  %+7.3f  %8.4f  %.2e  %.2e\n",
                           N, alphas[ai], phases[pi], time_steps[ti]*dt, g, eta, E, Om);
                }
                /* Reset for next IC */
                ic_spectral_decay(N, 0.3, alphas[ai], phases[pi]);
                nm_g = (int)c3d_get_num_modes();
            }
        }

        /* === Type 2: Flat spectrum === */
        for (int pi=0; pi<5; pi++) {
            ic_flat_spectrum(N, 0.01, phases[pi]);
            nm_g = (int)c3d_get_num_modes();
            for (int ti=0; ti<n_time; ti++) {
                if (ti>0) { buf_set(0,nu); buf_set(1,dt); for(int s=0;s<time_steps[ti];s++) c3d_do_step(); }
                read_state();
                double E = bits_to_dbl(c3d_energy());
                double Om = bits_to_dbl(c3d_enstrophy());
                double g = measure_gamma(N);
                double eta = measure_max_eta(N, nu);
                if (g > worst_gamma) {
                    worst_gamma = g;
                    snprintf(worst_desc,80,"flat p=%.1f t=%.2f",phases[pi],time_steps[ti]*dt);
                }
                if (eta > worst_eta) worst_eta = eta;
                printf("  %-4d  flat_spectrum    0.0    %.1f    %.4f  %+7.3f  %8.4f  %.2e  %.2e\n",
                       N, phases[pi], time_steps[ti]*dt, g, eta, E, Om);
            }
            ic_flat_spectrum(N, 0.01, phases[pi]);
            nm_g = (int)c3d_get_num_modes();
        }

        /* === Type 3: Single-shell concentrated === */
        for (int sh=1; sh<=N && sh<MSH; sh++) {
            ic_single_shell(N, sh, 0.3, 0.5);
            nm_g = (int)c3d_get_num_modes();
            for (int ti=0; ti<n_time; ti++) {
                if (ti>0) { buf_set(0,nu); buf_set(1,dt); for(int s=0;s<time_steps[ti];s++) c3d_do_step(); }
                read_state();
                double E = bits_to_dbl(c3d_energy());
                double Om = bits_to_dbl(c3d_enstrophy());
                double g = measure_gamma(N);
                double eta = measure_max_eta(N, nu);
                if (g > worst_gamma) {
                    worst_gamma = g;
                    snprintf(worst_desc,80,"shell=%d t=%.2f",sh,time_steps[ti]*dt);
                }
                if (eta > worst_eta) worst_eta = eta;
                printf("  %-4d  single_shell_%d   0.0    0.5    %.4f  %+7.3f  %8.4f  %.2e  %.2e\n",
                       N, sh, time_steps[ti]*dt, g, eta, E, Om);
            }
            ic_single_shell(N, sh, 0.3, 0.5);
            nm_g = (int)c3d_get_num_modes();
        }

        /* === Type 4: Random phase Monte Carlo (50 samples) === */
        for (int ri=0; ri<50; ri++) {
            double ra = 0.5 + rng_double() * 2.0; /* alpha in [0.5, 2.5] */
            ic_random_phases(N, 0.1, ra);
            nm_g = (int)c3d_get_num_modes();
            read_state();
            double E = bits_to_dbl(c3d_energy());
            double Om = bits_to_dbl(c3d_enstrophy());
            double g = measure_gamma(N);
            double eta = measure_max_eta(N, nu);
            if (g > worst_gamma) {
                worst_gamma = g;
                snprintf(worst_desc,80,"random #%d a=%.2f",ri,ra);
            }
            if (eta > worst_eta) worst_eta = eta;
            if (ri % 10 == 0)
                printf("  %-4d  random_phase     %.2f   rnd    0.0000  %+7.3f  %8.4f  %.2e  %.2e\n",
                       N, ra, g, eta, E, Om);
        }

        printf("\n  >>> N=%d: WORST gamma = %+.4f (from: %s)\n", N, worst_gamma, worst_desc);
        printf("  >>> N=%d: WORST eta   = %.6f\n", N, worst_eta);
        printf("  >>> N=%d: gamma < 2?  %s (margin = %.4f)\n\n",
               N, worst_gamma < 2.0 ? "YES" : "**NO**", 2.0 - worst_gamma);
        fflush(stdout);
    }

    printf("################################################################\n");
    printf("#  INTERPRETATION                                              #\n");
    printf("#                                                              #\n");
    printf("#  If gamma < 2 at every N for EVERY IC class tested:         #\n");
    printf("#  the subcritical bound holds across the sampled space.       #\n");
    printf("#  The margin (2 - gamma) quantifies robustness.              #\n");
    printf("#                                                              #\n");
    printf("#  If gamma DECREASES with N: monotonicity supports the       #\n");
    printf("#  computer-assisted proof strategy (verify small N,           #\n");
    printf("#  prove monotonicity analytically for large N).              #\n");
    printf("################################################################\n");

    return 0;
}
