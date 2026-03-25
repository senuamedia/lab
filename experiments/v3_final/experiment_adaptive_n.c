/*
 * experiment_adaptive_n.c — Adaptive truncation with no boundary wall
 *
 * Instead of fixing N, let N grow dynamically when the cascade pushes
 * energy toward the boundary. The active set expands ahead of the
 * cascade so there's never a wall to reflect off.
 *
 * Algorithm:
 *   1. Start at N_active = N_start (e.g., 3)
 *   2. Each sample interval, check: does the outermost shell have
 *      significant energy? If E_{N_active} > ε × E_total → expand
 *   3. If E_{N_active} < ε/10 × E_total → could contract (but don't,
 *      to keep the buffer zone)
 *   4. Track N_active(t) — does it stabilise?
 *
 * Also track the scaffold array measurements (enstrophy, shell η)
 * at each step to compare with fixed-truncation results.
 *
 * The key question: does N_active reach a maximum and stay there,
 * or does it grow without bound?
 *
 * If it stabilises: the cascade is fully absorbed by diffusion.
 * If it grows: the cascade continuously pumps energy to higher k.
 *
 * N_ceiling limits the maximum to prevent infinite computation.
 * If N_active hits the ceiling, that's a flag — we need a bigger ceiling.
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

static double shell_energy(int nm, int k) {
    double e = 0; int k2lo = k*k, k2hi = (k+1)*(k+1);
    for (int i = 0; i < nm; i++) {
        int kx=(int)c3d_get_kx(i),ky=(int)c3d_get_ky(i),kz=(int)c3d_get_kz(i);
        int k2=kx*kx+ky*ky+kz*kz;
        if (k2>=k2lo&&k2<k2hi) { double x=get_ux(i),y=get_uy(i),z=get_uz(i); e+=x*x+y*y+z*z; }
    } return 0.5*e;
}

/*
 * State preservation across re-enumeration.
 * When N_active increases, we need to:
 *   1. Save current state (all mode coefficients)
 *   2. Re-enumerate at new N
 *   3. Restore saved coefficients to matching modes
 *   4. New modes start at zero (no artificial energy injection)
 */
#define MAX_MODES 5000  /* enough for N≈12 */
static double saved_ux[MAX_MODES], saved_uy[MAX_MODES], saved_uz[MAX_MODES];
static int saved_kx[MAX_MODES], saved_ky[MAX_MODES], saved_kz[MAX_MODES];

static int save_current_state(int nm) {
    for (int i = 0; i < nm && i < MAX_MODES; i++) {
        saved_kx[i] = (int)c3d_get_kx(i);
        saved_ky[i] = (int)c3d_get_ky(i);
        saved_kz[i] = (int)c3d_get_kz(i);
        saved_ux[i] = get_ux(i);
        saved_uy[i] = get_uy(i);
        saved_uz[i] = get_uz(i);
    }
    return (nm < MAX_MODES) ? nm : MAX_MODES;
}

static void restore_state_to_new_n(int old_nm, int new_n, double nu, double dt) {
    int new_nm = (int)c3d_enumerate_modes(new_n);
    c3d_precompute_triads(new_n);
    c3d_zero_state(new_nm);

    /* Match old modes to new enumeration */
    for (int i = 0; i < new_nm; i++) {
        int kx = (int)c3d_get_kx(i), ky = (int)c3d_get_ky(i), kz = (int)c3d_get_kz(i);
        for (int j = 0; j < old_nm; j++) {
            if (saved_kx[j]==kx && saved_ky[j]==ky && saved_kz[j]==kz) {
                buf_set(0, (double)i);
                buf_set(1, saved_ux[j]);
                buf_set(2, saved_uy[j]);
                buf_set(3, saved_uz[j]);
                c3d_apply_state();
                break;
            }
        }
        /* If no match found, mode stays at zero (from c3d_zero_state) */
    }
    buf_set(0, nu);
    buf_set(1, dt);
}

int main(void) {
    int n_start = 3;     /* initial active N */
    int n_ceiling = 14;  /* maximum N to prevent infinite expansion */
    int n_buffer = 2;    /* keep 2 empty shells ahead of the energy */
    double epsilon = 1e-6; /* expansion threshold: E_shell/E_total */
    double dt = 0.0001;
    int max_steps = 50000;
    int sample_interval = 100;

    printf("############################################################\n");
    printf("#  ADAPTIVE N: No fixed truncation boundary                #\n");
    printf("#                                                          #\n");
    printf("#  N_active grows when cascade approaches the boundary.   #\n");
    printf("#  No wall = no reflection = no artefact.                  #\n");
    printf("#                                                          #\n");
    printf("#  Does N_active stabilise? If yes: cascade absorbed.     #\n");
    printf("#  N_start=%d, N_ceiling=%d, buffer=%d, ε=%.0e          #\n",
           n_start, n_ceiling, n_buffer, epsilon);
    printf("############################################################\n\n");

    struct { double nu; double amp; } cases[] = {
        {0.01, 0.1},
        {0.01, 0.3},
        {0.01, 0.5},
        {0.01, 1.0},
        {0.005, 0.3},
        {0.005, 0.5},
        {0.001, 0.3},
    };
    int n_cases = 7;

    for (int ci = 0; ci < n_cases; ci++) {
        double nu = cases[ci].nu;
        double amp = cases[ci].amp;

        if (nu < 0.005) dt = 0.00005;
        else if (nu < 0.01) dt = 0.0001;
        else dt = 0.0001;

        printf("  === ν=%.3f, A=%.1f ===\n\n", nu, amp);
        printf("  %-6s  %-7s  %-4s  %-6s  %-12s  %-12s  %-10s  %-10s  %-8s\n",
               "Step", "Time", "N", "Modes", "Energy", "Enstrophy", "E_top", "E_top/E", "Action");
        printf("  %-6s  %-7s  %-4s  %-6s  %-12s  %-12s  %-10s  %-10s  %-8s\n",
               "------", "-------", "----", "------", "----------", "----------",
               "--------", "--------", "--------");

        /* Initialise at N_start */
        int n_active = n_start;
        int nm = (int)c3d_enumerate_modes(n_active);
        c3d_precompute_triads(n_active);
        c3d_zero_state(nm);

        /* Set up IC: distributed, amp/|k| */
        for (int i = 0; i < nm; i++) {
            int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
            double k2 = (double)(kx*kx+ky*ky+kz*kz);
            double km = sqrt(k2); if (km < 0.001) km = 1.0;
            double va = amp / km, phase = (double)i * 0.7 + 0.3;
            double ux = va * sin(M_PI * phase), uy = va * sin(M_PI * (phase + 0.4)), uz = 0.0;
            if (kz != 0) uz = -((double)kx*ux+(double)ky*uy)/(double)kz;
            else if (ky != 0) uy = -(double)kx*ux/(double)ky;
            else ux = 0;
            buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
            c3d_apply_state();
        }
        buf_set(0, nu); buf_set(1, dt);

        int max_n_reached = n_active;
        int n_stable_count = 0; /* how many samples N hasn't changed */
        int expansions = 0;
        int blew_up = 0;

        for (int step = 0; step < max_steps; step++) {
            c3d_do_step();

            if (step % sample_interval == (sample_interval - 1)) {
                double E = get_energy();
                double Omega = get_enstrophy();

                if (E != E || Omega != Omega) { /* NaN check */
                    printf("  %-6d  %7.4f  %-4d  %-6d  NaN — BLOWUP\n",
                           step+1, (step+1)*dt, n_active, nm);
                    blew_up = 1;
                    break;
                }

                /* Energy in the top shell */
                double e_top = shell_energy(nm, n_active);
                double e_ratio = (E > 1e-30) ? e_top / E : 0;

                /* Check: should we expand? */
                char action[32] = "";
                if (e_ratio > epsilon && n_active < n_ceiling) {
                    /* Cascade approaching boundary — expand */
                    int old_nm = save_current_state(nm);
                    n_active += 1;
                    restore_state_to_new_n(old_nm, n_active, nu, dt);
                    nm = (int)c3d_enumerate_modes(n_active);
                    expansions++;
                    if (n_active > max_n_reached) max_n_reached = n_active;
                    n_stable_count = 0;
                    snprintf(action, sizeof(action), "EXPAND→%d", n_active);
                } else if (n_active >= n_ceiling && e_ratio > epsilon) {
                    snprintf(action, sizeof(action), "AT CEILING");
                } else {
                    n_stable_count++;
                    if (n_stable_count > 10)
                        snprintf(action, sizeof(action), "STABLE(%d)", n_stable_count);
                }

                /* Print every 5th sample or when action occurs */
                if (step % (sample_interval * 5) == (sample_interval * 5 - 1)
                    || action[0] != 0) {
                    printf("  %-6d  %7.4f  %-4d  %-6d  %12.6f  %12.6f  %10.2e  %10.2e  %s\n",
                           step+1, (step+1)*dt, n_active, nm, E, Omega,
                           e_top, e_ratio, action);
                    fflush(stdout);
                }
            }
        }

        if (!blew_up) {
            printf("\n  SUMMARY: max_N_reached=%d, expansions=%d, final_N=%d, stable_for=%d samples\n",
                   max_n_reached, expansions, n_active, n_stable_count);

            if (n_active < n_ceiling && n_stable_count > 20)
                printf("  → N STABILISED at %d. Cascade fully absorbed by diffusion.\n", n_active);
            else if (n_active >= n_ceiling)
                printf("  → HIT CEILING at %d. Need higher ceiling to determine if stable.\n", n_ceiling);
            else
                printf("  → N still changing. Run longer to determine stability.\n");
        }
        printf("\n");
    }

    printf("############################################################\n");
    printf("#  If N_active stabilises below ceiling for ALL (ν, A):   #\n");
    printf("#    The cascade is always absorbed by diffusion.          #\n");
    printf("#    No boundary wall needed. No truncation artefact.     #\n");
    printf("#    This is direct computational evidence for regularity. #\n");
    printf("#                                                          #\n");
    printf("#  If N_active hits ceiling: need bigger ceiling.          #\n");
    printf("#  If N_active grows without bound: cascade never stops.  #\n");
    printf("############################################################\n");

    return 0;
}
