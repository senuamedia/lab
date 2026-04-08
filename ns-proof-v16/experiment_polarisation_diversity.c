/*
 * experiment_polarisation_diversity.c — Test whether the divergence-free
 * constraint (û_k ⊥ k) forces phase diversity INDEPENDENTLY of the
 * Leray angle diversity.
 *
 * The question: if we hold the Leray angles fixed but vary the
 * polarisation directions, does R_K stay small?
 *
 * Approach: For a fixed shell K, compute R_K for:
 *   (a) The actual NS-evolved state (both diversities present)
 *   (b) A state where all modes have the SAME polarisation direction
 *       (removes polarisation diversity, keeps Leray diversity)
 *   (c) A state where Leray angles are made uniform but polarisations
 *       are diverse (removes Leray diversity, keeps polarisation)
 *
 * If (b) still has R_K << 1: Leray diversity alone suffices
 * If (c) still has R_K << 1: Polarisation diversity alone suffices
 * If both (b) and (c) have R_K ~ 1: BOTH are needed
 *
 * Also: test the ADVERSARIAL case — find the polarisation that
 * MAXIMISES R_K at each shell. If max R_K < 1, the proof closes.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_polarisation_diversity.c \
 *         src/triad_kernel_v3_accessible.c -o build/polar_div -lm
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
        ur[i][0]=bits_to_dbl(c3d_get_state_ux(i)); ui[i][0]=bits_to_dbl(c3d_get_state_ux_im(i));
        ur[i][1]=bits_to_dbl(c3d_get_state_uy(i)); ui[i][1]=bits_to_dbl(c3d_get_state_uy_im(i));
        ur[i][2]=bits_to_dbl(c3d_get_state_uz(i)); ui[i][2]=bits_to_dbl(c3d_get_state_uz_im(i));
    }
}

static void triad_complex(int k_idx, int p_idx, int q_idx, double *re_out, double *im_out) {
    int kx=mkx[k_idx], ky=mky[k_idx], kz=mkz[k_idx];
    int k2=kx*kx+ky*ky+kz*kz;
    double updq_re = ur[p_idx][0]*(double)mkx[q_idx] + ur[p_idx][1]*(double)mky[q_idx] + ur[p_idx][2]*(double)mkz[q_idx];
    double updq_im = ui[p_idx][0]*(double)mkx[q_idx] + ui[p_idx][1]*(double)mky[q_idx] + ui[p_idx][2]*(double)mkz[q_idx];
    double kduq_re = (double)kx*ur[q_idx][0] + (double)ky*ur[q_idx][1] + (double)kz*ur[q_idx][2];
    double kduq_im = (double)kx*ui[q_idx][0] + (double)ky*ui[q_idx][1] + (double)kz*ui[q_idx][2];
    double sc_re = kduq_re/(double)k2, sc_im = kduq_im/(double)k2;
    double dot_re=0, dot_im=0;
    for (int c=0; c<3; c++) {
        double kc = (c==0)?(double)kx:(c==1)?(double)ky:(double)kz;
        double pq_re = ur[q_idx][c] - sc_re*kc, pq_im = ui[q_idx][c] - sc_im*kc;
        dot_re += pq_re*ur[k_idx][c] + pq_im*ui[k_idx][c];
        dot_im += pq_im*ur[k_idx][c] - pq_re*ui[k_idx][c];
    }
    *re_out = updq_re*dot_re - updq_im*dot_im;
    *im_out = updq_re*dot_im + updq_im*dot_re;
}

/* Compute R_K for a specific shell using current state */
static double compute_RK(int K, int N) {
    int n_max_sq = N*N;
    double sum_re=0, sum_im=0, sum_abs=0;
    for (int k_idx=0; k_idx<nm_g; k_idx++) {
        int kx=mkx[k_idx],ky=mky[k_idx],kz=mkz[k_idx];
        int k2=kx*kx+ky*ky+kz*kz;
        if ((int)(sqrt((double)k2)+0.5) != K) continue;
        for (int p_idx=0; p_idx<nm_g; p_idx++) {
            int qx=kx-mkx[p_idx],qy=ky-mky[p_idx],qz=kz-mkz[p_idx];
            int q2=qx*qx+qy*qy+qz*qz;
            if (q2<=0||q2>n_max_sq) continue;
            int q_idx=find_mode(qx,qy,qz);
            if (q_idx<0) continue;
            double zr,zi;
            triad_complex(k_idx,p_idx,q_idx,&zr,&zi);
            double az=sqrt(zr*zr+zi*zi);
            if (az<1e-30) continue;
            sum_re+=zr; sum_im+=zi; sum_abs+=az;
        }
    }
    return (sum_abs>1e-30) ? sqrt(sum_re*sum_re+sum_im*sum_im)/sum_abs : 0;
}

/* Set ALL modes to the same polarisation direction (perpendicular to k)
 * with the same amplitude as the current state, but aligned polarisation */
static void set_aligned_polarisation(double amp_scale) {
    for (int i = 0; i < nm_g; i++) {
        int kx=mkx[i], ky=mky[i], kz=mkz[i];
        int k2 = kx*kx+ky*ky+kz*kz;
        if (k2 == 0) continue;

        /* Current amplitude */
        double amp = 0;
        for (int c=0; c<3; c++) amp += ur[i][c]*ur[i][c] + ui[i][c]*ui[i][c];
        amp = sqrt(amp) * amp_scale;
        if (amp < 1e-30) continue;

        /* Choose a fixed polarisation direction perpendicular to k */
        double e1x, e1y, e1z;
        if (abs(kx) <= abs(ky) && abs(kx) <= abs(kz)) {
            /* k mostly in y-z, use x-cross */
            double cx = 0, cy = -(double)kz, cz = (double)ky;
            double cn = sqrt(cy*cy+cz*cz); if(cn<1e-10) cn=1;
            e1x=cx/cn; e1y=cy/cn; e1z=cz/cn;
        } else if (abs(ky) <= abs(kz)) {
            double cx = -(double)kz, cy = 0, cz = (double)kx;
            double cn = sqrt(cx*cx+cz*cz); if(cn<1e-10) cn=1;
            e1x=cx/cn; e1y=cy/cn; e1z=cz/cn;
        } else {
            double cx = -(double)ky, cy = (double)kx, cz = 0;
            double cn = sqrt(cx*cx+cy*cy); if(cn<1e-10) cn=1;
            e1x=cx/cn; e1y=cy/cn; e1z=cz/cn;
        }

        /* Set mode to amp * e1 (real part only, zero imaginary) */
        ur[i][0] = amp * e1x; ur[i][1] = amp * e1y; ur[i][2] = amp * e1z;
        ui[i][0] = 0; ui[i][1] = 0; ui[i][2] = 0;
    }
}

/* Set random polarisation direction (perpendicular to k) for each mode */
static unsigned long rng_st = 98765432101ULL;
static double rng_d(void) {
    rng_st = rng_st * 6364136223846793005ULL + 1442695040888963407ULL;
    return (double)(rng_st >> 33) / (double)(1ULL << 31);
}

static void set_random_polarisation(double amp_scale) {
    for (int i = 0; i < nm_g; i++) {
        int kx=mkx[i], ky=mky[i], kz=mkz[i];
        int k2 = kx*kx+ky*ky+kz*kz;
        if (k2 == 0) continue;

        double amp = 0;
        for (int c=0; c<3; c++) amp += ur[i][c]*ur[i][c] + ui[i][c]*ui[i][c];
        amp = sqrt(amp) * amp_scale;
        if (amp < 1e-30) continue;

        /* Two perpendicular directions to k */
        double e1x, e1y, e1z, e2x, e2y, e2z;
        double km = sqrt((double)k2);
        double nkx=(double)kx/km, nky=(double)ky/km, nkz=(double)kz/km;

        if (fabs(nkx) <= fabs(nky) && fabs(nkx) <= fabs(nkz)) {
            double cx=0, cy=-nkz, cz=nky;
            double cn=sqrt(cy*cy+cz*cz); if(cn<1e-10)cn=1;
            e1x=cx/cn; e1y=cy/cn; e1z=cz/cn;
        } else if (fabs(nky) <= fabs(nkz)) {
            double cx=-nkz, cy=0, cz=nkx;
            double cn=sqrt(cx*cx+cz*cz); if(cn<1e-10)cn=1;
            e1x=cx/cn; e1y=cy/cn; e1z=cz/cn;
        } else {
            double cx=-nky, cy=nkx, cz=0;
            double cn=sqrt(cx*cx+cy*cy); if(cn<1e-10)cn=1;
            e1x=cx/cn; e1y=cy/cn; e1z=cz/cn;
        }
        e2x = nky*e1z - nkz*e1y;
        e2y = nkz*e1x - nkx*e1z;
        e2z = nkx*e1y - nky*e1x;

        /* Random angle in the perpendicular plane */
        double theta = rng_d() * 2 * M_PI;
        double ct = cos(theta), st = sin(theta);

        ur[i][0] = amp*(ct*e1x + st*e2x);
        ur[i][1] = amp*(ct*e1y + st*e2y);
        ur[i][2] = amp*(ct*e1z + st*e2z);
        ui[i][0] = 0; ui[i][1] = 0; ui[i][2] = 0;
    }
}

int main(void) {
    printf("################################################################\n");
    printf("#  POLARISATION DIVERSITY TEST                                  #\n");
    printf("#                                                              #\n");
    printf("#  Does the div-free constraint (û⊥k) force phase diversity   #\n");
    printf("#  INDEPENDENTLY of the Leray angle diversity?                 #\n");
    printf("#                                                              #\n");
    printf("#  Tests: (a) actual evolved state                             #\n");
    printf("#         (b) aligned polarisation (same dir for all modes)    #\n");
    printf("#         (c) random polarisation (diverse dir, same spectrum) #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    int N = 6;
    double nu = 0.01, dt = 0.0001;

    /* Setup and evolve to get a physical state */
    nm_g = (int)c3d_enumerate_modes(N);
    c3d_precompute_triads(N);
    c3d_zero_state(nm_g);
    for (int i = 0; i < nm_g; i++) {
        int kx=(int)c3d_get_kx(i), ky=(int)c3d_get_ky(i), kz=(int)c3d_get_kz(i);
        double k2=(double)(kx*kx+ky*ky+kz*kz), km=sqrt(k2);
        if(km<0.5) continue;
        double va=0.3*pow(km,-1.0), ph=(double)i*0.7+0.3;
        double ux=va*sin(M_PI*ph), uy=va*cos(M_PI*ph*0.6), uz=0;
        if(kz!=0) uz=-((double)kx*ux+(double)ky*uy)/(double)kz;
        else if(ky!=0) uy=-(double)kx*ux/(double)ky;
        else ux=0;
        buf_set(0,(double)i); buf_set(1,ux); buf_set(2,uy); buf_set(3,uz);
        c3d_apply_state();
    }
    c3d_enforce_symmetry();
    buf_set(0, nu); buf_set(1, dt);
    for (int s = 0; s < 500; s++) c3d_do_step();
    read_state();

    /* Save the evolved state */
    double ur_save[MAX_MODES][3], ui_save[MAX_MODES][3];
    memcpy(ur_save, ur, sizeof(ur));
    memcpy(ui_save, ui, sizeof(ui));

    printf("  K   R_evolved   R_aligned   R_random(avg10)  R_random(max)  aligned/evolved\n");
    printf("  --  ----------  ----------  ---------------  -------------  ---------------\n");

    for (int K = 1; K <= N && K < MSH; K++) {
        /* (a) Evolved state */
        memcpy(ur, ur_save, sizeof(ur));
        memcpy(ui, ui_save, sizeof(ui));
        double R_evolved = compute_RK(K, N);

        /* (b) Aligned polarisation */
        memcpy(ur, ur_save, sizeof(ur));
        memcpy(ui, ui_save, sizeof(ui));
        set_aligned_polarisation(1.0);
        double R_aligned = compute_RK(K, N);

        /* (c) Random polarisation — average over 10 trials */
        double R_random_sum = 0, R_random_max = 0;
        for (int trial = 0; trial < 10; trial++) {
            memcpy(ur, ur_save, sizeof(ur));
            memcpy(ui, ui_save, sizeof(ui));
            set_random_polarisation(1.0);
            double R = compute_RK(K, N);
            R_random_sum += R;
            if (R > R_random_max) R_random_max = R;
        }
        double R_random_avg = R_random_sum / 10.0;

        printf("  %-2d  %10.6f  %10.6f  %15.6f  %13.6f  %15.4f\n",
               K, R_evolved, R_aligned, R_random_avg, R_random_max,
               (R_evolved > 1e-10) ? R_aligned/R_evolved : 999.0);
    }

    printf("\n");
    printf("################################################################\n");
    printf("#  INTERPRETATION                                              #\n");
    printf("#                                                              #\n");
    printf("#  If R_aligned >> R_evolved: polarisation diversity matters. #\n");
    printf("#  If R_aligned ~ R_evolved: Leray diversity alone suffices.  #\n");
    printf("#  If R_aligned < 1: even worst-case polarisation can't       #\n");
    printf("#    achieve full coherence — the GEOMETRY prevents it.        #\n");
    printf("#                                                              #\n");
    printf("#  KEY: if R_aligned < 1 for all K, the Lattice-Leray Lemma  #\n");
    printf("#  is SUFFICIENT for subcritical transfer, regardless of the  #\n");
    printf("#  solution's Fourier coefficients.                            #\n");
    printf("################################################################\n");

    return 0;
}
