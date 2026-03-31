/*
 * Experiment 08: Prime vs Composite Divergence
 *
 * The primes are figure. The composites are ground.
 * Study them TOGETHER. The divergence between their structures
 * reveals what neither can show alone.
 *
 * For every measurement on primes, do the same on composites.
 * Overlay the scaffolds. Where they mirror perfectly: known structure.
 * Where they diverge: the residual. The secret.
 *
 * The integers = primes ∪ composites ∪ {1}.
 * If prime structure + composite structure = integer structure exactly,
 * everything is accounted for. RH holds.
 *
 * If prime structure + composite structure ≠ integer structure,
 * the gap is information that belongs to neither — the discordant note.
 *
 * Think of it as: the zeta function encodes ALL integers through
 * the Euler product. But primes and composites experience it differently.
 * An off-line zero would create an asymmetry visible in the divergence.
 */

#include "rh_scaffold.h"

#define MAX_N 1000000
#define N_PRIMES 80000

/* ────────────────────────────────────────────────── */
/* Generate prime and composite sequences             */
/* ────────────────────────────────────────────────── */

static int generate_composites(const char *sieve, int max_val,
                                int *composites, int max_count) {
    int count = 0;
    for (int i = 4; i <= max_val && count < max_count; i++) {
        if (sieve[i]) composites[count++] = i;
    }
    return count;
}

/* number of prime factors (with multiplicity) — Ω(n) */
static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        while (n % p == 0) { count++; n /= p; }
    }
    if (n > 1) count++;
    return count;
}

/* smallest prime factor */
static int smallest_factor(int n) {
    if (n < 2) return 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) return p;
    }
    return n;  /* n is prime */
}

/* Möbius function μ(n) */
static int mobius(int n) {
    int factors = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) {
            n /= p;
            factors++;
            if (n % p == 0) return 0;  /* p² divides n */
        }
    }
    if (n > 1) factors++;
    return (factors % 2 == 0) ? 1 : -1;
}

int main(void) {
    printf("=== Experiment 08: Prime vs Composite Divergence ===\n\n");
    printf("Overlay prime and composite analysis.\n");
    printf("The divergence reveals what neither shows alone.\n\n");

    /* generate sieve, primes, composites */
    char *sieve = calloc(MAX_N + 1, 1);
    for (int i = 2; (long long)i * i <= MAX_N; i++)
        if (!sieve[i])
            for (int j = i * i; j <= MAX_N; j += i)
                sieve[j] = 1;

    int *primes = malloc(N_PRIMES * sizeof(int));
    int np = 0;
    for (int i = 2; i <= MAX_N && np < N_PRIMES; i++)
        if (!sieve[i]) primes[np++] = i;

    int *composites = malloc(MAX_N * sizeof(int));
    int nc = generate_composites(sieve, MAX_N, composites, MAX_N);

    printf("Range: [2, %d]\n", MAX_N);
    printf("Primes: %d    Composites: %d    Ratio: %.4f\n\n",
           np, nc, (double)np / (np + nc));

    /* compute gaps for both */
    int *pgaps = malloc(np * sizeof(int));
    int *cgaps = malloc(nc * sizeof(int));
    int npg = 0, ncg = 0;
    for (int i = 0; i < np - 1; i++) pgaps[npg++] = primes[i + 1] - primes[i];
    for (int i = 0; i < nc - 1; i++) cgaps[ncg++] = composites[i + 1] - composites[i];

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Gap entropy — primes vs composites */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: GAP STRUCTURE — PRIMES vs COMPOSITES");
    printf("  Derivative │ P ent(mod30) │ C ent(mod30) │ P-C gap  │ Divergence\n");
    printf("  ───────────┼──────────────┼──────────────┼──────────┼───────────\n");

    for (int k = 0; k <= 5; k++) {
        int *pd = malloc(npg * sizeof(int));
        int *cd = malloc(ncg * sizeof(int));
        int pdn = diff_k(pgaps, pd, npg, k);
        int cdn = diff_k(cgaps, cd, ncg, k);
        double pe = normalised_entropy(pd, pdn, 30);
        double ce = normalised_entropy(cd, cdn, 30);
        double div = fabs(pe - ce);
        printf("  d^%-9d│    %6.4f    │    %6.4f    │ %+7.4f  │ %s\n",
               k, pe, ce, pe - ce,
               div > 0.05 ? "*** DIVERGENT" :
               div > 0.01 ? "**  different" :
               div > 0.005 ? "*   slight" : "    matched");
        free(pd); free(cd);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Multi-base divergence */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: MULTI-BASE ENTROPY DIVERGENCE");
    printf("  Base │ P entropy │ C entropy │ Divergence │ Interpretation\n");
    printf("  ─────┼───────────┼───────────┼────────────┼──────────────\n");

    int bases[] = {2, 3, 4, 5, 6, 7, 8, 10, 12, 15, 24, 30};
    int nb = sizeof(bases) / sizeof(bases[0]);
    for (int bi = 0; bi < nb; bi++) {
        int b = bases[bi];
        double pe = normalised_entropy(primes, np, b);
        double ce = normalised_entropy(composites, nc, b);
        double div = pe - ce;
        printf("  %4d │   %6.4f  │   %6.4f  │  %+7.4f   │ %s\n",
               b, pe, ce, div,
               fabs(div) > 0.1 ? "STRONG divergence" :
               fabs(div) > 0.01 ? "moderate" :
               fabs(div) > 0.001 ? "weak" : "matched");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Gap-gap MI — primes vs composites */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: GAP-GAP MEMORY — P vs C");
    printf("  Lag │ P MI(mod30) │ C MI(mod30) │ P-C       │ Who remembers more?\n");
    printf("  ────┼────────────┼─────────────┼───────────┼────────────────────\n");

    for (int lag = 1; lag <= 15; lag++) {
        double pmi = mutual_info_pair(pgaps, pgaps + lag, npg - lag, 30, 30);
        double cmi = mutual_info_pair(cgaps, cgaps + lag, ncg - lag, 30, 30);
        printf("  %3d │  %8.5f  │   %8.5f  │ %+8.5f │ %s\n",
               lag, pmi, cmi, pmi - cmi,
               pmi > cmi + 0.001 ? "PRIMES" :
               cmi > pmi + 0.001 ? "COMPOSITES" : "equal");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Interleaving — primes among composites */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: INTERLEAVING PATTERN");
    printf("For each prime, count composites before it since last prime.\n");
    printf("This is the 'rhythm' of primes within the integers.\n\n");

    int *interleave = malloc(np * sizeof(int));
    for (int i = 1; i < np; i++)
        interleave[i - 1] = primes[i] - primes[i - 1] - 1;  /* composites between consecutive primes */
    int ni = np - 1;

    printf("  Derivative │ Entropy(30) │ Norm  │ Trend\n");
    printf("  ───────────┼─────────────┼───────┼──────\n");
    double prev_ent = 0;
    for (int k = 0; k <= 5; k++) {
        int *dk = malloc(ni * sizeof(int));
        int dkn = diff_k(interleave, dk, ni, k);
        double ent = normalised_entropy(dk, dkn, 30);
        const char *trend = (k == 0) ? "—" :
                           (ent > prev_ent + 0.01) ? "↑ dissolving" :
                           (ent < prev_ent - 0.01) ? "↓ STRUCTURE" : "→ stable";
        printf("  d^%-9d│   %7.4f   │ %5.3f │ %s\n", k, ent * log2(30.0), ent, trend);
        prev_ent = ent;
        free(dk);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Ω(n) distribution — complexity of composites */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: COMPOSITE COMPLEXITY Ω(n)");
    printf("Number of prime factors (with multiplicity).\n");
    printf("Primes always have Ω=1. Composites vary.\n\n");

    int omega_hist[20] = {0};
    int sample = nc < 50000 ? nc : 50000;
    for (int i = 0; i < sample; i++) {
        int w = big_omega(composites[i]);
        if (w < 20) omega_hist[w]++;
    }
    printf("  Ω │ Count  │ Fraction │ Bar\n");
    printf("  ──┼────────┼──────────┼────────────────────────────────\n");
    for (int w = 2; w < 12; w++) {
        double frac = (double)omega_hist[w] / sample;
        printf("  %d │ %6d │  %5.3f   │ ", w, omega_hist[w], frac);
        int bar = (int)(frac * 80);
        for (int i = 0; i < bar; i++) printf("█");
        printf("\n");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Möbius function — the sign of the divergence */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: MÖBIUS FUNCTION & MERTENS SUM");
    printf("M(x) = Σ_{n≤x} μ(n). RH ⟺ M(x) = O(x^(1/2+ε)) for all ε>0.\n");
    printf("This IS the Riemann Hypothesis stated purely in integers.\n\n");

    /* compute Mertens function at checkpoints */
    int checkpoints[] = {100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 1000000};
    int ncp = sizeof(checkpoints) / sizeof(checkpoints[0]);

    printf("  x        │ M(x)    │ sqrt(x) │ M(x)/sqrt(x) │ |ratio| < 1?\n");
    printf("  ─────────┼─────────┼─────────┼──────────────┼─────────────\n");

    int mertens = 0;
    int ci = 0;
    double *mertens_seq = malloc(MAX_N * sizeof(double));
    int mertens_n = 0;
    int sample_stride = MAX_N / 50000;
    if (sample_stride < 1) sample_stride = 1;

    for (int n = 1; n <= MAX_N && ci < ncp; n++) {
        mertens += mobius(n);
        if (n % sample_stride == 0) {
            mertens_seq[mertens_n++] = (double)mertens;
        }
        if (n == checkpoints[ci]) {
            double sqrtx = sqrt((double)n);
            double ratio = (double)mertens / sqrtx;
            printf("  %9d │ %+7d │ %7.1f │   %+9.5f   │ %s\n",
                   n, mertens, sqrtx, ratio,
                   fabs(ratio) < 1.0 ? "YES ✓" : "NO ✗");
            ci++;
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: Mertens derivative scaffold */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: MERTENS FUNCTION — H-SCAFFOLD");
    printf("Apply derivative hierarchy to M(x).\n");
    printf("M(x) encodes the prime-composite balance directly.\n\n");

    printf("  Order │ Entropy(64) │ Norm  │ Trend\n");
    printf("  ──────┼─────────────┼───────┼──────\n");
    prev_ent = 0;
    for (int k = 0; k <= 5; k++) {
        double *dk = malloc(mertens_n * sizeof(double));
        int dkn = diff_k_d(mertens_seq, dk, mertens_n, k);
        double ent = shannon_entropy_d(dk, dkn, 64) / log2(64.0);
        const char *trend = (k == 0) ? "—" :
                           (ent > prev_ent + 0.01) ? "↑ dissolving" :
                           (ent < prev_ent - 0.01) ? "↓ STRUCTURE" : "→ stable";
        printf("  d^%-4d│   %7.4f   │ %5.3f │ %s\n", k, ent * log2(64.0), ent, trend);
        prev_ent = ent;
        free(dk);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 8: Oscillation comparison — gaps vs Mertens */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 8: OSCILLATION FINGERPRINT — GAPS vs MERTENS");
    printf("Compare DFT peaks: do they share frequencies?\n");
    printf("Shared = known structure. Unique = divergence signal.\n\n");

    int max_freq = 100;
    /* gaps DFT */
    double *gap_d = malloc(npg * sizeof(double));
    double gap_mean = 0;
    for (int i = 0; i < npg; i++) gap_mean += pgaps[i];
    gap_mean /= npg;
    for (int i = 0; i < npg; i++) gap_d[i] = pgaps[i] - gap_mean;

    int dft_n = npg < 20000 ? npg : 20000;
    double *gap_mags = malloc(max_freq * sizeof(double));
    for (int f = 1; f <= max_freq; f++) {
        double re = 0, im = 0;
        double omega = 2.0 * M_PI * f / dft_n;
        for (int i = 0; i < dft_n; i++) {
            re += gap_d[i] * cos(omega * i);
            im += gap_d[i] * sin(omega * i);
        }
        gap_mags[f - 1] = sqrt(re * re + im * im) / dft_n;
    }

    /* Mertens DFT */
    int mft_n = mertens_n < 20000 ? mertens_n : 20000;
    double *mert_d = malloc(mft_n * sizeof(double));
    double mert_mean = 0;
    for (int i = 0; i < mft_n; i++) mert_mean += mertens_seq[i];
    mert_mean /= mft_n;
    for (int i = 0; i < mft_n; i++) mert_d[i] = mertens_seq[i] - mert_mean;

    double *mert_mags = malloc(max_freq * sizeof(double));
    for (int f = 1; f <= max_freq; f++) {
        double re = 0, im = 0;
        double omega = 2.0 * M_PI * f / mft_n;
        for (int i = 0; i < mft_n; i++) {
            re += mert_d[i] * cos(omega * i);
            im += mert_d[i] * sin(omega * i);
        }
        mert_mags[f - 1] = sqrt(re * re + im * im) / mft_n;
    }

    printf("  Freq │ Gap mag  │ Mertens mag │ Ratio    │ Correlation\n");
    printf("  ─────┼──────────┼─────────────┼──────────┼────────────\n");

    double total_gap_e = 0, total_mert_e = 0, total_cross = 0;
    for (int f = 0; f < max_freq; f++) {
        total_gap_e += gap_mags[f] * gap_mags[f];
        total_mert_e += mert_mags[f] * mert_mags[f];
        total_cross += gap_mags[f] * mert_mags[f];
    }

    /* show top 15 by divergence (ratio far from median) */
    double *diverge = malloc(max_freq * sizeof(double));
    double median_ratio = 0;
    int valid = 0;
    for (int f = 0; f < max_freq; f++) {
        if (mert_mags[f] > 1e-10) {
            diverge[f] = gap_mags[f] / mert_mags[f];
            median_ratio += diverge[f];
            valid++;
        } else {
            diverge[f] = 0;
        }
    }
    median_ratio /= valid > 0 ? valid : 1;

    /* sort by distance from median ratio */
    int sorted[100];
    for (int i = 0; i < max_freq; i++) sorted[i] = i;
    for (int i = 0; i < max_freq - 1; i++) {
        for (int j = i + 1; j < max_freq; j++) {
            if (fabs(diverge[sorted[j]] - median_ratio) > fabs(diverge[sorted[i]] - median_ratio)) {
                int tmp = sorted[i]; sorted[i] = sorted[j]; sorted[j] = tmp;
            }
        }
    }

    for (int i = 0; i < 15; i++) {
        int f = sorted[i];
        printf("  %4d │ %8.5f │   %8.5f  │ %8.3f │ %s\n",
               f + 1, gap_mags[f], mert_mags[f],
               mert_mags[f] > 1e-10 ? gap_mags[f] / mert_mags[f] : 0.0,
               fabs(diverge[f] - median_ratio) > median_ratio ? "*** ANOMALOUS" :
               fabs(diverge[f] - median_ratio) > median_ratio * 0.5 ? "**  unusual" : "    normal");
    }

    /* spectral correlation */
    double spectral_corr = total_cross / (sqrt(total_gap_e) * sqrt(total_mert_e));
    printf("\n  Spectral correlation (gap ↔ Mertens): %.6f\n", spectral_corr);
    printf("  1.0 = identical oscillations, 0.0 = independent\n");

    /* ──────────────────────────────────────────── */
    /* TABLE 9: Cross-MI between prime gaps and composite gaps */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 9: CROSS-STRUCTURE — prime gaps vs composite gaps");
    printf("Do prime gaps and composite gaps share information?\n\n");

    /* align sequences: for each prime p[i], find nearest composite gap */
    /* simpler: compare gap distributions head-to-head */
    int common = npg < ncg ? npg : ncg;
    if (common > 50000) common = 50000;

    printf("  Base │ MI(Pgap, Cgap) │ P self-MI(lag1) │ C self-MI(lag1) │ Cross ratio\n");
    printf("  ─────┼────────────────┼─────────────────┼─────────────────┼────────────\n");

    int mi_bases[] = {6, 10, 12, 30};
    int nmib = sizeof(mi_bases) / sizeof(mi_bases[0]);
    for (int bi = 0; bi < nmib; bi++) {
        int b = mi_bases[bi];
        double cross = mutual_info_pair(pgaps, cgaps, common, b, b);
        double p_self = mutual_info_pair(pgaps, pgaps + 1, npg - 1, b, b);
        double c_self = mutual_info_pair(cgaps, cgaps + 1, ncg - 1, b, b);
        double max_self = p_self > c_self ? p_self : c_self;
        printf("  %4d │     %8.5f   │      %8.5f   │      %8.5f   │    %5.3f\n",
               b, cross, p_self, c_self,
               max_self > 1e-10 ? cross / max_self : 0.0);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 10: The divergence map */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 10: DIVERGENCE MAP — where primes and composites disagree");
    printf("For each base b: |P_entropy - C_entropy| across derivative orders.\n");
    printf("High divergence at high derivative = deep structural difference.\n\n");

    printf("  Base ");
    for (int k = 0; k <= 5; k++) printf("│ d^%-5d", k);
    printf("│ Total\n");
    printf("  ─────");
    for (int k = 0; k <= 5; k++) printf("┼────────");
    printf("┼──────\n");

    int map_bases[] = {2, 3, 5, 6, 7, 10, 30};
    int nmb = sizeof(map_bases) / sizeof(map_bases[0]);
    for (int bi = 0; bi < nmb; bi++) {
        int b = map_bases[bi];
        printf("  %4d ", b);
        double total_div = 0;
        for (int k = 0; k <= 5; k++) {
            int *pd = malloc(npg * sizeof(int));
            int *cd = malloc(ncg * sizeof(int));
            int pdn = diff_k(pgaps, pd, npg, k);
            int cdn = diff_k(cgaps, cd, ncg, k);
            double pe = normalised_entropy(pd, pdn, b);
            double ce = normalised_entropy(cd, cdn, b);
            double div = fabs(pe - ce);
            total_div += div;
            printf("│ %6.4f", div);
            free(pd); free(cd);
        }
        printf("│ %5.3f\n", total_div);
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: THE DIVERGENCE");
    printf("Primes and composites are two views of the same integers.\n");
    printf("Their structures are complementary but NOT identical.\n\n");
    printf("KEY FINDINGS:\n");
    printf("1. Gap divergence: where prime gaps have different entropy from\n");
    printf("   composite gaps at each derivative level\n");
    printf("2. Mertens function M(x) = Σμ(n) encodes the balance directly.\n");
    printf("   RH ⟺ M(x)/sqrt(x) stays bounded.\n");
    printf("3. Oscillation fingerprint: frequencies shared between gap DFT\n");
    printf("   and Mertens DFT are KNOWN structure. Unshared frequencies\n");
    printf("   are the divergence — candidates for the discordant note.\n");
    printf("4. Cross-MI between prime gaps and composite gaps measures\n");
    printf("   how much they know about each other.\n");
    printf("5. The DIVERGENCE MAP (Table 10) shows at which base and\n");
    printf("   derivative order the two views disagree most.\n");
    printf("   That's where to look for the signal.\n");

    free(sieve); free(primes); free(composites);
    free(pgaps); free(cgaps); free(interleave);
    free(mertens_seq); free(gap_d); free(gap_mags);
    free(mert_d); free(mert_mags); free(diverge);
    return 0;
}
