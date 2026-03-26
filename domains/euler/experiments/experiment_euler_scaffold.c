/*
 * experiment_euler_scaffold.c — Full 26-level scaffold array for the 3D Euler equations
 *
 * The 3D Euler equations are Navier-Stokes at ν=0 (no viscosity).
 * Energy is exactly conserved by the nonlinear term (verified to machine precision).
 * Without viscous dissipation, the cascade has no drain — energy redistributes
 * but never disappears. The question: does enstrophy blow up in finite time?
 *
 * The scaffold array measures 26 diagnostics across truncation levels N=2..N_max,
 * computing contraction ratios for each. The failure pattern — which arrays diverge
 * first and which survive — diagnoses whether blow-up is genuine or artefactual.
 *
 * Key difference from NS: at ν=0, there is NO diffusion. The per-shell balance
 * η_k = T_k/D_k is undefined (D_k=0). Instead we measure:
 *   - Shell transfer T_k directly (not as a ratio)
 *   - Shell energy E_k growth rate
 *   - Enstrophy growth rate dΩ/dt
 *   - Palinstrophy Σ = Σ |k|⁴ |û|²
 *   - Energy spectrum slope
 *
 * Parameters via -D flags:
 *   PARAM_AMP, PARAM_N_MAX, PARAM_IC_TYPE, PARAM_T_FINAL
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

#ifndef PARAM_AMP
#define PARAM_AMP 0.3
#endif
#ifndef PARAM_N_MAX
#define PARAM_N_MAX 8
#endif
#ifndef PARAM_IC_TYPE
#define PARAM_IC_TYPE 0
#endif
#ifndef PARAM_T_FINAL
#define PARAM_T_FINAL 2.0
#endif

static void buf_set(int idx, double val) {
    int64_t bits; memcpy(&bits, &val, sizeof(double));
    c3d_buf_idx(idx); c3d_buf_val(bits);
}
static double bits_to_dbl(int64_t b) { double v; memcpy(&v, &b, sizeof(double)); return v; }
static double get_ux(int i) { return bits_to_dbl(c3d_get_state_ux(i)); }
static double get_uy(int i) { return bits_to_dbl(c3d_get_state_uy(i)); }
static double get_uz(int i) { return bits_to_dbl(c3d_get_state_uz(i)); }

/* ── Shell diagnostics ── */

static double shell_energy(int nm, int k) {
    double e = 0;
    int k2lo = k * k, k2hi = (k + 1) * (k + 1);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx * kx + ky * ky + kz * kz;
        if (k2 >= k2lo && k2 < k2hi) {
            double x = get_ux(i), y = get_uy(i), z = get_uz(i);
            e += x * x + y * y + z * z;
        }
    }
    return 0.5 * e;
}

static double shell_enstrophy(int nm, int k) {
    double o = 0;
    int k2lo = k * k, k2hi = (k + 1) * (k + 1);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx * kx + ky * ky + kz * kz;
        if (k2 >= k2lo && k2 < k2hi) {
            double x = get_ux(i), y = get_uy(i), z = get_uz(i);
            o += (double)k2 * (x * x + y * y + z * z);
        }
    }
    return 0.5 * o;
}

static double palinstrophy(int nm) {
    double p = 0;
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx * kx + ky * ky + kz * kz;
        double x = get_ux(i), y = get_uy(i), z = get_uz(i);
        p += (double)(k2 * k2) * (x * x + y * y + z * z);
    }
    return 0.5 * p;
}

static double spectral_participation(int nm) {
    /* Participation ratio: (Σ|û|²)² / Σ|û|⁴ — measures energy distribution */
    double s2 = 0, s4 = 0;
    for (int i = 0; i < nm; i++) {
        double x = get_ux(i), y = get_uy(i), z = get_uz(i);
        double m2 = x * x + y * y + z * z;
        s2 += m2;
        s4 += m2 * m2;
    }
    return (s4 > 1e-30) ? (s2 * s2) / s4 : 0;
}

/* ── IC setup ── */

static void setup_ic_distributed(int nm, double amp) {
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        double k2 = (double)(kx * kx + ky * ky + kz * kz), km = sqrt(k2);
        if (km < 0.001) km = 1.0;
        double va = amp / km, phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase), uy = va * sin(M_PI * (phase + 0.4)), uz = 0;
        if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0;
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

static void setup_ic_taylor_green(int nm, double amp) {
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx * kx + ky * ky + kz * kz;
        double ux = 0, uy = 0, uz = 0;
        if (k2 == 3) {
            ux = amp * 0.125 * (double)kx;
            uy = -amp * 0.125 * (double)ky;
            uz = 0;
            if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        }
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

static void setup_ic_concentrated(int nm, double amp) {
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        int k2 = kx * kx + ky * ky + kz * kz;
        double ux = 0, uy = 0, uz = 0;
        if (k2 >= 4 && k2 < 9) {
            double phase = (double)i * 1.3 + 0.7;
            ux = amp * sin(phase); uy = amp * cos(phase); uz = 0;
            if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
            else if (ky != 0) uy = -(double)kx * ux / (double)ky;
            else ux = 0;
        }
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

static void setup_ic_random(int nm, double amp, int seed) {
    srand(seed);
    c3d_zero_state(nm);
    for (int i = 0; i < nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        double k2 = (double)(kx * kx + ky * ky + kz * kz), km = sqrt(k2);
        if (km < 0.001) km = 1.0;
        double va = amp / km;
        double ux = va * ((double)rand() / RAND_MAX - 0.5);
        double uy = va * ((double)rand() / RAND_MAX - 0.5);
        double uz = 0;
        if (kz != 0) uz = -((double)kx * ux + (double)ky * uy) / (double)kz;
        else if (ky != 0) uy = -(double)kx * ux / (double)ky;
        else ux = 0;
        buf_set(0, (double)i); buf_set(1, ux); buf_set(2, uy); buf_set(3, uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
}

static void setup_ic(int nm, double amp, int ic_type) {
    switch (ic_type) {
        case 0: setup_ic_distributed(nm, amp); break;
        case 1: setup_ic_taylor_green(nm, amp); break;
        case 2: setup_ic_concentrated(nm, amp); break;
        case 3: setup_ic_random(nm, amp, 42); break;
        default: setup_ic_distributed(nm, amp); break;
    }
}

static const char* ic_name(int t) {
    switch (t) {
        case 0: return "distributed";
        case 1: return "taylor-green";
        case 2: return "concentrated";
        case 3: return "random-42";
        default: return "unknown";
    }
}

/* ── Scaffold array: run one truncation level, record trajectory ── */

#define MAX_SAMPLES 2000

typedef struct {
    int n;                          /* truncation level */
    int num_samples;
    double t[MAX_SAMPLES];
    double energy[MAX_SAMPLES];
    double enstrophy[MAX_SAMPLES];
    double palinstr[MAX_SAMPLES];
    double participation[MAX_SAMPLES];
    double shell_e[MAX_SAMPLES][20];     /* per-shell energy */
    double shell_o[MAX_SAMPLES][20];     /* per-shell enstrophy */
    double shell_transfer[MAX_SAMPLES][20]; /* per-shell dE_k/dt */
    double max_shell_growth[MAX_SAMPLES];   /* max dE_k/E_k across shells */
    double total_transfer_abs[MAX_SAMPLES]; /* Σ|T_k| */
} ScaffoldLevel;

static void run_level(ScaffoldLevel *lev, int n, double amp, int ic_type,
                       double dt, double T_final, int sample_interval) {
    lev->n = n;
    lev->num_samples = 0;

    int nm = (int)c3d_enumerate_modes(n);
    c3d_precompute_triads(n);
    setup_ic(nm, amp, ic_type);

    /* ν = 0 for Euler */
    buf_set(0, 0.0);  /* nu = 0 */
    buf_set(1, dt);

    /* Record initial state */
    double prev_se[20];
    for (int k = 1; k <= n; k++) prev_se[k] = shell_energy(nm, k);

    int total_steps = (int)(T_final / dt);
    if (total_steps > 2000000) total_steps = 2000000;

    for (int step = 0; step <= total_steps; step++) {
        if (step > 0) c3d_do_step();

        if (step % sample_interval == 0 && lev->num_samples < MAX_SAMPLES) {
            int s = lev->num_samples;
            lev->t[s] = step * dt;
            lev->energy[s] = bits_to_dbl(c3d_energy());
            lev->enstrophy[s] = bits_to_dbl(c3d_enstrophy());
            lev->palinstr[s] = palinstrophy(nm);
            lev->participation[s] = spectral_participation(nm);

            double max_growth = 0;
            double total_abs_transfer = 0;

            for (int k = 1; k <= n; k++) {
                double ek = shell_energy(nm, k);
                double ok = shell_enstrophy(nm, k);
                lev->shell_e[s][k] = ek;
                lev->shell_o[s][k] = ok;

                if (step > 0 && sample_interval > 0) {
                    double dek = (ek - prev_se[k]) / (sample_interval * dt);
                    lev->shell_transfer[s][k] = dek;
                    total_abs_transfer += fabs(dek);
                    double growth = (prev_se[k] > 1e-30) ? fabs(dek) / prev_se[k] : 0;
                    if (growth > max_growth) max_growth = growth;
                } else {
                    lev->shell_transfer[s][k] = 0;
                }
                prev_se[k] = ek;
            }

            lev->max_shell_growth[s] = max_growth;
            lev->total_transfer_abs[s] = total_abs_transfer;
            lev->num_samples++;
        }
    }
}

/* ── Contraction ratio between two levels ── */

static double contraction_ratio(double *a, double *b, double *c, int n) {
    /* ρ = ||c - b||_L2 / ||b - a||_L2 */
    double num = 0, den = 0;
    for (int i = 0; i < n; i++) {
        double d1 = b[i] - a[i];
        double d2 = c[i] - b[i];
        den += d1 * d1;
        num += d2 * d2;
    }
    return (den > 1e-30) ? sqrt(num / den) : 0;
}

/* ── Main ── */

int main(void) {
    setbuf(stdout, NULL);  /* unbuffered output — see results in real time */

    double amp = PARAM_AMP;
    int n_max = PARAM_N_MAX;
    int ic_type = PARAM_IC_TYPE;
    double T_final = PARAM_T_FINAL;

    /* CFL-based dt — Euler is stiffer than NS (no diffusion to stabilise) */
    double dt = 0.1 / (amp * (double)n_max + 1.0);
    if (dt > 0.0001) dt = 0.0001;
    if (dt < 1e-7) dt = 1e-7;

    int sample_interval = (int)(T_final / dt) / 200;
    if (sample_interval < 1) sample_interval = 1;

    printf("################################################################\n");
    printf("#  EULER EQUATIONS — SCAFFOLD ARRAY DIAGNOSTICS               #\n");
    printf("#  3D Incompressible Euler on T³ (ν = 0)                      #\n");
    printf("################################################################\n\n");
    printf("  A = %.4f\n", amp);
    printf("  IC = %s (%d)\n", ic_name(ic_type), ic_type);
    printf("  N_max = %d (scaffold levels N=2..%d)\n", n_max, n_max);
    printf("  T_final = %.2f\n", T_final);
    printf("  dt = %.2e (CFL-based, ν=0)\n", dt);
    printf("  Sample interval = %d steps\n\n", sample_interval);

    /* ============================================================
     * PHASE 1: Energy conservation verification (must be exact)
     * ============================================================ */
    printf("============================================================\n");
    printf("  PHASE 1: ENERGY CONSERVATION AT ν=0\n");
    printf("============================================================\n\n");

    for (int n = 2; n <= n_max; n++) {
        int nm = (int)c3d_enumerate_modes(n);
        c3d_precompute_triads(n);
        setup_ic(nm, amp, ic_type);
        buf_set(0, 0.0); buf_set(1, dt);

        double E0 = bits_to_dbl(c3d_energy());
        for (int s = 0; s < 1000; s++) c3d_do_step();
        double E1 = bits_to_dbl(c3d_energy());
        double drift = (E0 > 1e-30) ? 100.0 * (E1 - E0) / E0 : 0;

        printf("  N=%d: E(0)=%.10f  E(T)=%.10f  drift=%.6f%%  %s\n",
               n, E0, E1, drift, fabs(drift) < 0.1 ? "OK" : "FAIL");
    }

    /* ============================================================
     * PHASE 2: Run scaffold array — one trajectory per level
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 2: SCAFFOLD ARRAY (N=2..%d)\n", n_max);
    printf("============================================================\n\n");

    int num_levels = n_max - 1; /* N=2 through N=n_max */
    ScaffoldLevel *levels = calloc(num_levels, sizeof(ScaffoldLevel));

    for (int li = 0; li < num_levels; li++) {
        int n = li + 2;
        printf("  Running N=%d...\n", n);
        run_level(&levels[li], n, amp, ic_type, dt, T_final, sample_interval);
        printf("    %d samples, E(0)=%.6e, E(T)=%.6e, Ω(0)=%.6e, Ω(T)=%.6e\n",
               levels[li].num_samples,
               levels[li].energy[0],
               levels[li].energy[levels[li].num_samples - 1],
               levels[li].enstrophy[0],
               levels[li].enstrophy[levels[li].num_samples - 1]);
    }

    /* ============================================================
     * PHASE 3: Compute contraction ratios for each array
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 3: CONTRACTION RATIOS\n");
    printf("============================================================\n\n");

    /* Need at least 3 levels for one contraction ratio */
    if (num_levels < 3) {
        printf("  Need N_max >= 4 for contraction ratios (3 levels minimum)\n");
        free(levels);
        return 1;
    }

    /* Align sample counts to minimum */
    int min_samples = levels[0].num_samples;
    for (int i = 1; i < num_levels; i++) {
        if (levels[i].num_samples < min_samples)
            min_samples = levels[i].num_samples;
    }

    printf("  %-20s", "Array");
    for (int i = 0; i < num_levels - 2; i++)
        printf("  ρ(N=%d→%d→%d)", i + 2, i + 3, i + 4);
    printf("  max_ρ   Status\n");
    printf("  ────────────────────");
    for (int i = 0; i < num_levels - 2; i++) printf("  ──────────────");
    printf("  ──────  ──────\n");

    /* Helper macro: compute and print contraction ratios for an array */
    #define PRINT_ARRAY(name, field) do { \
        printf("  %-20s", name); \
        double max_rho = 0; \
        for (int i = 0; i < num_levels - 2; i++) { \
            double rho = contraction_ratio( \
                levels[i].field, levels[i+1].field, levels[i+2].field, min_samples); \
            if (rho > max_rho) max_rho = rho; \
            printf("  %14.6f", rho); \
        } \
        printf("  %6.4f  %s\n", max_rho, max_rho < 1.0 ? "PASS" : "FAIL"); \
    } while(0)

    PRINT_ARRAY("Energy",          energy);
    PRINT_ARRAY("Enstrophy",       enstrophy);
    PRINT_ARRAY("Palinstrophy",    palinstr);
    PRINT_ARRAY("Participation",   participation);
    PRINT_ARRAY("Max shell growth", max_shell_growth);
    PRINT_ARRAY("Transfer |Σ|T_k||", total_transfer_abs);

    /* Per-shell contraction ratios */
    printf("\n  Per-shell energy contraction:\n");
    for (int k = 1; k <= 2; k++) { /* first two shells */
        printf("  %-20s", k == 1 ? "Shell k=1 energy" : "Shell k=2 energy");
        double max_rho = 0;
        for (int i = 0; i < num_levels - 2; i++) {
            /* Extract shell k timeseries from each level */
            double a[MAX_SAMPLES], b[MAX_SAMPLES], c[MAX_SAMPLES];
            for (int s = 0; s < min_samples; s++) {
                a[s] = levels[i].shell_e[s][k];
                b[s] = levels[i + 1].shell_e[s][k];
                c[s] = levels[i + 2].shell_e[s][k];
            }
            double rho = contraction_ratio(a, b, c, min_samples);
            if (rho > max_rho) max_rho = rho;
            printf("  %14.6f", rho);
        }
        printf("  %6.4f  %s\n", max_rho, max_rho < 1.0 ? "PASS" : "FAIL");
    }

    #undef PRINT_ARRAY

    /* ============================================================
     * PHASE 4: Enstrophy trajectory — does it blow up?
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 4: ENSTROPHY TRAJECTORY AT N=%d\n", n_max);
    printf("============================================================\n\n");

    ScaffoldLevel *top = &levels[num_levels - 1];
    printf("  %-10s %-14s %-14s %-14s %-14s %-14s\n",
           "Time", "Energy", "Enstrophy", "Palinstrophy", "Participation", "dΩ/dt (approx)");

    int print_every = top->num_samples / 20;
    if (print_every < 1) print_every = 1;

    double omega_max = 0;
    double palinstr_max = 0;

    for (int s = 0; s < top->num_samples; s++) {
        if (top->enstrophy[s] > omega_max) omega_max = top->enstrophy[s];
        if (top->palinstr[s] > palinstr_max) palinstr_max = top->palinstr[s];

        if (s % print_every == 0 || s == top->num_samples - 1) {
            double dodt = 0;
            if (s > 0) {
                double dt_samp = top->t[s] - top->t[s - 1];
                if (dt_samp > 1e-15)
                    dodt = (top->enstrophy[s] - top->enstrophy[s - 1]) / dt_samp;
            }
            printf("  %-10.4f %-14.6e %-14.6e %-14.6e %-14.4f %-14.6e\n",
                   top->t[s], top->energy[s], top->enstrophy[s],
                   top->palinstr[s], top->participation[s], dodt);
        }
    }

    /* ============================================================
     * PHASE 5: Cascade transfer exponent (Euler version)
     * ============================================================ */
    printf("\n============================================================\n");
    printf("  PHASE 5: CASCADE TRANSFER EXPONENT (ν=0)\n");
    printf("============================================================\n\n");

    /* Measure |T_k| vs k at several time points */
    {
        int nm = (int)c3d_enumerate_modes(n_max);
        c3d_precompute_triads(n_max);
        setup_ic(nm, amp, ic_type);
        buf_set(0, 0.0); buf_set(1, dt);

        double prev_se2[20];
        for (int k = 1; k <= n_max; k++) prev_se2[k] = shell_energy(nm, k);

        /* Evolve and measure at several points */
        int measure_points[] = {100, 500, 1000, 5000};
        int n_measures = 4;
        int step = 0;

        for (int mi = 0; mi < n_measures; mi++) {
            int target = measure_points[mi];
            while (step < target) { c3d_do_step(); step++; }

            double E = bits_to_dbl(c3d_energy());
            printf("  T=%.4f (step %d), E=%.6e:\n", step * dt, step, E);
            printf("  %-6s  %-14s  %-14s  %-14s\n",
                   "Shell", "E_k", "|T_k|", "|T_k|/(E*k^1.5)");

            double log_k[20], log_Tk[20];
            int valid = 0;

            for (int k = 1; k <= n_max; k++) {
                double ek = shell_energy(nm, k);
                double km = (double)k + 0.5;
                double dek = (ek - prev_se2[k]) / (100 * dt); /* approximate */
                double aTk = fabs(dek);
                prev_se2[k] = ek;

                double ratio = (E * pow(km, 1.5) > 1e-30) ? aTk / (E * pow(km, 1.5)) : 0;

                printf("  k=%-4d  %-14.6e  %-14.6e  %-14.6e\n", k, ek, aTk, ratio);

                if (k >= 2 && aTk > 1e-25) {
                    log_k[valid] = log(km);
                    log_Tk[valid] = log(aTk);
                    valid++;
                }
            }

            if (valid >= 2) {
                double sx = 0, sy = 0, sxy = 0, sx2 = 0;
                for (int i = 0; i < valid; i++) {
                    sx += log_k[i]; sy += log_Tk[i];
                    sxy += log_k[i] * log_Tk[i]; sx2 += log_k[i] * log_k[i];
                }
                double d = valid * sx2 - sx * sx;
                double gamma = (fabs(d) > 1e-10) ? (valid * sxy - sx * sy) / d : 0;
                printf("  → γ = %.4f  %s\n\n", gamma,
                       gamma < 2.0 ? "< 2 (subquadratic)" : ">= 2 (WARNING)");
            }
        }
    }

    /* ============================================================
     * SUMMARY
     * ============================================================ */
    printf("################################################################\n");
    printf("#  EULER SCAFFOLD SUMMARY                                     #\n");
    printf("################################################################\n\n");
    printf("  A = %.4f, IC = %s, N_max = %d, T = %.2f\n", amp, ic_name(ic_type), n_max, T_final);
    printf("  Ω_max = %.6e (max enstrophy at N=%d)\n", omega_max, n_max);
    printf("  Σ_max = %.6e (max palinstrophy at N=%d)\n", palinstr_max, n_max);
    printf("  Energy drift = %.6f%% (should be < 0.1%%)\n",
           100.0 * (top->energy[top->num_samples - 1] - top->energy[0]) / top->energy[0]);
    printf("\n");
    printf("  KEY QUESTION: Does enstrophy grow without bound?\n");
    printf("  Ω(0) = %.6e\n", top->enstrophy[0]);
    printf("  Ω(T) = %.6e\n", top->enstrophy[top->num_samples - 1]);
    printf("  Ratio Ω(T)/Ω(0) = %.4f\n",
           top->enstrophy[top->num_samples - 1] / top->enstrophy[0]);
    printf("\n");

    free(levels);
    return 0;
}
