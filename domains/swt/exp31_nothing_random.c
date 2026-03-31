/*
 * Experiment 31: Nothing Is Random — The Rod Conjecture
 *
 * Conjecture: No integer sequence is structureless at all scales.
 *   Every deviation from the void is scale-dependent.
 *   Every conjecture about boundedness/regularity eventually breaks.
 *   The colour map measures not WHETHER, but WHEN.
 *
 * Test 1: SCALE DEPENDENCE OF COLOUR
 *   For each sequence, measure colour at increasing window sizes.
 *   If the conjecture is right, colour is not constant — it drifts
 *   with scale, and the direction tells us whether we're approaching
 *   or receding from the breaking point.
 *
 * Test 2: WAVELET RESOLUTION REVEALS ALL
 *   For each sequence, measure colour under db1, db2, ..., db6.
 *   If nothing is random, smoother wavelets should ALWAYS find
 *   more structure — colour should INCREASE with wavelet order.
 *   Even for "proven" sequences (Erdős-Kac, Pisano).
 *
 * Test 3: THE RESOLUTION LIMIT
 *   White noise itself: generate "perfect" noise, then measure
 *   under increasing wavelet smoothness. At some order, even
 *   PRNG noise shows structure (the PRNG's algorithm leaking through).
 *   True randomness doesn't exist in computation. The void is
 *   an idealisation.
 *
 * Test 4: CONVERGENCE TO VOID = APPROACHING FAILURE
 *   Sequences whose colour decreases with scale are approaching
 *   their breaking point. Plot colour vs log(scale) for each.
 *   Extrapolate: at what scale does each reach the void?
 *   That's the predicted breaking scale.
 *
 * Test 5: EVEN "PROVEN" CONJECTURES
 *   Erdős-Kac is proven: (Ω(n) - log log n)/√(log log n) → N(0,1).
 *   But the CONVERGENCE has a rate. At what scale does the rate
 *   change? Is the Gaussian limit itself scale-dependent?
 *   Measure the colour of the residual after subtracting the
 *   Gaussian prediction. If it's nonzero, the "proof" describes
 *   an approximation, not a truth.
 */

#include "rh_scaffold.h"

#define MAX_N 2000000
#define MAX_PRIMES 150000

/* Daubechies high-pass filters (same as exp30) */
static const double db1_h[] = {0.7071067811865476, -0.7071067811865476};
static const double db2_h[] = {-0.4829629131445341, 0.8365163037378079,
    -0.2241438680420134, -0.1294095225512604};
static const double db3_h[] = {0.3326705529500826, -0.8068915093110925,
    0.4598775021184915, 0.1350110200102546, -0.0854412738820267, -0.0352262918857095};
static const double db4_h[] = {-0.2303778133088965, 0.7148465705529156,
    -0.6308807679298589, -0.0279837694168599, 0.1870348117190930, 0.0308413818355607,
    -0.0328830116668852, -0.0105974017850690};
static const double db5_h[] = {0.1601023979741930, -0.6038292697971896,
    0.7243085284377729, 0.1384281459013204, -0.2422948870663824, -0.0322448695846381,
    0.0775714938400459, -0.0062414902127983, -0.0125807519990820, 0.0033357252854738};
static const double db6_h[] = {-0.1115407433501095, 0.4946238903984533,
    -0.7511339080210959, 0.3152503517091982, 0.2262646939654400, -0.1297668675672625,
    -0.0975016055873225, 0.0275228655303053, 0.0315820393174862, 0.0005538422011614,
    -0.0047772575109455, 0.0010773010853085};

typedef struct { const char *name; const double *filter; int len; } Wavelet;
static Wavelet wavelets[] = {
    {"db1", db1_h, 2}, {"db2", db2_h, 4}, {"db3", db3_h, 6},
    {"db4", db4_h, 8}, {"db5", db5_h, 10}, {"db6", db6_h, 12}
};
static const int n_wavelets = 6;

static double rms_d(const double *v, int n) {
    double s = 0; for (int i = 0; i < n; i++) s += v[i] * v[i]; return sqrt(s / n);
}

static int wavelet_detail(const double *in, int n, const double *f, int fl, double *out) {
    int out_len = n / 2;
    for (int i = 0; i < out_len; i++) {
        double sum = 0;
        for (int j = 0; j < fl; j++) { int idx = 2*i+j; if (idx < n) sum += in[idx]*f[j]; }
        out[i] = sum;
    }
    return out_len;
}

/* measure colour under a specific wavelet at depth 4 */
static double measure_wavelet_colour(const double *seq, int n,
                                      const Wavelet *wf, double void_ratio) {
    double *current = malloc(n * sizeof(double));
    memcpy(current, seq, n * sizeof(double));
    int cur_len = n;
    double *detail = malloc(n * sizeof(double));
    double prev_rms = 0, ratio = 0;

    for (int d = 1; d <= 4 && cur_len > wf->len * 4; d++) {
        int det_len = wavelet_detail(current, cur_len, wf->filter, wf->len, detail);
        double det_rms = rms_d(detail, det_len);
        if (d == 4 && prev_rms > 1e-30) ratio = det_rms / prev_rms;
        prev_rms = det_rms;
        int next_len = cur_len / 2;
        for (int i = 0; i < next_len; i++) current[i] = current[2*i];
        cur_len = next_len;
    }
    free(current); free(detail);
    return ratio - void_ratio;
}

/* compute void for a wavelet via white noise trials */
static unsigned long long rng_state = 0x123456789ABCDEF0ULL;
static double rng_normal(void) {
    rng_state = rng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    double u1 = (double)(rng_state >> 11) / (double)(1ULL << 53);
    if (u1 < 1e-15) u1 = 1e-15;
    rng_state = rng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    double u2 = (double)(rng_state >> 11) / (double)(1ULL << 53);
    return sqrt(-2.0 * log(u1)) * cos(6.283185307179586 * u2);
}

static double compute_void(const Wavelet *wf, int trials) {
    int sig_len = 65536;
    double *signal = malloc(sig_len * sizeof(double));
    double *detail = malloc(sig_len * sizeof(double));
    double ratio_sum = 0; int valid = 0;

    for (int t = 0; t < trials; t++) {
        rng_state += (unsigned long long)(t * 7 + 13);
        for (int i = 0; i < sig_len; i++) signal[i] = rng_normal();
        double *cur = malloc(sig_len * sizeof(double));
        memcpy(cur, signal, sig_len * sizeof(double));
        int cl = sig_len; double prev_rms = 0, ratio = 0;
        for (int d = 1; d <= 4 && cl > wf->len * 4; d++) {
            int dl = wavelet_detail(cur, cl, wf->filter, wf->len, detail);
            double dr = rms_d(detail, dl);
            if (d == 4 && prev_rms > 1e-30) ratio = dr / prev_rms;
            prev_rms = dr;
            int nl = cl/2; for (int i = 0; i < nl; i++) cur[i] = cur[2*i]; cl = nl;
        }
        free(cur);
        if (ratio > 0.1 && ratio < 5.0) { ratio_sum += ratio; valid++; }
    }
    free(signal); free(detail);
    return valid > 0 ? ratio_sum / valid : 0;
}

static int big_omega(int n) {
    int c = 0; for (int p = 2; (long long)p*p <= n; p++) while (n%p==0) { c++; n/=p; }
    if (n > 1) c++; return c;
}

static int mobius(int n) {
    int f = 0; for (int p = 2; (long long)p*p <= n; p++) {
        if (n%p==0) { n/=p; f++; if (n%p==0) return 0; } }
    if (n > 1) f++; return (f%2==0) ? 1 : -1;
}

int main(void) {
    printf("=== Experiment 31: Nothing Is Random — The Rod Conjecture ===\n\n");
    printf("\"No integer sequence is structureless at all scales.\"\n");
    printf("\"Every conjecture about boundedness eventually breaks.\"\n");
    printf("\"The colour map measures not WHETHER, but WHEN.\"\n\n");

    /* sieve */
    char *sieve = calloc(MAX_N * 20 + 1, 1);
    for (int i = 2; (long long)i*i <= MAX_N*20; i++)
        if (!sieve[i]) for (int j = i*i; j <= MAX_N*20; j += i) sieve[j] = 1;

    /* compute voids */
    printf("Computing wavelet voids (50 trials each)...\n");
    double voids[6];
    for (int w = 0; w < n_wavelets; w++) voids[w] = compute_void(&wavelets[w], 50);
    printf("Done.\n\n");

    /* generate sequences */
    typedef struct { const char *name; const char *status; double *seq; int len; } Seq;
    Seq seqs[12]; int ns = 0;

    /* prime gaps */
    { double *s = malloc(MAX_PRIMES*sizeof(double)); int pp=2, idx=0;
      for (int i=3; i<=MAX_N*20 && idx<MAX_PRIMES; i++) if (!sieve[i]) { s[idx++]=(double)(i-pp); pp=i; }
      seqs[ns++] = (Seq){"Prime gaps", "RH: OPEN", s, idx}; }

    /* Möbius */
    { double *s = malloc(MAX_N*sizeof(double));
      for (int i=0; i<MAX_N; i++) s[i]=(double)mobius(i+2);
      seqs[ns++] = (Seq){"Möbius μ(n)", "Mertens: BROKEN", s, MAX_N}; }

    /* Liouville */
    { double *s = malloc(MAX_N*sizeof(double));
      for (int i=0; i<MAX_N; i++) s[i]=(big_omega(i+2)%2==0)?1.0:-1.0;
      seqs[ns++] = (Seq){"Liouville λ(n)", "Pólya: BROKEN", s, MAX_N}; }

    /* Collatz */
    { double *s = malloc(MAX_N*sizeof(double));
      for (int i=0; i<MAX_N; i++) { long long n=i+2; int st=0;
        while(n>1&&st<1000){n=(n%2==0)?n/2:3*n+1;st++;} s[i]=(double)st; }
      seqs[ns++] = (Seq){"Collatz steps", "Collatz: OPEN", s, MAX_N}; }

    /* Ω(n) */
    { double *s = malloc(MAX_N*sizeof(double));
      for (int i=0; i<MAX_N; i++) s[i]=(double)big_omega(i+2);
      seqs[ns++] = (Seq){"Ω(n)", "Erdős-Kac: PROVEN", s, MAX_N}; }

    /* Euler φ */
    { double *s = malloc(MAX_N*sizeof(double));
      for (int i=0; i<MAX_N; i++) { int n=i+2, r=n, t=n;
        for (int p=2; (long long)p*p<=t; p++) { if(t%p==0){while(t%p==0)t/=p;r-=r/p;} }
        if(t>1) r-=r/t; s[i]=(double)r; }
      seqs[ns++] = (Seq){"Euler φ(n)", "Totient: PROVEN", s, MAX_N}; }

    /* Divisor */
    { double *s = malloc(MAX_N*sizeof(double));
      for (int i=0; i<MAX_N; i++) { int n=i+2, d=0;
        for (int j=1; (long long)j*j<=n; j++) if(n%j==0){d++; if(j!=n/j)d++;}
        s[i]=(double)d; }
      seqs[ns++] = (Seq){"Divisor d(n)", "Dirichlet: PARTIAL", s, MAX_N}; }

    /* Fibonacci mod */
    { double *s = malloc(MAX_N*sizeof(double)); long long a=1,b=1;
      for (int i=0; i<MAX_N; i++) { s[i]=(double)(a%1000);
        long long c=(a+b)%1000000; a=b; b=c; }
      seqs[ns++] = (Seq){"Fibonacci mod", "Pisano: PROVEN", s, MAX_N}; }

    /* Erdős-Kac RESIDUAL: Ω(n) - log log n, normalised */
    { double *s = malloc(MAX_N*sizeof(double));
      for (int i=0; i<MAX_N; i++) {
        int n = i + 2;
        double lln = log(log((double)n));
        double expected = lln;
        double stddev = sqrt(lln);
        s[i] = stddev > 0.01 ? ((double)big_omega(n) - expected) / stddev : 0;
      }
      seqs[ns++] = (Seq){"Erdős-Kac residual", "PROVEN (residual)", s, MAX_N}; }

    /* ══════════════════════════════════════════ */
    /* TEST 1: SCALE DEPENDENCE OF COLOUR        */
    /* ══════════════════════════════════════════ */
    rh_table_header("TEST 1: COLOUR VS SCALE (Haar)");
    printf("Does colour change with window size? If yes → scale-dependent.\n\n");

    int windows[] = {1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 500000, 1000000};
    int nwin = 10;

    printf("  %-20s│", "Sequence");
    for (int w = 0; w < nwin; w++) {
        if (windows[w] >= 1000000) printf(" %4dK│", windows[w]/1000);
        else if (windows[w] >= 10000) printf(" %4dK│", windows[w]/1000);
        else printf(" %5d│", windows[w]);
    }
    printf(" Trend\n");

    printf("  ────────────────────┼");
    for (int w = 0; w < nwin; w++) printf("──────┼");
    printf("──────\n");

    for (int s = 0; s < ns; s++) {
        printf("  %-20s│", seqs[s].name);
        double first_colour = 0, last_colour = 0;
        int first_set = 0;
        double prev_c = 0;
        int ups = 0, downs = 0;

        for (int w = 0; w < nwin; w++) {
            int wlen = windows[w];
            if (wlen > seqs[s].len) { printf("   —  │"); continue; }

            double c = measure_wavelet_colour(seqs[s].seq, wlen, &wavelets[0], voids[0]);
            printf(" %+5.3f│", c);

            if (!first_set) { first_colour = c; first_set = 1; }
            last_colour = c;
            if (w > 0) { if (c > prev_c + 0.001) ups++; else if (c < prev_c - 0.001) downs++; }
            prev_c = c;
        }

        const char *trend;
        if (ups > downs + 2) trend = "↑ GROWING";
        else if (downs > ups + 2) trend = "↓ SHRINKING";
        else trend = "~ OSCILLATING";
        printf(" %s\n", trend);
    }

    /* ══════════════════════════════════════════ */
    /* TEST 2: WAVELET RESOLUTION REVEALS ALL    */
    /* ══════════════════════════════════════════ */
    rh_table_header("TEST 2: COLOUR VS WAVELET ORDER (full data)");
    printf("Smoother wavelets should find MORE structure if nothing is random.\n");
    printf("Colour should increase with wavelet order for ALL sequences.\n\n");

    printf("  Sequence            │ Status       │ db1    │ db2    │ db3    │ db4    │ db5    │ db6    │ Max │ Monotonic?\n");
    printf("  ────────────────────┼──────────────┼────────┼────────┼────────┼────────┼────────┼────────┼─────┼──────────\n");

    for (int s = 0; s < ns; s++) {
        printf("  %-20s│ %-12s │", seqs[s].name, seqs[s].status);

        double colours[6];
        double max_abs = 0;
        int max_w = 0;
        int increasing = 0;

        for (int w = 0; w < n_wavelets; w++) {
            int use_len = seqs[s].len > 50000 ? 50000 : seqs[s].len;
            colours[w] = measure_wavelet_colour(seqs[s].seq, use_len, &wavelets[w], voids[w]);
            printf(" %+5.3f │", colours[w]);
            if (fabs(colours[w]) > max_abs) { max_abs = fabs(colours[w]); max_w = w; }
        }

        /* check if |colour| is monotonically increasing with wavelet order */
        int mono = 1;
        for (int w = 1; w < n_wavelets; w++)
            if (fabs(colours[w]) < fabs(colours[w-1]) - 0.001) { mono = 0; break; }

        printf(" db%d │ %s\n", max_w + 1, mono ? "YES — structure grows" : "no — peaks then falls");
    }

    /* ══════════════════════════════════════════ */
    /* TEST 3: THE PRNG ISN'T RANDOM EITHER      */
    /* ══════════════════════════════════════════ */
    rh_table_header("TEST 3: IS WHITE NOISE ACTUALLY WHITE?");
    printf("If nothing is random, even our PRNG has colour under fine enough lens.\n\n");

    /* test multiple PRNGs */
    printf("  Testing PRNG (LCG) under each wavelet...\n\n");

    /* generate PRNG sequences of different lengths */
    int prng_sizes[] = {1000, 5000, 10000, 50000, 200000, 1000000};
    int n_prng = 6;

    printf("  PRNG length │ db1    │ db2    │ db3    │ db4    │ db5    │ db6    │ Max |colour|\n");
    printf("  ────────────┼────────┼────────┼────────┼────────┼────────┼────────┼───────────\n");

    for (int p = 0; p < n_prng; p++) {
        int plen = prng_sizes[p];
        double *noise = malloc(plen * sizeof(double));
        rng_state = 0xCAFEBABE + p * 12345;
        for (int i = 0; i < plen; i++) noise[i] = rng_normal();

        printf("  %11d │", plen);
        double max_abs = 0;
        for (int w = 0; w < n_wavelets; w++) {
            double c = measure_wavelet_colour(noise, plen, &wavelets[w], voids[w]);
            printf(" %+5.3f │", c);
            if (fabs(c) > max_abs) max_abs = fabs(c);
        }
        printf("  %.4f %s\n", max_abs, max_abs > 0.005 ? "← PRNG LEAKING" : "");
        free(noise);
    }

    /* also test: is the PRNG colour scale-dependent? */
    printf("\n  If PRNG colour shrinks with length → it's measurement noise.\n");
    printf("  If PRNG colour is constant → the PRNG has real structure.\n");

    /* ══════════════════════════════════════════ */
    /* TEST 4: PREDICTED BREAKING SCALES          */
    /* ══════════════════════════════════════════ */
    rh_table_header("TEST 4: WHEN DOES EACH CONJECTURE BREAK?");
    printf("Extrapolate colour vs scale to find where colour reaches the void.\n\n");

    printf("  Sequence            │ Status       │ Colour@1K │ Colour@1M │ Slope/decade │ Predicted break\n");
    printf("  ────────────────────┼──────────────┼───────────┼───────────┼──────────────┼───────────────\n");

    for (int s = 0; s < ns; s++) {
        /* measure at 1K and at max available scale */
        double c_small = measure_wavelet_colour(seqs[s].seq, 1000, &wavelets[0], voids[0]);
        int big_len = seqs[s].len > 1000000 ? 1000000 : seqs[s].len;
        double c_big = measure_wavelet_colour(seqs[s].seq, big_len, &wavelets[0], voids[0]);

        /* slope in colour per decade of scale */
        double log_small = log10(1000.0);
        double log_big = log10((double)big_len);
        double slope = (log_big > log_small + 0.1) ?
                       (c_big - c_small) / (log_big - log_small) : 0;

        /* predicted breaking scale: where |colour| reaches void (colour = 0) */
        /* colour(s) = c_big + slope × (s - log_big) = 0 */
        /* s = log_big - c_big / slope */
        double predicted = 0;
        if (fabs(slope) > 1e-6 && c_big * slope < 0) { /* colour approaching zero */
            predicted = log_big - c_big / slope;
        }

        printf("  %-20s│ %-12s │  %+6.4f   │  %+6.4f   │  %+9.2e   │ ",
               seqs[s].name, seqs[s].status, c_small, c_big, slope);

        if (predicted > log_big && predicted < 1e10) {
            printf("10^%.0f", predicted);
            /* check against known breaking scale */
            if (strstr(seqs[s].status, "BROKEN")) printf(" (KNOWN)");
        } else if (fabs(slope) < 1e-6) {
            printf("colour flat — no prediction");
        } else {
            printf("colour growing — not approaching void");
        }
        printf("\n");
    }

    /* ══════════════════════════════════════════ */
    /* TEST 5: THE ERDŐS-KAC RESIDUAL             */
    /* ══════════════════════════════════════════ */
    rh_table_header("TEST 5: IS ERDŐS-KAC TRULY PROVEN?");
    printf("Erdős-Kac: (Ω(n) - log log n)/√(log log n) → N(0,1).\n");
    printf("PROVEN. But is the residual truly structureless?\n\n");

    /* the residual sequence is already generated as seqs[ns-1] */
    int ek_idx = -1;
    for (int s = 0; s < ns; s++)
        if (strstr(seqs[s].name, "residual")) { ek_idx = s; break; }

    if (ek_idx >= 0) {
        printf("  Erdős-Kac residual colour under each wavelet:\n\n");
        printf("  Wavelet │ Colour   │ vs void  │ Structure?\n");
        printf("  ────────┼──────────┼──────────┼──────────\n");

        for (int w = 0; w < n_wavelets; w++) {
            double c = measure_wavelet_colour(seqs[ek_idx].seq, 500000,
                                               &wavelets[w], voids[w]);
            printf("  %-7s │ %+7.4f  │ %+7.4f  │ %s\n",
                   wavelets[w].name, c, c,
                   fabs(c) > 0.005 ? "*** STRUCTURE FOUND" :
                   fabs(c) > 0.001 ? "* weak signal" : "consistent with noise");
        }

        printf("\n  Scale dependence of residual colour:\n\n");
        printf("  Window  │ Haar colour │ db4 colour │ db6 colour\n");
        printf("  ────────┼────────────┼────────────┼───────────\n");

        int ek_windows[] = {2000, 5000, 10000, 50000, 100000, 500000};
        for (int w = 0; w < 6; w++) {
            int wlen = ek_windows[w];
            if (wlen > seqs[ek_idx].len) break;
            double c1 = measure_wavelet_colour(seqs[ek_idx].seq, wlen, &wavelets[0], voids[0]);
            double c4 = measure_wavelet_colour(seqs[ek_idx].seq, wlen, &wavelets[3], voids[3]);
            double c6 = measure_wavelet_colour(seqs[ek_idx].seq, wlen, &wavelets[5], voids[5]);
            printf("  %7d │   %+7.4f  │   %+7.4f  │   %+7.4f\n", wlen, c1, c4, c6);
        }

        printf("\n  If the residual has colour: the Gaussian limit is an approximation.\n");
        printf("  The structure Erdős-Kac describes is real, but it's not the WHOLE story.\n");
    }

    /* ══════════════════════════════════════════ */
    /* VERDICT                                    */
    /* ══════════════════════════════════════════ */
    rh_table_header("VERDICT: THE ROD CONJECTURE");

    printf("  Test 1 — Scale dependence:   Does colour drift with window size?\n");
    printf("  Test 2 — Resolution:         Do smoother wavelets find more structure?\n");
    printf("  Test 3 — PRNG structure:     Is even 'random' noise structured?\n");
    printf("  Test 4 — Breaking scales:    Can we predict when conjectures break?\n");
    printf("  Test 5 — Proven residuals:   Do 'proven' results have hidden structure?\n\n");

    printf("  If all five tests show structure:\n");
    printf("    Nothing is random. Every conjecture breaks.\n");
    printf("    The void is empty only at our resolution.\n");
    printf("    Mathematics describes approximations at finite scale.\n");
    printf("    The colour map is a clock, not a classifier.\n\n");

    printf("  If some tests fail:\n");
    printf("    There IS a threshold of true randomness.\n");
    printf("    Some sequences genuinely reach the void.\n");
    printf("    Some conjectures genuinely hold forever.\n");
    printf("    The colour map classifies, not just measures.\n");

    /* cleanup */
    free(sieve);
    for (int s = 0; s < ns; s++) free(seqs[s].seq);
    return 0;
}
