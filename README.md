# Senuamedia Lab — Scaffold Array Diagnostics

Multi-perspective diagnostic framework for dynamical systems. The scaffold array measures the same system from multiple perspectives simultaneously and uses cross-perspective contraction ratios to diagnose convergence, stability, and failure modes.

Applied to fluid dynamics (NS, Euler, SQG, MHD) and learning dynamics (neural gates). All code is pure C with no dependencies beyond the standard library.

## Domain Spaces

```
domains/
├── navier-stokes/     # 3D NS regularity (Paper 3) — ν > 0, cascade stabilisation
├── euler/             # 3D Euler blow-up question (Paper 4) — ν = 0, inviscid cascade
├── sqg/               # Surface quasi-geostrophic (Paper 4) — 2D analogue of 3D NS
├── mhd/               # Magnetohydrodynamics (Paper 4) — coupled NS + Maxwell
├── neural-gates/      # Neural gate dynamics — learning convergence diagnostics
└── uat/               # Unified Adaptation Theorem (Paper 1) — convergence framework
```

## Papers

- [Paper 1: Unified Adaptation Theorem](https://doi.org/10.5281/zenodo.19149831)
- [Paper 2: NS Regularity Scaffold](https://doi.org/10.5281/zenodo.19155497)
- [Paper 3: Global Regularity of 3D Navier-Stokes](https://zenodo.org/records/19216332)
- [Paper 4: Cross-Domain Scaffold (Euler, SQG, MHD)](https://zenodo.org/records/19230481)

## Legacy Structure

The root directory contains the original flat experiment files from Papers 1-3.
New work uses the `domains/` structure.

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
├── interval_verify.c           # Formal verification (determinism, multiple ICs)
├── framework_comparison.c      # Controlled v2/v3 test of 4 published analytical frameworks
└── ns_solver_v3_variant.c      # 4th independent solver (RK4, direct summation, hash lookup)

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
├── v3_final/                   # Results from corrected v3 solver
├── universality/               # 16-configuration universality sweep
└── framework_comparison/       # v2 vs v3 framework diagnostic results
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

### Step 6: Run Framework Comparison (v2 vs v3)

```bash
cd ../../validation
gcc -O3 -o framework_comparison framework_comparison.c -lm
./framework_comparison
```

**Expected:** v3 passes all energy conservation diagnostics (NL rate = 0, Σ T_K = 0).
v2 fails all of them (NL rate = +3.4e3, energy grows 74×, enstrophy blows up 128×).

### Step 7: Verify with Fourth Independent Solver

```bash
gcc -O3 -o ns_solver_v3_variant ns_solver_v3_variant.c -lm
./ns_solver_v3_variant
```

**Expected:** Energy decreasing, enstrophy bounded, NL rate at machine zero at all
(N, ν) — matching the primary C solver and Python reference despite completely
different code architecture (RK4, direct summation, hash table).

### Step 8: Run Scaffold Array Contraction Test

```bash
gcc -O3 -c experiment_tipping_point.c -o tipping.o -DPARAM_N_MAX=8
gcc -O2 tipping.o ../../solvers/v3/kernel.o -o run_tipping -lm

./run_tipping
```

**Expected:** All contraction ratios ρ < 1 at every amplitude through A=0.35.

---

## Framework Comparison: Why Existing Analytical Approaches Fall Short

A controlled experiment testing four published analytical frameworks against the
v2 (no -i) and v3 (correct -i) solvers. Same IC, same parameters, only difference
is the -i factor.

### Running the Experiment

```bash
cd validation
gcc -O3 -o framework_comparison framework_comparison.c -lm
./framework_comparison
```

### Results (N=4, ν=0.01, A=0.3, T=0.5)

| Diagnostic | v2 (no -i) | v3 (correct -i) |
|-----------|-----------|-----------------|
| Energy rate Σ Re(ū·NL) | +3.41e+03 | +6.03e-17 |
| Shell zero-sum Σ T_K | +3.41e+03 | +2.64e-16 |
| Energy ratio E(T)/E(0) | 74.4× growth | 0.937 decay |
| Enstrophy ratio Ω(T)/Ω(0) | 128× blow-up | 1.05 stable |
| Low-freq vorticity (Bradshaw-Grujić) | 4.28 | 0.38 |
| Spectral variance Σ−Ω²/E | 1.49e+03 | 3.80e+01 |
| Max \|T_K\|/diffusion (Grujić) | 426× | 13.2× |

### Framework Pass/Fail

| Framework criterion | v2 | v3 |
|--------------------|-----|-----|
| Bradshaw-Grujić: low-freq ω bounded | FAIL | PASS |
| Cheskidov-Shvydkoy: finite K_d | FAIL | PASS |
| Energy zero-sum: \|Σ T_K\| < 1e-10 | FAIL | PASS |
| Energy conservation: \|NL rate\| < 1e-10 | FAIL | PASS |

Every framework diagnostic that depends on energy conservation passes with -i and
fails without. The -i factor is the sole structural difference between blow-up and
regularity. Published frameworks that do not use the full -i cancellation structure
are analysing a different equation — one that can blow up.

Results saved in `results/framework_comparison/`.

---

## Fourth Independent Solver (Variant V3)

A deliberately different C implementation to rule out implementation-specific bugs.

### Architecture Differences from Primary V3

| Aspect | Primary v3 | Variant v3 |
|--------|-----------|------------|
| Triad computation | Precomputed, offset arrays | Direct O(N³) summation |
| Mode lookup | Linear scan | Hash table |
| Time integrator | Lie-Trotter (exact diffusion + Euler NL) | Classical RK4 |
| State storage | Interleaved 1D array | 2D array [mode][component] |

Same mathematics: 3D Galerkin NS on T³ with correct -i factor.

### Running

```bash
cd validation
gcc -O3 -o ns_solver_v3_variant ns_solver_v3_variant.c -lm
./ns_solver_v3_variant
```

### Results

All six configurations (N=2,3,4 × ν=0.01,0.001): energy decreasing, enstrophy
bounded, NL rate at machine zero (1e-16 to 1e-19), divergence-free maintained
(1e-16). Agrees with primary C solver and Python reference.

Four independent implementations, four architectures, same conclusions.

Results saved in `results/framework_comparison/variant_solver_run.txt`.

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
| Viscosity | ν | 0.01 | Tested: 10⁻⁵ – 10⁻² |
| Time step | dt | 0.0001 | CFL-based, auto-selected |
| Amplitude | A | 0.3 | Tested: 0.1 – 10.0 |
| Max wavenumber | N_max | 8 | v3: tested 2–30 (adaptive) |
| Domain | — | T³ = [0, 2π]³ | Periodic torus |
| IC families | — | 6 types | distributed, TG, concentrated, 3× random |

---

## Validation Summary

| Method | Implementation | Result |
|--------|---------------|--------|
| Energy conservation | C v3 (primary) | Σ Re(conj(û)·NL) = 0.0 at all N |
| Energy conservation | C v3 (variant, RK4) | NL rate = 1e-16 to 1e-19 at all N |
| Energy conservation | Python | Σ conj(û)·NL = 0.0 at all N |
| Cross-validation | C vs Python | E(0) agrees to 1e-8 relative |
| High-accuracy ODE | scipy RK45 | E(0) exact match, E(T) within 9e-6 |
| Analytical solution | Taylor-Green | exp(-6νt) matched to 1e-7 |
| Determinism | Interval verify | Bit-exact across runs |
| Divergence-free | All | |k·û| < 1e-16 preserved |
| Framework comparison | C (standalone) | 4/5 frameworks pass v3, 0/5 pass v2 |

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

### Framework Diagnostic Comparison (N=4, ν=0.01, A=0.3, T=0.5)
Four published frameworks tested against both solvers:
- **Bradshaw-Grujić (2017):** FAIL v2, PASS v3
- **Cheskidov-Shvydkoy (2014):** FAIL v2, PASS v3
- **Energy zero-sum:** FAIL v2, PASS v3
- **Energy conservation:** FAIL v2, PASS v3

The -i factor is the sole difference. Every framework that depends on energy
conservation structure passes with -i and fails without.

### Implementation Independence
Four solvers, four architectures, same conclusions:
1. **C primary** (triad_kernel_v3.c) — precomputed triads, Lie-Trotter
2. **C variant** (ns_solver_v3_variant.c) — direct summation, RK4, hash lookup
3. **Python** (ns_galerkin_3d.py) — NumPy, explicit loops
4. **scipy** (dedalus_ns_test.py) — RK45 adaptive integrator

---

## Universality Verification (Paper 3, Section 9)

The computer-assisted proof requires that the cascade bound C_s ≤ constant and the exponent γ < 2 hold across all parameters. A sweep of 29 configurations verifies this:

### Running the Universality Sweep

```bash
# Build
cd solvers/v3
gcc -O3 -c triad_kernel_v3.c -o kernel.o

# Run a single config (example: ν=0.001, A=0.3, distributed IC)
cd ../../experiments/v3_final
gcc -O3 -c experiment_universality.c -o exp.o \
    -DPARAM_NU=0.001 -DPARAM_AMP=0.3 -DPARAM_IC_TYPE=0 \
    -DPARAM_N_MAX=8 -DPARAM_N_CEILING=20
gcc -O2 exp.o ../../solvers/v3/kernel.o -o run -lm
./run
```

### Parameters

| Flag | Values tested | Description |
|------|--------------|-------------|
| `PARAM_NU` | 0.00001, 0.0001, 0.001, 0.01 | Viscosity (3 orders of magnitude) |
| `PARAM_AMP` | 0.1, 0.3, 0.5, 1.0, 2.0, 5.0, 10.0 | Amplitude (2 orders of magnitude) |
| `PARAM_IC_TYPE` | 0-5 | 0=distributed, 1=Taylor-Green, 2=concentrated, 3-5=random seeds |
| `PARAM_N_MAX` | 8 | Galerkin truncation level |
| `PARAM_N_CEILING` | 20-30 | Adaptive N ceiling |

### IC types
- **0 (distributed):** Energy decays as 1/|k|, divergence-free, deterministic phases
- **1 (Taylor-Green):** Classical Taylor-Green vortex, energy at |k|²=3
- **2 (concentrated):** All energy in shell |k|=2
- **3,4,5 (random):** Random divergence-free fields with seeds 42, 137, 271

### What each run measures
- **C_s** = max_{k,t} |T_k| / (E · k^{3/2}) — the simple bound constant
- **C_L** = max_{k,t} |T_k| / (E · Ω^{1/2} · k^{0.5}) — the lemma bound constant
- **γ** = fitted cascade power-law exponent (need γ < 2)
- **Ω_max** = maximum enstrophy (need bounded)
- **N_stable** = adaptive N stabilisation point (need finite)

### Running the full sweep on AWS

```bash
# Launch 7 EC2 c5.2xlarge instances, then:
bash deploy/launch_universality.sh IP1 IP2 IP3 IP4 IP5 IP6 IP7

# Collect results:
bash deploy/collect_universality.sh IP1 IP2 IP3 IP4 IP5 IP6 IP7
```

Results are written to `results/universality/`.

---

## Neural Gate Scaffold Array

The scaffold array methodology applied to learning dynamics. A neural gate
is a sigmoid decision unit that learns its branching policy via gradient
descent. The scaffold measures convergence across learning rate perspectives.

### Quick Start

```bash
cd domains/neural-gates

# Build
gcc -O3 -c gate_solver.c -o gate_solver.o
gcc -O3 -c experiments/experiment_gate_scaffold.c -o exp.o
gcc -O2 exp.o gate_solver.o -o gate_scaffold -lm

# Run (completes in seconds)
./gate_scaffold
```

**Expected output:**
- 7 learning rates (η = 0.001 to 1.0) trained on linearly separable 2D data
- Contraction ratios for 5 diagnostic families (loss, weights, gradients, activations)
- Gradient cascade exponent γ at each η (should be negative = self-regularising)
- Final state comparison (do all η converge to the same decision?)

### Hard Cases (failure mode diagnostics)

```bash
gcc -O3 -c experiments/experiment_gate_hard_cases.c -o hard.o
gcc -O2 hard.o gate_solver.o -o gate_hard -lm

./gate_hard
```

Runs four experiments:
1. **XOR data** — impossible for a single gate. Scaffold should show healthy failure (all ρ < 1, γ ≈ -9).
2. **Concentric circles** — impossible. Same healthy failure pattern.
3. **Extreme η** (1 to 100) — should show instability (all ρ > 1).
4. **Standard η** (baseline) — function converges, weights don't (mixed pattern).

The scaffold produces **four different diagnostic patterns** for these four cases, confirming it discriminates between convergence, healthy failure, over-parameterisation, and instability.

### Key Finding: γ < 0 Across Domains

| Domain | γ | What it measures |
|--------|---|-----------------|
| Navier-Stokes (ν > 0) | -1.5 | Energy cascade across wavenumbers |
| Euler (ν = 0) | -1.7 | Inviscid cascade |
| SQG (critical) | -2.0 | 2D quasi-geostrophic cascade |
| MHD (kinetic) | -0.4 | Velocity cascade in MHD |
| **Neural gate** | **-0.1 to -9.2** | **Gradient cascade across iterations** |

The cascade exponent is negative in every domain tested. The system self-regularises whether it's fluid dynamics or learning dynamics.

### Source Files

| File | Description |
|------|------------|
| `gate_solver.c` | Neural gate: sigmoid forward, BCE loss, exact gradient, SGD, trajectory recording |
| `experiments/experiment_gate_scaffold.c` | Scaffold across 7 learning rates, contraction ratios, γ measurement |
| `experiments/experiment_gate_hard_cases.c` | XOR, circles, extreme η — failure mode diagnostics |
| `results/scaffold_run.txt` | Baseline scaffold output |
| `results/hard_cases.txt` | Hard case diagnostic output |

All pure C. No dependencies beyond `math.h`. Compiles with gcc or clang.

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
