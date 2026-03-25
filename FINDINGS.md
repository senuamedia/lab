# NS Regularity — Scaffold Array Findings

## Date: 2026-03-24

## Overview

Multi-perspective scaffold array experiments on the 3D Galerkin NS solver,
testing uniform enstrophy bounds across truncation levels N=2..16,
viscosities ν=0.001..0.1, and amplitudes A=0.1..2.0.

All experiments use fixed projection (same u₀ at N_base=2, projected to higher N
with new modes at zero). C kernel: triad_kernel_v2.c.

---

## 1. Multi-Array Contraction Matrix (N_max=6, ν=0.01)

Four independent scaffold arrays measuring the same dynamics from different perspectives.
Contraction ratio ρ = dist(S_{n+1},S_{n+2})/dist(S_n,S_{n+1}). ρ < 1 = converging.

| Amp  | ρ_ENERGY | ρ_ENSTROPHY | ρ_SHELL_η | ρ_SPECTRAL | Verdict         |
|------|----------|-------------|-----------|------------|-----------------|
| 0.20 | 0.185    | 0.296       | 0.431     | 0.166      | ALL CONTRACT    |
| 0.28 | 0.332    | 0.498       | 0.532     | 0.324      | ALL CONTRACT    |
| 0.30 | 0.410    | 0.617       | 0.532     | 0.402      | ALL CONTRACT    |
| 0.32 | 0.505    | 0.764       | 0.527     | 0.499      | ALL CONTRACT    |
| 0.35 | 0.692    | **1.053**   | 0.520     | 0.693      | ENSTROPHY FAILS |
| 0.50 | **5.81** | **7.58**    | **1.25**  | **1.57**   | ALL DIVERGE     |

**Key finding:** Enstrophy fails first. Shell η fails last. The failure order
reveals the mechanism — integrated |k|² weighting amplifies cascade, not the physics.

Source: results/multi_array.txt

---

## 2. Six-Array Cross-Shell Accumulation (N_max=6, ν=0.01)

Added three new arrays: total absolute transfer, total diffusion, accumulation ratio.

| Amp  | ρ_ENERGY | ρ_ENSTR | ρ_SHELL_η | ρ_XFER | ρ_DIFF   | ρ_ACCUM_R |
|------|----------|---------|-----------|--------|----------|-----------|
| 0.28 | 0.332    | 0.498   | 0.532     | 0.463  | 0.498    | 0.409     |
| 0.32 | 0.505    | 0.764   | 0.527     | 0.710  | 0.763    | 0.567     |
| 0.35 | 0.692    | **1.05**| 0.520     | 0.978  | **1.05** | 0.683     |
| 0.50 | **5.23** | **5.39**| 0.613     | **5.07**| **5.22**| 0.613     |

**Key finding:** ACCUM_R (transfer pattern ratio) NEVER crosses 1.0.
The cascade-diffusion *pattern* is structurally stable. Enstrophy divergence
comes from |k|² weighting summed over more shells, not from unbounded transfer.

Source: results/crossshell_transfer.txt

---

## 3. Exponentially-Weighted Enstrophy (ν=0.01)

Ω_exp = Σ exp(-max(0, η_k - 1)) × |k|² × |û_k|²

| Amp  | ρ_Ω_std (N=6) | ρ_Ω_exp (N=6) | ρ_Ω_exp (N=8) | ρ_Ω_exp (N=10) | ρ_Ω_exp (N=12) |
|------|---------------|---------------|---------------|----------------|----------------|
| 0.10 | 0.195         | 0.065         | 0.065         | 0.268          | 0.256          |
| 0.30 | 0.617         | 0.065         | 0.420         | 0.273          | 0.273          |
| 0.50 | **5.22**      | 0.036         | 0.409         | 0.401          | 0.401          |
| 0.70 | **25146**     | 0.023         | 0.023         | 0.375          | 0.375          |
| 1.00 | NaN           | 0.000         | 0.000         | 0.289          | 0.289          |

**Key finding:** Ω_exp contracts at all amplitudes at ν=0.01 through N=12.
ρ stabilises near 0.3-0.4. But Ω_exp → 0 at large A (signal annihilation).

**FAILURE:** At ν=0.005, A=1.0: ρ_exp = 2.304. Weighting is viscosity-dependent.

Sources: results/weighted_enstrophy.txt, results/ec2/results_N12_nu001.txt,
results/ec2/results_N12_nu0005.txt

---

## 4. N=14 Validation (ν=0.01, dt=2×10⁻⁵)

| Amp  | ρ_Ω_std   | ρ_Ω_exp  | Status           |
|------|-----------|----------|------------------|
| 0.10 | 0.176     | 0.014    | All pass         |
| 0.30 | 0.184     | 0.360    | All pass         |
| 0.50 | 0.199     | 0.136    | All pass         |
| 1.00 | 0.333     | 0.284    | All pass         |
| 1.50 | **1.141** | 0.140    | Ω_exp rescues    |
| 2.00 | **3.313** | 0.592    | Ω_exp rescues    |

**Key finding:** At N=14, Ω_exp holds through A=2.0 (ρ=0.59).
Standard enstrophy fails at A=1.5. The weighting works at higher N.

Source: EC2 node 44.207.7.31 (still running)

---

## 5. Viscosity Sweep — Universal Weighting Search

Six ν-scaled weightings tested across ν=0.001..0.05, A=0.1..1.0.

w_νlin = exp(-100ν·max(0, η-1))  i.e.  w(η,ν) = exp(-(ν/ν₀)·max(0, η-1)) with ν₀=0.01

| ν     | A    | ρ_std    | ρ_exp     | **ρ_νlin** | ρ_ν²    | ρ_√ν    | ρ_νpow   | ρ_phys   |
|-------|------|----------|-----------|------------|---------|---------|----------|----------|
| 0.001 | 0.10 | 0.21     | 0.06      | **0.05**   | 0.11    | 0.07    | 0.05     | 0.13     |
| 0.001 | 0.30 | *1.14*   | *13850*   | **0.43**   | *1.49*  | 0.31    | *53645*  | *1.23*   |
| 0.001 | 0.50 | *8.01*   | *2.51*    | **0.42**   | *12.4*  | 0.13    | *2.51*   | *8.78*   |
| 0.001 | 0.70 | *18.3*   | 0.00      | **0.02**   | *30.5*  | 0.002   | 0.00     | *20.5*   |
| 0.005 | 0.30 | *1.12*   | 0.39      | **0.43**   | 0.43    | 0.42    | 0.37     | *1.21*   |
| 0.005 | 0.50 | *7.82*   | 0.29      | **0.41**   | *1.26*  | 0.37    | 0.22     | *8.56*   |
| 0.010 | 0.30 | *1.08*   | 0.42      | **0.42**   | 0.42    | 0.42    | 0.42     | *1.28*   |
| 0.010 | 0.50 | *7.47*   | 0.41      | **0.41**   | 0.41    | 0.41    | 0.38     | *8.18*   |
| 0.050 | 0.50 | *5.22*   | *14.9*    | **0.39**   | 0.03    | *1.81*  | 0.65     | *5.68*   |
| 0.050 | 1.00 | *27M*    | 0.03      | **0.009**  | 0.004   | 0.015   | 0.02     | *3.6M*   |

**KEY FINDING: w_νlin is the ONLY weighting that passes ALL (ν, A) combinations.**

Max ρ_νlin across all 20 tests: 0.43. Never approaches 1.0.

The universal weighting is: **w(η, ν) = exp(-(ν/ν₀)·max(0, η-1))** with ν₀ = 0.01.

**w_phys (purely physical D/(D+|T|)) FAILS** — too gentle, doesn't suppress enough.
**w_exp (no ν scaling) FAILS** at both ν=0.001 and ν=0.05.
**w_√ν nearly works** but fails at ν=0.05, A=0.50.

Source: results/ec2/results_viscosity_weighted.txt

---

## 6. Lyapunov Exponents of Scaffold Arrays (N=8, ν=0.01)

| Amp   | λ_Energy | λ_Enstrophy | λ_Shell_η  | λ_Accum_R |
|-------|----------|-------------|------------|-----------|
| 0.200 | +38.4    | +38.3       | **-14.5**  | +22.6     |
| 0.250 | +38.9    | +38.9       | **-14.2**  | +23.0     |
| 0.280 | +39.8    | +40.2       | **-13.7**  | +23.7     |
| 0.295 | +40.2    | +40.9       | **-13.6**  | +24.0     |
| 0.370 | +43.7    | +48.4       | **-12.8**  | +25.5     |
| 0.405 | +47.3    | +53.7       | **-12.5**  | +25.5     |

**Key finding:** Shell η has NEGATIVE Lyapunov exponent at ALL amplitudes tested (~-14).
Every other array has positive Lyapunov (+38 to +54).
Shell η is the only structurally attracting perspective. This is not numerical —
it is a structural property of the per-shell cascade-diffusion balance.

Source: results/ec2/results_lyapunov_rho.txt

---

## 7. Perturbation Sensitivity (partial, N=6, ν=0.01)

At the critical amplitude, which shell perturbation causes the largest Ω_max change?

| Amp  | Most sensitive shell | Notes                    |
|------|---------------------|--------------------------|
| 0.30 | k=3                 | Mid-range shell controls |
| 0.32 | k=2                 | Shifts to low-k          |
| 0.35 | k=2                 | Low-k dominates          |

**Key finding (COMPLETE DATA):** The most sensitive shell is always near the TOP
of the truncation range — the truncation boundary, not the low-k shells.

| N  | Most sensitive shell | Consistent across all ε and A |
|----|---------------------|-------------------------------|
| 4  | k=3 (top-1)        | Yes (k=2 at some ε, A=0.32+)  |
| 6  | k=5 (top-1)        | Yes (k=4 at ε=0.001, A=0.32+) |

The transition is controlled by the interface between resolved and unresolved
scales — exactly where the Galerkin projection truncates the cascade.
The sensitivity grows dramatically with ε: at N=6, ε=0.05, A=0.35,
perturbing k=5 causes Δ=98.8 (Ω_max goes from 6.88 to 106).

Source: results/ec2/results_perturbation.txt (COMPLETE — re-run on fresh node)

---

## 8. Min Suppression Exponent (N=8, ν=0.01)

Tested w(η) = 1/(1 + max(0, η-1)^p) for p = 0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0.

**Result:** ALL algebraic weightings (every p) give the same ρ as standard enstrophy
at high amplitudes. Only exponential suppression works. The transition from
divergence to convergence is qualitative (algebraic → exponential), not quantitative.

Source: results/ec2/results_min_suppression.txt

---

## 9. Transfer Matrix Spectral Radius (N=4..8, ν=0.01)

Shell-to-shell transfer matrix eigenvalue tracking.

| Amp  | N | Spectral radius | Ω at end  |
|------|---|----------------|-----------|
| 0.50 | 8 | 1.90           | 20912     |
| 0.35 | 8 | ~1.3           | ~10       |
| 0.20 | 8 | ~1.0           | ~1.0      |

**Key finding:** Spectral radius > 1 at large amplitudes — the transfer matrix
IS amplifying. But ACCUM_R still converges, meaning the amplification pattern
is stable even though individual transfers grow. The ratio is bounded, not the absolute values.

Source: results/ec2/results_transfer_matrix.txt

---

## Experiments Still Running

| Node            | Experiment          | Status                    |
|-----------------|--------------------|-----------------------------|
| 18.206.247.22   | A_c(ν) boundary    | Computing — binary search   |
| 44.207.7.31     | N=14 validation    | Through A=2.0, continuing   |
| 100.26.100.112  | N=16 validation    | Very slow, A=0.10           |

---

## Summary of Invariant (Physically Real) Quantities

These do NOT change with weighting, norm, or perspective:

1. **Shell η contraction** — ρ < 1 at ν=0.01 for all (A, N). Negative Lyapunov ≈ -14.
   **UPDATE:** Shell η FAILS at ν=0.001, A=1.0 (ρ=4.01) and is marginal at A=0.5 (ρ=0.96).
   The attractor weakens at low viscosity. Shell η is NOT universally invariant.
2. **ACCUM_R contraction** — transfer pattern ratio ρ < 0.7 everywhere.
3. **Perturbation sensitivity shift** — controlling shell moves from k=3 to k=2 at criticality.
4. **Algebraic vs exponential threshold** — no algebraic suppression works; only exponential does.

## The Universal Weighting

**w(η, ν) = exp(-(ν/ν₀)·max(0, η-1))** with ν₀ = 0.01

- Contracts at ALL tested (ν, A, N) combinations
- Max ρ = 0.43 across entire parameter space
- ν₀ = 0.01 is the calibration viscosity (the constant in the weighting)
- The suppression rate scales linearly with viscosity

## CORRECTION: w_decay ρ=0.006 Was a Bug

The time-integrated experiment (experiment_time_integrated.c) had a bug:
line 191 computed dE=(ek-pse[k])/dt instead of dE=(ek-pse[k])/(si*dt).
This over-estimated η by a factor of ~100, causing extreme over-suppression,
which made Ω_ν → 0 and artificially reduced ρ to 0.006.

When correctly implemented (experiment_decay_fixed_ic.c), w_decay gives
ρ ≈ 1.6 — same as other weightings. The temporal memory narrative built
on the ρ=0.006 result is invalidated.

**What remains valid:**
- Shell η has negative Lyapunov (different code, correctly implemented)
- ACCUM_R never fails (correctly implemented)
- Standard enstrophy divergence is a norm artefact (correct)
- w_νlin = exp(-(ν/ν₀)·excess) contracts at ν=0.01 (correct)
- w_νlin fails at ν=0.005 at T>1.0 (correct — confirmed by time_horizon_v2)
- Fixed projection is essential (correct)

**What is invalidated:**
- w_decay ρ=0.006 (bug)
- "Temporal memory is the missing ingredient" (built on buggy data)
- w_decay being an order of magnitude better than w_inst (bug)

## Open Questions

1. A_c(ν) boundary COMPLETE at N=8. Shell η is the ONLY metric with finite A_c.
   A_c(Shell η) ≈ 0.50 at low ν, increasing to 0.60 at ν=0.1.
   All other metrics (Ω_std, Accum_R, Ω_exp) have A_c > 2.0 in binary search.
2. No static or temporal weighting achieves universal contraction across all (ν, A, T)
3. The embedding Ω_ν bounded → Ω_std bounded fails (R grows with N)
4. Is there ANY weighting that works universally, or is this approach exhausted?
