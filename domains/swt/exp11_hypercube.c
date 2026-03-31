/*
 * Experiment 11: The Hypercube — Primes in Multi-Dimensional [0,1]^D
 *
 * Stop looking at 1D projections. Each prime is a point in D dimensions.
 * Each dimension is a different algebraic rotation of the same number.
 *
 * D1: p mod 2 / 2          (parity — always 0.5 for p>2)
 * D2: p mod 3 / 3          (ternary residue)
 * D3: p mod 5 / 5          (quinary residue)
 * D4: p mod 7 / 7          (septenary residue)
 * D5: gap / max_gap         (normalised gap)
 * D6: local_density * ln(p) (normalised density — should be ~1.0 by PNT)
 * D7: (Ω(p-1) - mean) / std (factorisation complexity of p-1)
 *
 * Now apply the scaffold IN EACH DIMENSION and ACROSS dimensions.
 * The cross-dimensional derivative is the rotation.
 *
 * H on D1 is the mod-2 projection.
 * H' on D1 is how mod-2 changes between consecutive primes.
 * H' ACROSS D1→D2 is how mod-2 structure relates to mod-3 structure.
 * H''' across ALL dimensions simultaneously is the FULL jerk.
 *
 * The 1D ratio was 1.873. What is it in 7D?
 * If the same: structure is separable (each dimension independent).
 * If different: cross-dimensional coupling exists.
 * That coupling IS the hidden structure we're looking for.
 */

#include "rh_scaffold.h"

#define MAX_N 1000000
#define MAX_PRIMES 80000
#define N_DIMS 7

/* ────────────────────────────────────────────────── */
/* Multi-dimensional prime representation             */
/* ────────────────────────────────────────────────── */

/* RMS */
static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* number of prime factors of n (with multiplicity) */
static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

static const char *dim_names[N_DIMS] = {
    "mod2", "mod3", "mod5", "mod7", "gap", "density", "Ω(p-1)"
};

int main(void) {
    printf("=== Experiment 11: The Hypercube ===\n\n");
    printf("Each prime is a point in %dD unit hypercube.\n", N_DIMS);
    printf("Apply scaffold within and ACROSS dimensions.\n\n");

    /* sieve and generate primes */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    int *primes = malloc(MAX_PRIMES * sizeof(int));
    int np = 0;
    for (int i = 2; i <= MAX_N && np < MAX_PRIMES; i++)
        if (!sieve[i]) primes[np++] = i;
    printf("Primes: %d (up to %d)\n\n", np, primes[np - 1]);

    /* build the hypercube: coords[dim][prime_index] ∈ [0,1] */
    double **coords = malloc(N_DIMS * sizeof(double *));
    for (int d = 0; d < N_DIMS; d++)
        coords[d] = malloc(np * sizeof(double));

    /* D1: p mod 2 / 2 */
    for (int i = 0; i < np; i++)
        coords[0][i] = (double)(primes[i] % 2) / 2.0;

    /* D2: p mod 3 / 3 */
    for (int i = 0; i < np; i++)
        coords[1][i] = (double)(primes[i] % 3) / 3.0;

    /* D3: p mod 5 / 5 */
    for (int i = 0; i < np; i++)
        coords[2][i] = (double)(primes[i] % 5) / 5.0;

    /* D4: p mod 7 / 7 */
    for (int i = 0; i < np; i++)
        coords[3][i] = (double)(primes[i] % 7) / 7.0;

    /* D5: normalised gap */
    double max_gap = 0;
    for (int i = 0; i < np - 1; i++) {
        double g = (double)(primes[i + 1] - primes[i]);
        if (g > max_gap) max_gap = g;
    }
    coords[4][0] = 0;
    for (int i = 1; i < np; i++)
        coords[4][i] = (double)(primes[i] - primes[i - 1]) / max_gap;

    /* D6: normalised density: local_density * ln(p) (should be ~1 by PNT) */
    {
        int window = 50;
        int lo = 0, hi = 0;
        for (int i = 0; i < np; i++) {
            while (lo < np && primes[lo] < primes[i] - window) lo++;
            while (hi < np && primes[hi] <= primes[i] + window) hi++;
            double density = (double)(hi - lo) / (2.0 * window);
            double normalised = density * log((double)primes[i]);
            /* clamp to [0, 2] then map to [0, 1] */
            if (normalised < 0) normalised = 0;
            if (normalised > 2) normalised = 2;
            coords[5][i] = normalised / 2.0;
        }
    }

    /* D7: Ω(p-1) normalised */
    {
        double mean_omega = 0;
        for (int i = 0; i < np; i++) {
            int w = big_omega(primes[i] - 1);
            coords[6][i] = (double)w;
            mean_omega += w;
        }
        mean_omega /= np;
        double std_omega = 0;
        for (int i = 0; i < np; i++) {
            double d = coords[6][i] - mean_omega;
            std_omega += d * d;
        }
        std_omega = sqrt(std_omega / np);
        /* normalise to [0,1] via sigmoid-like mapping */
        for (int i = 0; i < np; i++) {
            double z = (coords[6][i] - mean_omega) / (std_omega > 0 ? std_omega : 1);
            coords[6][i] = 1.0 / (1.0 + exp(-z));  /* sigmoid to [0,1] */
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Per-dimension derivative scaffold */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: PER-DIMENSION H''''/H''' RATIO");
    printf("  Dim │ Name     │ d0 RMS    │ d3 RMS    │ d4 RMS    │ Ratio 4/3\n");
    printf("  ────┼──────────┼───────────┼───────────┼───────────┼──────────\n");

    double per_dim_ratio[N_DIMS];
    for (int d = 0; d < N_DIMS; d++) {
        /* compute gaps (differences between consecutive primes' coordinates) */
        double *gaps = malloc(np * sizeof(double));
        int ng = np - 1;
        for (int i = 0; i < ng; i++)
            gaps[i] = coords[d][i + 1] - coords[d][i];

        double r0 = rms_d(gaps, ng);

        double *d3 = malloc(ng * sizeof(double));
        double *d4 = malloc(ng * sizeof(double));
        int d3n = diff_k_d(gaps, d3, ng, 3);
        int d4n = diff_k_d(gaps, d4, ng, 4);
        double r3 = rms_d(d3, d3n);
        double r4 = rms_d(d4, d4n);
        per_dim_ratio[d] = r3 > 1e-30 ? r4 / r3 : 0;

        printf("  D%-3d│ %-8s │ %9.4e │ %9.4e │ %9.4e │ %8.4f\n",
               d + 1, dim_names[d], r0, r3, r4, per_dim_ratio[d]);

        free(gaps); free(d3); free(d4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Cross-dimensional MI — the coupling matrix */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: CROSS-DIMENSIONAL MUTUAL INFORMATION");
    printf("MI between dimensions reveals coupling.\n");
    printf("High MI = the two axes see the same structure.\n\n");

    /* discretise each dimension into 20 bins for MI */
    int **disc = malloc(N_DIMS * sizeof(int *));
    for (int d = 0; d < N_DIMS; d++) {
        disc[d] = malloc(np * sizeof(int));
        for (int i = 0; i < np; i++) {
            int b = (int)(coords[d][i] * 19.999);
            if (b < 0) b = 0;
            if (b >= 20) b = 19;
            disc[d][i] = b;
        }
    }

    printf("%-8s", "");
    for (int j = 0; j < N_DIMS; j++) printf("│ %-8s", dim_names[j]);
    printf("\n────────");
    for (int j = 0; j < N_DIMS; j++) printf("┼─────────");
    printf("\n");

    double mi_matrix[N_DIMS][N_DIMS];
    for (int i = 0; i < N_DIMS; i++) {
        printf("%-8s", dim_names[i]);
        for (int j = 0; j < N_DIMS; j++) {
            mi_matrix[i][j] = mutual_info_pair(disc[i], disc[j], np, 20, 20);
            printf("│ %7.4f ", mi_matrix[i][j]);
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Joint multi-dimensional derivative */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: JOINT DERIVATIVE — Euclidean distance in D dimensions");
    printf("Instead of differentiating each axis alone, compute the\n");
    printf("Euclidean distance between consecutive points in the hypercube.\n");
    printf("This is the FULL derivative — all rotations simultaneously.\n\n");

    /* compute Euclidean distance between consecutive prime-points */
    double *euclid = malloc(np * sizeof(double));
    int ne = np - 1;
    for (int i = 0; i < ne; i++) {
        double sum = 0;
        for (int d = 0; d < N_DIMS; d++) {
            double diff = coords[d][i + 1] - coords[d][i];
            sum += diff * diff;
        }
        euclid[i] = sqrt(sum);
    }

    /* H-scaffold on Euclidean distance sequence */
    printf("  Order │ RMS         │ Entropy(64) │ Norm  │ Ratio to prev\n");
    printf("  ──────┼─────────────┼─────────────┼───────┼──────────────\n");

    double prev_rms = 0;
    double joint_rms[15];
    double *eseq = malloc(ne * sizeof(double));
    memcpy(eseq, euclid, ne * sizeof(double));
    int en = ne;
    for (int k = 0; k <= 10 && en > 100; k++) {
        if (k > 0) en = diff_k_d(eseq, eseq, en, 1);
        double r = rms_d(eseq, en);
        double ent = shannon_entropy_d(eseq, en, 64) / log2(64.0);
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        joint_rms[k] = r;
        printf("  d^%-4d│ %11.6e │   %7.4f   │ %5.3f │ %s%8.4f\n",
               k, r, ent * log2(64.0), ent,
               k == 0 ? " " : ratio > 1.0 ? "▲" : "▽",
               ratio);
        prev_rms = r;
    }

    double joint_ratio = joint_rms[3] > 1e-30 ? joint_rms[4] / joint_rms[3] : 0;
    printf("\n  JOINT H''''/H''' ratio: %.4f\n", joint_ratio);
    printf("  1D ratio (from exp09): 1.8730\n");
    printf("  Difference: %+.4f  %s\n", joint_ratio - 1.873,
           fabs(joint_ratio - 1.873) < 0.02 ? "SAME as 1D" :
           "DIFFERENT — cross-dimensional coupling detected");

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Manhattan distance — L1 norm */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: MANHATTAN DISTANCE (L1) — sum of absolute changes");

    double *manhattan = malloc(ne * sizeof(double));
    for (int i = 0; i < ne; i++) {
        double sum = 0;
        for (int d = 0; d < N_DIMS; d++)
            sum += fabs(coords[d][i + 1] - coords[d][i]);
        manhattan[i] = sum;
    }

    double *mseq = malloc(ne * sizeof(double));
    memcpy(mseq, manhattan, ne * sizeof(double));
    int mn = ne;
    double man_rms[15];

    printf("  Order │ RMS         │ Ratio to prev\n");
    printf("  ──────┼─────────────┼──────────────\n");
    prev_rms = 0;
    for (int k = 0; k <= 10 && mn > 100; k++) {
        if (k > 0) mn = diff_k_d(mseq, mseq, mn, 1);
        double r = rms_d(mseq, mn);
        man_rms[k] = r;
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        printf("  d^%-4d│ %11.6e │ %s%8.4f\n",
               k, r,
               k == 0 ? " " : ratio > 1.0 ? "▲" : "▽",
               ratio);
        prev_rms = r;
    }

    double man_ratio = man_rms[3] > 1e-30 ? man_rms[4] / man_rms[3] : 0;
    printf("\n  Manhattan H''''/H''' ratio: %.4f\n", man_ratio);

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Per-dimension pair coupling ratios */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: PAIRWISE 2D RATIOS — which pairs couple?");
    printf("Compute H''''/H''' of Euclidean distance in each 2D projection.\n\n");

    printf("%-8s", "");
    for (int j = 0; j < N_DIMS; j++) printf("│ %-8s", dim_names[j]);
    printf("\n────────");
    for (int j = 0; j < N_DIMS; j++) printf("┼─────────");
    printf("\n");

    for (int di = 0; di < N_DIMS; di++) {
        printf("%-8s", dim_names[di]);
        for (int dj = 0; dj < N_DIMS; dj++) {
            /* 2D Euclidean distance */
            double *dist2d = malloc(ne * sizeof(double));
            for (int i = 0; i < ne; i++) {
                double a = coords[di][i + 1] - coords[di][i];
                double b = coords[dj][i + 1] - coords[dj][i];
                dist2d[i] = sqrt(a * a + b * b);
            }
            double *td3 = malloc(ne * sizeof(double));
            double *td4 = malloc(ne * sizeof(double));
            int td3n = diff_k_d(dist2d, td3, ne, 3);
            int td4n = diff_k_d(dist2d, td4, ne, 4);
            double r3 = rms_d(td3, td3n);
            double r4 = rms_d(td4, td4n);
            double ratio = r3 > 1e-30 ? r4 / r3 : 0;
            printf("│ %7.4f ", ratio);
            free(dist2d); free(td3); free(td4);
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Increasing dimensionality — 1D, 2D, 3D, ... 7D */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: RATIO vs DIMENSIONALITY");
    printf("Add one dimension at a time. Does the ratio change?\n\n");

    printf("  Dims │ Axes              │ H''''/H''' │ vs 1D    │ Coupling?\n");
    printf("  ─────┼───────────────────┼────────────┼──────────┼──────────\n");

    for (int ndim = 1; ndim <= N_DIMS; ndim++) {
        /* Euclidean distance using first ndim dimensions */
        double *dist = malloc(ne * sizeof(double));
        for (int i = 0; i < ne; i++) {
            double sum = 0;
            for (int d = 0; d < ndim; d++) {
                double diff = coords[d][i + 1] - coords[d][i];
                sum += diff * diff;
            }
            dist[i] = sqrt(sum);
        }
        double *td3 = malloc(ne * sizeof(double));
        double *td4 = malloc(ne * sizeof(double));
        int td3n = diff_k_d(dist, td3, ne, 3);
        int td4n = diff_k_d(dist, td4, ne, 4);
        double r3 = rms_d(td3, td3n);
        double r4 = rms_d(td4, td4n);
        double ratio = r3 > 1e-30 ? r4 / r3 : 0;

        /* build axis label */
        char label[64] = "";
        for (int d = 0; d < ndim && d < 4; d++) {
            if (d > 0) strcat(label, ",");
            strcat(label, dim_names[d]);
        }
        if (ndim > 4) strcat(label, ",...");

        double diff_1d = ratio - per_dim_ratio[0];
        printf("  %4dD │ %-17s │   %7.4f  │ %+7.4f  │ %s\n",
               ndim, label, ratio, diff_1d,
               fabs(diff_1d) > 0.02 ? "*** COUPLED" :
               fabs(diff_1d) > 0.005 ? "**  weak" : "    none");

        free(dist); free(td3); free(td4);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: Cross-dimensional derivative (the rotation derivative) */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: ROTATION DERIVATIVE — d/d(dim) of the scaffold");
    printf("For each prime, compute how the coordinate CHANGES across dimensions.\n");
    printf("This is the derivative in the rotation direction.\n\n");

    /* for each prime i: rotation_deriv[i] = Σ |coords[d+1][i] - coords[d][i]| */
    double *rot_deriv = malloc(np * sizeof(double));
    for (int i = 0; i < np; i++) {
        double sum = 0;
        for (int d = 0; d < N_DIMS - 1; d++) {
            sum += fabs(coords[d + 1][i] - coords[d][i]);
        }
        rot_deriv[i] = sum;
    }

    /* now apply H-scaffold to rotation derivative */
    printf("  Order │ RMS         │ Entropy │ Norm  │ Ratio\n");
    printf("  ──────┼─────────────┼─────────┼───────┼──────\n");

    double *rseq = malloc(np * sizeof(double));
    memcpy(rseq, rot_deriv, np * sizeof(double));
    int rn = np;
    double rot_rms[15];
    prev_rms = 0;
    for (int k = 0; k <= 8 && rn > 100; k++) {
        if (k > 0) rn = diff_k_d(rseq, rseq, rn, 1);
        double r = rms_d(rseq, rn);
        double ent = shannon_entropy_d(rseq, rn, 64) / log2(64.0);
        rot_rms[k] = r;
        double ratio = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        printf("  d^%-4d│ %11.6e │ %7.4f │ %5.3f │ %8.4f\n",
               k, r, ent * log2(64.0), ent, ratio);
        prev_rms = r;
    }

    double rot_ratio = rot_rms[3] > 1e-30 ? rot_rms[4] / rot_rms[3] : 0;
    printf("\n  Rotation-derivative H''''/H''': %.4f\n", rot_ratio);

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE HYPERCUBE VIEW");
    printf("Per-dimension ratios:\n");
    for (int d = 0; d < N_DIMS; d++)
        printf("  D%d %-8s : %.4f\n", d + 1, dim_names[d], per_dim_ratio[d]);
    printf("\nJoint (Euclidean, %dD):  %.4f\n", N_DIMS, joint_ratio);
    printf("Joint (Manhattan, %dD): %.4f\n", N_DIMS, man_ratio);
    printf("Rotation derivative:    %.4f\n\n", rot_ratio);

    printf("KEY FINDINGS:\n");
    printf("1. If all per-dim ratios are identical: dimensions are independent.\n");
    printf("   The hypercube is a product space. No cross-coupling.\n\n");
    printf("2. If the joint ratio DIFFERS from per-dim ratios: coupling exists.\n");
    printf("   The dimensions interact. Structure lives in the cross-terms.\n\n");
    printf("3. The ROTATION DERIVATIVE measures how structure changes as you\n");
    printf("   rotate between algebraic viewpoints. Its ratio tells you whether\n");
    printf("   rotation reveals new information or just reshuffles the same.\n\n");
    printf("4. If coupling increases with dimensionality: higher-D views see\n");
    printf("   more structure. The discordant note is in the cross-terms.\n");

    for (int d = 0; d < N_DIMS; d++) { free(coords[d]); free(disc[d]); }
    free(coords); free(disc);
    free(sieve); free(primes); free(euclid); free(eseq);
    free(manhattan); free(mseq); free(rot_deriv); free(rseq);
    return 0;
}
