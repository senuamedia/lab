/*
 * experiment_suppression_vs_n.c — Does suppression strengthen with N?
 *
 * Measures the cascade exponent γ and max cascade-to-diffusion ratio
 * η_max at each truncation level N = 4, 5, 6, 7, 8, 9, 10, 12.
 *
 * If γ becomes more negative and η_max decreases with N,
 * the suppression strengthens — each new shell is a stronger
 * energy sink than the last.
 *
 * This provides data for the Galerkin monotonicity theorem:
 * the regularity mechanism strengthens with resolution.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_suppression_vs_n.c \
 *         src/triad_kernel_v3_accessible.c -o build/suppress_n -lm
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

#define MAX_BASE 500
#define MAX_MODES 10000
#define MSH 16

static int bkx[MAX_BASE], bky[MAX_BASE], bkz[MAX_BASE];
static double bux[MAX_BASE], buy[MAX_BASE], buz[MAX_BASE];
static int nbm = 0;

static void ic_spectral(int n_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx[i] = (int)c3d_get_kx(i);
        bky[i] = (int)c3d_get_ky(i);
        bkz[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx[i]*bkx[i]+bky[i]*bky[i]+bkz[i]*bkz[i]);
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp * pow(km, -alpha);
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        if (bkz[i] != 0) uz = -((double)bkx[i]*ux+(double)bky[i]*uy)/(double)bkz[i];
        else if (bky[i] != 0) uy = -(double)bkx[i]*ux/(double)bky[i];
        else ux = 0.0;
        bux[i] = ux; buy[i] = uy; buz[i] = uz;
    }
}

static void apply_ic(int N) {
    int nm = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        for (int j = 0; j < nbm; j++) {
            if (bkx[j] == kx && bky[j] == ky && bkz[j] == kz) {
                buf_set(0, (double)i);
                buf_set(1, bux[j]); buf_set(2, buy[j]); buf_set(3, buz[j]);
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

/* Measure per-shell |T_K| from state differences */
static void measure_transfer(int N, int nm, double nu, double dt,
                              double *E_shell, double *T_shell, double *D_shell) {
    /* Compute shell energies before step */
    memset(E_shell, 0, sizeof(double)*MSH);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        int sh = (int)(sqrt((double)k2)+0.5);
        if (sh < MSH) {
            double ur0=bits_to_dbl(c3d_get_state_ux(i));
            double ui0=bits_to_dbl(c3d_get_state_ux_im(i));
            double ur1=bits_to_dbl(c3d_get_state_uy(i));
            double ui1=bits_to_dbl(c3d_get_state_uy_im(i));
            double ur2=bits_to_dbl(c3d_get_state_uz(i));
            double ui2=bits_to_dbl(c3d_get_state_uz_im(i));
            E_shell[sh] += 0.5*(ur0*ur0+ui0*ui0+ur1*ur1+ui1*ui1+ur2*ur2+ui2*ui2);
        }
    }

    /* Diffusion rate per shell: D_K = 2ν(K+0.5)²E_K */
    for (int K = 1; K < MSH && K <= N; K++) {
        D_shell[K] = 2.0 * nu * (K+0.5)*(K+0.5) * E_shell[K];
    }

    /* Take one step, compute shell energies after */
    double E_after[MSH];
    memset(E_after, 0, sizeof(E_after));
    c3d_do_step();
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        int sh = (int)(sqrt((double)k2)+0.5);
        if (sh < MSH) {
            double ur0=bits_to_dbl(c3d_get_state_ux(i));
            double ui0=bits_to_dbl(c3d_get_state_ux_im(i));
            double ur1=bits_to_dbl(c3d_get_state_uy(i));
            double ui1=bits_to_dbl(c3d_get_state_uy_im(i));
            double ur2=bits_to_dbl(c3d_get_state_uz(i));
            double ui2=bits_to_dbl(c3d_get_state_uz_im(i));
            E_after[sh] += 0.5*(ur0*ur0+ui0*ui0+ur1*ur1+ui1*ui1+ur2*ur2+ui2*ui2);
        }
    }

    /* T_K = dE_K/dt + D_K (per-shell transfer) */
    for (int K = 1; K < MSH && K <= N; K++) {
        double dEdt = (E_after[K] - E_shell[K]) / dt;
        T_shell[K] = dEdt + D_shell[K];
    }
}

int main(void) {
    int n_base = 3;
    double dt = 0.0001;
    double amp = 0.20;
    double alpha = 1.0;
    int evolve_steps = 500; /* T = 0.05 before measuring */

    double nus[] = {0.01, 0.001};
    int n_nus = 2;
    int Ns[] = {4, 5, 6, 7, 8, 9, 10, 12};
    int n_Ns = 8;

    printf("################################################################\n");
    printf("#  SUPPRESSION vs N: Does cascade weakening strengthen?        #\n");
    printf("#                                                              #\n");
    printf("#  Measure γ, max(η_K), and per-shell T_K/D_K at each N.     #\n");
    printf("#  If γ ↓ and η_max ↓ with N: Galerkin monotonicity holds.   #\n");
    printf("#                                                              #\n");
    printf("#  A = %.2f, α = %.1f, T_evolve = %.2f                       #\n",
           amp, alpha, dt*evolve_steps);
    printf("################################################################\n\n");

    for (int vi = 0; vi < n_nus; vi++) {
        double nu = nus[vi];
        printf("  ν = %.4f\n", nu);
        printf("  %-4s %-7s %-10s %-10s %-10s %-10s %-10s\n",
               "N", "modes", "E(t)", "Ω(t)", "γ", "max η_K", "η at K=N-1");
        printf("  %-4s %-7s %-10s %-10s %-10s %-10s %-10s\n",
               "---", "------", "---------", "---------",
               "---------", "---------", "---------");

        for (int ni = 0; ni < n_Ns; ni++) {
            int N = Ns[ni];

            /* Set up and evolve */
            ic_spectral(n_base, amp, alpha);
            apply_ic(N);
            int nm = (int)c3d_get_num_modes();

            if (nm > MAX_MODES) {
                printf("  %-4d %-7d SKIPPED (too many modes for MAX_MODES)\n", N, nm);
                continue;
            }

            buf_set(0, nu); buf_set(1, dt);
            for (int s = 0; s < evolve_steps; s++) c3d_do_step();

            /* Measure per-shell transfer */
            double E_sh[MSH], T_sh[MSH], D_sh[MSH];
            memset(T_sh, 0, sizeof(T_sh));
            memset(D_sh, 0, sizeof(D_sh));
            measure_transfer(N, nm, nu, dt, E_sh, T_sh, D_sh);

            /* Compute total energy and enstrophy */
            double E_total = 0, Omega = 0;
            for (int K = 1; K < MSH && K <= N; K++) {
                E_total += E_sh[K];
                Omega += K*K*E_sh[K]; /* approximate */
            }

            /* Fit γ from interior shells K=2..N-2 */
            double lk[MSH], lt[MSH]; int np = 0;
            for (int K = 2; K <= N-1 && K < MSH; K++) {
                double absT = fabs(T_sh[K]);
                if (absT > 1e-30) {
                    lk[np] = log((double)K);
                    lt[np] = log(absT);
                    np++;
                }
            }
            double gamma = 0;
            if (np >= 2) {
                double sx=0,sy=0,sxx=0,sxy=0;
                for (int i=0;i<np;i++){
                    sx+=lk[i];sy+=lt[i];sxx+=lk[i]*lk[i];sxy+=lk[i]*lt[i];
                }
                gamma = (np*sxy-sx*sy)/(np*sxx-sx*sx);
            }

            /* Compute η_K = |T_K|/D_K at each shell, find max */
            double eta_max = 0, eta_boundary = 0;
            for (int K = 2; K <= N-1 && K < MSH; K++) {
                if (D_sh[K] > 1e-30) {
                    double eta = fabs(T_sh[K]) / D_sh[K];
                    if (eta > eta_max) eta_max = eta;
                }
            }
            /* η at boundary shell K=N-1 */
            if (N-1 < MSH && D_sh[N-1] > 1e-30) {
                eta_boundary = fabs(T_sh[N-1]) / D_sh[N-1];
            }

            printf("  %-4d %-7d %-10.4e %-10.4e %+-10.4f %-10.4e %-10.4e\n",
                   N, nm, E_total, Omega, gamma, eta_max, eta_boundary);
            fflush(stdout);
        }
        printf("\n");
    }

    printf("################################################################\n");
    printf("#  If γ becomes more negative with N: cascade weakens faster.  #\n");
    printf("#  If η_max decreases with N: diffusion margin grows.         #\n");
    printf("#  Both → Galerkin monotonicity of subcriticality.            #\n");
    printf("################################################################\n");

    return 0;
}
