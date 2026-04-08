/*
 * experiment_gamma_monotonicity.c — Test whether gamma(N) is monotonically
 * decreasing as the truncation level N increases.
 *
 * Strategy: fix a base IC at low N, project to increasing N via zero-padding
 * (exactly as the Galerkin approximation of a fixed smooth function does),
 * then measure gamma at each N.
 *
 * If gamma(N) is monotonically decreasing, then verifying gamma < 2 at
 * small N extends automatically to all larger N.
 *
 * Also measures: cancellation ratio, max eta_K, and energy conservation.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_gamma_monotonicity.c \
 *         src/triad_kernel_v3_accessible.c -o build/gamma_monotone -lm
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
extern int64_t c3d_energy_rate_nl(void);
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
#define MAX_BASE 500
static int mkx[MAX_MODES], mky[MAX_MODES], mkz[MAX_MODES];
static double ur[MAX_MODES][3], ui[MAX_MODES][3];
static int nm_g;

/* Base IC storage */
static int base_kx[MAX_BASE], base_ky[MAX_BASE], base_kz[MAX_BASE];
static double base_ux[MAX_BASE], base_uy[MAX_BASE], base_uz[MAX_BASE];
static int n_base_modes = 0;

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

/* Store base IC at N_base */
static void store_base_ic(int N_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(N_base);
    c3d_precompute_triads(N_base);
    n_base_modes = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < n_base_modes; i++) {
        base_kx[i]=(int)c3d_get_kx(i); base_ky[i]=(int)c3d_get_ky(i); base_kz[i]=(int)c3d_get_kz(i);
        double k2=(double)(base_kx[i]*base_kx[i]+base_ky[i]*base_ky[i]+base_kz[i]*base_kz[i]);
        double km=sqrt(k2); if(km<0.5) { base_ux[i]=base_uy[i]=base_uz[i]=0; continue; }
        double va = amp * pow(km, -alpha);
        double phase = (double)i * 0.7 + 0.3;
        double ux = va*sin(M_PI*phase), uy = va*cos(M_PI*phase*0.6), uz=0;
        if(base_kz[i]!=0) uz = -((double)base_kx[i]*ux+(double)base_ky[i]*uy)/(double)base_kz[i];
        else if(base_ky[i]!=0) uy = -(double)base_kx[i]*ux/(double)base_ky[i];
        else ux=0;
        base_ux[i]=ux; base_uy[i]=uy; base_uz[i]=uz;
    }
}

/* Apply base IC to truncation N (zero-padding: new modes start at zero) */
static void apply_base_ic_to(int N) {
    nm_g = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm_g);
    for (int i = 0; i < nm_g; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        for (int j = 0; j < n_base_modes; j++) {
            if (base_kx[j]==kx && base_ky[j]==ky && base_kz[j]==kz) {
                buf_set(0,(double)i); buf_set(1,base_ux[j]); buf_set(2,base_uy[j]); buf_set(3,base_uz[j]);
                c3d_apply_state(); break;
            }
        }
    }
    c3d_enforce_symmetry();
}

/* Measure all diagnostics at current state */
typedef struct {
    double gamma;
    double max_eta;
    double cancel_ratio;  /* |sum T_K| / sum |T_K| */
    double E_tot;
    double Omega;
    double nl_rate;       /* energy conservation check */
} diagnostics_t;

static diagnostics_t measure_all(int N, double nu) {
    diagnostics_t d;
    int n_max_sq = N*N;

    /* Shell energies */
    double E_sh[MSH]; memset(E_sh,0,sizeof(E_sh));
    d.E_tot=0; d.Omega=0;
    for (int i=0; i<nm_g; i++) {
        int k2=mkx[i]*mkx[i]+mky[i]*mky[i]+mkz[i]*mkz[i];
        int sh=(int)(sqrt((double)k2)+0.5);
        double e=0; for(int c=0;c<3;c++) e+=ur[i][c]*ur[i][c]+ui[i][c]*ui[i][c];
        e *= 0.5;
        d.E_tot += e; d.Omega += (double)k2 * e;
        if(sh<MSH) E_sh[sh]+=e;
    }

    /* Per-shell transfer */
    double T_K[MSH]; memset(T_K,0,sizeof(T_K));
    double T_K_abs[MSH]; memset(T_K_abs,0,sizeof(T_K_abs));
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
            double tc = triad_contrib(k_idx,p_idx,q_idx);
            T_K[ks] += tc;
            T_K_abs[ks] += fabs(tc);
        }
    }

    /* Gamma via log-log regression */
    double norm = d.E_tot * sqrt(d.Omega);
    double sx=0,sy=0,sxx=0,sxy=0; int npts=0;
    for (int K=1; K<=N && K<MSH; K++) {
        double absT = fabs(T_K[K]);
        if (absT<1e-30 || norm<1e-30) continue;
        double lK=log((double)K), lr=log(absT/norm);
        sx+=lK; sy+=lr; sxx+=lK*lK; sxy+=lK*lr; npts++;
    }
    d.gamma = (npts>=2) ? (npts*sxy-sx*sy)/(npts*sxx-sx*sx) + 1.0 : -999.0;

    /* Max eta */
    d.max_eta = 0;
    for (int K=1; K<=N && K<MSH; K++) {
        if (E_sh[K]<1e-30) continue;
        double eta = fabs(T_K[K]) / (nu * (double)(K*K) * E_sh[K]);
        if (eta > d.max_eta) d.max_eta = eta;
    }

    /* Cancellation ratio: |sum T_K| / sum |T_K| */
    double sum_signed=0, sum_abs=0;
    for (int K=1; K<=N && K<MSH; K++) { sum_signed += T_K[K]; sum_abs += fabs(T_K[K]); }
    d.cancel_ratio = (sum_abs>1e-30) ? fabs(sum_signed)/sum_abs : 0;

    /* Energy conservation check */
    d.nl_rate = bits_to_dbl(c3d_energy_rate_nl());

    return d;
}

int main(void) {
    printf("################################################################\n");
    printf("#  GAMMA MONOTONICITY IN N                                     #\n");
    printf("#                                                              #\n");
    printf("#  Fix base IC at N_base, project to N = N_base..N_max.       #\n");
    printf("#  Measure gamma at each N. Check monotonicity.                #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    double nu = 0.01, dt = 0.0001;
    int N_max = 8;

    /* Test with multiple IC types */
    typedef struct { double amp; double alpha; const char* name; } ic_config_t;
    ic_config_t configs[] = {
        {0.10, 1.0, "distributed (A=0.1, alpha=1)"},
        {0.30, 1.0, "distributed (A=0.3, alpha=1)"},
        {0.10, 0.0, "flat (A=0.1, alpha=0)"},
        {0.30, 2.0, "steep (A=0.3, alpha=2)"},
    };
    int n_configs = 4;
    int N_base = 2;

    for (int ci = 0; ci < n_configs; ci++) {
        printf("  === Config: %s, N_base=%d ===\n\n", configs[ci].name, N_base);
        printf("  N     modes   gamma    max_eta  cancel   E_tot     Omega     NL_rate      monotone?\n");
        printf("  ----  ------  -------  -------  ------   --------  --------  -----------  ---------\n");
        fflush(stdout);

        store_base_ic(N_base, configs[ci].amp, configs[ci].alpha);

        double prev_gamma = 999.0;
        int all_monotone = 1;

        for (int N = N_base; N <= N_max; N++) {
            /* Apply base IC with zero-padding to N */
            apply_base_ic_to(N);
            nm_g = (int)c3d_get_num_modes();

            /* Evolve for a short time */
            buf_set(0, nu); buf_set(1, dt);
            for (int s = 0; s < 500; s++) c3d_do_step();

            read_state();
            diagnostics_t d = measure_all(N, nu);

            int mono = (d.gamma <= prev_gamma + 0.01); /* allow small numerical noise */
            if (!mono) all_monotone = 0;

            printf("  %-4d  %-6d  %+7.3f  %7.4f  %6.4f   %.2e  %.2e  %+11.2e  %s\n",
                   N, nm_g, d.gamma, d.max_eta, d.cancel_ratio,
                   d.E_tot, d.Omega, d.nl_rate,
                   (N==N_base) ? "---" : (mono ? "YES" : "**NO**"));
            fflush(stdout);

            prev_gamma = d.gamma;
        }

        printf("\n  >>> Monotone across all N? %s\n\n", all_monotone ? "YES" : "NO — investigate!");
        printf("  ---\n\n");
    }

    /* === Also test at t=0 (instantaneous, no evolution) === */
    printf("  === INSTANTANEOUS (t=0): gamma from IC directly, no evolution ===\n\n");
    printf("  N     modes   gamma_t0  max_eta  cancel   E_tot     Omega\n");
    printf("  ----  ------  --------  -------  ------   --------  --------\n");

    store_base_ic(N_base, 0.30, 1.0);
    double prev_gamma = 999.0;
    for (int N = N_base; N <= N_max; N++) {
        apply_base_ic_to(N);
        nm_g = (int)c3d_get_num_modes();
        read_state();
        diagnostics_t d = measure_all(N, nu);
        printf("  %-4d  %-6d  %+8.3f  %7.4f  %6.4f   %.2e  %.2e  %s\n",
               N, nm_g, d.gamma, d.max_eta, d.cancel_ratio,
               d.E_tot, d.Omega,
               (d.gamma < prev_gamma + 0.01) ? "" : "  <-- NON-MONOTONE");
        prev_gamma = d.gamma;
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  INTERPRETATION                                              #\n");
    printf("#                                                              #\n");
    printf("#  If gamma decreases monotonically with N for ALL IC types:  #\n");
    printf("#  verifying gamma < 2 at N_base suffices for all N >= N_base.#\n");
    printf("#                                                              #\n");
    printf("#  If cancel_ratio decreases with N: more modes = more        #\n");
    printf("#  cancellation = stronger depletion. This is the mechanism.  #\n");
    printf("#                                                              #\n");
    printf("#  Combined with Grujic-Xu (2024) asymptotic criticality:    #\n");
    printf("#  the gap vanishes as N -> inf, consistent with monotone     #\n");
    printf("#  improvement of gamma.                                       #\n");
    printf("################################################################\n");

    return 0;
}
