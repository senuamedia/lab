# Senuamedia Lab — Navier-Stokes Regularity Experiments

All experiments, solvers, and validation code for the 3D Navier-Stokes regularity research.

**Papers:**
- [Unified Adaptation Theorem](https://doi.org/10.5281/zenodo.19149831) — DOI: 10.5281/zenodo.19149831
- [NS Regularity Scaffold](https://doi.org/10.5281/zenodo.19155497) — DOI: 10.5281/zenodo.19155497
- Energy Conservation, Cascade Stabilisation, and NS Regularity — (Paper 3, forthcoming)

---

## Important: The v2/v3 Solver Story

This repository contains two versions of the 3D Galerkin NS solver. **Only v3 is correct.**

### The v2 Bug

The v2 solver (`solvers/v2/triad_kernel_v2.c`) implemented the NS nonlinear term as:

```
rhs_k = -Σ_{p+q=k} (û_p · q) P_k(û_q)
```

This is **missing the factor -i** from the Fourier-space NS equation:

```
dû_k/dt = -ν|k|²û_k - i Σ_{p+q=k} (û_p · q) P_k(û_q)
```

The -i factor is essential because the energy conservation identity
`Σ Re(conj(û_k) · NL_k) = 0` relies on the antisymmetry of the
complex trilinear form. Without -i, the solver computes a different
dynamical system that **creates energy out of nothing** (1-15% per
unit time, growing with N).

### How It Was Discovered

The bug was found through a chain of diagnostic experiments:

1. **Scaffold array analysis** showed enstrophy divergence at the truncation boundary
2. **Adaptive truncation** (removing the boundary) showed energy growing from 0.25 to 298
3. **Energy conservation audit** at ν=0 across multiple dt values showed energy drift was **completely dt-independent** — proving the error was in the RHS, not the time integrator
4. **Direct computation** of `Σ Re(conj(û) · NL)` returned nonzero values at every N

### The v3 Fix

The v3 solver (`solvers/v3/triad_kernel_v3.c`) stores complex Fourier coefficients
(6 doubles per mode) and applies -i correctly. Energy conservation verified:

```
Σ Re(conj(û) · NL) = 0.000000e+00  at all N = 2 through 8
```

### Why Both Versions Are Included

The v2 results are preserved in `results/v2_original/` and `experiments/v2_original/`.
They document the research journey and show how the bug was identified. The scaffold
array framework that led to the discovery is itself a methodological contribution.

**All quantitative v2 results are incorrect.** The qualitative structure (scaffold
arrays, per-shell analysis, perturbation sensitivity) remains valid as methodology.

---

## Repository Structure

```
solvers/
├── v2/triad_kernel_v2.c       # BROKEN — missing -i factor (preserved for history)
└── v3/triad_kernel_v3.c       # CORRECT — complex coefficients, exact energy conservation

validation/
├── ns_galerkin_3d.py           # Independent Python implementation (NumPy)
├── dedalus_ns_test.py          # scipy RK45 cross-validation
├── taylor_green_test.c         # Analytical test case (known exact solution)
└── interval_verify.c           # Formal verification (determinism, multiple ICs)

experiments/
├── v2_original/                # Historical experiments (v2 solver, energy bug)
│   ├── experiment_parametric.c
│   ├── experiment_phi_vs_alpha.c
│   ├── experiment_crossval.c
│   └── ...
└── v3_final/                   # Correct experiments (v3 solver)
    ├── experiment_energy_audit.c
    ├── experiment_adaptive_n.c
    ├── experiment_tipping_point.c
    ├── experiment_crossshell_transfer.c
    ├── experiment_scaffold_array.c
    └── experiment_multi_array.c

results/
├── v2_original/                # 23 result files from v2 solver
└── v3_final/                   # Results from corrected v3 solver
```

---

## Prerequisites

### For C experiments
```bash
# Any C99 compiler (gcc, clang)
gcc --version   # or clang --version
```

### For Python validation
```bash
pip install numpy scipy
python3 --version   # Python 3.7+
```

---

## Quick Start: Verify the Central Claim

### Step 1: Verify Energy Conservation

```bash
# Build the v3 kernel and energy audit
cd solvers/v3
gcc -O3 -c triad_kernel_v3.c -o kernel.o

cd ../../experiments/v3_final
gcc -O3 -c experiment_energy_audit.c -o audit.o
gcc -O2 audit.o ../../solvers/v3/kernel.o -o run_audit -lm

./run_audit
```

**Expected:** At ν=0, energy drift < 0.02% at all N (Euler truncation only).
At ν>0, energy DECREASES at every N. Compare with v2 which showed energy
INCREASING at N≥6.

### Step 2: Verify with Independent Python Implementation

```bash
cd ../../validation
python3 ns_galerkin_3d.py
```

**Expected:**
- `Σ conj(û)·NL = +0.000000e+00` at all N (energy conserved)
- Energy decreases at ν > 0
- Divergence-free condition preserved to 1e-16

### Step 3: Cross-validate with scipy RK45

```bash
python3 dedalus_ns_test.py
```

**Expected:**
- E(0) matches between Python Galerkin and scipy to all digits
- E(T) matches within time-stepping error (~1e-5 relative)
- NL energy rate = 0 in both implementations

### Step 4: Verify Against Analytical Solution

```bash
cd ../../experiments/v3_final
gcc -O3 -c ../../validation/taylor_green_test.c -o tg.o
gcc -O2 tg.o ../../solvers/v3/kernel.o -o run_tg -lm

./run_tg
```

**Expected:** Energy decay matches exp(-6νt) to 1e-7 relative error.

### Step 5: Run Adaptive Truncation (Cascade Stabilisation)

```bash
gcc -O3 -c experiment_adaptive_n.c -o adaptive.o
gcc -O2 adaptive.o ../../solvers/v3/kernel.o -o run_adaptive -lm

./run_adaptive
```

**Expected:** At A=0.1, ν=0.01: N stabilises at ~10-12, energy monotonically
decreases, enstrophy bounded at ~0.9.

**Note:** This experiment includes calls to `c3d_enforce_symmetry()` after
setting initial conditions. If using the raw experiment code from v2_original,
add `extern int64_t c3d_enforce_symmetry(void);` and call it after all
`c3d_apply_state()` calls.

### Step 6: Run Scaffold Array Contraction Test

```bash
gcc -O3 -c experiment_tipping_point.c -o tipping.o -DPARAM_N_MAX=8
gcc -O2 tipping.o ../../solvers/v3/kernel.o -o run_tipping -lm

./run_tipping
```

**Expected:** All contraction ratios ρ < 1 at every amplitude through A=0.35.

---

## Reproducing the v2 Bug (For Verification)

To confirm the energy conservation failure in v2:

```bash
cd solvers/v2
gcc -O3 -c triad_kernel_v2.c -o kernel_v2.o

cd ../../experiments/v3_final
gcc -O3 -c experiment_energy_audit.c -o audit.o
gcc -O2 audit.o ../../solvers/v2/kernel_v2.o -o run_audit_v2 -lm

./run_audit_v2
```

**Expected:** At ν=0, energy drift of +1% to +15% (dt-independent).
At ν>0, energy INCREASES at N≥6. This confirms the bug.

---

## Parameter Reference

| Parameter | Symbol | Typical Value | Notes |
|-----------|--------|---------------|-------|
| Viscosity | ν | 0.01 | Range: 0.001 – 0.1 |
| Time step | dt | 0.0001 | Adjusted for stability |
| Amplitude | A | 0.1 | Range: 0.05 – 1.0 |
| Max wavenumber | N_max | 8 | v3: tested 2–20 |
| Domain | — | T³ = [0, 2π]³ | Periodic torus |

---

## Validation Summary

| Method | Implementation | Result |
|--------|---------------|--------|
| Energy conservation | C v3 | Σ Re(conj(û)·NL) = 0.0 at all N |
| Energy conservation | Python | Σ conj(û)·NL = 0.0 at all N |
| Cross-validation | C vs Python | E(0) agrees to 1e-8 relative |
| High-accuracy ODE | scipy RK45 | E(0) exact match, E(T) within 9e-6 |
| Analytical solution | Taylor-Green | exp(-6νt) matched to 1e-7 |
| Determinism | Interval verify | Bit-exact across runs |
| Divergence-free | All | |k·û| < 1e-16 preserved |

---

## Key Results (v3 Solver)

### Cascade Stabilisation
At A=0.1, ν=0.01: the cascade reaches wavenumber N=10-12 and stabilises.
Energy decreases monotonically (0.266 → 0.172, -35%). Enstrophy bounded at ~0.8.

### All Contraction Ratios Pass
At N_max=8: energy ρ < 0.33, enstrophy ρ < 0.36, shell η ρ < 0.81
at all amplitudes through A=0.31.

### v2 vs v3 Comparison (A=0.1, ν=0.01, T=1.4)
| Metric | v2 (broken) | v3 (correct) |
|--------|-------------|--------------|
| N_active | 14 (at ceiling) | 10 (stable) |
| Energy | 298 (+11,600%) | 0.188 (-23%) |
| Enstrophy | 50,130 | 0.86 |
| E_top/E | 4.2% (growing) | 1e-7 (negligible) |

---

## Documentation

- `BREAKTHROUGH.md` — Discovery chain: v2 bug → v3 fix → cascade stabilisation
- `DISCUSSION.md` — Full research reasoning (19 topics)
- `FINDINGS.md` — All data tables with version annotations
- `SUMMARY.md` — Overall status and experiment inventory

---

## License

CC BY 4.0 — Creative Commons Attribution 4.0 International

## Author

Rod Higgins — [Senuamedia](https://senuamedia.com)
