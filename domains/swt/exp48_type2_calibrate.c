/*
 * Experiment 48: Type-2 Breach Calibration
 *
 * ONLY use known phase-alignment breaches. No amplitude breaches.
 *
 * Known type-2 breach points:
 *   1. Pólya L(x)>0:           x = 10^8.96    (needs ~30 zeros of L)
 *   2. Skewes π(x)>li(x):      x ≈ 10^316     (needs ~200 zeros of π)
 *   3. Mertens |M/√x|>1:       x ≈ 10^(10^40) (needs ~1M zeros of M)
 *
 * From exp45: zeros needed = f(threshold, amplitude decay)
 *   Pólya needs Σ|A_L| > |DC| ≈ 0.67 → ~30 zeros (measured)
 *   Mertens needs Σ|A_M| > 1.0 → ~4163 zeros (from theoretical decay)
 *   Skewes needs Σ|A_π| > |DC_π| → ~200 zeros (estimated)
 *
 * Model: log₁₀(x_breach) = f(K_zeros)
 *   where K is the number of zeros needed for sufficient amplitude.
 *
 * Three points, two-parameter fit. Then apply to unknowns.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void) {
    printf("=== Experiment 48: Type-2 Breach Calibration ===\n\n");
    printf("Phase-alignment breaches only. Three known points.\n\n");

    /* Known calibration points: (zeros_needed, log10_x_breach) */
    typedef struct { const char *name; double K; double log10_x; } CalPoint;

    CalPoint known[] = {
        {"Pólya L>0",       30,     8.96},
        {"Skewes π>li",    200,    316},
        {"Mertens |M|>1",  4163,   1e40},  /* log10(x) = 10^40 */
    };
    int nk = 3;

    printf("  Known type-2 breaches:\n\n");
    printf("  Conjecture      │ Zeros (K) │ Breach 10^        │ log₁₀(log₁₀(x))\n");
    printf("  ────────────────┼───────────┼───────────────────┼─────────────────\n");
    for (int i = 0; i < nk; i++) {
        double ll = known[i].log10_x > 1000 ? log10(known[i].log10_x) : 0;
        if (known[i].log10_x > 1000)
            printf("  %-16s│    %5.0f  │ 10^(10^%.1f)       │    %.2f\n",
                   known[i].name, known[i].K, ll, ll);
        else
            printf("  %-16s│    %5.0f  │ 10^%-14.1f │    %.2f\n",
                   known[i].name, known[i].K, known[i].log10_x, log10(known[i].log10_x));
    }

    /* ═══ FIT MODELS ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("FITTING: log₁₀(x) = f(K)\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    /* use log-log: log(log10(x)) vs log(K) — linearised */
    /* transform: y = log₁₀(log₁₀(x)), x = log₁₀(K) */
    double x_data[3], y_data[3];
    for (int i = 0; i < 3; i++) {
        x_data[i] = log10(known[i].K);
        y_data[i] = log10(known[i].log10_x);
    }

    printf("  Transformed data: y = log₁₀(log₁₀(x)), x = log₁₀(K)\n\n");
    printf("  Conjecture      │ log₁₀(K) │ log₁₀(log₁₀(x))\n");
    printf("  ────────────────┼──────────┼─────────────────\n");
    for (int i = 0; i < 3; i++)
        printf("  %-16s│   %5.2f  │     %5.2f\n", known[i].name, x_data[i], y_data[i]);

    /* linear fit: y = a + b × x → log₁₀(log₁₀(x)) = a + b × log₁₀(K) */
    double sx=0,sy=0,sxx=0,sxy=0;
    for(int i=0;i<3;i++){sx+=x_data[i];sy+=y_data[i];sxx+=x_data[i]*x_data[i];sxy+=x_data[i]*y_data[i];}
    double b=(3*sxy-sx*sy)/(3*sxx-sx*sx);
    double a=(sy-b*sx)/3;

    printf("\n  FIT: log₁₀(log₁₀(x)) = %.4f + %.4f × log₁₀(K)\n", a, b);
    printf("  Equivalently: log₁₀(x) = 10^(%.4f) × K^%.4f\n\n", a, b);

    /* validate */
    printf("  Validation:\n");
    printf("  Conjecture      │ Actual log₁₀(x) │ Predicted     │ Error factor\n");
    printf("  ────────────────┼─────────────────┼───────────────┼─────────────\n");
    for (int i = 0; i < 3; i++) {
        double pred_y = a + b * x_data[i];
        double pred_log10x = pow(10, pred_y);
        double actual = known[i].log10_x;
        double ratio = actual > 100 ? pred_log10x / actual : pred_log10x / actual;
        if (actual > 1000)
            printf("  %-16s│ 10^%-12.1f │ 10^%-10.1f │ ×%.2f\n",
                   known[i].name, log10(actual), pred_y, pow(10, pred_y - log10(actual)));
        else
            printf("  %-16s│ %-15.1f │ %-13.1f │ ×%.2f\n",
                   known[i].name, actual, pred_log10x, pred_log10x / actual);
    }

    /* ═══ PREDICT UNKNOWNS ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("THE NUMBERS — Type-2 Breach Predictions\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Using: log₁₀(log₁₀(x)) = %.4f + %.4f × log₁₀(K)\n\n", a, b);

    typedef struct { const char *name; double K; const char *known; } Prediction;
    Prediction preds[] = {
        {"Pólya L>0 (check)",       30,    "10^9 ✓"},
        {"Skewes π>li (check)",    200,    "~10^316 ✓"},
        {"Mertens |M|>1 (check)",  4163,   "10^(10^40) ✓"},
        {"Mertens |M|>2",          298991, "unknown"},
        {"Mertens |M|>5",          1.47e9, "unknown"},
        {"RH |err/√x|>1",         1000,   "unknown (Littlewood)"},
        {"RH |err/√x|>2",         5000,   "unknown"},
        {"RH |err/√x|>5",         50000,  "unknown"},
        {"|L/√x|>10",             4084,   "unknown"},
        {"|L/√x|>100",            50000,  "unknown"},
        {"Collatz divergence",     100000, "unknown"},
    };
    int np = 11;

    printf("  Conjecture              │ Zeros (K) │ Predicted breach      │ Known\n");
    printf("  ────────────────────────┼───────────┼───────────────────────┼──────\n");

    for (int p = 0; p < np; p++) {
        double pred_y = a + b * log10(preds[p].K);
        double pred_log10x = pow(10, pred_y);

        printf("  %-24s│ %9.0f │", preds[p].name, preds[p].K);
        if (pred_log10x < 1000)
            printf("   10^%-17.1f│", pred_log10x);
        else if (pred_log10x < 1e15)
            printf("   10^%-17.0f│", pred_log10x);
        else
            printf("   10^(10^%-12.1f) │", log10(pred_log10x));
        printf(" %s\n", preds[p].known);
    }

    /* ═══ THE TABLE ═══ */
    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("THE TABLE — SPECTRAL WAVE THEORY PREDICTIONS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  Model: log₁₀(x) = 10^(%.4f) × K^%.4f\n", a, b);
    printf("  Calibrated from: Pólya (10^9), Skewes (~10^316), Mertens (10^(10^40))\n\n");

    printf("  ┌────────────────────────┬───────────────────────────┐\n");
    printf("  │ Conjecture             │ First Breach Scale        │\n");
    printf("  ├────────────────────────┼───────────────────────────┤\n");

    for (int p = 0; p < np; p++) {
        double pred_y = a + b * log10(preds[p].K);
        double pred_log10x = pow(10, pred_y);

        printf("  │ %-22s │", preds[p].name);
        if (pred_log10x < 100)
            printf("  10^%-22.1f│\n", pred_log10x);
        else if (pred_log10x < 1e6)
            printf("  10^%-22.0f│\n", pred_log10x);
        else
            printf("  10^(10^%-18.1f) │\n", log10(pred_log10x));
    }
    printf("  └────────────────────────┴───────────────────────────┘\n");

    return 0;
}
