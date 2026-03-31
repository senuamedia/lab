/*
 * Experiment 13: The Inverse — Composites Through the Same Lens
 *
 * We measured primes. Now measure composites IDENTICALLY.
 * Same scaffold. Same dimensions. Same analysis.
 *
 * If primes give ratio 1.85 and composites give ratio 1.85:
 *   → The ratio is a property of INTEGERS, not primes.
 *   → We've measured nothing about primality.
 *
 * If primes give 1.85 and composites give something DIFFERENT:
 *   → The difference IS the prime structure.
 *   → The gap between the two ratios encodes RH.
 *
 * The secret might be: primes + composites = integers.
 * If prime_ratio + composite_ratio = 2.0 (the discrete limit):
 *   → They're perfect complements.
 *   → All structure is accounted for.
 *   → RH holds because there's nothing left over.
 *
 * If prime_ratio + composite_ratio ≠ 2.0:
 *   → There's a residual.
 *   → That residual is the discordant note.
 */

#include "rh_scaffold.h"

#define MAX_N 1000000
#define MAX_SEQ 200000

static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

/* compute H''''/H''' ratio for a gap sequence */
static double compute_ratio(const double *gaps, int ng) {
    double *d3 = malloc(ng * sizeof(double));
    double *d4 = malloc(ng * sizeof(double));
    int d3n = diff_k_d(gaps, d3, ng, 3);
    int d4n = diff_k_d(gaps, d4, ng, 4);
    double r3 = rms_d(d3, d3n);
    double r4 = rms_d(d4, d4n);
    double ratio = r3 > 1e-30 ? r4 / r3 : 0;
    free(d3); free(d4);
    return ratio;
}

/* compute full derivative profile */
static void compute_profile(const double *gaps, int ng, double *ratios, double *entropies, int max_order) {
    double *seq = malloc(ng * sizeof(double));
    memcpy(seq, gaps, ng * sizeof(double));
    int n = ng;
    double prev_rms = 0;
    for (int k = 0; k <= max_order && n > 100; k++) {
        if (k > 0) n = diff_k_d(seq, seq, n, 1);
        double r = rms_d(seq, n);
        ratios[k] = (k > 0 && prev_rms > 1e-30) ? r / prev_rms : 0;
        entropies[k] = shannon_entropy_d(seq, n, 64) / log2(64.0);
        prev_rms = r;
    }
    free(seq);
}

int main(void) {
    printf("=== Experiment 13: The Inverse ===\n\n");
    printf("Same analysis on composites. Compare everything.\n");
    printf("The secret is in the difference.\n\n");

    /* sieve */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    int *primes = malloc(MAX_SEQ * sizeof(int));
    int *composites = malloc(MAX_SEQ * sizeof(int));
    int np = 0, nc = 0;
    for (int i = 2; i <= MAX_N; i++) {
        if (!sieve[i] && np < MAX_SEQ) primes[np++] = i;
        else if (sieve[i] && nc < MAX_SEQ) composites[nc++] = i;
    }
    printf("Primes: %d    Composites: %d    Ratio P/C: %.4f\n\n", np, nc, (double)np / nc);

    /* compute gap sequences */
    int npg = np - 1, ncg = nc - 1;
    double *pgaps = malloc(npg * sizeof(double));
    double *cgaps = malloc(ncg * sizeof(double));
    for (int i = 0; i < npg; i++) pgaps[i] = (double)(primes[i + 1] - primes[i]);
    for (int i = 0; i < ncg; i++) cgaps[i] = (double)(composites[i + 1] - composites[i]);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Head-to-head derivative profile */
    /* ──────────────────────────────────────────── */
    int max_order = 12;
    double p_ratios[15], p_ent[15];
    double c_ratios[15], c_ent[15];
    compute_profile(pgaps, npg, p_ratios, p_ent, max_order);
    compute_profile(cgaps, ncg, c_ratios, c_ent, max_order);

    rh_table_header("TABLE 1: AMPLITUDE RATIO — PRIMES vs COMPOSITES");
    printf("  Order │ P ratio  │ C ratio  │ P+C      │ |P-C|    │ Interpretation\n");
    printf("  ──────┼──────────┼──────────┼──────────┼──────────┼──────────────\n");

    for (int k = 1; k <= max_order; k++) {
        double sum = p_ratios[k] + c_ratios[k];
        double diff = fabs(p_ratios[k] - c_ratios[k]);
        printf("  d%d/d%d│ %8.4f │ %8.4f │ %8.4f │ %8.4f │ %s\n",
               k, k - 1, p_ratios[k], c_ratios[k], sum, diff,
               diff < 0.01 ? "SAME" :
               diff < 0.05 ? "similar" :
               diff < 0.2 ? "DIFFERENT" : "*** DIVERGENT");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Entropy profile comparison */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: ENTROPY — PRIMES vs COMPOSITES");
    printf("  Order │ P ent    │ C ent    │ P+C      │ |P-C|    │ Complement?\n");
    printf("  ──────┼──────────┼──────────┼──────────┼──────────┼────────────\n");

    for (int k = 0; k <= max_order; k++) {
        double sum = p_ent[k] + c_ent[k];
        double diff = fabs(p_ent[k] - c_ent[k]);
        printf("  d^%-4d│ %8.4f │ %8.4f │ %8.4f │ %8.4f │ %s\n",
               k, p_ent[k], c_ent[k], sum, diff,
               fabs(sum - 1.0) < 0.05 ? "sum≈1 ✓" :
               diff < 0.01 ? "identical" : "");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Multi-base ratios — primes vs composites */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: H''''/H''' BY MODULAR BASE — P vs C");
    printf("  Base │ P ratio  │ C ratio  │ P+C      │ P-C      │ Note\n");
    printf("  ─────┼──────────┼──────────┼──────────┼──────────┼─────\n");

    int bases[] = {2, 3, 5, 6, 7, 10, 11, 13, 30, 210};
    int nb = sizeof(bases) / sizeof(bases[0]);

    for (int bi = 0; bi < nb; bi++) {
        int b = bases[bi];
        /* prime gaps mod b */
        double *pg_mod = malloc(npg * sizeof(double));
        double *cg_mod = malloc(ncg * sizeof(double));
        for (int i = 0; i < npg; i++)
            pg_mod[i] = (double)(cmod(primes[i + 1], b) - cmod(primes[i], b)) / b;
        for (int i = 0; i < ncg; i++)
            cg_mod[i] = (double)(cmod(composites[i + 1], b) - cmod(composites[i], b)) / b;

        double pr = compute_ratio(pg_mod, npg);
        double cr = compute_ratio(cg_mod, ncg);

        printf("  %4d │ %8.4f │ %8.4f │ %8.4f │ %+7.4f │ %s\n",
               b, pr, cr, pr + cr, pr - cr,
               fabs(pr + cr - 2.0) < 0.1 ? "sum≈2 ✓" :
               fabs(pr - cr) < 0.01 ? "same" : "");

        free(pg_mod); free(cg_mod);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Multi-dimensional convergence for COMPOSITES */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: DIMENSIONAL CONVERGENCE — COMPOSITES");
    printf("Same analysis as exp12 but on composites.\n\n");

    /* build dimensions for composites */
    int mod_dims[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47};
    int n_mod = sizeof(mod_dims) / sizeof(mod_dims[0]);

    /* storage for dimension gap sequences */
    double **p_dims = malloc(n_mod * sizeof(double *));
    double **c_dims = malloc(n_mod * sizeof(double *));

    for (int di = 0; di < n_mod; di++) {
        int b = mod_dims[di];
        p_dims[di] = malloc(npg * sizeof(double));
        c_dims[di] = malloc(ncg * sizeof(double));
        for (int i = 0; i < npg; i++) {
            double v1 = (double)(primes[i] % b) / b;
            double v2 = (double)(primes[i + 1] % b) / b;
            p_dims[di][i] = v2 - v1;
        }
        for (int i = 0; i < ncg; i++) {
            double v1 = (double)(composites[i] % b) / b;
            double v2 = (double)(composites[i + 1] % b) / b;
            c_dims[di][i] = v2 - v1;
        }
    }

    printf("  D  │ P ratio  │ C ratio  │ P+C      │ |P-C|    │ Converging?\n");
    printf("  ───┼──────────┼──────────┼──────────┼──────────┼────────────\n");

    double prev_p = 0, prev_c = 0;
    for (int d = 1; d <= n_mod; d++) {
        /* Euclidean distance using first d dimensions */
        double *p_dist = malloc(npg * sizeof(double));
        double *c_dist = malloc(ncg * sizeof(double));

        for (int i = 0; i < npg; i++) {
            double sum = 0;
            for (int dd = 0; dd < d; dd++) {
                double v = p_dims[dd][i];
                sum += v * v;
            }
            p_dist[i] = sqrt(sum);
        }
        for (int i = 0; i < ncg; i++) {
            double sum = 0;
            for (int dd = 0; dd < d; dd++) {
                double v = c_dims[dd][i];
                sum += v * v;
            }
            c_dist[i] = sqrt(sum);
        }

        double pr = compute_ratio(p_dist, npg);
        double cr = compute_ratio(c_dist, ncg);
        double delta_p = pr - prev_p;
        double delta_c = cr - prev_c;

        printf("  %2d │ %8.4f │ %8.4f │ %8.4f │ %8.4f │ P:%s C:%s\n",
               d, pr, cr, pr + cr, fabs(pr - cr),
               d > 1 ? (delta_p < -0.002 ? "▽" : delta_p > 0.002 ? "▲" : "→") : "—",
               d > 1 ? (delta_c < -0.002 ? "▽" : delta_c > 0.002 ? "▲" : "→") : "—");

        prev_p = pr; prev_c = cr;
        free(p_dist); free(c_dist);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: The integers — primes + composites interleaved */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: THE INTEGERS — all numbers, no filter");
    printf("What does the scaffold see when looking at ALL integers?\n\n");

    /* integer gaps are trivially all 1, so use a different view:
     * for each integer n, compute its "prime distance" = distance to nearest prime */
    int sample = 100000;
    double *int_prime_dist = malloc(sample * sizeof(double));
    int pi = 0;
    for (int n = 2; n < sample + 2; n++) {
        while (pi < np - 1 && primes[pi + 1] <= n) pi++;
        int dist_prev = n - primes[pi];
        int dist_next = (pi + 1 < np) ? primes[pi + 1] - n : 1000;
        int_prime_dist[n - 2] = (double)(dist_prev < dist_next ? dist_prev : dist_next);
    }

    printf("  Integer 'prime distance' scaffold:\n\n");
    double int_ratios[15], int_ent[15];
    compute_profile(int_prime_dist, sample, int_ratios, int_ent, 10);

    printf("  Order │ Int ratio │ P ratio  │ C ratio  │ Int unique?\n");
    printf("  ──────┼───────────┼──────────┼──────────┼────────────\n");
    for (int k = 1; k <= 10; k++) {
        double unique = fabs(int_ratios[k] - p_ratios[k]) + fabs(int_ratios[k] - c_ratios[k]);
        printf("  d%d/d%d│  %8.4f │ %8.4f │ %8.4f │ %s\n",
               k, k - 1, int_ratios[k], p_ratios[k], c_ratios[k],
               unique < 0.02 ? "matches P" :
               fabs(int_ratios[k] - c_ratios[k]) < 0.02 ? "matches C" :
               "UNIQUE");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: The Ω(n) scaffold — factorisation complexity */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: FACTORISATION COMPLEXITY Ω(n) — the inverse view");
    printf("Primes have Ω=1 always. Composites have Ω≥2.\n");
    printf("The Ω sequence for ALL integers IS the prime indicator.\n\n");

    double *omega_seq = malloc(sample * sizeof(double));
    for (int n = 2; n < sample + 2; n++)
        omega_seq[n - 2] = (double)big_omega(n);

    /* separate into: Ω of primes, Ω of composites, Ω of all */
    double *omega_comp = malloc(nc * sizeof(double));
    for (int i = 0; i < nc && i < sample; i++)
        omega_comp[i] = (double)big_omega(composites[i]);
    int noc = nc < sample ? nc : sample;

    double all_ratios[15], all_ent[15];
    double comp_omega_ratios[15], comp_omega_ent[15];
    compute_profile(omega_seq, sample, all_ratios, all_ent, 10);
    compute_profile(omega_comp, noc, comp_omega_ratios, comp_omega_ent, 10);

    printf("  Order │ All Ω rat │ Comp Ω rat│ All Ω ent│ Comp Ω ent│ Note\n");
    printf("  ──────┼───────────┼───────────┼──────────┼───────────┼─────\n");
    for (int k = 1; k <= 10; k++) {
        printf("  d%d/d%d│  %8.4f │  %8.4f │  %7.4f │   %7.4f │ %s\n",
               k, k - 1,
               all_ratios[k], comp_omega_ratios[k],
               all_ent[k], comp_omega_ent[k],
               fabs(all_ratios[k] - comp_omega_ratios[k]) < 0.01 ? "same" : "DIFFER");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: THE COMPLEMENT TEST */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: THE COMPLEMENT — P + C = ?");
    printf("Key question: do prime and composite ratios sum to a constant?\n\n");

    printf("  From Table 1 (H''''/H''' amplitude ratios):\n\n");
    printf("    Prime ratio at d4/d3:     %.4f\n", p_ratios[4]);
    printf("    Composite ratio at d4/d3: %.4f\n", c_ratios[4]);
    printf("    Sum:                      %.4f\n", p_ratios[4] + c_ratios[4]);
    printf("    Product:                  %.4f\n\n", p_ratios[4] * c_ratios[4]);

    printf("  Across all derivative orders:\n\n");
    printf("  Order │ P+C sum  │ P×C prod │ 2-P-C   │ (P-1)(C-1)\n");
    printf("  ──────┼──────────┼──────────┼─────────┼───────────\n");
    for (int k = 2; k <= max_order; k++) {
        double sum = p_ratios[k] + c_ratios[k];
        double prod = p_ratios[k] * c_ratios[k];
        printf("  d%d/d%d│ %8.4f │ %8.4f │ %+7.4f │  %8.4f\n",
               k, k - 1, sum, prod, 2.0 - sum,
               (p_ratios[k] - 1.0) * (c_ratios[k] - 1.0));
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE INVERSE");
    printf("Primes and composites through the same scaffold.\n\n");
    printf("If their ratios are IDENTICAL: we've measured integers, not primes.\n");
    printf("If their ratios DIFFER: the difference is the prime signature.\n");
    printf("If their ratios SUM to a constant: they're perfect complements.\n");
    printf("If P+C ≈ 2.0: all structure accounted for. Nothing left over. RH holds.\n");
    printf("If P+C ≠ 2.0: residual exists. That residual is the discordant note.\n");

    for (int d = 0; d < n_mod; d++) { free(p_dims[d]); free(c_dims[d]); }
    free(p_dims); free(c_dims);
    free(sieve); free(primes); free(composites);
    free(pgaps); free(cgaps);
    free(int_prime_dist); free(omega_seq); free(omega_comp);
    return 0;
}
