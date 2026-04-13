#!/usr/bin/env python3
"""
Rock-pool v2: perfect the effective 1D model.

v1 findings (rock_pool_model.py):
  - K=1 pulse (A, B): M2 linear diffusion fits at ~13% rel_rmse, and the
    viscous case is reproduced by adding -ν K² E without re-fitting.
  - K=2 Gaussian packet (C): no candidate fit well (best 38%).
  - Broad spectrum (D): best 26%.

Remaining physics we haven't captured:
  1. FINITE wave speed (~5 shells/time in A, ~2 in C, ~1.7 in D).
     Rules out pure diffusion (infinite speed) for non-pulse cases.
  2. Reflection / ringing (K=3 sign changes in dE/dt).
     Rules out pure advection.
  3. Bidirectional transfer (K=2 packet feeds K=1 AND K≥3).
  4. Amplitude dependence (cascade velocity drops with energy content).

Minimum physics: damped wave (telegraph) with possibly nonlinear speed.

Candidate models (v2):

  M4b (cleaned telegraph):
    dE_K/dt = -(J_K - J_{K-1}) - ν K² E_K
    dJ_K/dt = c² (E_{K+1} - E_K) - γ J_K
    state: [E_1..E_n, J_1..J_n], J(0) fit as alpha * E(0)
    params: c, γ, alpha

  M5 (porous-medium / nonlinear diffusion):
    dE_K/dt = D (E_{K+1}^m - 2 E_K^m + E_{K-1}^m) - ν K² E_K
    params: D, m   (m=1 → linear heat)

  M6 (nonlinear telegraph: wave speed depends on amplitude):
    dE_K/dt = -(J_K - J_{K-1}) - ν K² E_K
    dJ_K/dt = c² (1 + β E_K)(E_{K+1} - E_K) - γ J_K
    params: c, γ, β, alpha   (alpha scales J(0))

  M7 (two-speed: diffusion + advection):
    dE_K/dt = -v (E_K - E_{K-1}) + D (E_{K+1} - 2 E_K + E_{K-1}) - ν K² E_K
    params: v, D
"""
import sys, os, time, json
import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import minimize

def flush(s): print(s); sys.stdout.flush()

DATA_PATH = '/Users/rod/code/ns-proof/results/cascade_wave.npz'

def load_data():
    data = np.load(DATA_PATH)
    experiments = {}
    for label in ['A', 'B', 'C', 'D']:
        try:
            experiments[label] = dict(
                t=data[f'{label}_t'],
                E_K=data[f'{label}_E_K'],
                K_list=data[f'{label}_K_list'],
                E_total=data[f'{label}_E_total'],
                Om_total=data[f'{label}_Om_total'],
            )
        except KeyError:
            pass
    return experiments

# ======= MODELS =======

def m4b_telegraph(t, y, c, gamma, nu, n):
    E = y[:n]; J = y[n:]
    K = np.arange(1, n+1)
    J_prev = np.concatenate([[0.0], J[:-1]])
    dE = -(J - J_prev) - nu * K*K * E
    E_next = np.concatenate([E[1:], [0.0]])
    dJ = c*c * (E_next - E) - gamma * J
    return np.concatenate([dE, dJ])

def m5_porous(t, y, D, m, nu, n):
    K = np.arange(1, n+1)
    y_safe = np.maximum(y, 0.0)
    ym = np.power(y_safe, m)
    ym_prev = np.concatenate([[ym[0]], ym[:-1]])     # reflecting at K=1
    ym_next = np.concatenate([ym[1:], [ym[-1]]])     # reflecting at K=n
    return D * (ym_next - 2*ym + ym_prev) - nu * K*K * y

def m6_nonlin_telegraph(t, y, c, gamma, beta, nu, n):
    E = y[:n]; J = y[n:]
    K = np.arange(1, n+1)
    J_prev = np.concatenate([[0.0], J[:-1]])
    dE = -(J - J_prev) - nu * K*K * E
    E_next = np.concatenate([E[1:], [0.0]])
    speed2 = c*c * (1.0 + beta * np.maximum(E, 0.0))
    dJ = speed2 * (E_next - E) - gamma * J
    return np.concatenate([dE, dJ])

def m7_adv_diff(t, y, v, D, nu, n):
    K = np.arange(1, n+1)
    y_prev = np.concatenate([[0.0], y[:-1]])         # no flux at K=0
    y_next = np.concatenate([y[1:], [y[-1]]])        # reflecting at K=n
    return -v * (y - y_prev) + D * (y_next - 2*y + y_prev) - nu * K*K * y

# ======= FITTING =======

def simulate(mfn, y0, t_eval, params, nu, n):
    rhs = lambda tt, yy: mfn(tt, yy, *params, nu, n)
    return solve_ivp(rhs, [t_eval[0], t_eval[-1]], y0,
                     t_eval=t_eval, method='RK45', rtol=1e-7, atol=1e-10,
                     max_step=0.05)

def fit_exp(mfn, exp, init_params, has_J, alpha_in_params, nu_val, label):
    """Fit model to one experiment.

    If has_J: state is [E..J..]; if alpha_in_params: last param is J(0)=α·E(0).
    """
    t = exp['t']
    E_obs = exp['E_K']
    n = E_obs.shape[1]

    def build_y0(params):
        if has_J:
            if alpha_in_params:
                alpha = params[-1]
                J0 = alpha * E_obs[0]
            else:
                J0 = np.zeros(n)
            return np.concatenate([E_obs[0], J0])
        return E_obs[0].copy()

    def obj(params):
        try:
            if has_J and alpha_in_params:
                model_params = params[:-1]
            else:
                model_params = params
            y0 = build_y0(params)
            sol = simulate(mfn, y0, t, model_params, nu_val, n)
            if not sol.success:
                return 1e10
            if has_J:
                y_sim = sol.y[:n, :].T
            else:
                y_sim = sol.y.T
            return float(np.sum((y_sim - E_obs)**2))
        except Exception:
            return 1e10

    result = minimize(obj, init_params, method='Nelder-Mead',
                      options={'maxiter': 4000, 'xatol': 1e-6, 'fatol': 1e-9,
                               'adaptive': True})

    # RMSE
    final_y0 = build_y0(result.x)
    model_params = result.x[:-1] if (has_J and alpha_in_params) else result.x
    sol = simulate(mfn, final_y0, t, model_params, nu_val, n)
    if sol.success:
        y_sim = sol.y[:n, :].T if has_J else sol.y.T
        rmse = float(np.sqrt(np.mean((y_sim - E_obs)**2)))
        rel = rmse / float(np.sqrt(np.mean(E_obs**2)))
    else:
        rmse = float('inf'); rel = float('inf')
    return result.x, rmse, rel, result.success

def get_nu(label):
    return 0.01 if label == 'B' else 0.0

# ======= MAIN =======

def main():
    flush("="*78)
    flush("ROCK POOL v2: PERFECT THE MODEL")
    flush("="*78)

    experiments = load_data()
    flush(f"Loaded experiments: {sorted(experiments.keys())}")

    specs = [
        # (name, function, initial_params, has_J, alpha_in_params)
        ('M4b_telegraph',     m4b_telegraph,     [3.0, 1.0, 0.0],        True,  True),
        ('M5_porous',         m5_porous,         [1.0, 1.0],             False, False),
        ('M6_nl_telegraph',   m6_nonlin_telegraph, [3.0, 1.0, 0.0, 0.0], True,  True),
        ('M7_adv_diff',       m7_adv_diff,       [2.0, 1.0],             False, False),
    ]

    all_results = {}
    for label in sorted(experiments.keys()):
        flush(f"\n--- Fitting experiment {label} (nu={get_nu(label)}) ---")
        exp = experiments[label]
        all_results[label] = {}
        for name, fn, init, has_J, has_alpha in specs:
            t0 = time.time()
            params, rmse, rel, ok = fit_exp(fn, exp, np.array(init, float),
                                             has_J, has_alpha, get_nu(label), label)
            dt = time.time() - t0
            flush(f"  {name:<18s} params={np.round(params,4).tolist()}  "
                  f"rel_rmse={rel:.4e}  t={dt:.1f}s  ok={ok}")
            all_results[label][name] = dict(
                params=params.tolist(), rmse=rmse, rel_rmse=rel, success=bool(ok),
            )

    # Table
    flush("\n" + "="*78)
    flush("MODEL COMPARISON (rel_rmse)")
    flush("="*78)
    header = f"{'Exp':<6}" + "".join(f"{s[0]:<20}" for s in specs)
    flush(header); flush("-"*len(header))
    for label in sorted(all_results.keys()):
        row = f"{label:<6}"
        for name, *_ in specs:
            r = all_results[label][name]['rel_rmse']
            row += f"{r:<20.4e}"
        flush(row)

    # Cross-validation A -> B for each model
    flush("\n" + "="*78)
    flush("CROSS-VALIDATION: A-params + nu=0.01 -> predict B")
    flush("="*78)
    if 'A' in experiments and 'B' in experiments:
        exp_B = experiments['B']
        for name, fn, init, has_J, has_alpha in specs:
            a_params = np.array(all_results['A'][name]['params'])
            n = exp_B['E_K'].shape[1]
            if has_J:
                alpha = a_params[-1] if has_alpha else 0.0
                y0 = np.concatenate([exp_B['E_K'][0], alpha * exp_B['E_K'][0]])
                model_params = a_params[:-1] if has_alpha else a_params
            else:
                y0 = exp_B['E_K'][0].copy()
                model_params = a_params
            sol = simulate(fn, y0, exp_B['t'], model_params, 0.01, n)
            if sol.success:
                y_sim = sol.y[:n, :].T if has_J else sol.y.T
                rmse = float(np.sqrt(np.mean((y_sim - exp_B['E_K'])**2)))
                rel = rmse / float(np.sqrt(np.mean(exp_B['E_K']**2)))
                flush(f"  {name:<18s} -> B: rel_rmse = {rel:.4e}")
            else:
                flush(f"  {name:<18s} -> B: integration failed")

    # Save
    out_path = '/Users/rod/code/ns-proof/results/rock_pool_v2_results.json'
    with open(out_path, 'w') as f:
        json.dump(all_results, f, indent=2, default=str)
    flush(f"\nResults saved to {out_path}")

if __name__ == '__main__':
    main()
