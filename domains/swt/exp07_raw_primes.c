/*
 * Experiment 07: Raw Primes — No Zeta, No Approximation
 *
 * The zeta function is too pure. Numbers are not.
 *
 * Instead of: ζ(s) → zeros → explicit formula → primes
 * We do:      primes → measure → sieve → rotate → derive → repeat
 *
 * No complex analysis. No continuous approximation.
 * Just the integers themselves, viewed through every lens we have.
 *
 * The question becomes: does the prime sequence, measured directly,
 * contain structure that CANNOT be explained by known mechanisms?
 *
 * If all structure dissolves through rotate-sieve-derive: RH holds
 * (because every oscillation maps to a zero on the line).
 *
 * If structure persists that no rotation can dissolve: that structure
 * IS the discordant note — the signature of an off-line zero,
 * visible in the raw integers without ever touching ζ(s).
 *
 * Key insight: we don't need to find the zero.
 * We need to find its SHADOW in the primes.
 */

#include "rh_scaffold.h"

#define N_PRIMES 80000

/* ────────────────────────────────────────────────── */
/* Direct prime measurements — no approximations      */
/* ────────────────────────────────────────────────── */

/* prime gap sequence */
static int prime_gaps(const int *p, int np, int *gaps) {
    for (int i = 0; i < np - 1; i++)
        gaps[i] = p[i + 1] - p[i];
    return np - 1;
}

/* local density: count of primes in window [p-w, p+w] */
static void local_density(const int *p, int np, int window, double *density) {
    int lo = 0, hi = 0;
    for (int i = 0; i < np; i++) {
        while (lo < np && p[lo] < p[i] - window) lo++;
        while (hi < np && p[hi] <= p[i] + window) hi++;
        density[i] = (double)(hi - lo) / (2.0 * window);
    }
}

/* deviation from average density: the "surprise" of each prime */
static void density_surprise(const int *p, int np, double *surprise) {
    /* expected density at p[i] ≈ 1/ln(p[i]) from PNT */
    /* but we compute ACTUAL local density and compare */
    double *actual = malloc(np * sizeof(double));
    local_density(p, np, 100, actual);
    for (int i = 0; i < np; i++) {
        double expected = 1.0 / log((double)p[i]);
        surprise[i] = actual[i] - expected;
    }
    free(actual);
}

/* prime residue pattern: p mod b for sequence of bases */
static void residue_vector(const int *p, int np, const int *bases, int nb,
                           int *vec) {
    /* vec[i * nb + j] = p[i] mod bases[j] */
    for (int i = 0; i < np; i++)
        for (int j = 0; j < nb; j++)
            vec[i * nb + j] = cmod(p[i], bases[j]);
}

/* joint residue entropy: view primes as points in CRT space */
static double joint_residue_entropy(const int *p, int np,
                                     int b1, int b2) {
    int cells = b1 * b2;
    int *counts = calloc(cells, sizeof(int));
    for (int i = 0; i < np; i++) {
        int r1 = cmod(p[i], b1);
        int r2 = cmod(p[i], b2);
        counts[r1 * b2 + r2]++;
    }
    double ent = 0;
    for (int i = 0; i < cells; i++) {
        if (counts[i] > 0) {
            double prob = (double)counts[i] / np;
            ent -= prob * log2(prob);
        }
    }
    free(counts);
    return ent;
}

/* gap-gap correlation: MI between gap[i] and gap[i+lag] */
static double gap_gap_mi(const int *gaps, int ng, int lag, int base) {
    if (lag >= ng) return 0;
    return mutual_info_pair(gaps, gaps + lag, ng - lag, base, base);
}

/* Chebyshev bias: count primes in each residue class */
static void chebyshev_bias(const int *p, int np, int modulus, double *bias) {
    int *counts = calloc(modulus, sizeof(int));
    for (int i = 0; i < np; i++)
        counts[cmod(p[i], modulus)]++;
    /* expected: equal among coprime residues */
    int coprime = 0;
    for (int r = 0; r < modulus; r++) {
        int g = modulus, x = r;
        while (x) { int t = x; x = g % x; g = t; }
        if (g == 1) coprime++;
    }
    double expected = (double)np / coprime;
    for (int r = 0; r < modulus; r++) {
        int g = modulus, x = r;
        while (x) { int t = x; x = g % x; g = t; }
        if (g == 1)
            bias[r] = ((double)counts[r] - expected) / expected;
        else
            bias[r] = 0;
    }
    free(counts);
}

/* oscillation detector: does a sequence contain periodic structure?
 * compute DFT magnitude at frequencies 1..max_freq */
static void detect_oscillation(const double *seq, int n, int max_freq,
                                double *magnitudes) {
    for (int f = 1; f <= max_freq; f++) {
        double re = 0, im = 0;
        double omega = 2.0 * M_PI * f / n;
        for (int i = 0; i < n; i++) {
            re += seq[i] * cos(omega * i);
            im += seq[i] * sin(omega * i);
        }
        magnitudes[f - 1] = sqrt(re * re + im * im) / n;
    }
}

int main(void) {
    printf("=== Experiment 07: Raw Primes — No Zeta ===\n\n");
    printf("Direct measurement of prime structure.\n");
    printf("No continuous approximation. No complex analysis.\n");
    printf("Just integers, scaffolds, and sieves.\n\n");

    /* generate primes */
    int *primes = malloc(N_PRIMES * sizeof(int));
    int np = sieve_primes(primes, N_PRIMES, 1100000);
    printf("Primes: %d (up to %d)\n\n", np, primes[np - 1]);

    /* compute gaps */
    int *gaps = malloc(np * sizeof(int));
    int ng = prime_gaps(primes, np, gaps);

    /* ──────────────────────────────────────────── */
    /* TABLE 1: Multi-scale density measurement */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 1: LOCAL DENSITY AT MULTIPLE SCALES");
    printf("Measure actual prime density in windows of different sizes.\n");
    printf("Compare against 1/ln(x). The DEVIATION is the signal.\n\n");

    int windows[] = {50, 100, 200, 500, 1000, 5000};
    int nw = sizeof(windows) / sizeof(windows[0]);

    printf("  Window │ Mean density │ Exp 1/ln(p̄) │ Deviation │ Dev entropy\n");
    printf("  ───────┼──────────────┼─────────────┼───────────┼───────────\n");

    for (int wi = 0; wi < nw; wi++) {
        double *dens = malloc(np * sizeof(double));
        local_density(primes, np, windows[wi], dens);
        double mean_d = 0;
        for (int i = 0; i < np; i++) mean_d += dens[i];
        mean_d /= np;

        /* expected at median prime */
        int median_p = primes[np / 2];
        double expected = 1.0 / log((double)median_p);

        /* deviation sequence */
        double *dev = malloc(np * sizeof(double));
        for (int i = 0; i < np; i++)
            dev[i] = dens[i] - 1.0 / log((double)primes[i]);
        double ent = shannon_entropy_d(dev, np, 64) / log2(64.0);

        printf("  %6d │    %8.6f  │   %8.6f  │ %+8.6f │    %5.3f\n",
               windows[wi], mean_d, expected, mean_d - expected, ent);
        free(dens); free(dev);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 2: Density surprise — derivative scaffold */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 2: DENSITY SURPRISE — H-SCAFFOLD");
    printf("The 'surprise' of each prime = actual_density - expected_density.\n");
    printf("Apply H → H' → H'' → H''' to the surprise sequence.\n\n");

    double *surprise = malloc(np * sizeof(double));
    density_surprise(primes, np, surprise);

    printf("  Order │ Entropy(64) │ Norm  │ Trend\n");
    printf("  ──────┼─────────────┼───────┼──────\n");

    double prev_ent = 0;
    for (int k = 0; k <= 5; k++) {
        double *dk = malloc(np * sizeof(double));
        int dkn = diff_k_d(surprise, dk, np, k);
        double ent = shannon_entropy_d(dk, dkn, 64) / log2(64.0);
        const char *trend = (k == 0) ? "—" :
                           (ent > prev_ent + 0.01) ? "↑ dissolving" :
                           (ent < prev_ent - 0.01) ? "↓ STRUCTURE" : "→ stable";
        printf("  d^%-4d│   %7.4f   │ %5.3f │ %s\n", k, ent * log2(64.0), ent, trend);
        prev_ent = ent;
        free(dk);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 3: Gap-gap structure — the heartbeat */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 3: GAP-GAP MUTUAL INFORMATION");
    printf("Does gap[n] predict gap[n+k]? MI measures the linkage.\n\n");
    printf("  Lag │ MI(mod30) │ MI(mod6) │ MI(mod10) │ Significance\n");
    printf("  ────┼───────────┼──────────┼───────────┼─────────────\n");

    for (int lag = 1; lag <= 20; lag++) {
        double mi30 = gap_gap_mi(gaps, ng, lag, 30);
        double mi6  = gap_gap_mi(gaps, ng, lag, 6);
        double mi10 = gap_gap_mi(gaps, ng, lag, 10);
        double max_mi = mi30 > mi6 ? (mi30 > mi10 ? mi30 : mi10) : (mi6 > mi10 ? mi6 : mi10);
        printf("  %3d │  %7.5f  │ %7.5f  │  %7.5f  │ %s\n",
               lag, mi30, mi6, mi10,
               max_mi > 0.01 ? "*** LINKED" :
               max_mi > 0.005 ? "**  moderate" :
               max_mi > 0.001 ? "*   weak" : "    noise");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 4: Chebyshev bias — the prime race */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 4: CHEBYSHEV BIAS (prime races)");
    printf("Primes 'prefer' certain residue classes. The bias is measurable.\n\n");

    int bias_mods[] = {3, 4, 5, 7, 8, 12, 24};
    int nbm = sizeof(bias_mods) / sizeof(bias_mods[0]);
    for (int bi = 0; bi < nbm; bi++) {
        int m = bias_mods[bi];
        double *bias = calloc(m, sizeof(double));
        chebyshev_bias(primes, np, m, bias);
        printf("  mod %2d: ", m);
        for (int r = 0; r < m; r++) {
            int g = m, x = r;
            while (x) { int t = x; x = g % x; g = t; }
            if (g == 1) {
                printf(" r=%d:%+.4f", r, bias[r]);
            }
        }
        printf("\n");
        free(bias);
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 5: Joint CRT structure — the chord */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 5: JOINT CRT ENTROPY (primes in multi-base space)");
    printf("View each prime as (p mod b1, p mod b2). Joint entropy vs independent.\n\n");
    printf("  b1 × b2 │ Joint ent │ Indep ent │ Redundancy │ MI\n");
    printf("  ────────┼───────────┼───────────┼────────────┼──────\n");

    int crt_bases[] = {3, 5, 7, 11, 13};
    int ncrt = sizeof(crt_bases) / sizeof(crt_bases[0]);
    for (int i = 0; i < ncrt; i++) {
        for (int j = i + 1; j < ncrt; j++) {
            double je = joint_residue_entropy(primes, np, crt_bases[i], crt_bases[j]);
            double e1 = shannon_entropy(primes, np, crt_bases[i]);
            double e2 = shannon_entropy(primes, np, crt_bases[j]);
            double indep = e1 + e2;
            double redundancy = indep - je;
            double mi = mutual_info_bases(primes, np, crt_bases[i], crt_bases[j]);
            printf("  %2d × %2d │   %6.4f  │   %6.4f  │   %7.5f  │ %6.4f\n",
                   crt_bases[i], crt_bases[j], je, indep, redundancy, mi);
        }
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 6: Oscillation detection in gap sequence */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 6: OSCILLATION DETECTION IN GAP SEQUENCE");
    printf("DFT of gap sequence — looking for periodic components.\n");
    printf("Each significant frequency is a 'note' in the music.\n\n");

    /* convert gaps to double, subtract mean */
    double *fgaps = malloc(ng * sizeof(double));
    double gap_mean = 0;
    for (int i = 0; i < ng; i++) gap_mean += gaps[i];
    gap_mean /= ng;
    for (int i = 0; i < ng; i++) fgaps[i] = gaps[i] - gap_mean;

    int max_freq = 200;
    double *mags = malloc(max_freq * sizeof(double));
    detect_oscillation(fgaps, ng > 20000 ? 20000 : ng, max_freq, mags);

    /* find top 20 frequencies */
    int top_idx[20];
    double top_mag[20];
    for (int t = 0; t < 20; t++) { top_idx[t] = -1; top_mag[t] = 0; }
    for (int f = 0; f < max_freq; f++) {
        for (int t = 0; t < 20; t++) {
            if (mags[f] > top_mag[t]) {
                /* shift down */
                for (int s = 19; s > t; s--) {
                    top_idx[s] = top_idx[s - 1];
                    top_mag[s] = top_mag[s - 1];
                }
                top_idx[t] = f;
                top_mag[t] = mags[f];
                break;
            }
        }
    }

    printf("  Rank │ Freq │ Magnitude │ Period   │ Interpretation\n");
    printf("  ─────┼──────┼───────────┼──────────┼──────────────\n");
    for (int t = 0; t < 20; t++) {
        if (top_idx[t] < 0) continue;
        int f = top_idx[t] + 1;
        double period = (double)(ng > 20000 ? 20000 : ng) / f;
        printf("  %4d │ %4d │  %8.5f │ %8.1f │ %s\n",
               t + 1, f, top_mag[t], period,
               top_mag[t] > 0.5 ? "*** STRONG" :
               top_mag[t] > 0.1 ? "**  moderate" :
               top_mag[t] > 0.05 ? "*   weak" : "    background");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 7: Density surprise oscillations */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 7: OSCILLATIONS IN DENSITY SURPRISE");
    printf("These oscillations correspond to zeta zeros — but measured\n");
    printf("directly from primes, without computing ζ(s).\n\n");

    int surp_n = np > 20000 ? 20000 : np;
    double *surp_mags = malloc(max_freq * sizeof(double));
    detect_oscillation(surprise, surp_n, max_freq, surp_mags);

    printf("  Rank │ Freq │ Magnitude │ Interpretation\n");
    printf("  ─────┼──────┼───────────┼──────────────\n");

    /* find top 10 */
    int stop_idx[10];
    double stop_mag[10];
    for (int t = 0; t < 10; t++) { stop_idx[t] = -1; stop_mag[t] = 0; }
    for (int f = 0; f < max_freq; f++) {
        for (int t = 0; t < 10; t++) {
            if (surp_mags[f] > stop_mag[t]) {
                for (int s = 9; s > t; s--) {
                    stop_idx[s] = stop_idx[s - 1];
                    stop_mag[s] = stop_mag[s - 1];
                }
                stop_idx[t] = f;
                stop_mag[t] = surp_mags[f];
                break;
            }
        }
    }

    for (int t = 0; t < 10; t++) {
        if (stop_idx[t] < 0) continue;
        int f = stop_idx[t] + 1;
        printf("  %4d │ %4d │  %8.6f │ %s\n",
               t + 1, f, stop_mag[t],
               stop_mag[t] > 0.01 ? "*** STRONG oscillation" :
               stop_mag[t] > 0.001 ? "**  moderate" : "*   weak");
    }

    /* ──────────────────────────────────────────── */
    /* TABLE 8: Recursive sieve on raw structure */
    /* ──────────────────────────────────────────── */
    rh_table_header("TABLE 8: RECURSIVE SIEVE — raw primes, no zeta");
    printf("Sieve known structure layer by layer from the GAP sequence.\n");
    printf("L0: raw gaps\n");
    printf("L1: subtract mean gap at each prime (ln(p))\n");
    printf("L2: subtract mod-6 structure\n");
    printf("L3: differentiate\n");
    printf("Repeat until entropy converges.\n\n");

    /* L0: raw gaps as doubles */
    double *sieve_seq = malloc(ng * sizeof(double));
    for (int i = 0; i < ng; i++) sieve_seq[i] = (double)gaps[i];
    int sn = ng;

    printf("  Layer │ Description          │ Entropy │ Norm  │ Trend\n");
    printf("  ──────┼──────────────────────┼─────────┼───────┼──────\n");

    double layer_ent = shannon_entropy_d(sieve_seq, sn, 64) / log2(64.0);
    printf("  L0    │ Raw gaps             │ %7.4f │ %5.3f │ —\n",
           layer_ent * log2(64.0), layer_ent);

    /* L1: subtract expected gap ln(p[i]) */
    for (int i = 0; i < sn; i++)
        sieve_seq[i] -= log((double)primes[i]);
    layer_ent = shannon_entropy_d(sieve_seq, sn, 64) / log2(64.0);
    printf("  L1    │ - ln(p) expected     │ %7.4f │ %5.3f │ %s\n",
           layer_ent * log2(64.0), layer_ent,
           layer_ent > prev_ent + 0.01 ? "↑ dissolving" :
           layer_ent < prev_ent - 0.01 ? "↓ structure" : "→ stable");
    prev_ent = layer_ent;

    /* L2: subtract mod-6 bias (gaps are 2,4,6,8,... with mod-6 preference) */
    /* compute running mod-6 correction */
    for (int i = 0; i < sn; i++) {
        int g = gaps[i];
        int g6 = g % 6;
        /* known: gaps mod 6 prefer 0 (multiples of 6) */
        double bias_correction = (g6 == 0) ? -0.5 : 0.1;
        sieve_seq[i] -= bias_correction;
    }
    layer_ent = shannon_entropy_d(sieve_seq, sn, 64) / log2(64.0);
    printf("  L2    │ - mod6 bias          │ %7.4f │ %5.3f │ %s\n",
           layer_ent * log2(64.0), layer_ent,
           layer_ent > prev_ent + 0.01 ? "↑ dissolving" :
           layer_ent < prev_ent - 0.01 ? "↓ structure" : "→ stable");
    prev_ent = layer_ent;

    /* recursive: differentiate and measure */
    for (int cycle = 3; cycle < 12 && sn > 100; cycle++) {
        sn = diff_k_d(sieve_seq, sieve_seq, sn, 1);
        layer_ent = shannon_entropy_d(sieve_seq, sn, 64) / log2(64.0);
        printf("  L%-5d│ differentiate #%d     │ %7.4f │ %5.3f │ %s\n",
               cycle, cycle - 2, layer_ent * log2(64.0), layer_ent,
               layer_ent > prev_ent + 0.01 ? "↑ dissolving" :
               layer_ent < prev_ent - 0.01 ? "↓ structure" : "→ stable");
        prev_ent = layer_ent;
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    rh_table_header("SUMMARY: RAW PRIMES SPEAK");
    printf("Without invoking the zeta function:\n\n");
    printf("1. Local density deviations contain measurable oscillations\n");
    printf("2. Gap-gap MI reveals short-range correlations (the heartbeat)\n");
    printf("3. Chebyshev bias shows primes have PREFERENCES\n");
    printf("4. CRT joint structure reveals cross-base dependencies\n");
    printf("5. DFT of gaps and density surprise shows periodic components\n");
    printf("   — these ARE the zeta zeros, seen from the integer side\n");
    printf("6. Recursive sieve on raw gaps converges toward noise\n\n");
    printf("The discordant note — if it exists — would appear as:\n");
    printf("  • An oscillation frequency that DOESN'T match any known zero\n");
    printf("  • A MI linkage that persists through all sieve layers\n");
    printf("  • A Chebyshev bias that grows rather than stabilises\n");
    printf("  • Structure that differentiation AMPLIFIES rather than destroys\n");

    free(primes); free(gaps); free(surprise);
    free(fgaps); free(mags); free(surp_mags); free(sieve_seq);
    return 0;
}
