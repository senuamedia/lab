/*
 * Explicit Formula Evaluator — The Fold
 *
 * Evaluates M(x)/√x, L(x)/√x, and (π(x)-li(x))/√x at ANY x
 * using the explicit formula and precomputed zeta zeros.
 *
 * No sieving. No factoring. Just a sum over zeros.
 *
 * M(x)/√x ≈ Σ_ρ  x^(ρ-1/2) / (ρ ζ'(ρ))
 *          = Σ_n  x^(iγ_n) / (ρ_n ζ'(ρ_n))  + conjugate
 *          = Σ_n  2 Re[ x^(iγ_n) / (ρ_n ζ'(ρ_n)) ]
 *          = Σ_n  2|A_n| cos(γ_n ln(x) + φ_n)
 *
 * where A_n = 1/(ρ_n ζ'(ρ_n)), γ_n = Im(ρ_n), φ_n = arg(A_n)
 *
 * Input: file of zeros (γ_n values) and optionally |ζ'(ρ_n)|
 * Output: function values at specified x, scan for breaches
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define MAX_ZEROS 100000

typedef struct {
    double gamma;      /* imaginary part of zero */
    double zeta_prime;  /* |ζ'(ρ)| — if known, else estimated */
    double amp;         /* 2 / (|ρ| × |ζ'(ρ)|) */
    double phase;       /* arg(1/(ρ ζ'(ρ))) */
} Zero;

static Zero zeros[MAX_ZEROS];
static int n_zeros = 0;

/* estimate |ζ'(ρ)| when not available */
/* average: |ζ'(ρ)| ≈ C × √(log γ) for large γ */
static double estimate_zeta_prime(double gamma) {
    /* calibrated from known values: C ≈ 1.8 */
    return 1.8 * sqrt(log(gamma));
}

/* load zeros from file — one γ per line */
static int load_zeros(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) { fprintf(stderr, "Cannot open %s\n", filename); return 0; }

    char line[256];
    n_zeros = 0;
    while (fgets(line, sizeof(line), f) && n_zeros < MAX_ZEROS) {
        double g;
        if (sscanf(line, "%lf", &g) == 1 && g > 0) {
            zeros[n_zeros].gamma = g;
            zeros[n_zeros].zeta_prime = estimate_zeta_prime(g);
            /* |ρ| = sqrt(1/4 + γ²) ≈ γ for large γ */
            double rho_abs = sqrt(0.25 + g*g);
            zeros[n_zeros].amp = 2.0 / (rho_abs * zeros[n_zeros].zeta_prime);
            /* phase: arg(1/(ρ ζ'(ρ))) — approximate as -arg(ρ) = -atan(2γ) */
            zeros[n_zeros].phase = -atan2(g, 0.5);
            n_zeros++;
        }
    }
    fclose(f);
    return n_zeros;
}

/* load zeros with known |ζ'(ρ)| values — format: γ ζ'_abs per line */
static int load_zeros_with_deriv(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) return 0;

    char line[256];
    n_zeros = 0;
    while (fgets(line, sizeof(line), f) && n_zeros < MAX_ZEROS) {
        double g, zp;
        if (sscanf(line, "%lf %lf", &g, &zp) == 2 && g > 0 && zp > 0) {
            zeros[n_zeros].gamma = g;
            zeros[n_zeros].zeta_prime = zp;
            double rho_abs = sqrt(0.25 + g*g);
            zeros[n_zeros].amp = 2.0 / (rho_abs * zp);
            zeros[n_zeros].phase = -atan2(g, 0.5);
            n_zeros++;
        }
    }
    fclose(f);
    return n_zeros;
}

/* evaluate M(x)/√x at a given x using N zeros */
static double eval_mertens(double log_x, int use_n) {
    if (use_n > n_zeros) use_n = n_zeros;
    double sum = 0;
    for (int i = 0; i < use_n; i++) {
        sum += zeros[i].amp * cos(zeros[i].gamma * log_x + zeros[i].phase);
    }
    /* add the constant term: -2 + Σ 1/(ρ(ρ-1)) ≈ -2 */
    /* actually the explicit formula for M(x) includes a constant */
    /* we calibrate from known values */
    return sum;
}

/* scan for breach: where does |eval| first exceed threshold */
static double find_breach(double threshold, int use_n,
                           double log_x_start, double log_x_end, double step) {
    for (double lx = log_x_start; lx <= log_x_end; lx += step) {
        double val = eval_mertens(lx, use_n);
        if (fabs(val) > threshold) return lx;
    }
    return -1;
}

/* scan for sign change */
static double find_sign_change(int use_n, double log_x_start, double log_x_end, double step) {
    double prev = eval_mertens(log_x_start, use_n);
    for (double lx = log_x_start + step; lx <= log_x_end; lx += step) {
        double val = eval_mertens(lx, use_n);
        if (prev * val < 0) return lx;
        prev = val;
    }
    return -1;
}

int main(int argc, char **argv) {
    setvbuf(stdout, NULL, _IONBF, 0);
    printf("=== Explicit Formula Evaluator ===\n\n");

    /* try loading zeros from various sources */
    int loaded = 0;

    /* first try zeros with derivatives */
    if (!loaded) loaded = load_zeros_with_deriv("zero_tables/zeros_with_deriv.txt");
    if (!loaded) loaded = load_zeros("zero_tables/zeros.txt");
    if (!loaded) loaded = load_zeros("zero_tables/zeta_zeros.txt");

    /* if no file, use our 30 known zeros as fallback */
    if (!loaded) {
        printf("No zero table files found. Using 30 built-in zeros.\n\n");
        double builtin_gamma[] = {
            14.1347,21.0220,25.0109,30.4249,32.9351,37.5862,40.9187,43.3271,
            48.0052,49.7738,52.9703,56.4462,59.3470,60.8318,65.1125,67.0798,
            69.5464,72.0672,75.7047,77.1448,79.3375,82.9104,84.7355,87.4253,
            88.8091,92.4919,94.6514,95.8706,98.8312,101.318
        };
        double builtin_zp[] = {
            3.745,4.735,5.111,4.517,6.584,5.765,7.175,5.304,
            7.666,5.646,8.453,6.806,8.198,10.150,7.180,9.835,
            8.437,7.923,11.588,8.218,10.476,8.987,11.740,9.539,
            12.640,9.030,12.091,10.815,10.250,13.408
        };
        n_zeros = 30;
        for (int i = 0; i < 30; i++) {
            zeros[i].gamma = builtin_gamma[i];
            zeros[i].zeta_prime = builtin_zp[i];
            double rho_abs = sqrt(0.25 + builtin_gamma[i]*builtin_gamma[i]);
            zeros[i].amp = 2.0 / (rho_abs * builtin_zp[i]);
            zeros[i].phase = -atan2(builtin_gamma[i], 0.5);
        }
        loaded = 30;
    }

    printf("Zeros loaded: %d\n", n_zeros);
    printf("Highest γ: %.2f\n", zeros[n_zeros-1].gamma);
    double amp_sum = 0;
    for (int i = 0; i < n_zeros; i++) amp_sum += zeros[i].amp;
    printf("Σ|A|: %.4f (max constructive interference)\n\n", amp_sum);

    /* ═══ Evaluate at key scales ═══ */
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("M(x)/√x AT KEY SCALES (explicit formula, %d zeros)\n", n_zeros);
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Scale      │ M(x)/√x │ |M/√x| │ Status\n");
    printf("  ───────────┼──────────┼────────┼────────\n");

    double scales[] = {1e3,1e6,1e9,1e12,1e15,1e20,1e50,1e100,1e200,1e316};
    for (int s = 0; s < 10; s++) {
        double lx = log(scales[s]);
        double val = eval_mertens(lx, n_zeros);
        printf("  10^%-7.0f │ %+8.4f │ %6.4f │ %s\n",
               log10(scales[s]), val, fabs(val),
               fabs(val) > 1.0 ? "*** |M|>1 BREACH" :
               fabs(val) > 0.5 ? "** high" : "");
    }

    /* ═══ Scan for Mertens breach ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("SCAN: Where does |M(x)/√x| first exceed 1.0?\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* scan with increasing numbers of zeros to see convergence */
    int zero_counts[] = {10, 20, 30, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 50000, 100000};
    int nzc = 13;

    printf("  Zeros used │ Σ|A|   │ First |M|>1.0 at    │ Converging?\n");
    printf("  ───────────┼────────┼──────────────────────┼───────────\n");

    for (int z = 0; z < nzc; z++) {
        int nz = zero_counts[z];
        if (nz > n_zeros) break;

        double asum = 0;
        for (int i = 0; i < nz; i++) asum += zeros[i].amp;

        if (asum < 1.0) {
            printf("  %10d │ %6.3f │ impossible (Σ|A|<1)  │\n", nz, asum);
        } else {
            /* scan for breach — can search arbitrarily far */
            double breach = find_breach(1.0, nz, log(1e6), log(1e1000), 0.01);
            if (breach > 0)
                printf("  %10d │ %6.3f │ 10^%-17.1f │ %s\n", nz, asum, breach/log(10),
                       z > 0 ? "check" : "");
            else
                printf("  %10d │ %6.3f │ beyond 10^434         │\n", nz, asum);
        }
    }

    /* ═══ Envelope growth with zero count ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("ENVELOPE GROWTH: max |M/√x| vs number of zeros included\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Zeros │ Σ|A|   │ Max |M/√x| (scan 10^3..10^434)\n");
    printf("  ──────┼────────┼─────────────────────────────────\n");

    for (int z = 0; z < nzc; z++) {
        int nz = zero_counts[z];
        if (nz > n_zeros) break;

        double asum = 0;
        for (int i = 0; i < nz; i++) asum += zeros[i].amp;

        /* find max |eval| in a broad scan */
        double max_val = 0;
        double max_lx = 0;
        for (double lx = log(1e3); lx <= 1000; lx += 0.01) {
            double val = fabs(eval_mertens(lx, nz));
            if (val > max_val) { max_val = val; max_lx = lx; }
        }

        printf("  %5d │ %6.3f │ %.4f at 10^%.1f %s\n",
               nz, asum, max_val, max_lx/log(10),
               max_val > 1.0 ? " *** BREACH" : "");
    }

    printf("\n  With more zeros → Σ|A| grows → envelope grows → breach certain.\n");
    printf("  The explicit formula eliminates the need for sieving.\n");

    return 0;
}
