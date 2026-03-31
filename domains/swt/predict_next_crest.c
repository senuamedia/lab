/*
 * Quick wave model: fit L(x)/√x from exp32 data, predict next crest.
 * DFT on the 38 measurement points, extract top frequencies,
 * reconstruct and scan forward.
 */
#include <stdio.h>
#include <math.h>

int main(void) {
    /* exp32 data: x values and L(x)/√x */
    double data[][2] = {
        {10000000, -0.2663}, {50000000, -1.0759}, {100000000, -0.3884},
        {200000000, -0.7867}, {300000000, -0.9612}, {400000000, -0.5600},
        {500000000, -0.8409}, {600000000, -0.6267}, {700000000, -0.9594},
        {750000000, -1.0085}, {800000000, -0.6821}, {830000000, -0.6729},
        {850000000, -0.5113}, {870000000, -0.4672}, {880000000, -0.4148},
        {890000000, -0.2873}, {895000000, -0.2698}, {900000000, -0.1543},
        {903000000, -0.0317}, {905000000, -0.0632}, {906000000, -0.0194},
        {906100000, -0.0114}, {906140000, -0.0091}, {906148000, -0.0029},
        {906149000, -0.0029}, {906150000, -0.0005}, {906150257, +0.0000},
        {906150500, +0.0009}, {906151000, +0.0008}, {906155000, -0.0004},
        {906160000, -0.0015}, {906200000, +0.0030}, {906500000, -0.0040},
        {907000000, -0.0638}, {910000000, -0.1559}, {920000000, -0.2840},
        {950000000, -0.4225}, {1000000000, -0.7974}
    };
    int n = 38;

    /* convert to ln(x) space */
    double lnx[38], val[38];
    for (int i = 0; i < n; i++) {
        lnx[i] = log(data[i][0]);
        val[i] = data[i][1];
    }

    /* DC offset (mean) */
    double dc = 0;
    for (int i = 0; i < n; i++) dc += val[i];
    dc /= n;

    printf("=== Wave Model: Predict Next L(x) Crest ===\n\n");
    printf("Data: %d points from exp32 (10M to 1B)\n", n);
    printf("DC offset (mean L/√x): %.4f\n\n", dc);

    /* DFT: scan frequencies γ = 0.5 to 80, find top 10 */
    typedef struct { double gamma, amp, phase, power; } Wave;
    Wave top[10] = {0};

    for (double gamma = 0.5; gamma <= 80.0; gamma += 0.1) {
        double a = 0, b = 0;
        for (int i = 0; i < n; i++) {
            double ph = gamma * lnx[i];
            a += (val[i] - dc) * cos(ph);
            b += (val[i] - dc) * sin(ph);
        }
        a *= 2.0 / n; b *= 2.0 / n;
        double power = a*a + b*b;
        double amp = sqrt(power);
        double phase = atan2(b, a);

        for (int k = 0; k < 10; k++) {
            if (power > top[k].power) {
                for (int j = 9; j > k; j--) top[j] = top[j-1];
                top[k] = (Wave){gamma, amp, phase, power};
                break;
            }
        }
    }

    /* known zeta zeros */
    double zeros[] = {14.13,21.02,25.01,30.42,32.94,37.59,40.92,43.33,48.01,49.77};

    printf("TOP 10 FREQUENCIES IN L(x)/√x:\n\n");
    printf("  Rank │ γ       │ Amplitude │ Phase   │ Nearest zero │ Match?\n");
    printf("  ─────┼─────────┼───────────┼─────────┼──────────────┼───────\n");

    for (int k = 0; k < 10; k++) {
        double nearest = 0, dist = 999;
        for (int z = 0; z < 10; z++) {
            double d = fabs(top[k].gamma - zeros[z]);
            if (d < dist) { dist = d; nearest = zeros[z]; }
        }
        printf("  %4d │ %7.2f │   %7.4f │ %+6.3f  │    γ=%6.2f   │ %s\n",
               k+1, top[k].gamma, top[k].amp, top[k].phase, nearest,
               dist < 1.0 ? "*** YES" : dist < 2.0 ? "* close" : "no");
    }

    /* reconstruct and scan forward */
    printf("\n\nRECONSTRUCTION: L(x)/√x from top 10 waves\n\n");

    /* verify against known data first */
    printf("  Verification against known points:\n");
    printf("  x             │ Actual   │ Model    │ Error\n");
    printf("  ──────────────┼──────────┼──────────┼──────\n");

    double max_err = 0;
    for (int i = 0; i < n; i += 3) { /* every 3rd point */
        double model = dc;
        for (int k = 0; k < 10; k++)
            model += top[k].amp * cos(top[k].gamma * lnx[i] + top[k].phase);
        double err = fabs(model - val[i]);
        if (err > max_err) max_err = err;
        printf("  %13.0f │ %+7.4f  │ %+7.4f  │ %.4f\n",
               data[i][0], val[i], model, err);
    }
    printf("\n  Max error: %.4f\n", max_err);

    /* PREDICT FORWARD: scan from 1B to 100B */
    printf("\n\nPREDICTION: Next crests of L(x)/√x beyond 1B\n\n");
    printf("  ln(x)   │ x ≈              │ L/√x (model) │ Status\n");
    printf("  ────────┼──────────────────┼──────────────┼──────────\n");

    double prev_val = -999;
    int crests_found = 0;
    double crest_positions[10];
    double crest_values[10];

    for (double lx = log(1e9); lx <= log(1e11); lx += 0.01) {
        double model = dc;
        for (int k = 0; k < 10; k++)
            model += top[k].amp * cos(top[k].gamma * lx + top[k].phase);

        /* detect crests (local maxima near or above zero) */
        if (prev_val != -999 && model < prev_val && prev_val > -0.3) {
            double crest_x = exp(lx - 0.01);
            printf("  %7.3f  │ %16.0f │   %+9.4f   │ %s\n",
                   lx - 0.01, crest_x, prev_val,
                   prev_val > 0 ? "*** PREDICTED BREACH" :
                   prev_val > -0.1 ? "** NEAR BREACH" : "crest");
            if (crests_found < 10) {
                crest_positions[crests_found] = lx - 0.01;
                crest_values[crests_found] = prev_val;
                crests_found++;
            }
        }
        prev_val = model;
    }

    /* zero crossings */
    printf("\n\nPREDICTED ZERO CROSSINGS (L(x)/√x = 0):\n\n");
    printf("  ln(x)   │ x ≈              │ Direction\n");
    printf("  ────────┼──────────────────┼──────────\n");

    prev_val = -999;
    for (double lx = log(1e9); lx <= log(1e11); lx += 0.001) {
        double model = dc;
        for (int k = 0; k < 10; k++)
            model += top[k].amp * cos(top[k].gamma * lx + top[k].phase);

        if (prev_val != -999) {
            if (prev_val < 0 && model >= 0) {
                printf("  %7.4f  │ %16.0f │ ↑ negative→positive (PÓLYA VIOLATION)\n",
                       lx, exp(lx));
            } else if (prev_val > 0 && model <= 0) {
                printf("  %7.4f  │ %16.0f │ ↓ positive→negative (return)\n",
                       lx, exp(lx));
            }
        }
        prev_val = model;
    }

    /* summary */
    printf("\n\nSUMMARY:\n\n");
    printf("  Known breach: x = 906,150,257 (ln x = %.4f)\n", log(906150257.0));
    if (crests_found > 0) {
        printf("  Next %d predicted crests:\n", crests_found);
        for (int i = 0; i < crests_found; i++) {
            printf("    x ≈ %.3e (ln x = %.3f), L/√x ≈ %+.4f %s\n",
                   exp(crest_positions[i]), crest_positions[i], crest_values[i],
                   crest_values[i] > 0 ? "*** BREACH" : "");
        }
    }

    /* wave periods */
    printf("\n  Dominant wave periods (in ln x):\n");
    for (int k = 0; k < 5; k++) {
        printf("    γ=%.2f → period = %.4f in ln(x) ≈ factor of %.1f in x\n",
               top[k].gamma, 2*M_PI/top[k].gamma, exp(2*M_PI/top[k].gamma));
    }

    return 0;
}
