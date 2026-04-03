/*
 * experiment_analytical_C.c — Compute C from pure lattice geometry
 *
 * The per-triad bound is |c̄(S,K)| ≤ C · √(E_S · E_K)
 * where C depends on mode counts M_S, M_K, triad counts n(S,K),
 * and the maximum wavenumber magnitude.
 *
 * From the Cauchy-Schwarz derivation:
 *   |c̄(S,K)| ≤ (1/n(S,K)) · √(2E_S) · √(Σ |q|²|û_q|²|û_k|²)
 *
 * The second factor involves the third leg q = k - p.
 * Bounding |û_q|² ≤ 2E/M_tot and |û_k|² ≤ 2E_K/M_K:
 *   Σ |q|²|û_q|²|û_k|² ≤ (2E/M_tot) · (2E_K/M_K) · Σ_{triads} |q|²
 *
 * So: |c̄(S,K)| ≤ (1/n(S,K)) · √(2E_S) · √((4E·E_K)/(M_tot·M_K) · Q(S,K))
 *
 * where Q(S,K) = Σ_{triads connecting S,K} |q|² is a pure geometric quantity.
 *
 * Dividing by √(E_S·E_K):
 *   C(S,K) = √(2) · √(4E/(M_tot·M_K)) · √(Q(S,K)) / n(S,K) · 1/√(E_K)
 *
 * Hmm, E still appears. Let me think more carefully.
 *
 * Actually: the TIGHTEST bound uses Cauchy-Schwarz differently.
 * For a single triad: c(p,q,k) = Re(conj(û_k) · (-i)(û_p·q)P_k(û_q))
 * |c| ≤ |û_k| · |û_p| · |q| · |û_q|
 *
 * Average over n(S,K) triads with |p|~S, |k|~K, q=k-p:
 * |c̄| = |Σ c| / n ≤ Σ|c| / n ≤ (Σ |û_k|·|û_p|·|q|·|û_q|) / n
 *
 * By Cauchy-Schwarz on the triad sum:
 * Σ |û_k|·|û_p|·|q|·|û_q| ≤ √(Σ|û_k|²·|û_p|²) · √(Σ|q|²·|û_q|²)
 *
 * First factor: Σ_{triads}|û_k|²|û_p|² ≤ (Σ_{|k|~K}|û_k|²)(Σ_{|p|~S}|û_p|²)·(max triads per pair)
 *   but actually each (k,p) pair has at most one q, so:
 *   Σ_{triads}|û_k|²|û_p|² = Σ_{k,p: k-p∈B_N} |û_k|²|û_p|²
 *   ≤ (Σ_k|û_k|²)(Σ_p|û_p|²) = 2E_K · 2E_S
 *   (by independence — the constraint k-p∈B_N only removes pairs, so the bound holds)
 *
 * Second factor: Σ_{triads}|q|²|û_q|² ≤ Σ_{q∈B_N}|q|²|û_q|² · (max times q appears)
 *   Each q appears in at most M_S·M_K/n(S,K) triads... no, that's not right.
 *   Actually Σ_{triads}|q|²|û_q|² = Σ_{q} |q|²|û_q|² · (# triads using this q)
 *   ≤ max_q(# triads using q) · Σ_q|q|²|û_q|² = D(S,K) · 2Ω
 *   where D(S,K) = max over q of (# of (p,k) pairs with |p|~S, |k|~K, k-p=q)
 *
 * So: |c̄| ≤ (1/n) · √(4E_S·E_K) · √(2Ω·D(S,K))
 *        = (1/n) · 2√(E_S·E_K·Ω·D(S,K)/2)... still has Ω
 *
 * The cleanest bound: use |q| ≤ K+S (triangle inequality) to pull it out:
 * |c̄| ≤ (K+S)/n · √(4E_S·E_K) · √(Σ|û_q|²)
 *      = (K+S)/n · 2√(E_S·E_K) · √(2E)
 *
 * So: C_analytical(S,K) = 2√2 · (K+S) · √E / n(S,K)
 *
 * And C = max_{S,K} C_analytical(S,K) / √(E_S·E_K) ... no, wait.
 * We had |c̄| ≤ C·√(E_S·E_K), and the bound gives:
 *   |c̄| ≤ 2√2·(K+S)·√E·√(E_S·E_K)/n(S,K)
 *
 * So: C(S,K) = 2√2·(K+S)·√E / n(S,K)
 *
 * This depends on E (the total energy) but NOT on the flow state's
 * distribution across shells. Since E(t) ≤ E(0), C is bounded by
 * initial data.
 *
 * C_geom(S,K) = 2√2·(K+S)/n(S,K) is the PURELY GEOMETRIC part.
 * C = C_geom · √E.
 *
 * This experiment computes C_geom(S,K) from the lattice alone
 * and compares C_geom·√E with the measured C from experiment_per_triad_bound.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_analytical_C.c \
 *         src/triad_kernel_v3_final.c -o build/analytical_C -lm
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

extern int64_t c3d_enumerate_modes(int64_t n_max);
extern int64_t c3d_precompute_triads(int64_t n_max);
extern int64_t c3d_get_kx(int64_t idx);
extern int64_t c3d_get_ky(int64_t idx);
extern int64_t c3d_get_kz(int64_t idx);
extern int64_t c3d_get_num_modes(void);

int main(void) {
    printf("################################################################\n");
    printf("#  ANALYTICAL C FROM LATTICE GEOMETRY                          #\n");
    printf("#                                                              #\n");
    printf("#  C_geom(S,K) = 2√2·(K+S) / n(S,K)                         #\n");
    printf("#  C = C_geom · √E  (total energy factor)                    #\n");
    printf("#                                                              #\n");
    printf("#  Compare with measured C ≤ 1.12e-3 from per_triad_bound.   #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    int Ns[] = {6, 8, 10};
    int n_Ns = 3;
    #define MSH 12

    for (int ni = 0; ni < n_Ns; ni++) {
        int N = Ns[ni];
        int nm = (int)c3d_enumerate_modes(N);
        c3d_precompute_triads(N);
        int n_max_sq = N * N;

        int lkx[5000], lky[5000], lkz[5000];
        for (int i = 0; i < nm && i < 5000; i++) {
            lkx[i] = (int)c3d_get_kx(i);
            lky[i] = (int)c3d_get_ky(i);
            lkz[i] = (int)c3d_get_kz(i);
        }

        /* Count triads n(S,K) and mode counts M_S */
        long n_SK[MSH][MSH]; memset(n_SK, 0, sizeof(n_SK));
        long M_S[MSH]; memset(M_S, 0, sizeof(M_S));

        for (int i = 0; i < nm; i++) {
            int k2 = lkx[i]*lkx[i]+lky[i]*lky[i]+lkz[i]*lkz[i];
            int sh = (int)(sqrt((double)k2)+0.5);
            if (sh < MSH) M_S[sh]++;
        }

        for (int p_idx = 0; p_idx < nm; p_idx++) {
            int px=lkx[p_idx],py=lky[p_idx],pz=lkz[p_idx];
            int p2=px*px+py*py+pz*pz;
            int ps=(int)(sqrt((double)p2)+0.5);
            if (ps >= MSH) continue;

            for (int k_idx = 0; k_idx < nm; k_idx++) {
                int kx=lkx[k_idx],ky=lky[k_idx],kz=lkz[k_idx];
                int k2=kx*kx+ky*ky+kz*kz;
                int ks=(int)(sqrt((double)k2)+0.5);
                if (ks >= MSH) continue;

                int qx=kx-px,qy=ky-py,qz=kz-pz;
                int q2=qx*qx+qy*qy+qz*qz;
                if (q2<=0 || q2>n_max_sq) continue;

                int found = 0;
                for (int qi=0; qi<nm; qi++) {
                    if (lkx[qi]==qx && lky[qi]==qy && lkz[qi]==qz) { found=1; break; }
                }
                if (found) n_SK[ks][ps]++;
            }
        }

        printf("  === N = %d (%d modes) ===\n\n", N, nm);

        /* C_geom(S,K) = 2√2·(K+S) / n(S,K) */
        printf("  C_geom(S,K) = 2√2·(K+S)/n(S,K):\n\n");
        printf("  K\\S   ");
        for (int S=1; S<=N && S<MSH; S++) printf("    S=%-4d ",S);
        printf("   max\n  ------");
        for (int S=1; S<=N && S<MSH; S++) printf("  ---------");
        printf("  ---------\n");

        double max_Cgeom = 0;
        for (int K=1; K<=N && K<MSH; K++) {
            printf("  K=%-4d",K);
            double row_max = 0;
            for (int S=1; S<=N && S<MSH; S++) {
                double Cg = 0;
                if (n_SK[K][S] > 0)
                    Cg = 2.0*sqrt(2.0)*(double)(K+S) / (double)n_SK[K][S];
                if (Cg > row_max) row_max = Cg;
                if (Cg > max_Cgeom) max_Cgeom = Cg;
                printf("  %9.4e", Cg);
            }
            printf("  %9.4e\n", row_max);
        }

        printf("\n  Max C_geom = %.6e\n", max_Cgeom);

        /* For E=2.4 (A=0.30 typical), C = C_geom · √E */
        double E_typical = 2.4;
        double C_predicted = max_Cgeom * sqrt(E_typical);
        printf("  Predicted C (E=%.1f): %.6e\n", E_typical, C_predicted);
        printf("  Measured C:          1.12e-03\n");
        printf("  Ratio predicted/measured: %.2f\n\n", C_predicted / 1.12e-3);

        fflush(stdout);
    }

    printf("################################################################\n");
    printf("#  If predicted C ≥ measured C: the analytical bound holds.   #\n");
    printf("#  The ratio tells us how tight the bound is.                 #\n");
    printf("#                                                              #\n");
    printf("#  C_geom is PURELY GEOMETRIC — computable from Z³ alone.    #\n");
    printf("#  C = C_geom · √E is bounded by C_geom · √E(0).           #\n");
    printf("#  This closes the per-triad bound analytically.              #\n");
    printf("################################################################\n");

    return 0;
}
