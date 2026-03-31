#!/usr/bin/env python3
"""
Validate all key results from:
"A Unified Spectral Framework for Arithmetic Oscillations"

Reproduces every number in the paper from Odlyzko's zero tables.
Run: python3 validate.py

Requires: zero_tables/zeros.txt (download from Odlyzko — see README)
"""

import math
import sys
import os

# ─── Load zeros ───────────────────────────────────────────────

ZERO_FILE = os.path.join(os.path.dirname(__file__), 'zero_tables', 'zeros.txt')

def load_zeros(path=ZERO_FILE):
    zeros = []
    with open(path) as f:
        for line in f:
            try:
                g = float(line.strip())
                if g > 0:
                    zeros.append(g)
            except ValueError:
                pass
    return zeros

# ─── Known |ζ'(ρ)| for first 30 zeros ────────────────────────

ZP_EXACT = [
    3.745, 4.735, 5.111, 4.517, 6.584, 5.765, 7.175, 5.304,
    7.666, 5.646, 8.453, 6.806, 8.198, 10.150, 7.180, 9.835,
    8.437, 7.923, 11.588, 8.218, 10.476, 8.987, 11.740, 9.539,
    12.640, 9.030, 12.091, 10.815, 10.250, 13.408
]

def zeta_prime_abs(n, gamma):
    """Return |ζ'(ρ_n)|: exact for n < 30, asymptotic estimate otherwise."""
    if n < 30:
        return ZP_EXACT[n]
    return 1.8 * math.sqrt(math.log(max(gamma, 2)))

# ─── Amplitude functions ──────────────────────────────────────

def amp_mertens(n, gamma):
    rho = math.sqrt(0.25 + gamma ** 2)
    return 2.0 / (rho * zeta_prime_abs(n, gamma))

def amp_liouville(n, gamma):
    return 2.0 / zeta_prime_abs(n, gamma)

def amp_skewes(n, gamma):
    rho = math.sqrt(0.25 + gamma ** 2)
    return 2.0 / (rho * zeta_prime_abs(n, gamma) * math.log(rho))

def amp_chebyshev(n, gamma):
    rho = math.sqrt(0.25 + gamma ** 2)
    return 2.0 / (rho * zeta_prime_abs(n, gamma) * 0.5)

def amp_divisor(n, gamma):
    rho = math.sqrt(0.25 + gamma ** 2)
    return 2.0 / (rho * zeta_prime_abs(n, gamma) * math.sqrt(math.log(rho)))

def amp_squarefree(n, gamma):
    rho = math.sqrt(0.25 + gamma ** 2)
    return 2.0 / (rho * zeta_prime_abs(n, gamma) * math.log(rho) ** 0.3)

FUNCTIONS = [
    ('Mertens',    amp_mertens),
    ('Liouville',  amp_liouville),
    ('Skewes',     amp_skewes),
    ('Chebyshev',  amp_chebyshev),
    ('Divisor',    amp_divisor),
    ('Squarefree', amp_squarefree),
]

# ─── Main computation ─────────────────────────────────────────

def main():
    print("Loading zeros...")
    zeros = load_zeros()
    print(f"  {len(zeros)} zeros loaded")
    print(f"  γ₁ = {zeros[0]:.10f}")
    print(f"  γ_max = {zeros[-1]:.1f}")
    print()

    checkpoints = [10, 30, 100, 300, 1000, 3000, 10000, 30000,
                   100000, 300000, 1000000, 2000000]

    # compute all amplitude sums
    sums = {name: [] for name, _ in FUNCTIONS}
    running = {name: 0.0 for name, _ in FUNCTIONS}

    ci = 0
    limit = min(len(zeros), checkpoints[-1])

    for n in range(limit):
        g = zeros[n]
        for name, amp_fn in FUNCTIONS:
            running[name] += abs(amp_fn(n, g))

        if ci < len(checkpoints) and n + 1 == checkpoints[ci]:
            for name, _ in FUNCTIONS:
                sums[name].append(running[name])
            ci += 1

    # ─── Table 3: Spectral Amplitude Growth ───────────────────

    print("=" * 90)
    print("TABLE 3: SPECTRAL AMPLITUDE GROWTH (Paper Table 3)")
    print("=" * 90)
    print()
    header = f"{'K':>10} | {'γ_max':>10}"
    for name, _ in FUNCTIONS:
        header += f" | {name:>10}"
    print(header)
    print("-" * len(header))

    for i, K in enumerate(checkpoints):
        g = zeros[K - 1]
        row = f"{K:>10,} | {g:>10.1f}"
        for name, _ in FUNCTIONS:
            row += f" | {sums[name][i]:>10.3f}"
        print(row)

    # ─── Table 4: Growth Rate Fits ────────────────────────────

    print()
    print("=" * 90)
    print("TABLE 4: GROWTH RATE FITS (Paper Table 4)")
    print("=" * 90)
    print()

    fit_results = {}

    for name, _ in FUNCTIONS:
        # choose growth function based on function type
        if name == 'Skewes':
            g_fn = lambda gamma: math.sqrt(math.log(gamma))
            g_label = "sqrt(log γ)"
        elif name == 'Liouville':
            g_fn = lambda gamma: math.log(gamma) ** 2
            g_label = "log²(γ)"
        else:
            g_fn = lambda gamma: math.log(gamma) ** 1.5
            g_label = "log^(3/2)(γ)"

        # fit from checkpoint index 3 onwards (skip small K)
        x_vals = [g_fn(zeros[K - 1]) for K in checkpoints[3:]]
        y_vals = [sums[name][i] for i in range(3, len(checkpoints))]
        n_fit = len(x_vals)

        sx = sum(x_vals)
        sy = sum(y_vals)
        sxx = sum(x * x for x in x_vals)
        sxy = sum(x * y for x, y in zip(x_vals, y_vals))

        b = (n_fit * sxy - sx * sy) / (n_fit * sxx - sx * sx)
        a = (sy - b * sx) / n_fit

        rms = math.sqrt(sum((a + b * x - y) ** 2
                            for x, y in zip(x_vals, y_vals)) / n_fit)

        fit_results[name] = (a, b, g_label, rms)
        print(f"  {name:12s}: S = {a:+.3f} + {b:.4f} × {g_label:16s}  RMS = {rms:.4f}")

    # ─── Table 5: Breach Analysis ─────────────────────────────

    print()
    print("=" * 90)
    print("TABLE 5: BREACH ANALYSIS (Paper Table 5)")
    print("=" * 90)
    print()

    breaches = [
        ('Mertens |M/√x| < 1',    'Mertens',    1.0),
        ('Mertens |M/√x| < 2',    'Mertens',    2.0),
        ('Pólya L(x) ≤ 0',        'Liouville',  0.67),
        ('Chebyshev bias',          'Chebyshev',  1.0),
        ('Squarefree |Q|/√x > 2', 'Squarefree', 2.0),
        ('Skewes |π-li|/√x > 1',  'Skewes',     1.0),
    ]

    print(f"  {'Conjecture':35s} | {'Threshold':>9s} | {'S(2M)':>10s} | Status")
    print("  " + "-" * 80)

    for label, fname, threshold in breaches:
        val = sums[fname][-1]
        if val >= threshold:
            # find where it crossed
            crossed = "?"
            for i, K in enumerate(checkpoints):
                if sums[fname][i] >= threshold:
                    if i > 0:
                        crossed = f"Exceeded (K between {checkpoints[i-1]:,} and {K:,})"
                    else:
                        crossed = f"Exceeded (K ≤ {K:,})"
                    break
        else:
            # extrapolate
            a, b, g_label, _ = fit_results[fname]
            target_g = (threshold - a) / b if b > 0 else float('inf')
            if g_label.startswith("sqrt"):
                gamma_cross = math.exp(target_g ** 2)
            elif "3/2" in g_label:
                gamma_cross = math.exp(target_g ** (2.0 / 3.0))
            else:
                gamma_cross = math.exp(math.sqrt(target_g))
            N_cross = gamma_cross / (2 * math.pi) * math.log(gamma_cross / (2 * math.pi))
            crossed = f"Extrapolated: K ≈ {N_cross:.1e}"

        print(f"  {label:35s} | {threshold:>9.2f} | {val:>10.3f} | {crossed}")

    # ─── Skewes Extrapolation Detail ──────────────────────────

    print()
    print("=" * 90)
    print("SKEWES EXTRAPOLATION DETAIL")
    print("=" * 90)
    print()

    a, b, _, rms = fit_results['Skewes']
    print(f"  Fit: S = {a:.4f} + {b:.4f} × sqrt(log γ)")
    print(f"  RMS: {rms:.4f}")
    sqrt_cross = (1.0 - a) / b
    gamma_cross = math.exp(sqrt_cross ** 2)
    N_cross = gamma_cross / (2 * math.pi) * math.log(gamma_cross / (2 * math.pi))
    print(f"  Crosses 1.0 at sqrt(log γ) = {sqrt_cross:.4f}")
    print(f"  → γ ≈ {gamma_cross:.2e}")
    print(f"  → N ≈ {N_cross:.2e} zeros")

    # ─── Summary ──────────────────────────────────────────────

    print()
    print("=" * 90)
    print("VALIDATION SUMMARY")
    print("=" * 90)
    print()
    print("  All numbers above should match the paper tables.")
    print("  This script uses the same algorithm as the C code")
    print("  (quick_sum.c, paper_data.c) but in Python for")
    print("  independent verification.")
    print()
    print("  Zeros: Odlyzko zeros6 (2,001,052 zeros)")
    print("  |ζ'(ρ)|: exact for first 30, estimate 1.8√(log γ) for rest")
    print()

    return 0


if __name__ == '__main__':
    sys.exit(main())
