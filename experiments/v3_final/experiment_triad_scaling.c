/*
 * experiment_triad_scaling.c — Precise n(S,K) scaling exponents
 *
 * The analytical β = s - b where b is the K-scaling exponent of n(S,K).
 * We need b precisely. If b ≤ 1.5: β > 2 at s = 3.5 and Step 5 closes.
 *
 * Compute n(S,K) at N = 6, 8, 10, 12 (if feasible) to:
 *   1. Get b as a function of S (not just at one S)
 *   2. Get b at larger N where boundary effects are smaller
 *   3. Get the S-scaling exponent a precisely
 *   4. Check if b is N-independent (converged)
 *
 * Also compute the SUM Σ_S n(S,K)² · S^{-2s} directly for s = 3, 3.5, 4
 * to get the analytical ρ_K without fitting intermediate exponents.
 *
 * BUILD:
 *   clang -O3 experiments/experiment_triad_scaling.c \
 *         src/triad_kernel_v3_final.c -o build/triad_scale -lm
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

#define MSH 15

int main(void) {
    printf("################################################################\n");
    printf("#  PRECISE TRIAD COUNT SCALING                                 #\n");
    printf("#                                                              #\n");
    printf("#  n(S,K) at N = 6, 8, 10                                     #\n");
    printf("#  K-exponent b at each source shell S                        #\n");
    printf("#  Direct computation of Σ_S n(S,K)²·S^{-2s} for s=3,3.5,4  #\n");
    printf("################################################################\n\n");
    fflush(stdout);

    int Ns[] = {6, 8, 10};
    int n_Ns = 3;

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

        /* Count n(S,K) */
        long n_SK[MSH][MSH]; memset(n_SK, 0, sizeof(n_SK));
        long M_S[MSH]; memset(M_S, 0, sizeof(M_S));

        for (int i = 0; i < nm; i++) {
            int k2 = lkx[i]*lkx[i]+lky[i]*lky[i]+lkz[i]*lkz[i];
            int sh = (int)(sqrt((double)k2)+0.5);
            if (sh < MSH) M_S[sh]++;
        }

        for (int p = 0; p < nm; p++) {
            int px=lkx[p],py=lky[p],pz=lkz[p];
            int p2=px*px+py*py+pz*pz;
            int ps=(int)(sqrt((double)p2)+0.5);
            if (ps >= MSH) continue;
            for (int k = 0; k < nm; k++) {
                int kx=lkx[k],ky=lky[k],kz=lkz[k];
                int k2=kx*kx+ky*ky+kz*kz;
                int ks=(int)(sqrt((double)k2)+0.5);
                if (ks >= MSH) continue;
                int qx=kx-px,qy=ky-py,qz=kz-pz;
                int q2=qx*qx+qy*qy+qz*qz;
                if (q2<=0||q2>n_max_sq) continue;
                int found=0;
                for (int qi=0;qi<nm;qi++){
                    if(lkx[qi]==qx&&lky[qi]==qy&&lkz[qi]==qz){found=1;break;}
                }
                if (found) n_SK[ks][ps]++;
            }
        }

        printf("  === N = %d (%d modes) ===\n\n", N, nm);

        /* Print n(S,K) matrix */
        printf("  n(S,K):\n  K\\S  ");
        for (int S=1;S<=N&&S<MSH;S++) printf("  %-8d",S);
        printf("\n  -----");
        for (int S=1;S<=N&&S<MSH;S++) printf("  --------");
        printf("\n");
        for (int K=1;K<=N&&K<MSH;K++){
            printf("  K=%-3d",K);
            for (int S=1;S<=N&&S<MSH;S++) printf("  %-8ld",n_SK[K][S]);
            printf("\n");
        }
        printf("\n");

        /* Fit b(S) = K-exponent at each source shell S */
        /* Use interior shells K = 2..N-2 to avoid boundary */
        printf("  K-exponent b at each S (fitted from K=2..%d):\n  S    b(S)\n", N-2);
        for (int S=1; S<=N&&S<MSH; S++) {
            double sx=0,sy=0,sxx=0,sxy=0; int n=0;
            for (int K=2; K<=N-2&&K<MSH; K++) {
                if (n_SK[K][S] > 0) {
                    double lk=log((double)K), ln=log((double)n_SK[K][S]);
                    sx+=lk;sy+=ln;sxx+=lk*lk;sxy+=lk*ln;n++;
                }
            }
            double b = (n>=2) ? (n*sxy-sx*sy)/(n*sxx-sx*sx) : 0;
            printf("  %-4d %+.4f\n", S, b);
        }
        printf("\n");

        /* Fit a(K) = S-exponent at each target shell K */
        printf("  S-exponent a at each K (fitted from S=2..%d):\n  K    a(K)\n", N-2);
        for (int K=1; K<=N&&K<MSH; K++) {
            double sx=0,sy=0,sxx=0,sxy=0; int n=0;
            for (int S=2; S<=N-2&&S<MSH; S++) {
                if (n_SK[K][S] > 0) {
                    double ls=log((double)S), ln=log((double)n_SK[K][S]);
                    sx+=ls;sy+=ln;sxx+=ls*ls;sxy+=ls*ln;n++;
                }
            }
            double a = (n>=2) ? (n*sxy-sx*sy)/(n*sxx-sx*sx) : 0;
            printf("  %-4d %+.4f\n", K, a);
        }
        printf("\n");

        /* Direct: compute Σ_S n(S,K)² · S^{-2s} for s = 3, 3.5, 4, 5
         * Then ρ_K² ~ E_K · Σ_S n²·S^{-2s}
         * With E_K ~ K^{-2s}: ρ_K ~ K^{-s} · √(Σ)
         * Fit the K-dependence of √(Σ) to get the effective β */
        double s_vals[] = {2.0, 3.0, 3.5, 4.0, 5.0};
        int n_s = 5;

        printf("  Analytical ρ_K prediction: ρ_K² ~ K^{-2s} · Σ_S n(S,K)²·S^{-2s}\n\n");
        for (int si=0; si<n_s; si++) {
            double s = s_vals[si];
            printf("  s = %.1f:\n", s);
            printf("    K     Σ n²S^{-2s}   K^{-2s}·Σ    log(K)   log(K^{-2s}·Σ)  β_eff\n");

            double lk_arr[MSH], ly_arr[MSH]; int np=0;
            for (int K=2; K<=N-1&&K<MSH; K++) {
                double sum_nS = 0;
                for (int S=1; S<=N&&S<MSH; S++) {
                    if (S > 0)
                        sum_nS += (double)(n_SK[K][S])*(double)(n_SK[K][S]) * pow((double)S, -2*s);
                }
                double rho2 = pow((double)K, -2*s) * sum_nS;
                double lk = log((double)K);
                double lr = (rho2 > 0) ? log(rho2) : -99;
                printf("    %-4d  %12.2e  %12.2e  %6.3f   %14.4f\n",
                       K, sum_nS, rho2, lk, lr);
                if (rho2 > 0) { lk_arr[np]=lk; ly_arr[np]=lr; np++; }
            }

            /* Fit: log(ρ²) = -2β·log(K) + const */
            double sx2=0,sy2=0,sxx2=0,sxy2=0;
            for(int i=0;i<np;i++){
                sx2+=lk_arr[i];sy2+=ly_arr[i];sxx2+=lk_arr[i]*lk_arr[i];sxy2+=lk_arr[i]*ly_arr[i];
            }
            double slope2 = (np>=2) ? (np*sxy2-sx2*sy2)/(np*sxx2-sx2*sx2) : 0;
            double beta_eff = -slope2 / 2.0;

            printf("    → β_eff(s=%.1f) = %.4f   (need β > 2 for closure)\n\n", s, beta_eff);
        }
        fflush(stdout);
    }

    printf("################################################################\n");
    printf("#  The analytical β comes from:                                #\n");
    printf("#    ρ_K² ~ K^{-2s} · Σ_S n(S,K)² · S^{-2s}                 #\n");
    printf("#    β = s + (rate at which Σ decays with K) / 2              #\n");
    printf("#                                                              #\n");
    printf("#  If β_eff > 2 at s = 3.5: Step 5 closes analytically.      #\n");
    printf("################################################################\n");

    return 0;
}
