/*
 * minimal_triad.c — C cross-validation of the minimal triad system
 *
 * The SMALLEST NS system: 6 modes (1 triad + conjugates).
 * Solved with RK4 integrator (independent of v3 solver).
 *
 * Must match Python/scipy result:
 *   -i:  energy conserved to ~10⁻¹³
 *   +1:  energy grows ~36.5%
 *
 * BUILD:
 *   clang -O3 validation/minimal_triad.c -o build/minimal_triad_c -lm
 */

#include <stdio.h>
#include <math.h>
#include <string.h>
#include <complex.h>

#define NM 6  /* 6 modes */

/* Modes: p=(1,0,0), q=(0,1,0), k=(1,1,0), plus conjugates */
static int modes[NM][3] = {
    {1,0,0}, {0,1,0}, {1,1,0}, {-1,0,0}, {0,-1,0}, {-1,-1,0}
};

/* State: 6 modes × 3 components, complex */
static double complex state[NM][3];

static int find_mode(int kx, int ky, int kz) {
    for (int i = 0; i < NM; i++)
        if (modes[i][0]==kx && modes[i][1]==ky && modes[i][2]==kz) return i;
    return -1;
}

/* Precomputed triads: for each k, list of (p,q) pairs with p+q=k */
#define MAX_TRIADS 20
static int triad_p[NM][MAX_TRIADS], triad_q[NM][MAX_TRIADS];
static int n_triads[NM];

static void precompute_triads(void) {
    memset(n_triads, 0, sizeof(n_triads));
    for (int pi = 0; pi < NM; pi++) {
        for (int qi = 0; qi < NM; qi++) {
            int kx = modes[pi][0]+modes[qi][0];
            int ky = modes[pi][1]+modes[qi][1];
            int kz = modes[pi][2]+modes[qi][2];
            int ki = find_mode(kx, ky, kz);
            if (ki >= 0 && pi != ki && qi != ki) {
                int n = n_triads[ki];
                triad_p[ki][n] = pi;
                triad_q[ki][n] = qi;
                n_triads[ki]++;
            }
        }
    }
}

static double energy(double complex u[NM][3]) {
    double E = 0;
    for (int i = 0; i < NM; i++)
        for (int c = 0; c < 3; c++)
            E += 0.5 * cabs(u[i][c]) * cabs(u[i][c]);
    return E;
}

/* Compute RHS: du/dt = prefactor * Σ_{p+q=k} (û_p·q) P_k(û_q) */
static void compute_rhs(double complex u[NM][3], double complex prefactor,
                         double complex du[NM][3]) {
    memset(du, 0, NM * 3 * sizeof(double complex));

    for (int ki = 0; ki < NM; ki++) {
        double kx = modes[ki][0], ky = modes[ki][1], kz = modes[ki][2];
        double k2 = kx*kx + ky*ky + kz*kz;
        double complex nl[3] = {0, 0, 0};

        for (int t = 0; t < n_triads[ki]; t++) {
            int pi = triad_p[ki][t];
            int qi = triad_q[ki][t];
            double qx = modes[qi][0], qy = modes[qi][1], qz = modes[qi][2];

            /* û_p · q */
            double complex up_dot_q = u[pi][0]*qx + u[pi][1]*qy + u[pi][2]*qz;

            /* Leray: P_k(û_q) = û_q - (k·û_q/|k|²)k */
            double complex k_dot_uq = kx*u[qi][0] + ky*u[qi][1] + kz*u[qi][2];
            double complex sc = (k2 > 1e-10) ? k_dot_uq / k2 : 0;
            double complex pq[3] = {
                u[qi][0] - sc*kx,
                u[qi][1] - sc*ky,
                u[qi][2] - sc*kz
            };

            nl[0] += up_dot_q * pq[0];
            nl[1] += up_dot_q * pq[1];
            nl[2] += up_dot_q * pq[2];
        }

        du[ki][0] = prefactor * nl[0];
        du[ki][1] = prefactor * nl[1];
        du[ki][2] = prefactor * nl[2];
    }
}

/* RK4 step */
static void rk4_step(double complex u[NM][3], double complex prefactor, double dt) {
    double complex k1[NM][3], k2[NM][3], k3[NM][3], k4[NM][3], tmp[NM][3];

    compute_rhs(u, prefactor, k1);

    for (int i=0;i<NM;i++) for (int c=0;c<3;c++)
        tmp[i][c] = u[i][c] + 0.5*dt*k1[i][c];
    compute_rhs(tmp, prefactor, k2);

    for (int i=0;i<NM;i++) for (int c=0;c<3;c++)
        tmp[i][c] = u[i][c] + 0.5*dt*k2[i][c];
    compute_rhs(tmp, prefactor, k3);

    for (int i=0;i<NM;i++) for (int c=0;c<3;c++)
        tmp[i][c] = u[i][c] + dt*k3[i][c];
    compute_rhs(tmp, prefactor, k4);

    for (int i=0;i<NM;i++) for (int c=0;c<3;c++)
        u[i][c] += dt/6.0 * (k1[i][c] + 2*k2[i][c] + 2*k3[i][c] + k4[i][c]);
}

static void set_ic(double amp) {
    memset(state, 0, sizeof(state));
    for (int i = 0; i < NM; i++) {
        double k2 = modes[i][0]*modes[i][0]+modes[i][1]*modes[i][1]+modes[i][2]*modes[i][2];
        double km = sqrt(k2); if (km < 0.001) km = 1.0;
        double va = amp / km;
        double phase = (double)i * 0.7 + 0.3;
        double ux = va * sin(M_PI * phase);
        double uy = va * sin(M_PI * (phase + 0.4));
        double uz = 0.0;
        int kx=modes[i][0], ky=modes[i][1], kz=modes[i][2];
        if (kz != 0) uz = -(kx*ux+ky*uy)/(double)kz;
        else if (ky != 0) uy = -kx*ux/(double)ky;
        else ux = 0.0;
        state[i][0] = ux; state[i][1] = uy; state[i][2] = uz;
    }
    /* Conjugate symmetry: mode i and NM-1-i are conjugate pairs */
    for (int i = 0; i < NM; i++) {
        int j = find_mode(-modes[i][0], -modes[i][1], -modes[i][2]);
        if (j > i) {
            state[j][0] = conj(state[i][0]);
            state[j][1] = conj(state[i][1]);
            state[j][2] = conj(state[i][2]);
        }
    }
}

int main(void) {
    precompute_triads();

    double T = 10.0;
    double dt = 0.001;
    int steps = (int)(T / dt);
    double amp = 0.1;

    printf("################################################################\n");
    printf("#  C CROSS-VALIDATION: Minimal triad system                    #\n");
    printf("#                                                              #\n");
    printf("#  6 modes, RK4 integrator (independent of v3 solver)         #\n");
    printf("#  Must match Python/scipy results exactly.                   #\n");
    printf("################################################################\n\n");

    printf("  T = %.1f, dt = %.4f, steps = %d, amp = %.2f\n\n", T, dt, steps, amp);

    double complex prefactors[] = {-I, +I, 1.0+0*I, -1.0+0*I};
    const char *labels[] = {"-i (correct NS)", "+i (sign flipped)",
                            "+1 (v2 bug)", "-1 (real, flipped)"};

    printf("  %-25s  %12s  %12s  %12s  %10s\n",
           "Prefactor", "E(0)", "E(T)", "ΔE/E(0)", "Conserved?");
    printf("  %-25s  %12s  %12s  %12s  %10s\n",
           "-------------------------", "------------", "------------",
           "------------", "----------");

    for (int p = 0; p < 4; p++) {
        set_ic(amp);
        double E0 = energy(state);

        for (int s = 0; s < steps; s++)
            rk4_step(state, prefactors[p], dt);

        double ET = energy(state);
        double drift = (ET - E0) / fabs(E0);
        const char *cons = (fabs(drift) < 1e-6) ? "YES" : "NO";

        printf("  %-25s  %12.8f  %12.8f  %12.6e  %10s\n",
               labels[p], E0, ET, drift, cons);
    }

    /* Time series for -i */
    printf("\n  --- Time series for -i (C, RK4) ---\n\n");
    set_ic(amp);
    double E0 = energy(state);
    printf("  %8s  %14s  %14s\n", "t", "E(t)", "ΔE/E(0)");
    printf("  %8s  %14s  %14s\n", "---", "---", "---");

    for (int s = 0; s <= steps; s++) {
        if (s % (steps/10) == 0) {
            double E = energy(state);
            printf("  %8.2f  %14.10f  %14.6e\n", s*dt, E, (E-E0)/fabs(E0));
        }
        if (s < steps) rk4_step(state, -I, dt);
    }

    printf("\n################################################################\n");
    printf("#  C result must match Python/scipy:                           #\n");
    printf("#    -i: ΔE/E ~ 0 (machine precision)                        #\n");
    printf("#    +1: ΔE/E ~ +0.365 (36.5%% growth)                        #\n");
    printf("#  Cross-language agreement proves implementation-independent. #\n");
    printf("################################################################\n");

    return 0;
}
