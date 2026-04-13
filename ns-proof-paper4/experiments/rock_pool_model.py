#!/usr/bin/env python3
"""
Rock-pool model fitting: build and verify a 1D effective theory for the
shell-energy dynamics E_K(t) observed in cascade_wave.py.

Workflow:
  1. Load all cascade_wave experimental data (A=inviscid, B=viscous,
     C=Gaussian packet, D=broad spectrum)
  2. Define candidate effective models with small numbers of parameters
  3. Fit each model to the data
  4. Pick the model with best predictive power (fit on some runs, predict
     others to check generalization)
  5. Report model parameters, goodness-of-fit, and any residual structure

Candidate models (all are 1D ODE systems on the shell index K ∈ {1, 2, ..., N}):

  M1 (linear advection + viscous dissipation)
    dE_K/dt = -v * (E_K - E_{K-1}) - nu * K^2 * E_K
    params: v
    boundary: no flux into K=0 and out of K=N (closed)

  M2 (linear diffusion + viscous)
    dE_K/dt = D * (E_{K+1} - 2*E_K + E_{K-1}) - nu * K^2 * E_K
    params: D
    boundary: reflecting

  M3 (nonlinear transfer + viscous, Leith 1967)
    dE_K/dt = -dJ/dK - nu * K^2 * E_K
    where J_K = c * K^(a) * sqrt(E_K * E_{K+1}) etc
    params: c, a

  M4 (two-variable telegraph / damped wave on K-lattice)
    dE_K/dt = -dJ_K/dK - nu * K^2 * E_K
    dJ_K/dt = -omega_K^2 * (E_{K+1} - E_K) - gamma * J_K
    params: omega_0, gamma
    This is a second-order wave equation in K-time, captures ringing.

Goal: find the model whose predictions most closely match Exps A-D, and
identify which physical ingredient (advection, diffusion, nonlinearity,
second-order wave) is essential.
"""
import sys, os, time, json
import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import minimize

def flush(s): print(s); sys.stdout.flush()

DATA_PATH = '/Users/rod/code/ns-proof/results/cascade_wave.npz'

# Wait for cascade data if not yet available
def wait_for_data(path, max_wait=1800):
    t0 = time.time()
    while not os.path.exists(path):
        if time.time() - t0 > max_wait:
            flush(f"TIMEOUT waiting for {path}; proceeding with whatever exists")
            return False
        time.sleep(10)
    return True

def load_data():
    """Load all experimental trajectories."""
    if not os.path.exists(DATA_PATH):
        flush(f"Data file {DATA_PATH} not yet present; waiting...")
        wait_for_data(DATA_PATH)
    if not os.path.exists(DATA_PATH):
        flush(f"Data file still missing after wait; aborting")
        sys.exit(1)
    data = np.load(DATA_PATH)
    flush(f"Loaded data from {DATA_PATH}")
    flush(f"Available arrays: {sorted(data.files)}")

    experiments = {}
    for label in ['A', 'B', 'C', 'D']:
        try:
            t = data[f'{label}_t']
            E_K = data[f'{label}_E_K']
            K_list = data[f'{label}_K_list']
            E_total = data[f'{label}_E_total']
            Om_total = data[f'{label}_Om_total']
            experiments[label] = dict(
                t=t, E_K=E_K, K_list=K_list,
                E_total=E_total, Om_total=Om_total,
            )
            flush(f"  Exp {label}: {len(t)} samples, {len(K_list)} shells, "
                  f"E_K shape {E_K.shape}")
        except KeyError as e:
            flush(f"  Exp {label}: missing ({e})")
    return experiments

# ======= CANDIDATE MODELS =======

def model_1_linear_advection(t, y, v, nu, n_shells):
    """dE_K/dt = -v*(E_K - E_{K-1}) - nu*K^2*E_K, K=1..n."""
    dy = np.zeros_like(y)
    K_values = np.arange(1, n_shells + 1)
    # E_{K-1} term: prepend zero (no flux from K=0)
    E_prev = np.concatenate([[0.0], y[:-1]])
    dy = -v * (y - E_prev) - nu * K_values**2 * y
    return dy

def model_2_diffusion(t, y, D, nu, n_shells):
    """dE_K/dt = D*(E_{K+1} - 2*E_K + E_{K-1}) - nu*K^2*E_K, reflecting bc."""
    dy = np.zeros_like(y)
    K_values = np.arange(1, n_shells + 1)
    E_prev = np.concatenate([[y[0]], y[:-1]])   # reflecting at K=1 (mirror)
    E_next = np.concatenate([y[1:], [y[-1]]])   # reflecting at K=N
    dy = D * (E_next - 2*y + E_prev) - nu * K_values**2 * y
    return dy

def model_3_nonlinear_leith(t, y, c, a, nu, n_shells):
    """Leith-type nonlinear cascade: dE/dt = -dJ/dK, J_K = c*K^a*sqrt(E_K*E_{K+1})."""
    dy = np.zeros_like(y)
    K_values = np.arange(1, n_shells + 1)
    # Flux J_K = c * K^a * sqrt(|E_K * E_{K+1}|)
    E_safe = np.maximum(y, 0)
    E_next = np.concatenate([E_safe[1:], [0.0]])
    J = c * np.power(K_values, a) * np.sqrt(E_safe * E_next)
    # dE_K/dt = J_{K-1} - J_K - nu K^2 E_K
    J_prev = np.concatenate([[0.0], J[:-1]])
    dy = J_prev - J - nu * K_values**2 * y
    return dy

def model_4_telegraph(t, y, omega0, gamma, nu, n_shells):
    """Two-variable damped wave (telegraph) on K-lattice.

    State vector: y = [E_1, ..., E_n, J_1, ..., J_n]
        dE_K/dt = -(J_K - J_{K-1}) - nu*K^2*E_K
        dJ_K/dt = omega0^2 * K * (E_{K+1} - E_K) - gamma * J_K
    """
    E = y[:n_shells]
    J = y[n_shells:]
    K_values = np.arange(1, n_shells + 1)

    J_prev = np.concatenate([[0.0], J[:-1]])
    dE = -(J - J_prev) - nu * K_values**2 * E

    E_next = np.concatenate([E[1:], [0.0]])
    dJ = omega0**2 * K_values * (E_next - E) - gamma * J

    return np.concatenate([dE, dJ])

# ======= FITTING =======

def simulate_model(model_fn, y0, t_eval, params, nu, n_shells):
    """Run a model forward in time using solve_ivp."""
    rhs = lambda t, y: model_fn(t, y, *params, nu, n_shells)
    sol = solve_ivp(rhs, [t_eval[0], t_eval[-1]], y0,
                    t_eval=t_eval, method='RK45', rtol=1e-7, atol=1e-10)
    return sol

def fit_to_experiment(model_fn, exp, param_bounds, initial_params,
                      initial_j=False, label=""):
    """Fit model parameters to minimise sum of squared residuals against E_K(t)."""
    t = exp['t']
    E_K_obs = exp['E_K']  # (n_t, n_shells)
    n_shells = E_K_obs.shape[1]
    nu = 0.01 if label in ['B'] else 0.0

    # Initial condition
    if initial_j:
        # Model 4 (telegraph): need both E and J initial; use J=0 initially
        y0 = np.concatenate([E_K_obs[0], np.zeros(n_shells)])
    else:
        y0 = E_K_obs[0].copy()

    def objective(params):
        try:
            sol = simulate_model(model_fn, y0, t, params, nu, n_shells)
            if not sol.success:
                return 1e10
            if initial_j:
                y_sim = sol.y[:n_shells, :].T
            else:
                y_sim = sol.y.T
            residual = np.sum((y_sim - E_K_obs)**2)
            return residual
        except Exception as e:
            return 1e10

    result = minimize(objective, initial_params, method='Nelder-Mead',
                      bounds=param_bounds, options={'maxiter': 500, 'xatol': 1e-5, 'fatol': 1e-8})
    return result

# ======= ANALYSIS =======

def rmse_of_fit(model_fn, exp, params, initial_j=False, label=""):
    t = exp['t']
    E_K_obs = exp['E_K']
    n_shells = E_K_obs.shape[1]
    nu = 0.01 if label in ['B'] else 0.0

    if initial_j:
        y0 = np.concatenate([E_K_obs[0], np.zeros(n_shells)])
    else:
        y0 = E_K_obs[0].copy()

    sol = simulate_model(model_fn, y0, t, params, nu, n_shells)
    if not sol.success:
        return float('inf'), None

    if initial_j:
        y_sim = sol.y[:n_shells, :].T
    else:
        y_sim = sol.y.T

    rmse = float(np.sqrt(np.mean((y_sim - E_K_obs)**2)))
    rel_rmse = rmse / float(np.sqrt(np.mean(E_K_obs**2)))
    return rmse, rel_rmse, y_sim

# ======= MAIN =======

def main():
    flush("="*78)
    flush("ROCK POOL MODEL FITTING")
    flush("="*78)

    experiments = load_data()
    if not experiments:
        flush("No experimental data loaded; exiting.")
        return

    # For each experiment, print a summary
    for label, exp in experiments.items():
        flush(f"\n--- Experiment {label} ---")
        flush(f"  Time points: {len(exp['t'])}, t ∈ [{exp['t'][0]:.4f}, {exp['t'][-1]:.4f}]")
        flush(f"  Shells: {list(exp['K_list'])}")
        flush(f"  E_K(0) = {exp['E_K'][0]}")
        flush(f"  E_K(T) = {exp['E_K'][-1]}")
        flush(f"  E_total: {exp['E_total'][0]:.4f} -> {exp['E_total'][-1]:.4f}")
        flush(f"  Omega_total: {exp['Om_total'][0]:.4f} -> {exp['Om_total'][-1]:.4f}")

    # ======= FIT EACH MODEL ON EACH EXPERIMENT =======
    flush("\n" + "="*78)
    flush("FITTING CANDIDATE MODELS")
    flush("="*78)

    model_specs = [
        ('M1_advection',  model_1_linear_advection,
         [(0.1, 100.0)], [5.0], False),
        ('M2_diffusion',  model_2_diffusion,
         [(0.01, 50.0)], [1.0], False),
        ('M3_Leith',      model_3_nonlinear_leith,
         [(0.01, 50.0), (-2.0, 3.0)], [1.0, 1.0], False),
        ('M4_telegraph',  model_4_telegraph,
         [(0.1, 50.0), (0.1, 50.0)], [5.0, 1.0], True),
    ]

    results = {}
    for exp_label, exp in experiments.items():
        flush(f"\n--- Fitting to Experiment {exp_label} ---")
        results[exp_label] = {}
        for mname, mfn, bounds, initial, use_j in model_specs:
            flush(f"  Fitting {mname}...", )
            t0 = time.time()
            fit_result = fit_to_experiment(mfn, exp, bounds, initial,
                                            initial_j=use_j, label=exp_label)
            rmse, rel_rmse, y_sim = rmse_of_fit(mfn, exp, fit_result.x,
                                                  initial_j=use_j, label=exp_label)
            elapsed = time.time() - t0
            flush(f"    params = {fit_result.x}, rmse = {rmse:.4e}, "
                  f"rel_rmse = {rel_rmse:.4e}, t = {elapsed:.1f}s")
            results[exp_label][mname] = dict(
                params=fit_result.x.tolist(),
                rmse=rmse, rel_rmse=rel_rmse,
                converged=fit_result.success,
            )

    # ======= MODEL COMPARISON =======
    flush("\n" + "="*78)
    flush("MODEL COMPARISON")
    flush("="*78)

    flush(f"\n{'Experiment':<12} " + " ".join(f"{m[0]:<16}" for m in model_specs))
    flush("-"*80)
    for exp_label in sorted(results.keys()):
        row = f"{exp_label:<12}"
        for mname, _, _, _, _ in model_specs:
            if mname in results[exp_label]:
                rel = results[exp_label][mname]['rel_rmse']
                row += f" {rel:<16.4e}"
            else:
                row += f" {'--':<16}"
        flush(row)

    # Identify best model
    best_models = {}
    for exp_label in sorted(results.keys()):
        best_model = min(results[exp_label].items(),
                         key=lambda kv: kv[1]['rel_rmse'])
        best_models[exp_label] = best_model[0]
        flush(f"  Best model for {exp_label}: {best_model[0]} "
              f"(rel_rmse = {best_model[1]['rel_rmse']:.4e})")

    # ======= CROSS-VALIDATION =======
    # Fit M1 on Exp A (inviscid), predict Exp B (viscous) using known nu
    flush("\n" + "="*78)
    flush("CROSS-VALIDATION: predict viscous from inviscid fit")
    flush("="*78)

    if 'A' in experiments and 'B' in experiments:
        exp_A = experiments['A']
        exp_B = experiments['B']
        # Best simple model for A
        for mname, mfn, bounds, initial, use_j in model_specs:
            a_params = results['A'][mname]['params']
            # Predict Exp B using the parameters fit to A (but with nu=0.01)
            t = exp_B['t']
            n_shells = exp_B['E_K'].shape[1]
            if use_j:
                y0 = np.concatenate([exp_B['E_K'][0], np.zeros(n_shells)])
            else:
                y0 = exp_B['E_K'][0].copy()
            try:
                sol = simulate_model(mfn, y0, t, a_params, nu=0.01, n_shells=n_shells)
                if use_j:
                    y_sim = sol.y[:n_shells, :].T
                else:
                    y_sim = sol.y.T
                rmse = float(np.sqrt(np.mean((y_sim - exp_B['E_K'])**2)))
                rel_rmse = rmse / float(np.sqrt(np.mean(exp_B['E_K']**2)))
                flush(f"  {mname}: A-params + nu=0.01 -> B: rel_rmse = {rel_rmse:.4e}")
            except Exception as e:
                flush(f"  {mname}: failed ({e})")

    # Save everything
    os.makedirs('/Users/rod/code/ns-proof/results', exist_ok=True)
    out = {
        'experiments_summary': {
            label: {
                'n_t': int(len(e['t'])),
                't_range': [float(e['t'][0]), float(e['t'][-1])],
                'E_K_initial': e['E_K'][0].tolist(),
                'E_K_final': e['E_K'][-1].tolist(),
                'E_total_initial': float(e['E_total'][0]),
                'E_total_final': float(e['E_total'][-1]),
                'Om_total_initial': float(e['Om_total'][0]),
                'Om_total_final': float(e['Om_total'][-1]),
            } for label, e in experiments.items()
        },
        'fit_results': {
            label: {
                m: {k: (float(v) if isinstance(v, (int, float, np.floating))
                        else (list(v) if isinstance(v, (list, tuple)) else v))
                    for k, v in r.items()}
                for m, r in exp_results.items()
            }
            for label, exp_results in results.items()
        },
        'best_models': best_models,
    }
    out_path = '/Users/rod/code/ns-proof/results/rock_pool_fit_results.json'
    with open(out_path, 'w') as f:
        json.dump(out, f, indent=2, default=str)
    flush(f"\nResults saved to {out_path}")

if __name__ == '__main__':
    main()
