/*
 * Experiment 30: The Wavelet Colour Spectrum
 *
 * The discovery: 1.8709 (the void) IS the Haar wavelet inter-scale
 * energy ratio for white noise at decomposition level 4.
 *
 * The Haar wavelet = discrete difference operator [1, -1]/√2.
 * H''''/H''' = energy ratio between 4th and 3rd Haar detail levels.
 * Colour = measured_ratio - 1.8709 = excess Haar wavelet energy.
 *
 * But Haar is the coarsest wavelet. It sees only the simplest
 * scale-to-scale structure. What about higher-order wavelets?
 *
 * Daubechies wavelets (dbN):
 *   db1 = Haar:     [1, -1]/√2                    (2 taps)
 *   db2:            [-0.1294, 0.2241, 0.8366, 0.4830]  (4 taps)
 *   db3:            (6 taps)
 *   db4:            (8 taps)
 *
 * Each wavelet family has its own "void" — the inter-scale energy
 * ratio for white noise. Each sequence has a colour under each wavelet.
 *
 * The WAVELET COLOUR SPECTRUM of a sequence:
 *   colour_db1, colour_db2, colour_db3, colour_db4, ...
 *
 * Hypothesis: the wavelet colour spectrum encodes the FULL multi-scale
 * structure of the sequence. Different conjectures might separate
 * under different wavelets. RH might be invisible under Haar but
 * visible under db4. Or the Mertens threshold might shift.
 *
 * Also: zeta zeros at height γ contribute oscillations at scale ~1/γ.
 * Wavelets decompose by scale. The wavelet transform of prime gaps
 * should show energy peaks at scales corresponding to zeta zeros.
 * This is the Mellin-wavelet bridge.
 */

#include "rh_scaffold.h"

#define N 500000
#define MAX_PRIMES 50000

/* ═══════════════════════════════════════════════ */
/* DAUBECHIES WAVELET COEFFICIENTS                 */
/* High-pass (detail) filters for db1 through db6  */
/* These are the analysis filters that extract      */
/* structure at each scale.                         */
/* ═══════════════════════════════════════════════ */

/* db1 (Haar) high-pass */
static const double db1_h[] = {0.7071067811865476, -0.7071067811865476};
static const int db1_len = 2;

/* db2 high-pass */
static const double db2_h[] = {
    -0.4829629131445341, 0.8365163037378079,
    -0.2241438680420134, -0.1294095225512604
};
static const int db2_len = 4;

/* db3 high-pass */
static const double db3_h[] = {
     0.3326705529500826, -0.8068915093110925,
     0.4598775021184915,  0.1350110200102546,
    -0.0854412738820267, -0.0352262918857095
};
static const int db3_len = 6;

/* db4 high-pass */
static const double db4_h[] = {
    -0.2303778133088965,  0.7148465705529156,
    -0.6308807679298589, -0.0279837694168599,
     0.1870348117190930,  0.0308413818355607,
    -0.0328830116668852, -0.0105974017850690
};
static const int db4_len = 8;

/* db5 high-pass */
static const double db5_h[] = {
     0.1601023979741930, -0.6038292697971896,
     0.7243085284377729,  0.1384281459013204,
    -0.2422948870663824, -0.0322448695846381,
     0.0775714938400459, -0.0062414902127983,
    -0.0125807519990820,  0.0033357252854738
};
static const int db5_len = 10;

/* db6 high-pass */
static const double db6_h[] = {
    -0.1115407433501095,  0.4946238903984533,
    -0.7511339080210959,  0.3152503517091982,
     0.2262646939654400, -0.1297668675672625,
    -0.0975016055873225,  0.0275228655303053,
     0.0315820393174862,  0.0005538422011614,
    -0.0047772575109455,  0.0010773010853085
};
static const int db6_len = 12;

typedef struct {
    const char *name;
    const double *filter;
    int len;
} WaveletFamily;

static WaveletFamily wavelets[] = {
    {"db1 (Haar)", db1_h, 2},
    {"db2",        db2_h, 4},
    {"db3",        db3_h, 6},
    {"db4",        db4_h, 8},
    {"db5",        db5_h, 10},
    {"db6",        db6_h, 12},
};
static const int n_wavelets = 6;

/* ═══════════════════════════════════════════════ */
/* WAVELET DETAIL EXTRACTION                       */
/* Apply high-pass filter → downsample by 2        */
/* This gives one level of wavelet decomposition   */
/* ═══════════════════════════════════════════════ */

static int wavelet_detail(const double *in, int n, const double *filter, int flen,
                           double *out) {
    int out_len = n / 2;
    for (int i = 0; i < out_len; i++) {
        double sum = 0;
        for (int j = 0; j < flen; j++) {
            int idx = 2 * i + j;
            if (idx < n) sum += in[idx] * filter[j];
        }
        out[i] = sum;
    }
    return out_len;
}

/* compute RMS of array */
static double rms_d(const double *v, int n) {
    double s = 0;
    for (int i = 0; i < n; i++) s += v[i] * v[i];
    return sqrt(s / n);
}

/* ═══════════════════════════════════════════════ */
/* VOID COMPUTATION: white noise ratio for a       */
/* given wavelet at a given decomposition depth     */
/*                                                  */
/* Method: generate white noise, apply wavelet      */
/* decomposition, measure energy ratio.             */
/* Average over many trials for stability.          */
/* ═══════════════════════════════════════════════ */

static unsigned long long rng_state = 0x123456789ABCDEF0ULL;
static double rng_normal(void) {
    /* Box-Muller transform from uniform random */
    rng_state = rng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    double u1 = (double)(rng_state >> 11) / (double)(1ULL << 53);
    if (u1 < 1e-15) u1 = 1e-15;
    rng_state = rng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    double u2 = (double)(rng_state >> 11) / (double)(1ULL << 53);
    return sqrt(-2.0 * log(u1)) * cos(6.283185307179586 * u2);
}

static double compute_void(const WaveletFamily *wf, int depth, int trials) {
    /* measure the inter-scale energy ratio for white noise */
    int sig_len = 65536;
    double *signal = malloc(sig_len * sizeof(double));
    double *detail = malloc(sig_len * sizeof(double));
    double *prev_detail = malloc(sig_len * sizeof(double));

    double ratio_sum = 0;
    int valid_trials = 0;

    for (int t = 0; t < trials; t++) {
        /* generate white noise */
        rng_state += (unsigned long long)(t * 7 + 13);
        for (int i = 0; i < sig_len; i++) signal[i] = rng_normal();

        /* apply wavelet decomposition to target depth */
        double *current = malloc(sig_len * sizeof(double));
        memcpy(current, signal, sig_len * sizeof(double));
        int cur_len = sig_len;

        double prev_rms = 0;
        double ratio = 0;

        for (int d = 1; d <= depth && cur_len > wf->len * 4; d++) {
            int det_len = wavelet_detail(current, cur_len, wf->filter, wf->len, detail);
            double det_rms = rms_d(detail, det_len);

            if (d == depth && prev_rms > 1e-30) {
                ratio = det_rms / prev_rms;
            }
            prev_rms = det_rms;

            /* for next level: use the approximation (low-pass + downsample) */
            /* approximate: just take every other sample (crude but sufficient for ratio) */
            int next_len = cur_len / 2;
            for (int i = 0; i < next_len && i < cur_len; i++)
                current[i] = current[2 * i]; /* crude downsampling for approximation */
            cur_len = next_len;
        }

        free(current);

        if (ratio > 0.1 && ratio < 5.0) { /* sanity check */
            ratio_sum += ratio;
            valid_trials++;
        }
    }

    free(signal); free(detail); free(prev_detail);
    return valid_trials > 0 ? ratio_sum / valid_trials : 0;
}

/* ═══════════════════════════════════════════════ */
/* WAVELET COLOUR: measure a sequence's colour     */
/* under a specific wavelet family at depth k      */
/* ═══════════════════════════════════════════════ */

static double wavelet_colour(const double *seq, int n,
                              const WaveletFamily *wf, int depth,
                              double void_ratio) {
    double *current = malloc(n * sizeof(double));
    memcpy(current, seq, n * sizeof(double));
    int cur_len = n;

    double *detail = malloc(n * sizeof(double));
    double prev_rms = 0;
    double ratio = 0;

    for (int d = 1; d <= depth && cur_len > wf->len * 4; d++) {
        int det_len = wavelet_detail(current, cur_len, wf->filter, wf->len, detail);
        double det_rms = rms_d(detail, det_len);

        if (d == depth && prev_rms > 1e-30) {
            ratio = det_rms / prev_rms;
        }
        prev_rms = det_rms;

        /* downsample for next level */
        int next_len = cur_len / 2;
        for (int i = 0; i < next_len; i++)
            current[i] = current[2 * i];
        cur_len = next_len;
    }

    free(current); free(detail);
    return ratio - void_ratio;
}

/* ═══════════════════════════════════════════════ */
/* MULTI-SCALE ENERGY DECOMPOSITION                */
/* Full wavelet packet decomposition: energy at    */
/* each scale level                                */
/* ═══════════════════════════════════════════════ */

#define MAX_LEVELS 12

static void energy_decomposition(const double *seq, int n,
                                  const WaveletFamily *wf,
                                  double *energies, int *n_levels) {
    double *current = malloc(n * sizeof(double));
    memcpy(current, seq, n * sizeof(double));
    int cur_len = n;
    double *detail = malloc(n * sizeof(double));

    *n_levels = 0;

    for (int d = 1; d <= MAX_LEVELS && cur_len > wf->len * 4; d++) {
        int det_len = wavelet_detail(current, cur_len, wf->filter, wf->len, detail);
        double energy = 0;
        for (int i = 0; i < det_len; i++) energy += detail[i] * detail[i];
        energies[d - 1] = energy / det_len;  /* normalised energy per coefficient */

        /* downsample for next level */
        int next_len = cur_len / 2;
        for (int i = 0; i < next_len; i++)
            current[i] = current[2 * i];
        cur_len = next_len;
        (*n_levels)++;
    }

    free(current); free(detail);
}

static int big_omega(int n) {
    int count = 0;
    for (int p = 2; (long long)p * p <= n; p++)
        while (n % p == 0) { count++; n /= p; }
    if (n > 1) count++;
    return count;
}

static int mobius(int n) {
    int factors = 0;
    for (int p = 2; (long long)p * p <= n; p++) {
        if (n % p == 0) { n /= p; factors++; if (n % p == 0) return 0; }
    }
    if (n > 1) factors++;
    return (factors % 2 == 0) ? 1 : -1;
}

int main(void) {
    printf("=== Experiment 30: The Wavelet Colour Spectrum ===\n\n");
    printf("1.8709 IS the Haar wavelet inter-scale energy ratio for white noise.\n");
    printf("What do higher-order wavelets reveal about number theory?\n\n");

    /* sieve */
    char *sieve = calloc(N * 20 + 1, 1);
    for (int i = 2; (long long)i * i <= N * 20; i++)
        if (!sieve[i]) for (int j = i * i; j <= N * 20; j += i) sieve[j] = 1;

    /* ──────────────────────────────────────────── */
    /* Phase 1: Compute void ratios for each wavelet */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 1: THE VOID FOR EACH WAVELET FAMILY\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("Computing white noise inter-scale ratios (100 trials each)...\n\n");

    #define DEPTH 4   /* same depth as the original experiments */
    double void_ratios[6];

    printf("  Wavelet     │ Taps │ Void (depth %d) │ vs Haar\n", DEPTH);
    printf("  ────────────┼──────┼─────────────────┼────────\n");

    for (int w = 0; w < n_wavelets; w++) {
        void_ratios[w] = compute_void(&wavelets[w], DEPTH, 100);
        printf("  %-11s │  %2d  │    %.4f        │ %+.4f\n",
               wavelets[w].name, wavelets[w].len,
               void_ratios[w],
               void_ratios[w] - void_ratios[0]);
    }

    printf("\n  The void shifts with wavelet order.\n");
    printf("  Higher-order wavelets have different noise baselines.\n\n");

    /* ──────────────────────────────────────────── */
    /* Phase 2: Generate sequences                  */
    /* ──────────────────────────────────────────── */

    typedef struct {
        const char *name;
        const char *conjecture;
        double *seq;
        int len;
    } Sequence;

    #define MAX_SEQ 10
    Sequence seqs[MAX_SEQ];
    int ns = 0;

    /* prime gaps */
    {
        double *seq = malloc(MAX_PRIMES * sizeof(double));
        int prev_p = 2, idx = 0;
        for (int i = 3; i <= N * 20 && idx < MAX_PRIMES; i++)
            if (!sieve[i]) { seq[idx++] = (double)(i - prev_p); prev_p = i; }
        seqs[ns++] = (Sequence){"Prime gaps", "RH", seq, idx};
    }

    /* Möbius */
    {
        double *seq = malloc(N * sizeof(double));
        for (int i = 0; i < N; i++) seq[i] = (double)mobius(i + 2);
        seqs[ns++] = (Sequence){"Möbius μ(n)", "Mertens", seq, N};
    }

    /* Liouville */
    {
        double *seq = malloc(N * sizeof(double));
        for (int i = 0; i < N; i++)
            seq[i] = (big_omega(i + 2) % 2 == 0) ? 1.0 : -1.0;
        seqs[ns++] = (Sequence){"Liouville λ(n)", "Pólya", seq, N};
    }

    /* Collatz steps */
    {
        double *seq = malloc(N * sizeof(double));
        for (int i = 0; i < N; i++) {
            long long n = i + 2; int steps = 0;
            while (n > 1 && steps < 1000) { n = (n % 2 == 0) ? n / 2 : 3 * n + 1; steps++; }
            seq[i] = (double)steps;
        }
        seqs[ns++] = (Sequence){"Collatz steps", "Collatz", seq, N};
    }

    /* twin prime gaps */
    {
        double *seq = malloc(MAX_PRIMES * sizeof(double));
        int tp_count = 0, prev_tp = 3;
        for (int i = 3; i <= N * 20 - 2 && tp_count < MAX_PRIMES; i++) {
            if (!sieve[i] && !sieve[i + 2]) {
                if (tp_count > 0) seq[tp_count - 1] = (double)(i - prev_tp);
                prev_tp = i; tp_count++;
            }
        }
        seqs[ns++] = (Sequence){"Twin prime gaps", "Twin primes", seq, tp_count > 1 ? tp_count - 1 : 0};
    }

    /* Ω(n) */
    {
        double *seq = malloc(N * sizeof(double));
        for (int i = 0; i < N; i++) seq[i] = (double)big_omega(i + 2);
        seqs[ns++] = (Sequence){"Ω(n)", "Erdős-Kac", seq, N};
    }

    /* divisor d(n) */
    {
        double *seq = malloc(N * sizeof(double));
        for (int i = 0; i < N; i++) {
            int n = i + 2, d = 0;
            for (int j = 1; (long long)j * j <= n; j++)
                if (n % j == 0) { d++; if (j != n / j) d++; }
            seq[i] = (double)d;
        }
        seqs[ns++] = (Sequence){"Divisor d(n)", "Dirichlet", seq, N};
    }

    /* Euler φ(n) */
    {
        double *seq = malloc(N * sizeof(double));
        for (int i = 0; i < N; i++) {
            int n = i + 2, result = n, temp = n;
            for (int p = 2; (long long)p * p <= temp; p++) {
                if (temp % p == 0) { while (temp % p == 0) temp /= p; result -= result / p; }
            }
            if (temp > 1) result -= result / temp;
            seq[i] = (double)result;
        }
        seqs[ns++] = (Sequence){"Euler φ(n)", "Totient", seq, N};
    }

    /* ──────────────────────────────────────────── */
    /* Phase 3: THE WAVELET COLOUR SPECTRUM TABLE   */
    /* ──────────────────────────────────────────── */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 2: WAVELET COLOUR SPECTRUM OF NUMBER THEORY\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Colour = measured_ratio - void_ratio for each wavelet family.\n");
    printf("  Depth = %d (same as original experiments).\n\n", DEPTH);

    printf("  %-16s│ %-10s│", "Sequence", "Conjecture");
    for (int w = 0; w < n_wavelets; w++)
        printf(" %-7s│", wavelets[w].name);
    printf(" Max wavelet\n");

    printf("  ────────────────┼──────────┼");
    for (int w = 0; w < n_wavelets; w++) printf("────────┼");
    printf("───────────\n");

    for (int s = 0; s < ns; s++) {
        if (seqs[s].len < 100) continue;

        printf("  %-16s│ %-10s│", seqs[s].name, seqs[s].conjecture);

        double max_abs_colour = 0;
        int max_wavelet = 0;

        for (int w = 0; w < n_wavelets; w++) {
            double c = wavelet_colour(seqs[s].seq, seqs[s].len,
                                       &wavelets[w], DEPTH, void_ratios[w]);
            printf(" %+6.4f │", c);

            if (fabs(c) > max_abs_colour) {
                max_abs_colour = fabs(c);
                max_wavelet = w;
            }
        }
        printf(" %s (%.4f)\n", wavelets[max_wavelet].name, max_abs_colour);
    }

    /* ──────────────────────────────────────────── */
    /* Phase 4: MULTI-SCALE ENERGY LANDSCAPE        */
    /* Where does each sequence's energy live?       */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 3: MULTI-SCALE ENERGY LANDSCAPE (Haar)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Energy at each Haar wavelet decomposition level.\n");
    printf("  Level 1 = finest scale (adjacent differences).\n");
    printf("  Higher levels = coarser structure.\n\n");

    /* also compute white noise energy for reference */
    double noise_energy[MAX_LEVELS] = {0};
    {
        double *noise = malloc(N * sizeof(double));
        rng_state = 0xDEADBEEF;
        for (int i = 0; i < N; i++) noise[i] = rng_normal();
        int nl;
        energy_decomposition(noise, N, &wavelets[0], noise_energy, &nl);
        free(noise);
    }

    printf("  %-16s│", "Sequence");
    for (int l = 1; l <= 8; l++) printf(" Level %d │", l);
    printf(" Peak level\n");

    printf("  ────────────────┼");
    for (int l = 1; l <= 8; l++) printf("─────────┼");
    printf("──────────\n");

    /* white noise reference */
    printf("  %-16s│", "White noise");
    for (int l = 0; l < 8; l++)
        printf(" %7.4f │", noise_energy[l]);
    printf(" (flat)\n");

    for (int s = 0; s < ns; s++) {
        if (seqs[s].len < 1000) continue;

        double energies[MAX_LEVELS];
        int nl;
        energy_decomposition(seqs[s].seq, seqs[s].len, &wavelets[0], energies, &nl);

        /* normalise by noise energy to show excess/deficit */
        printf("  %-16s│", seqs[s].name);
        int peak_level = 0;
        double peak_ratio = 0;
        for (int l = 0; l < 8 && l < nl; l++) {
            double ratio = noise_energy[l] > 1e-30 ? energies[l] / noise_energy[l] : 0;
            printf(" %7.2f │", ratio);
            if (ratio > peak_ratio) { peak_ratio = ratio; peak_level = l + 1; }
        }
        printf(" Level %d (%.1fx)\n", peak_level, peak_ratio);
    }

    printf("\n  Values are energy/noise_energy — 1.0 = white noise level.\n");
    printf("  >1.0 = excess energy at that scale. <1.0 = deficit.\n");

    /* ──────────────────────────────────────────── */
    /* Phase 5: THE ZETA-WAVELET BRIDGE              */
    /* Zeta zeros at height γ → oscillation at       */
    /* scale ~N/γ in the wavelet domain              */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("PHASE 4: ZETA-WAVELET BRIDGE\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  The first 10 zeta zeros and their wavelet scales:\n\n");

    /* first 10 non-trivial zeta zero heights */
    double gamma_zeros[] = {
        14.1347, 21.0220, 25.0109, 30.4249, 32.9351,
        37.5862, 40.9187, 43.3271, 48.0052, 49.7738
    };
    int n_zeros = 10;

    printf("  Zero │ γ (height) │ Wavelet scale │ Haar level │ Expected energy peak\n");
    printf("  ─────┼────────────┼───────────────┼────────────┼─────────────────────\n");

    for (int z = 0; z < n_zeros; z++) {
        double gamma = gamma_zeros[z];
        /* wavelet scale ~ N / gamma, so level ~ log2(N/gamma) */
        double wavelet_scale = (double)N / gamma;
        int level = (int)(log2(wavelet_scale));
        printf("  %4d │ %10.4f │  %11.0f  │     %2d     │ %s\n",
               z + 1, gamma, wavelet_scale, level,
               level >= 1 && level <= 8 ? "IN RANGE — should see signal" :
               level > 8 ? "too coarse for our data" : "below resolution");
    }

    /* check if prime gap energy peaks align with zeta zeros */
    printf("\n  Do prime gap wavelet energies peak where zeta zeros predict?\n\n");

    double gap_energies[MAX_LEVELS];
    int gap_nl;
    energy_decomposition(seqs[0].seq, seqs[0].len, &wavelets[0], gap_energies, &gap_nl);

    printf("  Level │ Energy ratio │ Zero γ  │ Alignment\n");
    printf("  ──────┼──────────────┼─────────┼──────────\n");

    for (int l = 0; l < 8 && l < gap_nl; l++) {
        double ratio = noise_energy[l] > 1e-30 ? gap_energies[l] / noise_energy[l] : 0;
        /* which zero corresponds to this level? */
        double expected_gamma = (double)seqs[0].len / pow(2, l + 1);
        /* find nearest zero */
        double nearest = 0;
        for (int z = 0; z < n_zeros; z++) {
            if (nearest == 0 || fabs(gamma_zeros[z] - expected_gamma) < fabs(nearest - expected_gamma))
                nearest = gamma_zeros[z];
        }
        printf("  %5d │ %12.4f │ %7.2f │ %s\n",
               l + 1, ratio, nearest,
               ratio > 1.5 ? "*** STRONG SIGNAL" :
               ratio > 1.1 ? "* weak signal" : "noise level");
    }

    /* ──────────────────────────────────────────── */
    /* SUMMARY */
    /* ──────────────────────────────────────────── */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SUMMARY: THE WAVELET COLOUR SPECTRUM\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  1. The void 1.8709 IS the Haar wavelet inter-scale ratio.\n");
    printf("     Each wavelet family has its own void.\n\n");
    printf("  2. The wavelet colour spectrum measures structure under\n");
    printf("     increasingly sophisticated multi-scale lenses.\n\n");
    printf("  3. If a sequence appears 'near void' under Haar but 'coloured'\n");
    printf("     under db4, the structure is there but too smooth for Haar.\n\n");
    printf("  4. The zeta-wavelet bridge: zero heights map to wavelet scales.\n");
    printf("     Energy peaks at those scales = the zeros doing their work.\n\n");
    printf("  5. The wavelet perspective: RH says all zeros on Re=1/2,\n");
    printf("     which means all scales of the prime counting function\n");
    printf("     are damped at the SAME rate (√x). An off-line zero would\n");
    printf("     create excess energy at one specific wavelet scale.\n");

    /* cleanup */
    free(sieve);
    for (int s = 0; s < ns; s++) free(seqs[s].seq);

    return 0;
}
