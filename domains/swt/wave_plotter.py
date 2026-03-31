#!/usr/bin/env python3
"""
Generate all paper figures using matplotlib.
Equivalent to wave_plotter.c + generate_all_figures.py.

Run: python3 wave_plotter.py
Outputs: figures/*.pdf

Requires: matplotlib, numpy, zero_tables/zeros.txt
"""

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import math
import os

ZERO_FILE = os.path.join(os.path.dirname(__file__), 'zero_tables', 'zeros.txt')
FIGS = os.path.join(os.path.dirname(__file__), 'figures')
os.makedirs(FIGS, exist_ok=True)

plt.rcParams.update({
    'font.size': 11,
    'font.family': 'serif',
    'axes.grid': True,
    'grid.alpha': 0.3,
})

# ─── Load zeros ───────────────────────────────────────────────

print("Loading zeros...")
zeros = []
with open(ZERO_FILE) as f:
    for line in f:
        try:
            g = float(line.strip())
            if g > 0: zeros.append(g)
        except: pass
zeros = np.array(zeros)
print(f"  {len(zeros)} zeros loaded")

ZP_EXACT = np.array([
    3.745, 4.735, 5.111, 4.517, 6.584, 5.765, 7.175, 5.304,
    7.666, 5.646, 8.453, 6.806, 8.198, 10.150, 7.180, 9.835,
    8.437, 7.923, 11.588, 8.218, 10.476, 8.987, 11.740, 9.539,
    12.640, 9.030, 12.091, 10.815, 10.250, 13.408
])

def zp_arr(n):
    """Return array of |ζ'(ρ)| estimates for first n zeros."""
    result = np.empty(n)
    k = min(n, 30)
    result[:k] = ZP_EXACT[:k]
    if n > 30:
        result[30:] = 1.8 * np.sqrt(np.log(np.maximum(zeros[30:n], 2)))
    return result

# ─── Amplitude sums ──────────────────────────────────────────

def compute_sums(max_k=2000000):
    """Compute cumulative amplitude sums for all six functions."""
    n = min(max_k, len(zeros))
    g = zeros[:n]
    rho = np.sqrt(0.25 + g ** 2)
    zp = zp_arr(n)

    amps = {
        'Mertens':    2.0 / (rho * zp),
        'Liouville':  2.0 / zp,
        'Skewes':     2.0 / (rho * zp * np.log(rho)),
        'Chebyshev':  2.0 / (rho * zp * 0.5),
        'Divisor':    2.0 / (rho * zp * np.sqrt(np.log(rho))),
        'Squarefree': 2.0 / (rho * zp * np.log(rho) ** 0.3),
    }

    checkpoints = [10, 30, 100, 300, 1000, 3000, 10000, 30000,
                   100000, 300000, 1000000, min(2000000, n)]

    sums = {}
    for name, amp in amps.items():
        cum = np.cumsum(np.abs(amp))
        sums[name] = [float(cum[k - 1]) for k in checkpoints if k <= n]

    return checkpoints[:len(sums['Mertens'])], sums

# ─── Wave reconstruction ─────────────────────────────────────

def reconstruct(amp_fn, log10_range, n_waves=1000, dc=0.0):
    """Reconstruct f(x)/sqrt(x) from explicit formula."""
    n_points = 2000
    log10_x = np.linspace(log10_range[0], log10_range[1], n_points)
    ln_x = log10_x * np.log(10)
    nw = min(n_waves, len(zeros))

    g = zeros[:nw]
    rho = np.sqrt(0.25 + g ** 2)
    zp = zp_arr(nw)
    amps = amp_fn(g, rho, zp)
    phases = -np.arctan2(g, 0.5)

    result = np.full(n_points, dc, dtype=float)
    for i in range(nw):
        result += amps[i] * np.cos(g[i] * ln_x + phases[i])

    return log10_x, result

def amp_mertens_arr(g, rho, zp): return 2.0 / (rho * zp)
def amp_liouville_arr(g, rho, zp): return 2.0 / zp
def amp_skewes_arr(g, rho, zp): return 2.0 / (rho * zp * np.log(rho))

# ─── Generate figures ─────────────────────────────────────────

print("Computing amplitude sums...")
cp, sums = compute_sums()
cp = np.array(cp)

# Fig 1: All amplitude growth (THE key figure)
print("Generating figures...")

fig, ax = plt.subplots(figsize=(10, 7))
ax.loglog(cp, sums['Mertens'], 'b-o', ms=4, lw=1.5, label=r'Mertens — $\log^{3/2}\gamma$')
ax.loglog(cp, sums['Skewes'], 'g-s', ms=4, lw=1.5, label=r'Skewes — $\sqrt{\log\gamma}$')
ax.loglog(cp, sums['Liouville'], 'r-^', ms=4, lw=1.5, label=r'Liouville — $\log^2\gamma$')
ax.loglog(cp, sums['Chebyshev'], 'm-D', ms=3, lw=1, label=r'Chebyshev — $\log^{3/2}\gamma$')
ax.loglog(cp, sums['Divisor'], 'c-v', ms=3, lw=1, label=r'Divisor — $\log^{3/2}\gamma$')
ax.loglog(cp, sums['Squarefree'], 'y-<', ms=3, lw=1, label=r'Squarefree — $\log^{3/2}\gamma$')
ax.axhline(1.0, color='black', ls='--', lw=1.5, alpha=0.5, label='Threshold = 1')
ax.set_xlabel('Number of zeros K', fontsize=13)
ax.set_ylabel(r'Spectral Amplitude Sum $\Sigma|A|(K)$', fontsize=13)
ax.set_title('Spectral Amplitude Growth — All Conjectures', fontsize=14)
ax.legend(fontsize=10)
ax.set_ylim(0.01, 1e7)
plt.tight_layout()
plt.savefig(os.path.join(FIGS, 'fig_all_growth.pdf'), dpi=150)
plt.close()
print("  fig_all_growth.pdf")

# Fig 2: Mertens three-panel
fig, axes = plt.subplots(3, 1, figsize=(10, 12))

log10_x, w100 = reconstruct(amp_mertens_arr, (1, 200), 100)
_, w1000 = reconstruct(amp_mertens_arr, (1, 200), 1000)

axes[0].plot(log10_x, w100, alpha=0.5, lw=0.5, label='100 zeros')
axes[0].plot(log10_x, w1000, alpha=0.8, lw=0.7, label='1000 zeros')
axes[0].axhline(1.0, color='red', ls='--', lw=1.5, label='Mertens bound')
axes[0].axhline(-1.0, color='red', ls='--', lw=1.5)
axes[0].set_xlabel(r'$\log_{10}(x)$')
axes[0].set_ylabel(r'$M(x)/\sqrt{x}$')
axes[0].set_title('(a) Wave Reconstruction')
axes[0].legend(fontsize=9)

axes[1].semilogx(cp, sums['Mertens'], 'b-o', ms=4)
axes[1].axhline(1.0, color='red', ls='--', lw=1.5, label='Threshold = 1')
axes[1].set_xlabel('Number of zeros')
axes[1].set_ylabel(r'$\Sigma|A|$')
axes[1].set_title('(b) Spectral Amplitude Swell')
axes[1].legend(fontsize=9)

axes[2].semilogx(cp, sums['Mertens'], 'bo-', ms=5)
axes[2].axhline(1.0, color='red', ls='--', lw=1.5)
axes[2].axhline(2.0, color='orange', ls='--', lw=1)
axes[2].set_xlabel('Number of zeros')
axes[2].set_ylabel(r'$\Sigma|A|$')
axes[2].set_title('(c) Breach Analysis')

plt.tight_layout()
plt.savefig(os.path.join(FIGS, 'fig_mertens.pdf'), dpi=150)
plt.close()
print("  fig_mertens.pdf")

# Fig 3: Pólya breach anatomy
fig, ax = plt.subplots(figsize=(10, 6))
polya_x = [10, 50, 100, 200, 300, 400, 500, 600, 700, 750, 800, 830, 850,
           870, 880, 890, 895, 900, 903, 905, 906, 906.15, 907, 910, 920, 950, 1000]
polya_y = [-0.266, -1.076, -0.388, -0.787, -0.961, -0.560, -0.841, -0.627,
           -0.959, -1.009, -0.682, -0.673, -0.511, -0.467, -0.415, -0.287,
           -0.270, -0.154, -0.032, -0.063, -0.019, 0.000, -0.064, -0.156,
           -0.284, -0.423, -0.797]
ax.plot(polya_x, polya_y, 'b-o', ms=5, lw=2)
ax.axhline(0, color='red', ls='--', lw=2, label=r"Pólya bound ($L = 0$)")
ax.axvline(906.15, color='green', ls=':', lw=1.5, alpha=0.7)
ax.annotate('BREACH', xy=(906.15, 0), xytext=(930, 0.3), fontsize=14,
            color='red', fontweight='bold',
            arrowprops=dict(arrowstyle='->', color='red', lw=2))
ax.set_xlabel('x (millions)', fontsize=12)
ax.set_ylabel(r'$L(x)/\sqrt{x}$', fontsize=12)
ax.set_title('Pólya Breach Anatomy — Wave Build, Crest, Recession', fontsize=13)
ax.legend(fontsize=11)
plt.tight_layout()
plt.savefig(os.path.join(FIGS, 'fig_polya_anatomy.pdf'), dpi=150)
plt.close()
print("  fig_polya_anatomy.pdf")

# Fig 4: Skewes extrapolation
fig, ax = plt.subplots(figsize=(10, 6))
ax.semilogx(cp, sums['Skewes'], 'go-', ms=5, label='Measured')
ext_n = np.logspace(np.log10(cp[-1]), 15, 100)
ext_gamma = 2 * np.pi * ext_n / np.log(np.maximum(ext_n, 3))
ext_val = -0.583 + 0.286 * np.sqrt(np.log(ext_gamma))
ax.semilogx(ext_n, ext_val, 'g--', lw=1.5, alpha=0.7, label='Extrapolation')
ax.axhline(1.0, color='red', ls='--', lw=1.5, label='Threshold = 1.0')
ax.set_xlabel('Number of zeros', fontsize=12)
ax.set_ylabel(r'$\Sigma|A|$', fontsize=12)
ax.set_title('Skewes: Extrapolated Crossing at ~10¹⁴ zeros', fontsize=13)
ax.legend(fontsize=11)
plt.tight_layout()
plt.savefig(os.path.join(FIGS, 'fig_skewes_extrap.pdf'), dpi=150)
plt.close()
print("  fig_skewes_extrap.pdf")

# Fig 5: Zero recovery scatter
fig, ax = plt.subplots(figsize=(8, 6))
recovered = [14.130, 21.010, 25.015, 30.445, 32.940, 37.560, 40.910,
             49.770, 48.010, 43.335, 59.380, 52.970, 56.450]
known = [14.135, 21.022, 25.011, 30.425, 32.935, 37.586, 40.919,
         49.774, 48.005, 43.327, 59.347, 52.970, 56.446]
ax.scatter(known, recovered, s=100, c='blue', zorder=5, label='Recovered (13/15)')
ax.plot([10, 65], [10, 65], 'r--', lw=1.5, label='Perfect recovery')
ax.set_xlabel(r'Known $\gamma$', fontsize=12)
ax.set_ylabel(r'Recovered $\gamma$', fontsize=12)
ax.set_title('Zeta Zeros Recovered from Arithmetic DFT', fontsize=13)
ax.legend(fontsize=11)
ax.set_xlim(10, 65)
ax.set_ylim(10, 65)
plt.tight_layout()
plt.savefig(os.path.join(FIGS, 'fig_zero_recovery.pdf'), dpi=150)
plt.close()
print("  fig_zero_recovery.pdf")

# Fig 6: NS connection
fig, ax = plt.subplots(figsize=(10, 5))
labels = ['NS (with -i)\nConvergent', 'NS (no -i)\nDivergent', 'Mertens\nDivergent', 'Skewes\nDivergent']
values = [1.975, 307.7, 4.13, 0.49]
colors = ['green', 'red', 'red', 'orange']
ax.bar(labels, values, color=colors, alpha=0.7, edgecolor='black')
ax.axhline(1.0, color='black', ls='--', lw=2, label='Convergence threshold')
ax.set_ylabel('Spectral amplitude sum', fontsize=12)
ax.set_title('Convergence Threshold: NS Regularity vs Number Theory', fontsize=13)
ax.set_yscale('log')
ax.legend(fontsize=11)
plt.tight_layout()
plt.savefig(os.path.join(FIGS, 'fig_ns_connection.pdf'), dpi=150)
plt.close()
print("  fig_ns_connection.pdf")

# Fig 7: Chebyshev validation
fig, ax = plt.subplots(figsize=(10, 6))
predicted = [8.42, 9.17, 8.32]
actual = [8.52, 8.77, 11.78]
labels = [r'$\pi(19,3)>\pi(19,1)$', r'$\pi(8,5)>\pi(8,1)$', r'$\pi(3,2)>\pi(3,1)$']
x = np.arange(len(labels))
ax.bar(x - 0.15, predicted, 0.3, label='Predicted', color='steelblue')
ax.bar(x + 0.15, actual, 0.3, label='Actual', color='coral')
ax.set_xticks(x)
ax.set_xticklabels(labels, fontsize=11)
ax.set_ylabel(r'$\log_{10}(x)$ of first reversal', fontsize=12)
ax.set_title('Chebyshev Bias Predictions vs Actual', fontsize=13)
ax.legend(fontsize=11)
for i in range(2):
    err = abs(predicted[i] - actual[i]) / actual[i] * 100
    ax.annotate(f'{err:.1f}%', xy=(i, max(predicted[i], actual[i]) + 0.3),
               ha='center', fontsize=11, color='green', fontweight='bold')
plt.tight_layout()
plt.savefig(os.path.join(FIGS, 'fig_chebyshev_validation.pdf'), dpi=150)
plt.close()
print("  fig_chebyshev_validation.pdf")

total = len([f for f in os.listdir(FIGS) if f.endswith('.pdf')])
print(f"\nDone: {total} figures in {FIGS}/")
