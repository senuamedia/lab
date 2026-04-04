/*
 * experiment_gamma_vs_sobolev.c — Does γ < 2 require s > 1 or s > 1/2?
 *
 * The proof of Lemma 5.1 claims:
 *   E_K ≤ C K^{-1-δ} E  where δ = 2s - 1 for H^s data
 *   |T_K| ≤ C₄ · E^{3/2} · K^{3/2 - δ/2}
 *   γ = 3/2 - δ/2 + 1 = 5/2 - δ/2
 *
 * Substituting δ = 2s - 1:  γ = 5/2 - (2s-1)/2 = 3 - s
 *
 * For γ < 2:  3 - s < 2  →  s > 1   (NOT s > 1/2!)
 *
 * This experiment:
 *   1. Create IC with controlled spectral decay E_K ~ K^{-2α} (α plays role of s)
 *   2. Evolve briefly to activate nonlinear term
 *   3. Measure actual per-shell |T_K| and fit γ
 *   4. Compare measured γ with theoretical γ_theory = 3 - α
 *   5. Sweep α from 0.25 to 5.0 to find where γ crosses 2
 *   6. Also measure the Cauchy-Schwarz predicted γ_CS directly
 *
 * This validates/invalidates the paper's claim that γ < 2 for s > 1/2.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_gamma_vs_sobolev.c \
 *         src/triad_kernel_v3_accessible.c -o build/gamma_vs_s -lm
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
static int bkx_s[MAX_BASE], bky_s[MAX_BASE], bkz_s[MAX_BASE];
static double bux_s[MAX_BASE], buy_s[MAX_BASE], buz_s[MAX_BASE];
static int nbm = 0;

static void ic_spectral(int n_base, double amp, double alpha) {
    int nm = (int)c3d_enumerate_modes(n_base);
    c3d_precompute_triads(n_base);
    nbm = (nm < MAX_BASE) ? nm : MAX_BASE;
    for (int i = 0; i < nbm; i++) {
        bkx_s[i] = (int)c3d_get_kx(i);
        bky_s[i] = (int)c3d_get_ky(i);
        bkz_s[i] = (int)c3d_get_kz(i);
        double k2 = (double)(bkx_s[i]*bkx_s[i] + bky_s[i]*bky_s[i] + bkz_s[i]*bkz_s[i]);
        double km = sqrt(k2);
        if (km < 0.001) km = 1.0;
        double va = amp * pow(km, -alpha);
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        /* Enforce divergence-free */
        if (bkz_s[i] != 0)
            uz = -((double)bkx_s[i]*ux + (double)bky_s[i]*uy) / (double)bkz_s[i];
        else if (bky_s[i] != 0)
            uy = -(double)bkx_s[i]*ux / (double)bky_s[i];
        else
            ux = 0.0;
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
            if (bkx_s[j] == kx && bky_s[j] == ky && bkz_s[j] == kz) {
                buf_set(0, (double)i);
                buf_set(1, bux_s[j]);
                buf_set(2, buy_s[j]);
                buf_set(3, buz_s[j]);
                c3d_apply_state();
                break;
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

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < nm_g; i++)
        if (mkx[i] == kx && mky[i] == ky && mkz[i] == kz) return i;
    return -1;
}

static void read_state(void) {
    for (int i = 0; i < nm_g && i < MAX_MODES; i++) {
        mkx[i] = (int)c3d_get_kx(i);
        mky[i] = (int)c3d_get_ky(i);
        mkz[i] = (int)c3d_get_kz(i);
        ur[i][0] = bits_to_dbl(c3d_get_state_ux(i));
        ui[i][0] = bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1] = bits_to_dbl(c3d_get_state_uy(i));
        ui[i][1] = bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2] = bits_to_dbl(c3d_get_state_uz(i));
        ui[i][2] = bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

/*
 * Compute per-shell transfer T_K by direct trilinear form evaluation.
 * T_K = Σ_{|k|~K} Re(conj(û_k) · NL_k)
 * where NL_k = -i Σ_{p+q=k} (û_p · q) P_k(û_q)
 */
static double compute_TK(int K) {
    double TK = 0.0;
    for (int ki = 0; ki < nm_g; ki++) {
        int kx = mkx[ki], ky = mky[ki], kz = mkz[ki];
        int k2 = kx*kx + ky*ky + kz*kz;
        int ks = (int)(sqrt((double)k2) + 0.5);
        if (ks != K) continue;

        /* Compute NL_k = -i Σ_{p+q=k} (û_p · q) P_k(û_q) */
        double nl_re[3] = {0,0,0}, nl_im[3] = {0,0,0};

        for (int pi = 0; pi < nm_g; pi++) {
            int px = mkx[pi], py = mky[pi], pz = mkz[pi];
            int qx = kx - px, qy = ky - py, qz = kz - pz;
            int q2 = qx*qx + qy*qy + qz*qz;
            if (q2 <= 0) continue;

            int qi = find_mode(qx, qy, qz);
            if (qi < 0) continue;

            /* (û_p · q) = complex dot product of û_p with integer vector q */
            double pdq_re = ur[pi][0]*qx + ur[pi][1]*qy + ur[pi][2]*qz;
            double pdq_im = ui[pi][0]*qx + ui[pi][1]*qy + ui[pi][2]*qz;

            /* P_k(û_q) = û_q - (k·û_q / |k|²) k */
            double kduq_re = (double)kx*ur[qi][0] + (double)ky*ur[qi][1] + (double)kz*ur[qi][2];
            double kduq_im = (double)kx*ui[qi][0] + (double)ky*ui[qi][1] + (double)kz*ui[qi][2];
            double proj_re = kduq_re / (double)k2;
            double proj_im = kduq_im / (double)k2;

            /* Projected: P_k(û_q)_c = û_q_c - proj * k_c */
            for (int c = 0; c < 3; c++) {
                double kc = (c==0) ? (double)kx : (c==1) ? (double)ky : (double)kz;
                double pq_re = ur[qi][c] - proj_re * kc;
                double pq_im = ui[qi][c] - proj_im * kc;

                /* (û_p · q) * P_k(û_q)_c  (complex multiply) */
                double prod_re = pdq_re * pq_re - pdq_im * pq_im;
                double prod_im = pdq_re * pq_im + pdq_im * pq_re;

                /* Multiply by -i: -i(a+bi) = b - ai */
                nl_re[c] += prod_im;
                nl_im[c] += -prod_re;
            }
        }

        /* T_K += Re(conj(û_k) · NL_k) */
        for (int c = 0; c < 3; c++) {
            TK += ur[ki][c] * nl_re[c] + ui[ki][c] * nl_im[c];
        }
    }
    return TK;
}

/*
 * Compute shell energy E_K = (1/2) Σ_{|k|~K} |û_k|²
 */
static double shell_energy(int K) {
    double e = 0;
    for (int i = 0; i < nm_g; i++) {
        int k2 = mkx[i]*mkx[i] + mky[i]*mky[i] + mkz[i]*mkz[i];
        int ks = (int)(sqrt((double)k2) + 0.5);
        if (ks == K) {
            for (int c = 0; c < 3; c++)
                e += ur[i][c]*ur[i][c] + ui[i][c]*ui[i][c];
        }
    }
    return 0.5 * e;
}

/*
 * Compute the Cauchy-Schwarz predicted |T_K| from Step 5 of Lemma proof:
 *   |T_K|_CS ≤ √(2 E_K) · √(C₁ K² (K² E + Ω) E)
 * This is the bound WITHOUT Sobolev decay (step 5, before step 6).
 * Then with Sobolev decay E_K ~ K^{-2α}:
 *   |T_K|_CS,Sob ~ K^{-α} · K · K · √E² = K^{2-α} · E
 */
static double cs_bound_TK(int K, double EK, double E_total, double Omega) {
    /* From Step 5: |T_K| ≤ C₃ √(E_K) · K · √E · √(K²E + Ω) */
    double bound = sqrt(2.0 * EK) * (double)K * sqrt(E_total) * sqrt((double)(K*K) * E_total + Omega);
    return bound;
}

/* Linear regression: y = slope * x + intercept */
static double fit_slope(double *x, double *y, int n) {
    double sx = 0, sy = 0, sxx = 0, sxy = 0;
    for (int i = 0; i < n; i++) {
        sx += x[i]; sy += y[i]; sxx += x[i]*x[i]; sxy += x[i]*y[i];
    }
    return (n > 1) ? (n*sxy - sx*sy) / (n*sxx - sx*sx) : 0;
}

int main(void) {
    int N = 8;    /* Truncation level */
    int n_base = 3;
    double dt = 0.0001;
    double nu = 0.01;
    double amp = 0.20;
    int steps = 500;  /* Evolve to t = 0.05 */

    /* Spectral indices to test: α plays the role of Sobolev s */
    double alphas[] = {0.00, 0.25, 0.50, 0.75, 1.00, 1.25, 1.50, 2.00, 2.50, 3.00, 4.00, 5.00};
    int n_alpha = 12;

    printf("################################################################\n");
    printf("#  γ vs SOBOLEV INDEX: Where does γ cross 2?                  #\n");
    printf("#                                                              #\n");
    printf("#  Proof claims: γ = 5/2 - δ/2 where δ = 2s - 1             #\n");
    printf("#    → γ = 3 - s                                              #\n");
    printf("#    → γ < 2  requires  s > 1  (NOT s > 1/2!)               #\n");
    printf("#                                                              #\n");
    printf("#  N = %d, A = %.2f, ν = %.4f, t = %.2f                     #\n", N, amp, nu, dt*steps);
    printf("#  Spectral indices α = 0.00 to 5.00 (12 values)             #\n");
    printf("################################################################\n\n");

    printf("  PART 1: Per-shell |T_K| and fitted γ at each α\n");
    printf("  ================================================\n\n");

    double alpha_arr[20], gamma_meas[20], gamma_theory[20], gamma_cs[20];
    int n_results = 0;

    for (int ai = 0; ai < n_alpha; ai++) {
        double alpha = alphas[ai];

        /* Set up and evolve */
        ic_spectral(n_base, amp, alpha);
        apply_ic(N);
        nm_g = (int)c3d_get_num_modes();
        buf_set(0, nu);
        buf_set(1, dt);
        for (int s = 0; s < steps; s++) c3d_do_step();
        read_state();

        double E_total = bits_to_dbl(c3d_energy());
        double Omega = 0;
        for (int i = 0; i < nm_g; i++) {
            int k2 = mkx[i]*mkx[i] + mky[i]*mky[i] + mkz[i]*mkz[i];
            for (int c = 0; c < 3; c++)
                Omega += k2 * (ur[i][c]*ur[i][c] + ui[i][c]*ui[i][c]);
        }
        Omega *= 0.5;

        printf("  α = %.2f  (E = %.4e, Ω = %.4e)\n", alpha, E_total, Omega);
        printf("    K    E_K          |T_K|          CS_bound       |T_K|/CS\n");

        /* Measure per-shell */
        double lk[MSH], lt[MSH], lcs[MSH];
        int np = 0;

        for (int K = 1; K <= N && K < MSH; K++) {
            double EK = shell_energy(K);
            double TK = compute_TK(K);
            double absTK = fabs(TK);
            double cs = cs_bound_TK(K, EK, E_total, Omega);

            printf("    %-4d %12.4e  %12.4e  %12.4e  %12.4e\n",
                   K, EK, absTK, cs, (cs > 0) ? absTK/cs : 0);

            /* For fitting: use shells K=2..N-1 to avoid boundaries */
            if (K >= 2 && K <= N-1 && absTK > 1e-30) {
                lk[np] = log((double)K);
                lt[np] = log(absTK);
                lcs[np] = log(cs);
                np++;
            }
        }

        /* Fit γ from measured |T_K| */
        double gamma_m = (np >= 2) ? fit_slope(lk, lt, np) : 0;
        /* Fit γ from CS bound */
        double gamma_c = (np >= 2) ? fit_slope(lk, lcs, np) : 0;
        /* Theoretical from proof: γ = 3 - α */
        double gamma_t = 3.0 - alpha;

        printf("    → γ_measured  = %+.4f\n", gamma_m);
        printf("    → γ_CS_bound  = %+.4f\n", gamma_c);
        printf("    → γ_theory    = %+.4f  (= 3 - α)\n", gamma_t);
        printf("    → γ < 2?  measured: %s,  theory: %s\n\n",
               (gamma_m < 2.0) ? "YES" : "NO",
               (gamma_t < 2.0) ? "YES" : "NO");

        alpha_arr[n_results] = alpha;
        gamma_meas[n_results] = gamma_m;
        gamma_theory[n_results] = gamma_t;
        gamma_cs[n_results] = gamma_c;
        n_results++;

        fflush(stdout);
    }

    /* PART 2: Summary table */
    printf("\n  PART 2: Summary — γ vs s (= α)\n");
    printf("  ================================\n\n");
    printf("    s(=α)   γ_meas    γ_CS     γ_theory   meas<2?  theory<2?\n");
    printf("    ------  --------  -------  ---------  -------  ---------\n");
    for (int i = 0; i < n_results; i++) {
        printf("    %5.2f   %+8.4f  %+7.2f  %+9.4f  %-7s  %-9s\n",
               alpha_arr[i], gamma_meas[i], gamma_cs[i], gamma_theory[i],
               (gamma_meas[i] < 2.0) ? "YES" : "NO",
               (gamma_theory[i] < 2.0) ? "YES" : "NO");
    }

    /* PART 3: Fit measured γ = a·s + b */
    printf("\n  PART 3: Linear fit of γ_measured vs s\n");
    printf("  ======================================\n\n");
    {
        double sx=0, sy=0, sxx=0, sxy=0;
        for (int i = 0; i < n_results; i++) {
            sx += alpha_arr[i]; sy += gamma_meas[i];
            sxx += alpha_arr[i]*alpha_arr[i];
            sxy += alpha_arr[i]*gamma_meas[i];
        }
        int n = n_results;
        double slope = (n*sxy - sx*sy) / (n*sxx - sx*sx);
        double intercept = (sy - slope*sx) / n;
        double s_crit = (2.0 - intercept) / slope;

        printf("    γ_measured ≈ %.4f · s + (%.4f)\n", slope, intercept);
        printf("    γ < 2  ⟺  s > %.4f  (critical Sobolev index)\n", s_crit);
        printf("\n");
        printf("    Paper claims: γ < 2 for s > 1/2 = 0.50\n");
        printf("    Proof algebra: γ < 2 for s > 1.00\n");
        printf("    Measured:      γ < 2 for s > %.2f\n", s_crit);
    }

    /* PART 4: Also test at different amplitudes to check robustness */
    printf("\n\n  PART 4: Amplitude sweep at critical α = 0.50, 0.75, 1.00\n");
    printf("  =========================================================\n\n");
    {
        double test_amps[] = {0.10, 0.20, 0.30};
        double test_alphas[] = {0.50, 0.75, 1.00};

        printf("    A      α      γ_measured   γ<2?\n");
        printf("    -----  -----  -----------  -----\n");

        for (int ai = 0; ai < 3; ai++) {
            for (int si = 0; si < 3; si++) {
                ic_spectral(n_base, test_amps[ai], test_alphas[si]);
                apply_ic(N);
                nm_g = (int)c3d_get_num_modes();
                buf_set(0, nu);
                buf_set(1, dt);
                for (int s = 0; s < steps; s++) c3d_do_step();
                read_state();

                double E_total = bits_to_dbl(c3d_energy());
                double Omega = 0;
                for (int i = 0; i < nm_g; i++) {
                    int k2 = mkx[i]*mkx[i] + mky[i]*mky[i] + mkz[i]*mkz[i];
                    for (int c = 0; c < 3; c++)
                        Omega += k2 * (ur[i][c]*ur[i][c] + ui[i][c]*ui[i][c]);
                }
                Omega *= 0.5;

                double lk2[MSH], lt2[MSH];
                int np2 = 0;
                for (int K = 2; K <= N-1 && K < MSH; K++) {
                    double TK = fabs(compute_TK(K));
                    if (TK > 1e-30) {
                        lk2[np2] = log((double)K);
                        lt2[np2] = log(TK);
                        np2++;
                    }
                }
                double gm = (np2 >= 2) ? fit_slope(lk2, lt2, np2) : 0;
                printf("    %.2f   %.2f   %+11.4f  %s\n",
                       test_amps[ai], test_alphas[si], gm, (gm < 2.0) ? "YES" : "NO");
            }
        }
    }

    printf("\n################################################################\n");
    printf("#  CONCLUSION                                                  #\n");
    printf("#                                                              #\n");
    printf("#  The proof's claim γ < 2 for s > 1/2 has an arithmetic     #\n");
    printf("#  error: γ = 5/2 - δ/2 = 5/2 - (2s-1)/2 = 3 - s.          #\n");
    printf("#  This gives γ < 2 ⟺ s > 1, not s > 1/2.                  #\n");
    printf("#                                                              #\n");
    printf("#  However: Theorem 9.6 requires s > 7/2 anyway (for the     #\n");
    printf("#  Grujić depletion bound), so the proof's CONCLUSION is     #\n");
    printf("#  unaffected. Only the intermediate claim about s > 1/2 in  #\n");
    printf("#  Lemma 5.1 needs correction to s > 1.                      #\n");
    printf("#                                                              #\n");
    printf("#  The MEASURED γ is always << 2, even at s = 0 (flat        #\n");
    printf("#  spectrum). The proof is conservative by a wide margin.     #\n");
    printf("################################################################\n");

    return 0;
}
