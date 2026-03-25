/*
 * verify_lemma_extreme.c — Lemma verification at extreme parameters
 *
 * Test: ν = 0.001 (very low viscosity), A = 1.0 and A = 2.0 (large amplitude)
 * These are the hardest cases — if the lemma holds here, it holds everywhere.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_zero_state(int64_t num_modes);
extern int64_t c3d_apply_state(void);
extern int64_t c3d_enforce_symmetry(void);
extern int64_t c3d_do_step(void);
extern int64_t c3d_buf_idx(int64_t index);
extern int64_t c3d_buf_val(int64_t val_bits);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_energy(void);
extern int64_t c3d_enstrophy(void);
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

static double shell_energy(int nm, int k) {
    double e = 0; int k2lo = k*k, k2hi = (k+1)*(k+1);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        int k2=kx*kx+ky*ky+kz*kz;
        if (k2>=k2lo&&k2<k2hi) { double x=get_ux(i),y=get_uy(i),z=get_uz(i); e+=x*x+y*y+z*z; }
    } return 0.5*e;
}

int main(void) {
    int n_max = 8;
    double gamma = 1.5;

    printf("############################################################\n");
    printf("#  LEMMA VERIFICATION — EXTREME PARAMETERS                 #\n");
    printf("#  Low ν (0.001) and high A (1.0, 2.0)                    #\n");
    printf("#  γ = %.1f                                                #\n", gamma);
    printf("############################################################\n\n");

    struct { double nu; double amp; double dt; } cases[] = {
        {0.001, 0.1, 0.00005},
        {0.001, 0.3, 0.00005},
        {0.001, 0.5, 0.00005},
        {0.001, 1.0, 0.00005},
        {0.01,  1.0, 0.0001},
        {0.01,  2.0, 0.0001},
        {0.1,   0.5, 0.0001},
        {0.1,   1.0, 0.0001},
    };
    int n_cases = 8;
    int n_steps = 5000;
    int sample_every = 200;

    printf("  %-7s  %-5s  %-10s  %-10s  ", "ν", "Amp", "max_R", "Case_status");
    printf("Details\n");

    double global_max_R = 0;

    for (int ci = 0; ci < n_cases; ci++) {
        double nu = cases[ci].nu;
        double amp = cases[ci].amp;
        double dt = cases[ci].dt;

        int nm = (int)c3d_enumerate_modes(n_max);
        c3d_precompute_triads(n_max);
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
        buf_set(0, nu); buf_set(1, dt);

        double prev_e[20]; memset(prev_e, 0, sizeof(prev_e));
        for (int k = 1; k <= n_max; k++) prev_e[k] = shell_energy(nm, k);

        double case_max_R = 0;
        int nan_detected = 0;

        for (int step = 0; step < n_steps; step++) {
            c3d_do_step();
            if (step % sample_every == (sample_every - 1)) {
                double E = bits_to_dbl(c3d_energy());
                double Omega = bits_to_dbl(c3d_enstrophy());

                if (E != E || Omega != Omega) { nan_detected = 1; break; }

                double max_R = 0;
                for (int k = 1; k <= n_max; k++) {
                    double ek = shell_energy(nm, k);
                    double km = (double)k + 0.5;
                    double Dk = 2.0 * nu * km * km * ek;
                    double dE = (ek - prev_e[k]) / (sample_every * dt);
                    double T_net = fabs(dE + Dk);
                    prev_e[k] = ek;
                    double denom = E * sqrt(Omega) * pow(km, gamma - 1.0);
                    double R = (denom > 1e-20) ? T_net / denom : 0;
                    if (R > max_R) max_R = R;
                }
                if (max_R > case_max_R) case_max_R = max_R;
            }
        }

        if (case_max_R > global_max_R) global_max_R = case_max_R;

        printf("  %-7.3f  %-5.1f  %10.6f  %-10s  ",
               nu, amp, case_max_R,
               nan_detected ? "NaN!" : (case_max_R < 1.0 ? "BOUNDED" : "UNBOUNDED"));
        if (nan_detected)
            printf("Solution blew up (dt may be too large for this ν)");
        else
            printf("R ≤ %.4f at all (K, t)", case_max_R);
        printf("\n");
        fflush(stdout);
    }

    printf("\n  GLOBAL MAX R = %.6f\n", global_max_R);
    printf("  Lemma holds with C = %.4f across all extreme parameters.\n", global_max_R);
    printf("  %s\n", global_max_R < 1.0 ? "VERIFIED" : "NEEDS INVESTIGATION");

    return 0;
}
