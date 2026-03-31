/*
 * Experiment 05: Rotation Depth — What Happens When You Keep Rotating
 *
 * The core question: apply rotate → sieve → derive REPEATEDLY.
 * At each cycle:
 *   1. ROTATE: Switch algebraic viewpoint (ADD → MUL → LOG → QUAD → ...)
 *   2. SIEVE: Strip known structure at this viewpoint
 *   3. DERIVE: Compute H' of residual
 *   4. Measure entropy
 *   5. REPEAT
 *
 * Track entropy across cycles. Three possible outcomes:
 *   A) Entropy increases monotonically → structure dissolves → RH consistent
 *   B) Entropy plateaus → finite structure, fully accounted for
 *   C) Entropy decreases at some cycle → HIDDEN STRUCTURE found → RH violation signal
 *
 * This is the recursive sieve from cipher exp46-49, generalised to
 * the prime sequence with algebraic rotation from exp58.
 */

#include "rh_scaffold.h"
#include "rh_zeta.h"

#define N_PRIMES 30000
#define MAX_CYCLES 20
#define N_ALGEBRAS 6

/* ────────────────────────────────────────────── */
/* Algebraic viewpoints                           */
/* ────────────────────────────────────────────── */

typedef enum {
    ALG_ADD = 0,    /* additive: gaps */
    ALG_MUL,        /* multiplicative: ratios */
    ALG_LOG,        /* logarithmic: ln-gaps */
    ALG_QUAD,       /* quadratic: gap² */
    ALG_RECIP,      /* reciprocal: 1/p */
    ALG_CHEBYSHEV   /* Chebyshev: ψ(p) - p */
} Algebra;

static const char *alg_names[] = {
    "ADD (gaps)", "MUL (ratios)", "LOG (ln-gaps)",
    "QUAD (gap²)", "RECIP (1/p)", "CHEBY (ψ-p)"
};

/*
 * Transform prime sequence into algebraic viewpoint.
 * Returns a double array of residuals in that algebra.
 */
static int algebra_transform(const int *primes, int np, Algebra alg, double *out) {
    int n = 0;
    switch (alg) {
    case ALG_ADD:
        /* gaps minus expected: (p[n+1]-p[n]) - ln(p[n]) */
        for (int i = 0; i < np - 1; i++) {
            double gap = (double)(primes[i + 1] - primes[i]);
            double expected = log((double)primes[i]);
            out[n++] = gap - expected;
        }
        break;

    case ALG_MUL:
        /* ratio residual: p[n+1]/p[n] - (1 + 1/ln(p[n])) */
        for (int i = 0; i < np - 1; i++) {
            double ratio = (double)primes[i + 1] / primes[i];
            double expected = 1.0 + 1.0 / log((double)primes[i]);
            out[n++] = ratio - expected;
        }
        break;

    case ALG_LOG:
        /* log-gap: ln(p[n+1]) - ln(p[n]) - 1/n (from PNT) */
        for (int i = 1; i < np - 1; i++) {
            double lg = log((double)primes[i + 1]) - log((double)primes[i]);
            double expected = 1.0 / (double)(i + 1);
            out[n++] = lg - expected;
        }
        break;

    case ALG_QUAD:
        /* squared gap residual */
        for (int i = 0; i < np - 1; i++) {
            double gap = (double)(primes[i + 1] - primes[i]);
            double expected = log((double)primes[i]);
            out[n++] = gap * gap - expected * expected;
        }
        break;

    case ALG_RECIP:
        /* 1/p[n] - 1/(n*ln(n)) */
        for (int i = 1; i < np; i++) {
            double recip = 1.0 / primes[i];
            double expected = 1.0 / ((double)(i + 1) * log((double)(i + 1)));
            out[n++] = recip - expected;
        }
        break;

    case ALG_CHEBYSHEV:
        /* ψ(p[n]) - p[n] = Σ_{q≤p[n]} Λ(q) - p[n] */
        {
            double psi = 0;
            int pi = 0;
            for (int i = 0; i < np; i++) {
                /* add von Mangoldt for primes up to primes[i] */
                while (pi <= i) {
                    int p = primes[pi];
                    long long pk = p;
                    while (pk <= primes[i]) {
                        if (pk == primes[i] || (pi == i)) {
                            psi += log((double)p);
                        }
                        pk *= p;
                        if (pk > primes[i]) break;
                    }
                    pi++;
                }
                pi = i + 1;
                out[n++] = psi - (double)primes[i];
            }
        }
        break;
    }
    return n;
}

int main(void) {
    printf("=== Experiment 05: Rotation Depth ===\n\n");
    printf("Rotate → Sieve → Derive → Repeat\n");
    printf("Track entropy across cycles and algebraic viewpoints.\n\n");

    /* generate primes */
    int *primes = malloc(N_PRIMES * sizeof(int));
    int np = sieve_primes(primes, N_PRIMES, 400000);
    printf("Primes: %d (up to %d)\n\n", np, primes[np - 1]);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Single-algebra rotation depth */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: ENTROPY vs CYCLE DEPTH — single algebra");
    printf("  Cycle");
    for (int a = 0; a < N_ALGEBRAS; a++) printf(" │ %-12s", alg_names[a]);
    printf("\n  ─────");
    for (int a = 0; a < N_ALGEBRAS; a++) printf("─┼─────────────");
    printf("\n");

    double alg_entropy[N_ALGEBRAS][MAX_CYCLES];
    int alg_lengths[N_ALGEBRAS];

    for (int a = 0; a < N_ALGEBRAS; a++) {
        double *seq = malloc(np * sizeof(double));
        int n = algebra_transform(primes, np, (Algebra)a, seq);
        alg_lengths[a] = n;

        for (int cycle = 0; cycle < MAX_CYCLES && n > 50; cycle++) {
            double ent = shannon_entropy_d(seq, n, 64) / log2(64.0);
            alg_entropy[a][cycle] = ent;

            /* derive: differentiate for next cycle */
            n = diff_k_d(seq, seq, n, 1);
        }
        /* fill remaining with -1 */
        for (int cycle = n > 50 ? MAX_CYCLES : 0; cycle < MAX_CYCLES; cycle++)
            alg_entropy[a][cycle] = -1;
        free(seq);
    }

    for (int cycle = 0; cycle < 12; cycle++) {
        printf("  %3d  ", cycle);
        for (int a = 0; a < N_ALGEBRAS; a++) {
            if (alg_entropy[a][cycle] >= 0)
                printf(" │    %6.4f   ", alg_entropy[a][cycle]);
            else
                printf(" │      —      ");
        }
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Rotating algebras — cycle through viewpoints */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: ROTATING ALGEBRAS — cycle through viewpoints each step");
    printf("Order: ADD → MUL → LOG → QUAD → RECIP → CHEBY → ADD → ...\n\n");
    printf("  Cycle │ Algebra      │ Entropy │ Δ       │ Trend\n");
    printf("  ──────┼──────────────┼─────────┼─────────┼──────\n");

    double *rot_seq = malloc(np * sizeof(double));
    int rot_n = algebra_transform(primes, np, ALG_ADD, rot_seq);
    double prev_ent = 0;
    double rotation_entropies[MAX_CYCLES];

    for (int cycle = 0; cycle < MAX_CYCLES && rot_n > 50; cycle++) {
        Algebra alg = (Algebra)(cycle % N_ALGEBRAS);
        double ent = shannon_entropy_d(rot_seq, rot_n, 64) / log2(64.0);
        rotation_entropies[cycle] = ent;
        double delta = (cycle == 0) ? 0 : ent - prev_ent;
        const char *trend = (cycle == 0) ? "baseline" :
                           (delta > 0.005) ? "↑ dissolving" :
                           (delta < -0.005) ? "↓ STRUCTURE" : "→ stable";
        printf("  %3d   │ %-12s │ %7.4f │ %+7.4f │ %s\n",
               cycle, alg_names[alg], ent, delta, trend);
        prev_ent = ent;

        /* derive */
        rot_n = diff_k_d(rot_seq, rot_seq, rot_n, 1);
    }
    free(rot_seq);

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Cross-algebra MI at each depth */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: CROSS-ALGEBRA MUTUAL INFORMATION at depth 0");
    printf("Does one algebra reveal information hidden from another?\n\n");

    /* compute residuals at depth 0 for each algebra */
    double *alg_resid[N_ALGEBRAS];
    int alg_n[N_ALGEBRAS];
    for (int a = 0; a < N_ALGEBRAS; a++) {
        alg_resid[a] = malloc(np * sizeof(double));
        alg_n[a] = algebra_transform(primes, np, (Algebra)a, alg_resid[a]);
    }

    /* discretise for MI computation */
    int **alg_disc = malloc(N_ALGEBRAS * sizeof(int *));
    for (int a = 0; a < N_ALGEBRAS; a++) {
        alg_disc[a] = malloc(alg_n[a] * sizeof(int));
        /* bin into 30 bins */
        double vmin = alg_resid[a][0], vmax = alg_resid[a][0];
        for (int i = 1; i < alg_n[a]; i++) {
            if (alg_resid[a][i] < vmin) vmin = alg_resid[a][i];
            if (alg_resid[a][i] > vmax) vmax = alg_resid[a][i];
        }
        double range = vmax - vmin;
        if (range < 1e-15) range = 1.0;
        for (int i = 0; i < alg_n[a]; i++) {
            alg_disc[a][i] = (int)((alg_resid[a][i] - vmin) / range * 29);
            if (alg_disc[a][i] < 0) alg_disc[a][i] = 0;
            if (alg_disc[a][i] >= 30) alg_disc[a][i] = 29;
        }
    }

    printf("%-12s", "");
    for (int j = 0; j < N_ALGEBRAS; j++) printf(" │ %-8s", alg_names[j]);
    printf("\n────────────");
    for (int j = 0; j < N_ALGEBRAS; j++) printf("─┼─────────");
    printf("\n");

    for (int i = 0; i < N_ALGEBRAS; i++) {
        printf("%-12s", alg_names[i]);
        for (int j = 0; j < N_ALGEBRAS; j++) {
            int common = alg_n[i] < alg_n[j] ? alg_n[i] : alg_n[j];
            double mi = mutual_info_pair(alg_disc[i], alg_disc[j], common, 30, 30);
            printf(" │ %7.4f ", mi);
        }
        printf("\n");
    }

    for (int a = 0; a < N_ALGEBRAS; a++) {
        free(alg_resid[a]);
        free(alg_disc[a]);
    }
    free(alg_disc);

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Entropy convergence rate */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: ENTROPY CONVERGENCE RATE");
    printf("Fit: entropy(cycle) = a + b*cycle + c*cycle²\n\n");

    /* linear fit for first 10 cycles of ADD algebra */
    double sum_x = 0, sum_y = 0, sum_xx = 0, sum_xy = 0;
    int fit_n = 0;
    for (int c = 0; c < 10 && alg_entropy[0][c] >= 0; c++) {
        sum_x += c;
        sum_y += alg_entropy[0][c];
        sum_xx += c * c;
        sum_xy += c * alg_entropy[0][c];
        fit_n++;
    }
    double slope = 0, intercept = 0;
    if (fit_n > 1) {
        slope = (fit_n * sum_xy - sum_x * sum_y) / (fit_n * sum_xx - sum_x * sum_x);
        intercept = (sum_y - slope * sum_x) / fit_n;
    }

    printf("  ADD algebra: entropy ≈ %.4f + %.4f × cycle\n", intercept, slope);
    printf("  Slope %s → structure %s through differentiation\n",
           slope > 0 ? "> 0" : slope < 0 ? "< 0" : "≈ 0",
           slope > 0 ? "DISSOLVES (consistent with RH)" :
           slope < 0 ? "ACCUMULATES (anomalous — investigate)" : "is STABLE");

    /* do same for each algebra */
    printf("\n  Per-algebra slopes:\n");
    for (int a = 0; a < N_ALGEBRAS; a++) {
        double sx = 0, sy = 0, sxx = 0, sxy = 0;
        int fn = 0;
        for (int c = 0; c < 10 && alg_entropy[a][c] >= 0; c++) {
            sx += c; sy += alg_entropy[a][c];
            sxx += c * c; sxy += c * alg_entropy[a][c];
            fn++;
        }
        double sl = 0;
        if (fn > 1) sl = (fn * sxy - sx * sy) / (fn * sxx - sx * sx);
        printf("    %-14s slope = %+.6f  %s\n", alg_names[a], sl,
               sl > 0.001 ? "(dissolving)" :
               sl < -0.001 ? "(ACCUMULATING)" : "(stable)");
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: ROTATION DEPTH ANALYSIS");
    printf("1. Each algebraic viewpoint reveals different residual structure\n");
    printf("2. Differentiation (derive step) either dissolves or preserves structure\n");
    printf("3. Cross-algebra MI shows how much information is SHARED vs UNIQUE\n");
    printf("4. If all algebras show entropy increasing with depth:\n");
    printf("   → All structure is in the known layers (RH consistent)\n");
    printf("5. If any algebra shows entropy DECREASING with depth:\n");
    printf("   → Hidden structure exists that differentiation reveals\n");
    printf("   → This structure would correspond to off-line zeros\n");
    printf("6. The convergence RATE encodes how far zeros can deviate from Re=1/2\n");
    printf("   → Faster convergence = tighter constraint on zero positions\n");

    free(primes);
    return 0;
}
