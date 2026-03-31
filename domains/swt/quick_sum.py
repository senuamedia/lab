#!/usr/bin/env python3
"""
Quick amplitude sum computation for all six arithmetic functions.
Equivalent to quick_sum.c — produces the same output.

Run: python3 quick_sum.py
"""

import math
import os

ZERO_FILE = os.path.join(os.path.dirname(__file__), 'zero_tables', 'zeros.txt')

ZP_EXACT = [
    3.745, 4.735, 5.111, 4.517, 6.584, 5.765, 7.175, 5.304,
    7.666, 5.646, 8.453, 6.806, 8.198, 10.150, 7.180, 9.835,
    8.437, 7.923, 11.588, 8.218, 10.476, 8.987, 11.740, 9.539,
    12.640, 9.030, 12.091, 10.815, 10.250, 13.408
]

def zp(n, gamma):
    return ZP_EXACT[n] if n < 30 else 1.8 * math.sqrt(math.log(max(gamma, 2)))

zeros = []
with open(ZERO_FILE) as f:
    for line in f:
        try:
            g = float(line.strip())
            if g > 0: zeros.append(g)
        except: pass

print(f"Loaded {len(zeros)} zeros (γ_max={zeros[-1]:.1f})")
print()

checks = [10, 30, 100, 300, 1000, 3000, 10000, 30000, 100000, 300000, 1000000, 2000000]

print(f"{'Zeros':>10} | {'γ_max':>10} | {'Mertens':>8} | {'Liouville':>10} | {'Skewes':>8} | {'Cheby':>8} | {'Divisor':>8} | {'Sqfree':>8}")
print("-" * 95)

ms = ls = ss = cs = ds = qs = 0.0
ci = 0

for n in range(min(len(zeros), checks[-1])):
    g = zeros[n]
    rho = math.sqrt(0.25 + g*g)
    z = zp(n, g)

    ms += 2.0 / (rho * z)
    ls += 2.0 / z
    ss += 2.0 / (rho * z * math.log(rho))
    cs += 2.0 / (rho * z * 0.5)
    ds += 2.0 / (rho * z * math.sqrt(math.log(rho)))
    qs += 2.0 / (rho * z * math.log(rho) ** 0.3)

    if ci < len(checks) and n + 1 == checks[ci]:
        print(f"{n+1:>10,} | {g:>10.1f} | {ms:>8.3f} | {ls:>10.1f} | {ss:>8.4f} | {cs:>8.3f} | {ds:>8.3f} | {qs:>8.3f}")
        ci += 1
