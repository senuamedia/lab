#!/usr/bin/env python3
"""
Rock-pool v3: universal coupled (E_K, Ω_K) telegraph PDE fitted to
1D Burgers, 2D NS, and 3D NS cascade data.

The model ansatz — one family of equations for all three dimensions,
only the fitted coefficients depend on d:

    ∂_t E_K  = -(J^E_K - J^E_{K-1}) - ν K² E_K
    ∂_t J^E_K = c_E² (1 + β_E E_K)(E_{K+1} - E_K) - γ_E J^E_K

    ∂_t Ω_K  = -(J^Ω_K - J^Ω_{K-1}) - 2 ν K² Ω_K + σ · K · √(E_K Ω_K)
    ∂_t J^Ω_K = c_Ω² (1 + β_Ω Ω_K)(Ω_{K+1} - Ω_K) - γ_Ω J^Ω_K

Notes:
  - c_E is *signed*. Fitting will return c_E² positive for forward
    cascade, **negative** (interpreted as cascade toward low K) in 2D.
  - σ = vortex-stretching cross-coupling.  Predicted: ~0 in 2D,
    > 0 in 3D, N/A in 1D (no Ω observable; we fix σ=0 and drop the Ω
    equation for 1D fits).
  - Fluxes J^E, J^Ω start at zero; reflecting at K = K_max and no flux
    at K = 0 (closed system).
  - Viscous term uses −νK²E_K and −2νK²Ω_K (the factor 2 is correct
    for Ω = ½|ω̂|² which dissipates at twice the rate of ½|û|²).

Optimiser: differential evolution (global) → L-BFGS-B (polish).
"""
import sys, os, time, json, glob, warnings
import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import differential_evolution, minimize
warnings.filterwarnings('ignore')
np.seterr(all='ignore')

def flush(s): print(s); sys.stdout.flush()

# ============================================================
# Data loading
# ============================================================
DATASETS = {
    '1D': '/Users/rod/code/ns-proof/results/cascade_wave_1d.npz',
    '2D': '/Users/rod/code/ns-proof/results/cascade_wave_2d.npz',
    '3D': '/Users/rod/code/ns-proof/results/cascade_wave.npz',
}

def load_all():
    out = {}
    for d, path in DATASETS.items():
        if not os.path.exists(path):
            flush(f"  WARNING: {path} missing, skipping {d}")
            continue
        data = np.load(path)
        out[d] = {}
        for label in ['A', 'B', 'C', 'D']:
            if f'{label}_t' not in data.files:
                continue
            out[d][label] = dict(
                t      = data[f'{label}_t'],
                E_K    = data[f'{label}_E_K'],
                Om_K   = data[f'{label}_Om_K'] if f'{label}_Om_K' in data.files else None,
                K_list = data[f'{label}_K_list'],
            )
    return out

# ============================================================
# Model
# ============================================================
def rhs_full(t, y, params, nu, n, include_omega):
    """
    State layout (include_omega=True):
        [E_1..E_n, JE_1..JE_n, Ω_1..Ω_n, JΩ_1..JΩ_n]  length 4n
    include_omega=False:
        [E_1..E_n, JE_1..JE_n]                          length 2n
    """
    c_E, gE, bE, c_Om, gO, bO, sigma = params
    K = np.arange(1, n+1, dtype=float)

    E  = y[0:n]
    JE = y[n:2*n]
    # Bounds safety
    E_pos = np.maximum(E, 0.0)

    # E equation
    JE_prev = np.concatenate([[0.0], JE[:-1]])          # no-flux at K=0
    E_next  = np.concatenate([E[1:], [E[-1]]])          # reflecting at K=n
    dE  = -(JE - JE_prev) - nu * K*K * E
    dJE = (c_E*abs(c_E)) * (1.0 + bE * E_pos) * (E_next - E) - gE * JE
    #   c_E*|c_E| preserves sign of c_E while giving c_E² magnitude.

    dy = np.empty_like(y)
    dy[0:n]   = dE
    dy[n:2*n] = dJE

    if include_omega:
        Om  = y[2*n:3*n]
        JOm = y[3*n:4*n]
        Om_pos = np.maximum(Om, 0.0)
        JOm_prev = np.concatenate([[0.0], JOm[:-1]])
        Om_next  = np.concatenate([Om[1:], [Om[-1]]])
        stretch = sigma * K * np.sqrt(E_pos * Om_pos)
        dOm  = -(JOm - JOm_prev) - 2.0 * nu * K*K * Om + stretch
        dJOm = (c_Om*abs(c_Om)) * (1.0 + bO * Om_pos) * (Om_next - Om) - gO * JOm
        dy[2*n:3*n] = dOm
        dy[3*n:4*n] = dJOm

    return dy

def simulate(params, y0, t_eval, nu, n, include_omega):
    rhs = lambda t, y: rhs_full(t, y, params, nu, n, include_omega)
    sol = solve_ivp(rhs, [t_eval[0], t_eval[-1]], y0,
                    t_eval=t_eval, method='RK45',
                    rtol=1e-3, atol=1e-6, max_step=0.05)
    return sol

def subsample_exp(exp, n_keep=80):
    """Reduce time-series length so DE fits finish in reasonable time."""
    t = exp['t']
    if len(t) <= n_keep:
        return exp
    idx = np.linspace(0, len(t)-1, n_keep).astype(int)
    out = dict(exp)
    out['t'] = t[idx]
    out['E_K'] = exp['E_K'][idx]
    if exp.get('Om_K') is not None:
        out['Om_K'] = exp['Om_K'][idx]
    return out

def build_y0(exp, include_omega):
    E0 = exp['E_K'][0].copy()
    n = E0.size
    y0 = np.zeros(2*n if not include_omega else 4*n)
    y0[0:n] = E0
    # Fluxes start at zero
    if include_omega and exp['Om_K'] is not None:
        y0[2*n:3*n] = exp['Om_K'][0]
    return y0, n

def residual(params, exp, nu, include_omega, weights=None):
    y0, n = build_y0(exp, include_omega)
    t = exp['t']
    try:
        sol = simulate(params, y0, t, nu, n, include_omega)
    except Exception:
        return 1e10
    if not sol.success:
        return 1e10
    y = sol.y
    E_sim = y[0:n, :].T
    err = (E_sim - exp['E_K'])**2
    # Scale normalization by E_K rms
    scale_E = np.sqrt(np.mean(exp['E_K']**2)) + 1e-12
    r = np.sum(err) / (scale_E**2)
    if include_omega and exp['Om_K'] is not None:
        Om_sim = y[2*n:3*n, :].T
        errO = (Om_sim - exp['Om_K'])**2
        scale_O = np.sqrt(np.mean(exp['Om_K']**2)) + 1e-12
        r += np.sum(errO) / (scale_O**2)
    return float(r)

def rel_rmse(params, exp, nu, include_omega):
    y0, n = build_y0(exp, include_omega)
    t = exp['t']
    sol = simulate(params, y0, t, nu, n, include_omega)
    if not sol.success:
        return float('inf'), float('inf')
    y = sol.y
    E_sim = y[0:n, :].T
    rms_E = np.sqrt(np.mean((E_sim - exp['E_K'])**2)) / (np.sqrt(np.mean(exp['E_K']**2)) + 1e-12)
    rms_O = float('nan')
    if include_omega and exp['Om_K'] is not None:
        Om_sim = y[2*n:3*n, :].T
        rms_O = np.sqrt(np.mean((Om_sim - exp['Om_K'])**2)) / (np.sqrt(np.mean(exp['Om_K']**2)) + 1e-12)
    return float(rms_E), float(rms_O)

# ============================================================
# Fitting
# ============================================================
PARAM_NAMES = ['c_E', 'γ_E', 'β_E', 'c_Ω', 'γ_Ω', 'β_Ω', 'σ']
# Bounds: c_E signed (negative allowed for inverse cascade)
BOUNDS_3D = [(-5.0, 5.0), (0.0, 20.0), (-2.0, 20.0),
             ( 0.0, 10.0), (0.0, 20.0), (-2.0, 20.0),
             ( 0.0, 5.0)]
BOUNDS_2D = [(-5.0, 5.0), (0.0, 20.0), (-2.0, 20.0),
             ( 0.0, 10.0), (0.0, 20.0), (-2.0, 20.0),
             ( 0.0, 2.0)]   # expect σ ≈ 0
BOUNDS_1D = [(-5.0, 5.0), (0.0, 20.0), (-2.0, 20.0),
             ( 0.0, 0.1), (0.0, 0.1), (-0.1, 0.1),
             ( 0.0, 0.1)]   # Ω not used, fix tight

def get_nu(dim, label):
    """Viscosity per experiment."""
    if dim == '1D':
        return {'A': 1e-4, 'B': 1e-2, 'C': 1e-3, 'D': 1e-3}[label]
    if dim == '2D':
        return {'A': 0.0, 'B': 1e-3, 'C': 1e-4, 'D': 1e-4}[label]
    if dim == '3D':
        return {'A': 0.0, 'B': 0.01, 'C': 0.0, 'D': 0.0}[label]
    return 0.0

def fit_one(dim, label, exp):
    nu = get_nu(dim, label)
    include_omega = (dim != '1D')
    bounds = {'1D': BOUNDS_1D, '2D': BOUNDS_2D, '3D': BOUNDS_3D}[dim]

    # Subsample for optimisation speed; evaluate final RMSE on full grid
    exp_sub = subsample_exp(exp, n_keep=80)
    obj = lambda p: residual(p, exp_sub, nu, include_omega)

    t0 = time.time()
    # Global search (fast settings)
    de = differential_evolution(obj, bounds,
                                 maxiter=30, popsize=8,
                                 tol=1e-4, seed=42, polish=False,
                                 workers=1, init='sobol',
                                 mutation=(0.3, 1.0), recombination=0.8)
    # Local polish on full data
    obj_full = lambda p: residual(p, exp, nu, include_omega)
    res = minimize(obj_full, de.x, method='L-BFGS-B', bounds=bounds,
                   options={'maxiter': 100, 'ftol': 1e-7})
    params = res.x
    elapsed = time.time() - t0
    rE, rO = rel_rmse(params, exp, nu, include_omega)
    return params, rE, rO, elapsed

# ============================================================
# Main
# ============================================================
def main():
    flush("="*78)
    flush("ROCK POOL v3: UNIVERSAL TELEGRAPH FIT (1D / 2D / 3D)")
    flush("="*78)
    flush(f"Model params: {PARAM_NAMES}")
    all_data = load_all()
    for d in ['1D', '2D', '3D']:
        if d not in all_data:
            continue
        flush(f"\n  {d}: experiments {sorted(all_data[d].keys())}, "
              f"n_shells={all_data[d]['A']['E_K'].shape[1] if 'A' in all_data[d] else '?'}")

    results = {}
    for dim in ['1D', '2D', '3D']:
        if dim not in all_data:
            continue
        flush(f"\n{'='*78}\nFitting {dim}\n{'='*78}")
        results[dim] = {}
        for label in sorted(all_data[dim].keys()):
            exp = all_data[dim][label]
            flush(f"\n--- {dim} / Exp {label}  (ν={get_nu(dim,label):.1e}, "
                  f"shells={exp['E_K'].shape[1]}) ---")
            params, rE, rO, elapsed = fit_one(dim, label, exp)
            flush(f"    fit time: {elapsed:.1f}s")
            for name, val in zip(PARAM_NAMES, params):
                flush(f"    {name:>4s} = {val:+.4f}")
            flush(f"    rel_rmse(E) = {rE:.4e}    rel_rmse(Ω) = {rO}")
            results[dim][label] = dict(
                params=params.tolist(),
                rel_rmse_E=rE, rel_rmse_Om=rO,
            )

    # Summary tables
    flush("\n" + "="*78)
    flush("SUMMARY: rel_rmse(E)")
    flush("="*78)
    header = f"{'Dim':<6}" + " ".join(f"{l:<12}" for l in ['A','B','C','D'])
    flush(header); flush("-"*len(header))
    for dim in sorted(results.keys()):
        row = f"{dim:<6}"
        for label in ['A','B','C','D']:
            if label in results[dim]:
                row += f"{results[dim][label]['rel_rmse_E']:<12.4e}"
            else:
                row += f"{'--':<12}"
        flush(row)

    flush("\n" + "="*78)
    flush("SUMMARY: fitted parameters (mean across experiments per dim)")
    flush("="*78)
    flush(f"{'Dim':<6}" + " ".join(f"{n:>10s}" for n in PARAM_NAMES))
    flush("-"*80)
    for dim in sorted(results.keys()):
        if not results[dim]:
            continue
        arr = np.array([results[dim][l]['params'] for l in results[dim]])
        mean = arr.mean(axis=0)
        row = f"{dim:<6}"
        for v in mean:
            row += f" {v:>+10.4f}"
        flush(row)

    out = '/Users/rod/code/ns-proof/results/rock_pool_v3_results.json'
    with open(out, 'w') as f:
        json.dump(results, f, indent=2, default=str)
    flush(f"\nResults saved to {out}")

    # Cross-dimensional predictions (key physics checks)
    flush("\n" + "="*78)
    flush("PHYSICS CHECKS")
    flush("="*78)
    if '2D' in results:
        sigma_2d = np.mean([results['2D'][l]['params'][6] for l in results['2D']])
        cE_2d = np.mean([results['2D'][l]['params'][0] for l in results['2D']])
        flush(f"2D:  ⟨σ⟩ = {sigma_2d:+.4f}  (expect ≈ 0)")
        flush(f"2D:  ⟨c_E⟩ = {cE_2d:+.4f}  (expect < 0: inverse cascade)")
    if '3D' in results:
        sigma_3d = np.mean([results['3D'][l]['params'][6] for l in results['3D']])
        cE_3d = np.mean([results['3D'][l]['params'][0] for l in results['3D']])
        flush(f"3D:  ⟨σ⟩ = {sigma_3d:+.4f}  (expect > 0: vortex stretching)")
        flush(f"3D:  ⟨c_E⟩ = {cE_3d:+.4f}  (expect > 0: forward cascade)")
    if '1D' in results:
        cE_1d = np.mean([results['1D'][l]['params'][0] for l in results['1D']])
        flush(f"1D:  ⟨c_E⟩ = {cE_1d:+.4f}  (expect > 0: forward cascade, shocks)")

if __name__ == '__main__':
    main()
