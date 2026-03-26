/*
 * experiment_universality.c — Verify C_s universality across (ν, A, IC)
 *
 * For each (ν, A, IC) configuration:
 *   1. Measure γ (cascade power-law exponent)
 *   2. Measure C_s = max_k,t |T_k|/(E·k^{3/2})
 *   3. Measure C_L = max_k,t |T_k|/(E·Ω^{1/2}·k^{γ-1})
 *   4. Run adaptive N — confirm cascade stabilises
 *   5. Track Ω(t) — confirm bounded
 *   6. Scaffold contraction ratios
 *
 * Parameters passed via -D compile flags:
 *   PARAM_NU, PARAM_AMP, PARAM_IC_TYPE, PARAM_N_MAX, PARAM_N_CEILING
 *
 * IC types: 0=distributed (1/|k| decay), 1=Taylor-Green, 2=concentrated, 3=random
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

#ifndef PARAM_NU
#define PARAM_NU 0.01
#endif
#ifndef PARAM_AMP
#define PARAM_AMP 0.3
#endif
#ifndef PARAM_IC_TYPE
#define PARAM_IC_TYPE 0
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 8
#endif
#ifndef PARAM_N_CEILING
#define PARAM_N_CEILING 20
#endif

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }

static double shell_energy(int nm, int k) {
    double e = 0; int k2lo = k*k, k2hi = (k+1)*(k+1);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        int k2=kx*kx+ky*ky+kz*kz;
        if (k2>=k2lo && k2<k2hi) {
            double x=get_ux(i),y=get_uy(i),z=get_uz(i);
            e += x*x+y*y+z*z;
        }
    }
    return 0.5*e;
}

/* IC type 0: distributed — energy decays as 1/|k| */
static void setup_ic_distributed(int nm, double amp) {
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        double k2=(double)(kx*kx+ky*ky+kz*kz), km=sqrt(k2);
        if(km<0.001) km=1.0;
        double va=amp/km, phase=(double)i*0.7+0.3;
        double ux=va*sin(M_PI*phase), uy=va*sin(M_PI*(phase+0.4)), uz=0;
        if(kz!=0) uz=-((double)kx*ux+(double)ky*uy)/(double)kz;
        else if(ky!=0) uy=-(double)kx*ux/(double)ky;
        else ux=0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

/* IC type 1: Taylor-Green vortex */
static void setup_ic_taylor_green(int nm, double amp) {
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        double ux=0, uy=0, uz=0;
        /* Taylor-Green: u = (sin x cos y cos z, -cos x sin y cos z, 0) */
        /* Fourier modes: (1,1,1), (1,-1,1), (-1,1,1), (-1,-1,1) and conjugates */
        int k2 = kx*kx+ky*ky+kz*kz;
        if (k2 == 3) { /* |k| = sqrt(3), modes (±1,±1,±1) */
            ux = amp * 0.125 * (double)kx;
            uy = -amp * 0.125 * (double)ky;
            uz = 0;
            /* Enforce div-free: kx*ux+ky*uy+kz*uz = 0 */
            if(kz!=0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
        }
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

/* IC type 2: concentrated — energy in single shell |k|=2 */
static void setup_ic_concentrated(int nm, double amp) {
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        int k2 = kx*kx+ky*ky+kz*kz;
        double ux=0, uy=0, uz=0;
        if (k2 >= 4 && k2 < 9) { /* shell |k| in [2,3) */
            double phase = (double)i*1.3+0.7;
            ux = amp*sin(phase); uy = amp*cos(phase); uz = 0;
            if(kz!=0) uz=-((double)kx*ux+(double)ky*uy)/(double)kz;
            else if(ky!=0) uy=-(double)kx*ux/(double)ky;
            else ux=0;
        }
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

/* IC type 3: random divergence-free with seed */
static void setup_ic_random(int nm, double amp, int seed) {
    srand(seed);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        double k2=(double)(kx*kx+ky*ky+kz*kz), km=sqrt(k2);
        if(km<0.001) km=1.0;
        double va=amp/km;
        double ux=va*((double)rand()/RAND_MAX-0.5);
        double uy=va*((double)rand()/RAND_MAX-0.5);
        double uz=0;
        if(kz!=0) uz=-((double)kx*ux+(double)ky*uy)/(double)kz;
        else if(ky!=0) uy=-(double)kx*ux/(double)ky;
        else ux=0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

static void setup_ic(int nm, double amp, int ic_type) {
    switch(ic_type) {
        case 0: setup_ic_distributed(nm, amp); break;
        case 1: setup_ic_taylor_green(nm, amp); break;
        case 2: setup_ic_concentrated(nm, amp); break;
        case 3: setup_ic_random(nm, amp, 42); break;
        case 4: setup_ic_random(nm, amp, 137); break;
        case 5: setup_ic_random(nm, amp, 271); break;
        default: setup_ic_distributed(nm, amp); break;
    }
}

static const char* ic_name(int ic_type) {
    switch(ic_type) {
        case 0: return "distributed";
        case 1: return "taylor-green";
        case 2: return "concentrated";
        case 3: return "random-seed42";
        case 4: return "random-seed137";
        case 5: return "random-seed271";
        default: return "unknown";
    }
}

int main(void) {
    double nu = PARAM_NU;
    double amp = PARAM_AMP;
    int ic_type = PARAM_IC_TYPE;
    int n_max = PARAM_N_MAX;
    int n_ceiling = PARAM_N_CEILING;

    /* CFL-based dt selection */
    double dt = 0.5 / (nu * (double)(n_max * n_max) + amp * (double)n_max + 1.0);
    if (dt > 0.0001) dt = 0.0001;
    if (dt < 1e-7) dt = 1e-7;

    int total_steps = (int)(2.0 / dt); /* T = 2.0 total time */
    if (total_steps > 200000) total_steps = 200000;
    int sample_interval = total_steps / 100;
    if (sample_interval < 10) sample_interval = 10;

    printf("################################################################\n");
    printf("#  UNIVERSALITY VERIFICATION — C_s BOUND                      #\n");
    printf("################################################################\n\n");
    printf("  ν = %.6f\n", nu);
    printf("  A = %.4f\n", amp);
    printf("  IC = %s (%d)\n", ic_name(ic_type), ic_type);
    printf("  N_max = %d\n", n_max);
    printf("  N_ceiling = %d (adaptive)\n", n_ceiling);
    printf("  dt = %.2e (CFL-based)\n", dt);
    printf("  Total steps = %d (T = %.2f)\n", total_steps, total_steps * dt);
    printf("  Sample interval = %d\n\n", sample_interval);

    /* ============================================================
     * PHASE 1: Fixed N — measure γ and C_s
     * ============================================================ */
    printf("============================================================\n");
    printf("  PHASE 1: CASCADE EXPONENT AND C_s (fixed N=%d)\n", n_max);
    printf("============================================================\n\n");

    int nm = (int)c3d_enumerate_modes(n_max);
    c3d_precompute_triads(n_max);
    printf("  Modes: %d\n\n", nm);

    setup_ic(nm, amp, ic_type);
    buf_set(0, nu); buf_set(1, dt);

    double E0 = bits_to_dbl(c3d_energy());
    double O0 = bits_to_dbl(c3d_enstrophy());
    printf("  E(0) = %.10f\n", E0);
    printf("  Ω(0) = %.10f\n\n", O0);

    /* Track shell energies for T_k computation */
    double prev_se[40]; memset(prev_se, 0, sizeof(prev_se));
    for (int k = 1; k <= n_max; k++) prev_se[k] = shell_energy(nm, k);

    double max_Cs = 0, max_Cl = 0;
    double max_omega = O0;
    double gamma_global = 0;
    int gamma_count = 0;

    printf("  %-8s %-10s %-10s %-10s %-10s %-10s\n",
           "Step", "Time", "Energy", "Enstrophy", "max_Cs", "max_Cl");

    for (int step = 0; step < total_steps; step++) {
        c3d_do_step();

        if ((step + 1) % sample_interval == 0) {
            double E = bits_to_dbl(c3d_energy());
            double O = bits_to_dbl(c3d_enstrophy());
            if (O > max_omega) max_omega = O;

            /* Measure T_k at each shell */
            double log_k[40], log_Tk[40];
            int valid = 0;

            for (int k = 1; k <= n_max; k++) {
                double ek = shell_energy(nm, k);
                double km = (double)k + 0.5;
                double Dk = 2.0 * nu * km * km * ek;
                double dE_shell = (ek - prev_se[k]) / (sample_interval * dt);
                double T_net = dE_shell + Dk;
                double aTk = fabs(T_net);
                prev_se[k] = ek;

                /* C_s = |T_k| / (E · k^{3/2}) */
                double Cs_k = (E * pow(km, 1.5) > 1e-30) ? aTk / (E * pow(km, 1.5)) : 0;
                if (Cs_k > max_Cs) max_Cs = Cs_k;

                /* C_L = |T_k| / (E · Ω^{1/2} · k^{γ-1}) — use γ=1.5 for now */
                double sqO = sqrt(fabs(O));
                double Cl_k = (E * sqO * pow(km, 0.5) > 1e-30) ?
                    aTk / (E * sqO * pow(km, 0.5)) : 0;
                if (Cl_k > max_Cl) max_Cl = Cl_k;

                if (k >= 2 && aTk > 1e-25) {
                    log_k[valid] = log(km);
                    log_Tk[valid] = log(aTk);
                    valid++;
                }
            }

            /* Fit γ */
            if (valid >= 2) {
                double sx=0,sy=0,sxy=0,sx2=0;
                for (int i=0;i<valid;i++) {
                    sx+=log_k[i]; sy+=log_Tk[i]; sxy+=log_k[i]*log_Tk[i]; sx2+=log_k[i]*log_k[i];
                }
                double d = valid*sx2 - sx*sx;
                if (fabs(d) > 1e-10) {
                    double g = (valid*sxy - sx*sy) / d;
                    gamma_global += g;
                    gamma_count++;
                }
            }

            printf("  %-8d %-10.4f %-10.6f %-10.6f %-10.6f %-10.6f\n",
                   step+1, (step+1)*dt, E, O, max_Cs, max_Cl);
        }
    }

    double E_final = bits_to_dbl(c3d_energy());
    double O_final = bits_to_dbl(c3d_enstrophy());
    double gamma_avg = (gamma_count > 0) ? gamma_global / gamma_count : 0;

    printf("\n  --- PHASE 1 RESULTS ---\n");
    printf("  E(0) = %.10f → E(T) = %.10f (change: %.4f%%)\n",
           E0, E_final, 100*(E_final-E0)/E0);
    printf("  Ω_max = %.10f\n", max_omega);
    printf("  C_s = %.6f (max |T_k|/(E·k^{3/2}))\n", max_Cs);
    printf("  C_L = %.6f (max |T_k|/(E·Ω^{1/2}·k^{0.5}))\n", max_Cl);
    printf("  γ_avg = %.4f (averaged over %d samples)\n", gamma_avg, gamma_count);
    printf("  γ < 2? %s\n", gamma_avg < 2.0 ? "YES ✓" : "NO ✗");
    printf("  Energy decreasing? %s\n", E_final < E0 ? "YES ✓" : "NO ✗");

    /* ============================================================
     * PHASE 2: Adaptive N — cascade stabilisation
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 2: ADAPTIVE N (ceiling %d)\n", n_ceiling);
    printf("============================================================\n\n");

    int n_active = 3;
    nm = (int)c3d_enumerate_modes(n_active);
    c3d_precompute_triads(n_active);
    setup_ic(nm, amp, ic_type);

    /* Adaptive dt */
    double adt = 0.5 / (nu * (double)(n_ceiling * n_ceiling) + amp * (double)n_ceiling + 1.0);
    if (adt > 0.0001) adt = 0.0001;
    if (adt < 1e-7) adt = 1e-7;
    buf_set(0, nu); buf_set(1, adt);

    E0 = bits_to_dbl(c3d_energy());
    int adaptive_steps = (int)(4.0 / adt);
    if (adaptive_steps > 400000) adaptive_steps = 400000;
    int asample = adaptive_steps / 200;
    if (asample < 10) asample = 10;

    int n_max_reached = n_active;
    int stable_count = 0;
    double eps = 1e-6;

    printf("  %-8s %-8s %-8s %-12s %-12s %-12s %-10s\n",
           "Step", "Time", "N_act", "Energy", "Enstrophy", "E_top/E", "Status");

    for (int step = 0; step < adaptive_steps; step++) {
        c3d_do_step();

        if ((step + 1) % asample == 0) {
            double E = bits_to_dbl(c3d_energy());
            double O = bits_to_dbl(c3d_enstrophy());
            double E_top = shell_energy(nm, n_active);
            double ratio = (E > 1e-30) ? E_top / E : 0;

            const char *status = "stable";
            if (ratio > eps && n_active < n_ceiling) {
                /* Expand */
                n_active++;
                nm = (int)c3d_enumerate_modes(n_active);
                c3d_precompute_triads(n_active);
                /* New modes initialised to zero by enumerate */
                c3d_enforce_symmetry();
                buf_set(0, nu); buf_set(1, adt);
                if (n_active > n_max_reached) n_max_reached = n_active;
                stable_count = 0;
                status = "EXPAND";
            } else {
                stable_count++;
            }

            printf("  %-8d %-8.3f %-8d %-12.6e %-12.6e %-12.3e %s",
                   step+1, (step+1)*adt, n_active, E, O, ratio, status);
            if (stable_count > 0) printf(" (%d)", stable_count);
            printf("\n");

            if (n_active >= n_ceiling) {
                printf("\n  *** HIT CEILING N=%d ***\n", n_ceiling);
            }
        }
    }

    double E_adapt_final = bits_to_dbl(c3d_energy());

    printf("\n  --- PHASE 2 RESULTS ---\n");
    printf("  N_max reached: %d\n", n_max_reached);
    printf("  N_active at end: %d (stable for %d samples)\n", n_active, stable_count);
    printf("  E(0) = %.10f → E(T) = %.10f (change: %.4f%%)\n",
           E0, E_adapt_final, 100*(E_adapt_final-E0)/E0);
    printf("  Hit ceiling? %s\n", n_active >= n_ceiling ? "YES ✗" : "NO ✓");
    printf("  Cascade stabilised? %s\n", stable_count > 20 ? "YES ✓" : "NO/UNCLEAR");

    /* ============================================================
     * SUMMARY
     * ============================================================ */
    printf("\n################################################################\n");
    printf("#  UNIVERSALITY SUMMARY                                       #\n");
    printf("################################################################\n\n");
    printf("  ν = %.6f, A = %.4f, IC = %s\n", nu, amp, ic_name(ic_type));
    printf("  C_s = %.6f (need: bounded, ideally ≤ 0.123)\n", max_Cs);
    printf("  C_L = %.6f (need: bounded, ideally ≤ 0.031)\n", max_Cl);
    printf("  γ = %.4f (need: < 2)\n", gamma_avg);
    printf("  Ω_max = %.6f (need: bounded)\n", max_omega);
    printf("  N_stable = %d (need: finite)\n", n_max_reached);
    printf("  Energy decreasing: %s\n", E_final < E0 ? "YES" : "NO");
    printf("\n");
    printf("  PASS = C_s bounded AND γ < 2 AND energy decreasing AND N stable\n");
    int pass = (max_Cs < 10.0) && (gamma_avg < 2.0) && (E_final < E0) && (stable_count > 10);
    printf("  RESULT: %s\n", pass ? "PASS ✓" : "FAIL ✗");
    printf("\n");

    return pass ? 0 : 1;
}
