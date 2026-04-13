#!/usr/bin/env python3
"""
Rock-pool v4: bidirectional telegraph PDE, clean sign convention, faster fit.

Changes from v3:
  (1) Two independent fluxes J^R (rightward, K→K+1) and J^L (leftward,
      K→K-1). A packet initial condition therefore radiates both ways.
  (2) c_E is a signed speed: c_E > 0 means forward cascade, c_E < 0 inverse.
  (3) Vortex-stretching form upgraded to  σ · K · √(E_K · Ω_K),  with an
      extra drain on E_K = -σ · √(E_K · Ω_K) / √K  (energy → enstrophy at
      the stretching rate; keeps total energy + enstrophy coherent).
  (4) Optimiser: L-BFGS-B multi-start (12 random starts) instead of DE.
      Dramatically faster, still escapes local minima.

Universal ansatz (same for all d):

    dE_K/dt  = -(J^R_K - J^R_{K-1}) + (J^L_{K+1} - J^L_K)
               - ν K² E_K - s_stretch_E
    dJ^R_K/dt = + c_R² · (1 + β_E E_K) · (E_K - E_{K+1}) - γ_R · J^R_K
    dJ^L_K/dt = + c_L² · (1 + β_E E_K) · (E_K - E_{K-1}) - γ_L · J^L_K

(analogous for Ω_K with c_R_Om, c_L_Om, γ_R_Om, γ_L_Om, β_Om, and a
stretching source  s_stretch_Om = +σ · K · √(E·Ω)  on the enstrophy.)

For 2D we expect c_R ≈ 0, c_L > 0 for energy (inverse), c_R > 0,
c_L ≈ 0 for enstrophy (forward).
For 3D we expect c_R > c_L for both E and Ω (forward-dominated).
For 1D we expect the same.

Parameters (11): c_R, c_L, γ_R, γ_L, β_E,
                 c_R_Om, c_L_Om, γ_R_Om, γ_L_Om, β_Om,
                 σ
"""
import sys, os, time, json, warnings
import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import minimize
warnings.filterwarnings('ignore')
np.seterr(all='ignore')

def flush(s): print(s); sys.stdout.flush()

DATASETS = {
    '1D': '/Users/rod/code/ns-proof/results/cascade_wave_1d.npz',
    '2D': '/Users/rod/code/ns-proof/results/cascade_wave_2d.npz',
    '3D': '/Users/rod/code/ns-proof/results/cascade_wave.npz',
}

def load_all():
    out = {}
    for d, path in DATASETS.items():
        if not os.path.exists(path):
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
PARAM_NAMES = [
    'c_R_E', 'c_L_E', 'γ_R_E', 'γ_L_E', 'β_E',
    'c_R_O', 'c_L_O', 'γ_R_O', 'γ_L_O', 'β_O',
    'σ',
]
N_PARAMS = len(PARAM_NAMES)

def rhs(t, y, p, nu, n, include_omega):
    (cRE, cLE, gRE, gLE, bE,
     cRO, cLO, gRO, gLO, bO, sigma) = p
    K = np.arange(1, n+1, dtype=float)

    E   = y[0:n]
    JRE = y[n:2*n]
    JLE = y[2*n:3*n]
    E_pos = np.maximum(E, 0.0)

    # Shifts (reflecting: copy boundary value)
    E_next = np.concatenate([E[1:], [E[-1]]])
    E_prev = np.concatenate([[E[0]], E[:-1]])
    JRE_prev = np.concatenate([[0.0], JRE[:-1]])
    JLE_next = np.concatenate([JLE[1:], [0.0]])

    dE = -(JRE - JRE_prev) + (JLE_next - JLE) - nu * K*K * E
    dJRE = (cRE*cRE) * (1.0 + bE*E_pos) * (E - E_next) - gRE * JRE
    dJLE = (cLE*cLE) * (1.0 + bE*E_pos) * (E - E_prev) - gLE * JLE

    out_len = 3*n if not include_omega else 6*n
    dy = np.empty(out_len)
    dy[0:n]   = dE
    dy[n:2*n] = dJRE
    dy[2*n:3*n] = dJLE

    if include_omega:
        Om  = y[3*n:4*n]
        JRO = y[4*n:5*n]
        JLO = y[5*n:6*n]
        Om_pos = np.maximum(Om, 0.0)

        Om_next = np.concatenate([Om[1:], [Om[-1]]])
        Om_prev = np.concatenate([[Om[0]], Om[:-1]])
        JRO_prev = np.concatenate([[0.0], JRO[:-1]])
        JLO_next = np.concatenate([JLO[1:], [0.0]])

        stretch = sigma * K * np.sqrt(E_pos * Om_pos)   # Ω source
        # Energy drain from stretching (dimensional: energy → enstrophy)
        drain   = stretch / (K + 1e-9)                  # → E lost at rate stretch/K

        dE  -= drain
        dOm  = -(JRO - JRO_prev) + (JLO_next - JLO) - 2.0*nu*K*K * Om + stretch
        dJRO = (cRO*cRO) * (1.0 + bO*Om_pos) * (Om - Om_next) - gRO * JRO
        dJLO = (cLO*cLO) * (1.0 + bO*Om_pos) * (Om - Om_prev) - gLO * JLO

        dy[0:n]     = dE
        dy[3*n:4*n] = dOm
        dy[4*n:5*n] = dJRO
        dy[5*n:6*n] = dJLO

    return dy

def build_y0(exp, include_omega):
    E0 = exp['E_K'][0].copy()
    n = E0.size
    if include_omega and exp.get('Om_K') is not None:
        y0 = np.zeros(6*n)
        y0[0:n] = E0
        y0[3*n:4*n] = exp['Om_K'][0]
    else:
        y0 = np.zeros(3*n)
        y0[0:n] = E0
    return y0, n

def simulate(params, y0, t_eval, nu, n, include_omega):
    return solve_ivp(lambda t,y: rhs(t, y, params, nu, n, include_omega),
                     [t_eval[0], t_eval[-1]], y0,
                     t_eval=t_eval, method='RK45',
                     rtol=1e-3, atol=1e-6, max_step=0.05)

def residual(params, exp, nu, include_omega):
    y0, n = build_y0(exp, include_omega)
    try:
        sol = simulate(params, y0, exp['t'], nu, n, include_omega)
    except Exception:
        return 1e10
    if not sol.success:
        return 1e10
    y = sol.y
    E_sim = y[0:n, :].T
    scale_E = np.sqrt(np.mean(exp['E_K']**2)) + 1e-12
    r = np.sum((E_sim - exp['E_K'])**2) / scale_E**2
    if include_omega and exp.get('Om_K') is not None:
        Om_sim = y[3*n:4*n, :].T
        scale_O = np.sqrt(np.mean(exp['Om_K']**2)) + 1e-12
        r += np.sum((Om_sim - exp['Om_K'])**2) / scale_O**2
    return float(r)

def rel_rmse(params, exp, nu, include_omega):
    y0, n = build_y0(exp, include_omega)
    sol = simulate(params, y0, exp['t'], nu, n, include_omega)
    if not sol.success:
        return float('inf'), float('inf')
    y = sol.y
    E_sim = y[0:n, :].T
    rE = float(np.sqrt(np.mean((E_sim - exp['E_K'])**2)) /
               (np.sqrt(np.mean(exp['E_K']**2)) + 1e-12))
    rO = float('nan')
    if include_omega and exp.get('Om_K') is not None:
        Om_sim = y[3*n:4*n, :].T
        rO = float(np.sqrt(np.mean((Om_sim - exp['Om_K'])**2)) /
                   (np.sqrt(np.mean(exp['Om_K']**2)) + 1e-12))
    return rE, rO

# ============================================================
# Fitting — L-BFGS-B multistart
# ============================================================
# Bounds: all non-negative (speeds squared in model)
BOUNDS = [
    (0.0, 5.0),   # c_R_E  (forward speed)
    (0.0, 5.0),   # c_L_E  (inverse speed)
    (0.0, 25.0),  # γ_R_E
    (0.0, 25.0),  # γ_L_E
    (-2.0, 20.0), # β_E
    (0.0, 10.0),  # c_R_O
    (0.0, 10.0),  # c_L_O
    (0.0, 25.0),  # γ_R_O
    (0.0, 25.0),  # γ_L_O
    (-2.0, 20.0), # β_O
    (0.0, 5.0),   # σ
]
# Lock Ω block for 1D (no vorticity observable)
BOUNDS_1D = BOUNDS.copy()
for i in [5, 6, 7, 8, 9, 10]:
    BOUNDS_1D[i] = (0.0, 0.01)

def subsample(exp, n_keep=60):
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

def fit_one(dim, label, exp, n_starts=8):
    nu = get_nu(dim, label)
    include_omega = (dim != '1D')
    bounds = BOUNDS_1D if dim == '1D' else BOUNDS

    exp_sub = subsample(exp, n_keep=60)
    obj_sub  = lambda p: residual(p, exp_sub, nu, include_omega)
    obj_full = lambda p: residual(p, exp,     nu, include_omega)

    t0 = time.time()
    rng = np.random.default_rng(42)
    best_fun = float('inf')
    best_x = None

    # Seeded starts: a couple of physics-motivated guesses + random
    seeds = [
        # Forward-cascade baseline
        np.array([2.0, 0.5, 5.0, 5.0, 1.0,
                  2.0, 0.5, 5.0, 5.0, 1.0, 0.5]),
        # Inverse-cascade baseline (for 2D)
        np.array([0.5, 2.0, 5.0, 5.0, 1.0,
                  2.0, 0.5, 5.0, 5.0, 1.0, 0.0]),
        # Diffusive baseline (near-equal fluxes)
        np.array([1.0, 1.0, 10.0, 10.0, 0.0,
                  1.0, 1.0, 10.0, 10.0, 0.0, 0.2]),
    ]
    for s in range(n_starts - 3):
        rand = np.array([rng.uniform(lo, hi) for (lo, hi) in bounds])
        seeds.append(rand)

    for x0 in seeds:
        # Clamp inside bounds
        x0 = np.clip(x0, [b[0] for b in bounds], [b[1] for b in bounds])
        try:
            r = minimize(obj_sub, x0, method='L-BFGS-B', bounds=bounds,
                         options={'maxiter': 60, 'ftol': 1e-6})
            if r.fun < best_fun:
                best_fun = r.fun
                best_x = r.x
        except Exception:
            continue

    # Final polish on full data
    polish = minimize(obj_full, best_x, method='L-BFGS-B', bounds=bounds,
                      options={'maxiter': 200, 'ftol': 1e-8})
    params = polish.x
    elapsed = time.time() - t0
    rE, rO = rel_rmse(params, exp, nu, include_omega)
    return params, rE, rO, elapsed

def get_nu(dim, label):
    if dim == '1D':
        return {'A': 1e-4, 'B': 1e-2, 'C': 1e-3, 'D': 1e-3}[label]
    if dim == '2D':
        return {'A': 0.0, 'B': 1e-3, 'C': 1e-4, 'D': 1e-4}[label]
    if dim == '3D':
        return {'A': 0.0, 'B': 0.01, 'C': 0.0, 'D': 0.0}[label]
    return 0.0

# ============================================================
# Main
# ============================================================
def main():
    flush("="*78)
    flush("ROCK POOL v4: BIDIRECTIONAL TELEGRAPH  (1D / 2D / 3D)")
    flush("="*78)
    flush(f"Parameters: {PARAM_NAMES}")
    all_data = load_all()
    for d in ['1D','2D','3D']:
        if d not in all_data: continue
        flush(f"  {d}: experiments {sorted(all_data[d].keys())}, "
              f"n_shells={all_data[d]['A']['E_K'].shape[1] if 'A' in all_data[d] else '?'}")

    results = {}
    for dim in ['1D','2D','3D']:
        if dim not in all_data: continue
        flush(f"\n{'='*78}\nFitting {dim}\n{'='*78}")
        results[dim] = {}
        for label in sorted(all_data[dim].keys()):
            exp = all_data[dim][label]
            flush(f"\n--- {dim} / Exp {label}  (ν={get_nu(dim,label):.1e}, "
                  f"shells={exp['E_K'].shape[1]}) ---")
            params, rE, rO, elapsed = fit_one(dim, label, exp, n_starts=8)
            flush(f"    fit time: {elapsed:.1f}s")
            for name, val in zip(PARAM_NAMES, params):
                flush(f"    {name:>6s} = {val:+.4f}")
            flush(f"    rel_rmse(E) = {rE:.4e}    rel_rmse(Ω) = {rO}")
            results[dim][label] = dict(
                params=params.tolist(),
                rel_rmse_E=rE, rel_rmse_Om=rO,
            )

    # Summary tables
    flush("\n" + "="*78)
    flush("SUMMARY: rel_rmse(E)")
    flush("="*78)
    flush(f"{'Dim':<6}" + " ".join(f"{l:<12}" for l in ['A','B','C','D']))
    flush("-"*60)
    for dim in sorted(results.keys()):
        row = f"{dim:<6}"
        for label in ['A','B','C','D']:
            if label in results[dim]:
                row += f"{results[dim][label]['rel_rmse_E']:<12.4e}"
            else:
                row += f"{'--':<12}"
        flush(row)

    flush("\n" + "="*78)
    flush("SUMMARY: rel_rmse(Ω)")
    flush("="*78)
    flush(f"{'Dim':<6}" + " ".join(f"{l:<12}" for l in ['A','B','C','D']))
    flush("-"*60)
    for dim in sorted(results.keys()):
        row = f"{dim:<6}"
        for label in ['A','B','C','D']:
            if label in results[dim]:
                rO = results[dim][label]['rel_rmse_Om']
                row += f"{rO:<12.4e}" if isinstance(rO, float) and not np.isnan(rO) else f"{'--':<12}"
            else:
                row += f"{'--':<12}"
        flush(row)

    flush("\n" + "="*78)
    flush("SUMMARY: fitted parameters (mean across experiments per dim)")
    flush("="*78)
    flush(f"{'Dim':<5}" + " ".join(f"{n:>8s}" for n in PARAM_NAMES))
    flush("-"*100)
    for dim in sorted(results.keys()):
        if not results[dim]: continue
        arr = np.array([results[dim][l]['params'] for l in results[dim]])
        mean = arr.mean(axis=0)
        row = f"{dim:<5}"
        for v in mean:
            row += f" {v:>+8.3f}"
        flush(row)

    out = '/Users/rod/code/ns-proof/results/rock_pool_v4_results.json'
    with open(out, 'w') as f:
        json.dump(results, f, indent=2, default=str)
    flush(f"\nResults saved to {out}")

    # Physics checks
    flush("\n" + "="*78)
    flush("PHYSICS CHECKS")
    flush("="*78)
    for dim in ['1D','2D','3D']:
        if dim not in results: continue
        mean_sigma = np.mean([results[dim][l]['params'][10] for l in results[dim]])
        mean_cR = np.mean([results[dim][l]['params'][0] for l in results[dim]])
        mean_cL = np.mean([results[dim][l]['params'][1] for l in results[dim]])
        flush(f"{dim}:  ⟨σ⟩={mean_sigma:+.4f}  ⟨c_R_E⟩={mean_cR:+.4f}  ⟨c_L_E⟩={mean_cL:+.4f}")
    flush("  Expected: 1D σ≈0, c_R>c_L (forward);")
    flush("            2D σ≈0, c_L>c_R for E (inverse);")
    flush("            3D σ>0, c_R>c_L (forward).")

if __name__ == '__main__':
    main()
