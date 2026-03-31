/*
 * rh_zeta.h — Riemann zeta function evaluation with dual numbers
 *
 * Provides:
 *   - Zeta evaluation on the critical strip via Dirichlet series + Euler-Maclaurin
 *   - Riemann-Siegel formula for efficient evaluation at large height
 *   - Dual number arithmetic for automatic derivative computation
 *   - Zero-finding on the critical line
 *   - Prime counting function and explicit formula terms
 */

#ifndef RH_ZETA_H
#define RH_ZETA_H

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* ---------- complex arithmetic ---------- */

typedef struct { double re, im; } Complex;

static Complex cx(double re, double im) { return (Complex){re, im}; }
static Complex cx_add(Complex a, Complex b) { return cx(a.re + b.re, a.im + b.im); }
static Complex cx_sub(Complex a, Complex b) { return cx(a.re - b.re, a.im - b.im); }
static Complex cx_mul(Complex a, Complex b) {
    return cx(a.re * b.re - a.im * b.im, a.re * b.im + a.im * b.re);
}
static Complex cx_scale(Complex a, double s) { return cx(a.re * s, a.im * s); }
static double cx_abs(Complex a) { return sqrt(a.re * a.re + a.im * a.im); }
static double cx_abs2(Complex a) { return a.re * a.re + a.im * a.im; }
static Complex cx_conj(Complex a) { return cx(a.re, -a.im); }

static Complex cx_div(Complex a, Complex b) {
    double d = cx_abs2(b);
    return cx((a.re * b.re + a.im * b.im) / d,
              (a.im * b.re - a.re * b.im) / d);
}

/* n^(-s) = exp(-s * ln(n)) */
static Complex cx_pow_real(double base, Complex s) {
    if (base <= 0) return cx(0, 0);
    double ln_base = log(base);
    double mag = exp(-s.re * ln_base);
    double phase = -s.im * ln_base;
    return cx(mag * cos(phase), mag * sin(phase));
}

static Complex cx_exp(Complex z) {
    double mag = exp(z.re);
    return cx(mag * cos(z.im), mag * sin(z.im));
}

static Complex cx_log(Complex z) {
    return cx(log(cx_abs(z)), atan2(z.im, z.re));
}

/* ---------- dual complex number (value + derivative) ---------- */

typedef struct {
    Complex val;   /* function value */
    Complex der;   /* derivative w.r.t. s */
} DualCx;

static DualCx dcx(Complex v, Complex d) { return (DualCx){v, d}; }
static DualCx dcx_const(Complex v) { return dcx(v, cx(0, 0)); }
static DualCx dcx_var(Complex v) { return dcx(v, cx(1, 0)); }

static DualCx dcx_add(DualCx a, DualCx b) {
    return dcx(cx_add(a.val, b.val), cx_add(a.der, b.der));
}

static DualCx dcx_sub(DualCx a, DualCx b) {
    return dcx(cx_sub(a.val, b.val), cx_sub(a.der, b.der));
}

static DualCx dcx_mul(DualCx a, DualCx b) {
    /* (f + f'ε)(g + g'ε) = fg + (fg' + f'g)ε */
    return dcx(cx_mul(a.val, b.val),
               cx_add(cx_mul(a.val, b.der), cx_mul(a.der, b.val)));
}

static DualCx dcx_div(DualCx a, DualCx b) {
    /* (f/g)' = (f'g - fg') / g² */
    Complex val = cx_div(a.val, b.val);
    Complex g2 = cx_mul(b.val, b.val);
    Complex der = cx_div(cx_sub(cx_mul(a.der, b.val), cx_mul(a.val, b.der)), g2);
    return dcx(val, der);
}

static DualCx dcx_scale(DualCx a, double s) {
    return dcx(cx_scale(a.val, s), cx_scale(a.der, s));
}

/* n^(-s) with dual: d/ds[n^(-s)] = -ln(n) * n^(-s) */
static DualCx dcx_pow_real(double base, DualCx s) {
    Complex val = cx_pow_real(base, s.val);
    double ln_base = log(base);
    /* d/ds[n^(-s)] = -ln(n) * n^(-s) * ds */
    Complex dval_ds = cx_scale(val, -ln_base);
    Complex der = cx_mul(dval_ds, s.der);
    return dcx(val, der);
}

/* ---------- zeta evaluation: Dirichlet series with acceleration ---------- */

/*
 * Borwein method for zeta(s) convergence acceleration.
 * Works for Re(s) > 0 except at s=1.
 * Uses n terms of the alternating series with Chebyshev acceleration.
 */
static Complex zeta_borwein(Complex s, int n) {
    /* precompute d_k coefficients */
    double *d = malloc((n + 1) * sizeof(double));
    d[0] = 1.0;
    for (int k = 1; k <= n; k++) {
        d[k] = d[k - 1] + (double)n * 1.0; /* simplified: use binomial */
    }
    /* proper Borwein coefficients: d_k = n * Σ_{j=k}^{n} (j choose k) */
    memset(d, 0, (n + 1) * sizeof(double));
    for (int k = 0; k <= n; k++) {
        double binom = 1.0;
        for (int j = k; j <= n; j++) {
            if (j == k) binom = 1.0;
            else binom *= (double)(j) / (double)(j - k);
            d[k] += binom;
        }
        d[k] *= n;
    }
    double d_n = d[n];

    /* compute: zeta(s) = (-1/(d_n * (1 - 2^(1-s)))) * Σ_{k=0}^{n-1} (-1)^k (d_k - d_n) / (k+1)^s */
    Complex sum = cx(0, 0);
    for (int k = 0; k < n; k++) {
        double coeff = (d[k] - d_n) * ((k % 2 == 0) ? -1.0 : 1.0);
        Complex term = cx_pow_real((double)(k + 1), s);
        sum = cx_add(sum, cx_scale(term, coeff));
    }

    /* 1 - 2^(1-s) */
    Complex one_minus_s = cx_sub(cx(1, 0), s);
    Complex pow2 = cx_pow_real(2.0, one_minus_s);  /* 2^(1-s) */
    Complex denom = cx_sub(cx(1, 0), pow2);
    /* avoid pole near s=1 */
    if (cx_abs(denom) < 1e-12) { free(d); return cx(1e15, 0); }

    Complex result = cx_div(sum, cx_scale(denom, -d_n));
    free(d);
    return result;
}

/*
 * Simpler Dirichlet series with Euler-Maclaurin correction.
 * Accurate for Re(s) > 1, reasonable for Re(s) > 0.5 with enough terms.
 */
static Complex zeta_dirichlet(Complex s, int terms) {
    Complex sum = cx(0, 0);
    for (int n = 1; n <= terms; n++) {
        sum = cx_add(sum, cx_pow_real((double)n, s));
    }
    /* Euler-Maclaurin first correction: N^(1-s)/(s-1) + N^(-s)/2 */
    double N = (double)terms;
    Complex s_minus_1 = cx_sub(s, cx(1, 0));
    Complex corr1 = cx_div(cx_pow_real(N, cx_sub(s, cx(1, 0))),  /* N^(1-s) */
                           s_minus_1);                              /* /(s-1) */
    Complex corr2 = cx_scale(cx_pow_real(N, s), 0.5);             /* N^(-s)/2 */
    return cx_add(sum, cx_add(corr1, corr2));
}

/*
 * Primary zeta evaluation — dispatch to best method.
 */
static Complex zeta(Complex s) {
    /* use Dirichlet series with Euler-Maclaurin for large Re(s) */
    if (s.re > 1.5) {
        return zeta_dirichlet(s, 200);
    }
    /* Borwein for the critical strip */
    return zeta_borwein(s, 30);
}

/*
 * Dual zeta: returns (ζ(s), ζ'(s)) via dual arithmetic.
 * Uses direct Dirichlet series with dual numbers.
 */
static DualCx zeta_dual(Complex s, int terms) {
    DualCx ds = dcx_var(s);
    DualCx sum = dcx_const(cx(0, 0));
    for (int n = 1; n <= terms; n++) {
        sum = dcx_add(sum, dcx_pow_real((double)n, ds));
    }
    /* Euler-Maclaurin first correction */
    DualCx one = dcx_const(cx(1, 0));
    DualCx s_m1 = dcx_sub(ds, one);
    double N = (double)terms;
    DualCx corr1 = dcx_div(dcx_pow_real(N, dcx_sub(ds, one)), s_m1);
    DualCx corr2 = dcx_scale(dcx_pow_real(N, ds), 0.5);
    return dcx_add(sum, dcx_add(corr1, corr2));
}

/* ---------- zero finding on the critical line ---------- */

/*
 * Z(t) = real-valued function whose zeros = zeros of ζ(1/2 + it)
 * Z(t) = exp(iθ(t)) * ζ(1/2 + it)
 * where θ(t) is the Riemann-Siegel theta function.
 */
static double rs_theta(double t) {
    /* θ(t) = Im(log(Γ(1/4 + it/2))) - (t/2)*log(π) */
    /* Stirling approximation for large t: */
    /* θ(t) ≈ (t/2)*log(t/(2πe)) - π/8 + 1/(48t) + ... */
    if (t < 1.0) return 0.0;
    return (t / 2.0) * log(t / (2.0 * M_PI)) - t / 2.0 - M_PI / 8.0
           + 1.0 / (48.0 * t) + 7.0 / (5760.0 * t * t * t);
}

/*
 * Evaluate Z(t) via the Riemann-Siegel formula.
 * Z(t) = 2 * Σ_{n=1}^{N} cos(θ(t) - t*ln(n)) / sqrt(n)  +  R(t)
 * where N = floor(sqrt(t/(2π))).
 */
static double riemann_siegel_Z(double t) {
    if (t < 2.0) {
        /* fall back to direct computation */
        Complex s = cx(0.5, t);
        Complex z = zeta(s);
        double theta = rs_theta(t);
        Complex rot = cx(cos(theta), sin(theta));
        Complex zr = cx_mul(rot, z);
        return zr.re;
    }
    int N = (int)floor(sqrt(t / (2.0 * M_PI)));
    if (N < 1) N = 1;
    double theta = rs_theta(t);
    double sum = 0.0;
    for (int n = 1; n <= N; n++) {
        sum += cos(theta - t * log((double)n)) / sqrt((double)n);
    }
    sum *= 2.0;

    /* Riemann-Siegel remainder (first correction term) */
    double p = sqrt(t / (2.0 * M_PI)) - N;
    /* C_0(p) ≈ cos(2π(p²-p-1/16)) / cos(2πp) */
    double c0_num = cos(2.0 * M_PI * (p * p - p - 1.0 / 16.0));
    double c0_den = cos(2.0 * M_PI * p);
    if (fabs(c0_den) > 1e-10) {
        double remainder = pow(-1.0, N - 1) * pow(t / (2.0 * M_PI), -0.25) * c0_num / c0_den;
        sum += remainder;
    }
    return sum;
}

/*
 * Find zeros of Z(t) by sign changes in [t_lo, t_hi].
 * Returns count, fills zeros[] with approximate t values.
 */
static int find_zeros(double t_lo, double t_hi, double step, double *zeros, int max_zeros) {
    int count = 0;
    double prev_z = riemann_siegel_Z(t_lo);
    for (double t = t_lo + step; t <= t_hi && count < max_zeros; t += step) {
        double cur_z = riemann_siegel_Z(t);
        if (prev_z * cur_z < 0) {
            /* bisect to refine */
            double a = t - step, b = t;
            for (int iter = 0; iter < 60; iter++) {
                double mid = (a + b) / 2.0;
                double z_mid = riemann_siegel_Z(mid);
                if (z_mid * riemann_siegel_Z(a) < 0) b = mid;
                else a = mid;
            }
            zeros[count++] = (a + b) / 2.0;
        }
        prev_z = cur_z;
    }
    return count;
}

/* ---------- prime counting and related functions ---------- */

/* li(x) = logarithmic integral ≈ x/ln(x) + x/ln²(x) + 2x/ln³(x) + ... */
static double li(double x) {
    if (x <= 1.0) return 0.0;
    if (x <= 2.0) {
        /* numerical integration near the singularity at x=1 */
        /* li(2) ≈ 1.04516 (the Ramanujan-Soldner constant is at ~1.45136) */
        double h = (x - 1.001) / 1000.0;
        double s = 0;
        for (int i = 0; i < 1000; i++) {
            double t = 1.001 + (i + 0.5) * h;
            s += 1.0 / log(t);
        }
        return s * h;
    }
    /* For x > 2: numerical integration using trapezoidal rule
     * li(x) = li(2) + integral from 2 to x of dt/ln(t)
     * li(2) ≈ 1.04516378... */
    double li2 = 1.045163780117492784844588889194613136522615578151;
    double lnx = log(x);
    /* use Euler-Maclaurin with optimal truncation of asymptotic series:
     * li(x) ≈ x/ln(x) * Σ_{k=0}^{N} k!/ln(x)^k
     * truncate when term starts growing (optimal N ≈ ln(x)) */
    int N = (int)lnx;
    if (N < 1) N = 1;
    if (N > 50) N = 50;
    double sum = 0.0;
    double term = 1.0;
    for (int k = 0; k < N; k++) {
        sum += term;
        double next_term = term * (double)(k + 1) / lnx;
        if (fabs(next_term) > fabs(term)) break;  /* diverging — stop */
        term = next_term;
    }
    return x / lnx * sum;
}

/* pi(x) - exact prime count up to x using sieve */
static int prime_count(int x) {
    if (x < 2) return 0;
    char *sieve = calloc(x + 1, 1);
    if (!sieve) return 0;
    for (int i = 2; (long long)i * i <= x; i++) {
        if (!sieve[i]) {
            for (int j = i * i; j <= x; j += i)
                sieve[j] = 1;
        }
    }
    int count = 0;
    for (int i = 2; i <= x; i++) {
        if (!sieve[i]) count++;
    }
    free(sieve);
    return count;
}

/* ---------- Chebyshev functions ---------- */

/* ψ(x) = Σ_{p^k ≤ x} ln(p) = Σ Λ(n) for n ≤ x */
static double chebyshev_psi(int x, const int *primes, int np) {
    double psi = 0.0;
    for (int i = 0; i < np && primes[i] <= x; i++) {
        int p = primes[i];
        long long pk = p;
        while (pk <= x) {
            psi += log((double)p);
            pk *= p;
        }
    }
    return psi;
}

#endif /* RH_ZETA_H */
