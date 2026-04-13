#!/usr/bin/env python3
"""
Rock-pool v5: Leith-type nonlinear flux.

v3 and v4 both failed on packet / broad-spectrum initial conditions in 1D
and 3D (rel_rmse 30–70 %) while fitting 2D nearly perfectly.  Diagnosis:
their local nearest-neighbour linear transfer cannot reproduce the
non-local triadic energy transfer that drives Burgers / NS cascades.

v5 uses the classical Obukhov–Leith closure for the inter-shell flux:

    Π^E_K = c_E · K^{α_E} · √(|E_K · E_{K+1}|)
    Π^Ω_K = c_Ω · K^{α_Ω} · √(|Ω_K · Ω_{K+1}|)

with *signed* coefficients c_E, c_Ω (negative = inverse cascade, as in 2D
for energy).  The equations are:

    dE_K/dt = Π^E_{K-1} - Π^E_K - ν K² E_K - drain(E→Ω)
    dΩ_K/dt = Π^Ω_{K-1} - Π^Ω_K - 2 ν K² Ω_K + σ · K · √(E_K Ω_K)
    drain(E→Ω) = σ · √(E_K Ω_K)            # energy leaves at the
                                            # stretching rate

Boundary conventions: Π_0 = Π_{N} = 0  (closed system, no leakage).

Parameters (only 5!):  c_E, α_E, c_Ω, α_Ω, σ
For 1D we lock σ = 0 and the Ω block (no vorticity observable).

Optimiser: a few seeded L-BFGS-B starts, short runs.  Full-dataset polish.
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
PARAM_NAMES = ['c_E', 'α_E', 'c_Ω', 'α_Ω', 'σ']

def leith_flux(field, c, alpha, K):
    """Π_K = c * K^α * √(|field_K · field_{K+1}|), with Π_{N-1} = 0 (reflecting top)."""
    f_pos = np.maximum(field, 0.0)
    f_next = np.concatenate([f_pos[1:], [0.0]])
    prod = np.sqrt(f_pos * f_next)
    # c may be negative (inverse cascade)
    K_pow = np.power(K, alpha)
    return c * K_pow * prod

def rhs(t, y, p, nu, n, include_omega):
    c_E, a_E, c_O, a_O, sigma = p
    K = np.arange(1, n+1, dtype=float)
    E = y[0:n]
    E_pos = np.maximum(E, 0.0)

    piE = leith_flux(E, c_E, a_E, K)
    piE_prev = np.concatenate([[0.0], piE[:-1]])
    dE = piE_prev - piE - nu * K*K * E

    if include_omega:
        Om = y[n:2*n]
        Om_pos = np.maximum(Om, 0.0)
        piO = leith_flux(Om, c_O, a_O, K)
        piO_prev = np.concatenate([[0.0], piO[:-1]])
        stretch = sigma * K * np.sqrt(E_pos * Om_pos)
        drain = sigma * np.sqrt(E_pos * Om_pos)          # E → Ω
        dE  -= drain
        dOm = piO_prev - piO - 2.0 * nu * K*K * Om + stretch
        return np.concatenate([dE, dOm])
    return dE

def build_y0(exp, include_omega):
    E0 = exp['E_K'][0].copy()
    n = E0.size
    if include_omega and exp.get('Om_K') is not None:
        y0 = np.concatenate([E0, exp['Om_K'][0]])
    else:
        y0 = E0
    return y0, n

def simulate(p, y0, t_eval, nu, n, include_omega):
    return solve_ivp(lambda t,y: rhs(t, y, p, nu, n, include_omega),
                     [t_eval[0], t_eval[-1]], y0,
                     t_eval=t_eval, method='RK45',
                     rtol=1e-3, atol=1e-6, max_step=0.05)

def residual(p, exp, nu, include_omega):
    y0, n = build_y0(exp, include_omega)
    try:
        sol = simulate(p, y0, exp['t'], nu, n, include_omega)
    except Exception:
        return 1e10
    if not sol.success:
        return 1e10
    E_sim = sol.y[0:n, :].T
    sE = np.sqrt(np.mean(exp['E_K']**2)) + 1e-12
    r = np.sum((E_sim - exp['E_K'])**2) / sE**2
    if include_omega and exp.get('Om_K') is not None:
        Om_sim = sol.y[n:2*n, :].T
        sO = np.sqrt(np.mean(exp['Om_K']**2)) + 1e-12
        r += np.sum((Om_sim - exp['Om_K'])**2) / sO**2
    return float(r)

def rel_rmse(p, exp, nu, include_omega):
    y0, n = build_y0(exp, include_omega)
    sol = simulate(p, y0, exp['t'], nu, n, include_omega)
    if not sol.success:
        return float('inf'), float('inf')
    E_sim = sol.y[0:n, :].T
    rE = float(np.sqrt(np.mean((E_sim - exp['E_K'])**2)) /
               (np.sqrt(np.mean(exp['E_K']**2)) + 1e-12))
    rO = float('nan')
    if include_omega and exp.get('Om_K') is not None:
        Om_sim = sol.y[n:2*n, :].T
        rO = float(np.sqrt(np.mean((Om_sim - exp['Om_K'])**2)) /
                   (np.sqrt(np.mean(exp['Om_K']**2)) + 1e-12))
    return rE, rO

# ============================================================
# Fitting
# ============================================================
BOUNDS   = [(-5.0, 5.0), (-1.0, 4.0), (-5.0, 10.0), (-1.0, 4.0), (0.0, 5.0)]
BOUNDS_1D = [(-5.0, 5.0), (-1.0, 4.0), (0.0, 0.01), (0.0, 0.01), (0.0, 0.01)]
BOUNDS_2D = [(-5.0, 5.0), (-1.0, 4.0), (-5.0, 10.0), (-1.0, 4.0), (0.0, 0.3)]
BOUNDS_3D = [(0.0,  5.0), (-1.0, 4.0), ( 0.0, 10.0), (-1.0, 4.0), (0.0, 5.0)]

def get_bounds(dim):
    return {'1D': BOUNDS_1D, '2D': BOUNDS_2D, '3D': BOUNDS_3D}[dim]

def subsample(exp, n_keep=50):
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

def fit_one(dim, label, exp):
    nu = get_nu(dim, label)
    include_omega = (dim != '1D')
    bounds = get_bounds(dim)
    lo = np.array([b[0] for b in bounds])
    hi = np.array([b[1] for b in bounds])

    exp_sub = subsample(exp, n_keep=60)
    obj_sub  = lambda p: residual(p, exp_sub, nu, include_omega)
    obj_full = lambda p: residual(p, exp, nu, include_omega)

    # Seed starting points (physics motivated)
    seeds = [
        np.array([ 1.0, 1.5, 1.0, 1.5, 0.5]),   # 3D K41 forward
        np.array([-1.0, 1.5, 1.0, 1.5, 0.0]),   # 2D inverse
        np.array([ 2.0, 0.5, 0.0, 0.0, 0.0]),   # 1D Burgers
        np.array([ 0.3, 2.0, 0.3, 2.0, 0.3]),   # steep spectral
        np.array([ 1.5, 1.0, 1.5, 1.0, 1.0]),   # generic
    ]
    rng = np.random.default_rng(42 + hash(dim+label) % 1000)
    for _ in range(3):
        seeds.append(lo + rng.random(len(bounds)) * (hi - lo))

    t0 = time.time()
    best_fun = float('inf'); best_x = None
    for x0 in seeds:
        x0 = np.clip(x0, lo, hi)
        try:
            r = minimize(obj_sub, x0, method='L-BFGS-B', bounds=bounds,
                         options={'maxiter': 80, 'ftol': 1e-6})
            if r.fun < best_fun:
                best_fun = r.fun; best_x = r.x
        except Exception:
            continue
    # Polish on full data
    polish = minimize(obj_full, best_x, method='L-BFGS-B', bounds=bounds,
                      options={'maxiter': 200, 'ftol': 1e-9})
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
    flush("ROCK POOL v5: LEITH NONLINEAR FLUX (1D / 2D / 3D)")
    flush("="*78)
    flush(f"Parameters: {PARAM_NAMES}")
    all_data = load_all()

    results = {}
    for dim in ['1D','2D','3D']:
        if dim not in all_data: continue
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

    flush("\nSUMMARY: rel_rmse(Ω)")
    flush("-"*60)
    for dim in sorted(results.keys()):
        row = f"{dim:<6}"
        for label in ['A','B','C','D']:
            if label in results[dim]:
                rO = results[dim][label]['rel_rmse_Om']
                val = f"{rO:<12.4e}" if isinstance(rO,float) and not np.isnan(rO) else f"{'--':<12}"
                row += val
            else:
                row += f"{'--':<12}"
        flush(row)

    flush("\nFITTED PARAMETERS (per experiment)")
    flush("-"*78)
    for dim in sorted(results.keys()):
        for label in sorted(results[dim].keys()):
            p = results[dim][label]['params']
            flush(f"  {dim}/{label}: " + "  ".join(f"{n}={v:+.3f}" for n,v in zip(PARAM_NAMES, p)))

    out = '/Users/rod/code/ns-proof/results/rock_pool_v5_results.json'
    with open(out, 'w') as f:
        json.dump(results, f, indent=2, default=str)
    flush(f"\nResults saved to {out}")

    flush("\n" + "="*78)
    flush("PHYSICS CHECKS")
    flush("="*78)
    for dim in ['1D','2D','3D']:
        if dim not in results: continue
        arr = np.array([results[dim][l]['params'] for l in results[dim]])
        m = arr.mean(axis=0)
        flush(f"{dim}:  ⟨c_E⟩={m[0]:+.3f}  ⟨α_E⟩={m[1]:+.3f}  "
              f"⟨c_Ω⟩={m[2]:+.3f}  ⟨α_Ω⟩={m[3]:+.3f}  ⟨σ⟩={m[4]:+.3f}")

if __name__ == '__main__':
    main()
