#!/usr/bin/env python3
"""
Rock-pool v6 — data-driven sparse regression (SINDy-style).

Goal: 100% accurate fit on every experiment in every dimension by letting
the DATA tell us which terms belong in the ODE, rather than guessing a
functional form up front.

Method:
  1. Load the DNS trajectories (E_K(t), Ω_K(t)) for every experiment in
     every dimension.
  2. Compute numerical derivatives dE_K/dt, dΩ_K/dt by centred finite
     differences on the smoothed time series.
  3. Build a rich library of candidate terms per shell K, including:
       • linear:         E_K, E_{K-1}, E_{K+1}, K²·E_K, K⁴·E_K,
                         Ω_K, Ω_{K-1}, Ω_{K+1}, K²·Ω_K
       • diffusion:      (E_{K+1} - 2 E_K + E_{K-1})
       • advection:      (E_K - E_{K-1}), (E_{K+1} - E_K)
       • bilinear:       E_K², E_K·E_{K+1}, E_K·E_{K-1},
                         E_K·Ω_K, Ω_K², √(E_K·E_{K+1})·K^α  (α=0.5,1,1.5)
       • stretching:     K·√(E_K·Ω_K), √(E_K·Ω_K)
  4. Stack samples across all 4 experiments in the dimension (enforces
     universality).
  5. Solve the linear least-squares problem A·c = y for the coefficient
     vector c. Use Ridge regression for stability.
  6. Validate by forward-integrating the discovered ODE with solve_ivp
     and computing rel_rmse against the DNS trajectory.
"""
import sys, os, time, json, warnings
import numpy as np
from scipy.integrate import solve_ivp
warnings.filterwarnings('ignore')
np.seterr(all='ignore')

def flush(s): print(s); sys.stdout.flush()

DATASETS = {
    '1D': '/Users/rod/code/ns-proof/results/cascade_wave_1d.npz',
    '2D': '/Users/rod/code/ns-proof/results/cascade_wave_2d.npz',
    '3D': '/Users/rod/code/ns-proof/results/cascade_wave.npz',
}
NU = {
    '1D': {'A': 1e-4, 'B': 1e-2, 'C': 1e-3, 'D': 1e-3},
    '2D': {'A': 0.0,  'B': 1e-3, 'C': 1e-4, 'D': 1e-4},
    '3D': {'A': 0.0,  'B': 1e-2, 'C': 0.0,  'D': 0.0},
}

# ============================================================
# Load data
# ============================================================
def load_all():
    out = {}
    for d, path in DATASETS.items():
        if not os.path.exists(path):
            continue
        data = np.load(path)
        out[d] = {}
        for label in ['A','B','C','D']:
            if f'{label}_t' not in data.files:
                continue
            exp = dict(
                t = data[f'{label}_t'],
                E = data[f'{label}_E_K'],              # (T, N)
                Om = data[f'{label}_Om_K'] if f'{label}_Om_K' in data.files else None,
                K = data[f'{label}_K_list'].astype(float),
                nu = NU[d][label],
            )
            out[d][label] = exp
    return out

# ============================================================
# Finite-difference derivatives
# ============================================================
def centred_deriv(y, t):
    """Centred finite difference along axis 0 (time). Returns same shape."""
    dy = np.zeros_like(y)
    dy[1:-1] = (y[2:] - y[:-2]) / (t[2:] - t[:-2])[:, None]
    # One-sided at endpoints
    dy[0]  = (y[1] - y[0]) / (t[1] - t[0])
    dy[-1] = (y[-1] - y[-2]) / (t[-1] - t[-2])
    return dy

# ============================================================
# Feature library (for energy equation)
# ============================================================
# For each shell K and each time sample, we build a row of features.
# Neighbour values use no-flux boundaries (K-1 < 1 → 0, K+1 > N → E_N).
def shift_minus(E):
    """E_{K-1}, zero-padded at K=1."""
    out = np.zeros_like(E)
    out[:, 1:] = E[:, :-1]
    return out

def shift_plus(E):
    """E_{K+1}, reflecting at K=N (copy last column)."""
    out = np.zeros_like(E)
    out[:, :-1] = E[:, 1:]
    out[:, -1]  = E[:, -1]
    return out

def build_features_E(exp):
    """Return (features, target, feature_names).

    features has shape (T*N, M) where T is number of samples, N number
    of shells, and M number of library terms.  The shell index K is
    encoded via the K-dependent terms (K², K^{3/2} etc).
    """
    E  = exp['E']                                         # (T, N)
    Om = exp['Om'] if exp['Om'] is not None else np.zeros_like(E)
    t  = exp['t']
    K  = exp['K'].astype(float)
    nu = exp['nu']
    T, N = E.shape

    dE_dt = centred_deriv(E, t)                           # (T, N)

    E_p = np.clip(E, 0, None)
    O_p = np.clip(Om, 0, None)

    E_m = shift_minus(E_p)
    E_P = shift_plus(E_p)
    O_m = shift_minus(O_p)
    O_P = shift_plus(O_p)

    K2   = (K**2)[None, :]
    K4   = (K**4)[None, :]
    K_15 = (K**1.5)[None, :]
    K_25 = (K**2.5)[None, :]
    K_arr = K[None, :]

    terms = {
        # Linear in E
        'E_K':           E_p,
        'E_K-1':         E_m,
        'E_K+1':         E_P,
        # Linear in Ω
        'Om_K':          O_p,
        'Om_K-1':        O_m,
        'Om_K+1':        O_P,
        # Viscous
        'nu_K2_E':       nu * K2 * E_p,
        'K2_E':          K2 * E_p,
        # Transport (local)
        'diff_E':        (E_P - 2*E_p + E_m),
        'adv_up':        (E_p - E_m),
        'adv_dn':        (E_P - E_p),
        # Bilinear
        'E_K*E_K-1':     E_p * E_m,
        'E_K*E_K+1':     E_p * E_P,
        'E_K^2':         E_p * E_p,
        'E_K-1*E_K+1':   E_m * E_P,
        # Leith sqrt fluxes
        'sqrt_EE-':      np.sqrt(E_p * E_m),
        'sqrt_EE+':      np.sqrt(E_p * E_P),
        'K_sqrt_EE+':    K_arr * np.sqrt(E_p * E_P),
        'K15_sqrt_EE+':  K_15 * np.sqrt(E_p * E_P),
        'K_sqrt_EE-':    K_arr * np.sqrt(E_p * E_m),
        'K15_sqrt_EE-':  K_15 * np.sqrt(E_p * E_m),
        # Flux divergence (Leith)
        'divΠ_1':        K_arr * (np.sqrt(E_p*E_P) - np.sqrt(shift_minus(E_p)*E_p)),
        'divΠ_15':       K_15  * (np.sqrt(E_p*E_P) - np.sqrt(shift_minus(E_p)*E_p)),
        # Energy–enstrophy coupling
        'E*Om':          E_p * O_p,
        'sqrt_EOm':      np.sqrt(E_p * O_p),
        'K_sqrt_EOm':    K_arr * np.sqrt(E_p * O_p),
    }
    names = list(terms.keys())
    F = np.stack([terms[n] for n in names], axis=-1)      # (T, N, M)
    # Reshape to (T*N, M) and (T*N,)
    F_flat = F.reshape(-1, F.shape[-1])
    y_flat = dE_dt.reshape(-1)
    return F_flat, y_flat, names, dE_dt, (T, N)

def build_features_Om(exp):
    """Library for dΩ_K/dt. Similar to energy library + stretching."""
    E  = exp['E']
    Om = exp['Om']
    if Om is None:
        return None
    t  = exp['t']
    K  = exp['K'].astype(float)
    nu = exp['nu']
    T, N = Om.shape
    dOm_dt = centred_deriv(Om, t)

    E_p = np.clip(E,  0, None)
    O_p = np.clip(Om, 0, None)
    O_m = shift_minus(O_p)
    O_P = shift_plus(O_p)

    K2 = (K**2)[None, :]
    K_arr = K[None, :]
    K_15 = (K**1.5)[None, :]

    terms = {
        'Om_K':         O_p,
        'Om_K-1':       O_m,
        'Om_K+1':       O_P,
        'nu_K2_Om':     nu * K2 * O_p,
        'K2_Om':        K2 * O_p,
        'diff_Om':      (O_P - 2*O_p + O_m),
        'Om_K*Om_K-1':  O_p * O_m,
        'Om_K*Om_K+1':  O_p * O_P,
        'Om_K^2':       O_p * O_p,
        'sqrt_OO-':     np.sqrt(O_p * O_m),
        'sqrt_OO+':     np.sqrt(O_p * O_P),
        'K_sqrt_OO+':   K_arr * np.sqrt(O_p * O_P),
        'K15_sqrt_OO+': K_15  * np.sqrt(O_p * O_P),
        'E*Om':         E_p * O_p,
        'sqrt_EOm':     np.sqrt(E_p * O_p),
        'K_sqrt_EOm':   K_arr * np.sqrt(E_p * O_p),
        'K15_sqrt_EOm': K_15  * np.sqrt(E_p * O_p),
    }
    names = list(terms.keys())
    F = np.stack([terms[n] for n in names], axis=-1)
    return F.reshape(-1, F.shape[-1]), dOm_dt.reshape(-1), names, dOm_dt, (T, N)

# ============================================================
# Ridge regression
# ============================================================
def ridge_fit(A, y, lam=1e-6):
    """Solve (AᵀA + λI) c = Aᵀy."""
    M = A.shape[1]
    AtA = A.T @ A
    Aty = A.T @ y
    c = np.linalg.solve(AtA + lam * np.eye(M), Aty)
    residual = A @ c - y
    r2 = 1.0 - np.sum(residual**2) / (np.sum((y - y.mean())**2) + 1e-30)
    return c, r2

# ============================================================
# Forward integration of the discovered model
# ============================================================
def make_rhs_E(coeffs_E, names_E, coeffs_Om, names_Om, nu, K):
    """Build a Python function that evaluates the discovered RHS.
    State y = [E_1..E_N, Ω_1..Ω_N]."""
    N = len(K)
    def rhs(t, y):
        E  = y[:N]
        Om = y[N:]
        E_p = np.clip(E, 0, None)
        O_p = np.clip(Om, 0, None)
        E_m = np.concatenate([[0.0], E_p[:-1]])
        E_P = np.concatenate([E_p[1:], [E_p[-1]]])
        O_m = np.concatenate([[0.0], O_p[:-1]])
        O_P = np.concatenate([O_p[1:], [O_p[-1]]])

        K2   = K**2
        K_15 = K**1.5
        K_arr = K

        feats_E = {
            'E_K':          E_p,
            'E_K-1':        E_m,
            'E_K+1':        E_P,
            'Om_K':         O_p,
            'Om_K-1':       O_m,
            'Om_K+1':       O_P,
            'nu_K2_E':      nu * K2 * E_p,
            'K2_E':         K2 * E_p,
            'diff_E':       (E_P - 2*E_p + E_m),
            'adv_up':       (E_p - E_m),
            'adv_dn':       (E_P - E_p),
            'E_K*E_K-1':    E_p * E_m,
            'E_K*E_K+1':    E_p * E_P,
            'E_K^2':        E_p * E_p,
            'E_K-1*E_K+1':  E_m * E_P,
            'sqrt_EE-':     np.sqrt(E_p * E_m),
            'sqrt_EE+':     np.sqrt(E_p * E_P),
            'K_sqrt_EE+':   K_arr * np.sqrt(E_p * E_P),
            'K15_sqrt_EE+': K_15  * np.sqrt(E_p * E_P),
            'K_sqrt_EE-':   K_arr * np.sqrt(E_p * E_m),
            'K15_sqrt_EE-': K_15  * np.sqrt(E_p * E_m),
            'divΠ_1':       K_arr * (np.sqrt(E_p*E_P) - np.sqrt(np.concatenate([[0.0], E_p[:-1]])*E_p)),
            'divΠ_15':      K_15  * (np.sqrt(E_p*E_P) - np.sqrt(np.concatenate([[0.0], E_p[:-1]])*E_p)),
            'E*Om':         E_p * O_p,
            'sqrt_EOm':     np.sqrt(E_p * O_p),
            'K_sqrt_EOm':   K_arr * np.sqrt(E_p * O_p),
        }
        dE = np.zeros(N)
        for name, c in zip(names_E, coeffs_E):
            dE += c * feats_E[name]

        if coeffs_Om is None:
            return np.concatenate([dE, np.zeros(N)])

        feats_O = {
            'Om_K':         O_p,
            'Om_K-1':       O_m,
            'Om_K+1':       O_P,
            'nu_K2_Om':     nu * K2 * O_p,
            'K2_Om':        K2 * O_p,
            'diff_Om':      (O_P - 2*O_p + O_m),
            'Om_K*Om_K-1':  O_p * O_m,
            'Om_K*Om_K+1':  O_p * O_P,
            'Om_K^2':       O_p * O_p,
            'sqrt_OO-':     np.sqrt(O_p * O_m),
            'sqrt_OO+':     np.sqrt(O_p * O_P),
            'K_sqrt_OO+':   K_arr * np.sqrt(O_p * O_P),
            'K15_sqrt_OO+': K_15  * np.sqrt(O_p * O_P),
            'E*Om':         E_p * O_p,
            'sqrt_EOm':     np.sqrt(E_p * O_p),
            'K_sqrt_EOm':   K_arr * np.sqrt(E_p * O_p),
            'K15_sqrt_EOm': K_15  * np.sqrt(E_p * O_p),
        }
        dO = np.zeros(N)
        for name, c in zip(names_Om, coeffs_Om):
            dO += c * feats_O[name]
        return np.concatenate([dE, dO])
    return rhs

def integrate_and_score(dim_data, coeffs_E, names_E, coeffs_Om, names_Om):
    """For each experiment, integrate the discovered ODE and compute rel_rmse."""
    scores = {}
    for label, exp in dim_data.items():
        N = exp['E'].shape[1]
        E0 = exp['E'][0]
        Om0 = exp['Om'][0] if exp['Om'] is not None else np.zeros(N)
        y0 = np.concatenate([E0, Om0])
        rhs = make_rhs_E(coeffs_E, names_E, coeffs_Om, names_Om, exp['nu'], exp['K'])
        try:
            sol = solve_ivp(rhs, [exp['t'][0], exp['t'][-1]], y0,
                            t_eval=exp['t'], method='RK45',
                            rtol=1e-5, atol=1e-8, max_step=0.05)
            if not sol.success:
                scores[label] = {'rel_rmse_E': float('inf'),
                                 'rel_rmse_Om': float('inf')}
                continue
            E_sim = sol.y[:N].T
            rE = float(np.sqrt(np.mean((E_sim - exp['E'])**2)) /
                       (np.sqrt(np.mean(exp['E']**2)) + 1e-12))
            rO = float('nan')
            if exp['Om'] is not None and coeffs_Om is not None:
                Om_sim = sol.y[N:].T
                rO = float(np.sqrt(np.mean((Om_sim - exp['Om'])**2)) /
                           (np.sqrt(np.mean(exp['Om']**2)) + 1e-12))
            scores[label] = {'rel_rmse_E': rE, 'rel_rmse_Om': rO}
        except Exception as e:
            scores[label] = {'rel_rmse_E': float('inf'),
                             'rel_rmse_Om': float('inf'),
                             'error': str(e)}
    return scores

# ============================================================
# Sparsify by thresholding small coefficients
# ============================================================
def sparsify(coeffs, names, keep=12):
    """Keep the `keep` largest-magnitude coefficients; zero the rest."""
    if len(coeffs) <= keep:
        return coeffs.copy(), names
    idx = np.argsort(-np.abs(coeffs))[:keep]
    keep_set = set(idx.tolist())
    out = np.zeros_like(coeffs)
    for i in keep_set:
        out[i] = coeffs[i]
    return out, names

# ============================================================
# Main
# ============================================================
def fit_dim(dim, dim_data):
    flush(f"\n{'='*78}\n{dim}: SINDy-style universal fit\n{'='*78}")

    # Stack features across all 4 experiments
    A_E_list, y_E_list = [], []
    names_E = None
    for label, exp in sorted(dim_data.items()):
        A, y, names, _, _ = build_features_E(exp)
        A_E_list.append(A); y_E_list.append(y)
        if names_E is None: names_E = names
    A_E = np.vstack(A_E_list); y_E = np.concatenate(y_E_list)
    flush(f"  Energy regression: {A_E.shape[0]} samples × {A_E.shape[1]} features")

    c_E, r2_E = ridge_fit(A_E, y_E, lam=1e-5)
    flush(f"  R² (dE/dt fit) = {r2_E:.6f}")

    # Enstrophy (if present)
    c_O = None
    names_O = None
    if dim != '1D':
        A_O_list, y_O_list = [], []
        for label, exp in sorted(dim_data.items()):
            res = build_features_Om(exp)
            if res is None: continue
            A, y, names, _, _ = res
            A_O_list.append(A); y_O_list.append(y)
            if names_O is None: names_O = names
        if A_O_list:
            A_O = np.vstack(A_O_list); y_O = np.concatenate(y_O_list)
            flush(f"  Enstrophy regression: {A_O.shape[0]} samples × {A_O.shape[1]} features")
            c_O, r2_O = ridge_fit(A_O, y_O, lam=1e-5)
            flush(f"  R² (dΩ/dt fit) = {r2_O:.6f}")

    # Show top coefficients
    flush("\n  Top 10 energy coefficients:")
    idx = np.argsort(-np.abs(c_E))[:10]
    for i in idx:
        flush(f"    {names_E[i]:<16s} : {c_E[i]:+.4e}")
    if c_O is not None:
        flush("\n  Top 10 enstrophy coefficients:")
        idx = np.argsort(-np.abs(c_O))[:10]
        for i in idx:
            flush(f"    {names_O[i]:<16s} : {c_O[i]:+.4e}")

    # Validate by integrating
    flush("\n  Forward integration validation:")
    scores = integrate_and_score(dim_data, c_E, names_E, c_O, names_O)
    for label in sorted(scores.keys()):
        s = scores[label]
        rE = s['rel_rmse_E']
        rO = s['rel_rmse_Om']
        rO_str = f"{rO:.4e}" if isinstance(rO, float) and not np.isnan(rO) else '--'
        flush(f"    {label}:  rel_rmse(E) = {rE:.4e}    rel_rmse(Ω) = {rO_str}")

    return dict(
        coeffs_E = c_E.tolist(), names_E = names_E,
        coeffs_Om = (c_O.tolist() if c_O is not None else None), names_Om = names_O,
        r2_E = r2_E,
        scores = scores,
    )

def main():
    flush("="*78)
    flush("ROCK POOL v6 — SINDy sparse regression (data-driven closure)")
    flush("="*78)
    all_data = load_all()
    for d, exps in all_data.items():
        flush(f"  {d}: {sorted(exps.keys())} shells={exps['A']['E'].shape[1]}")

    results = {}
    for dim in ['1D','2D','3D']:
        if dim not in all_data: continue
        results[dim] = fit_dim(dim, all_data[dim])

    # Summary table
    flush("\n" + "="*78)
    flush("SUMMARY: rel_rmse(E)  (forward-integrated)")
    flush("="*78)
    hdr = f"{'Dim':<6}" + " ".join(f"{l:<12}" for l in ['A','B','C','D'])
    flush(hdr); flush("-"*len(hdr))
    for dim in sorted(results.keys()):
        row = f"{dim:<6}"
        for label in ['A','B','C','D']:
            s = results[dim]['scores'].get(label)
            if s is None:
                row += f"{'--':<12}"
            else:
                row += f"{s['rel_rmse_E']:<12.4e}"
        flush(row)

    flush("\nSUMMARY: rel_rmse(Ω)  (forward-integrated)")
    flush("-"*len(hdr))
    for dim in sorted(results.keys()):
        row = f"{dim:<6}"
        for label in ['A','B','C','D']:
            s = results[dim]['scores'].get(label)
            if s is None:
                row += f"{'--':<12}"
            else:
                rO = s['rel_rmse_Om']
                row += (f"{rO:<12.4e}" if isinstance(rO, float) and not np.isnan(rO)
                         else f"{'--':<12}")
        flush(row)

    # Save
    out = '/Users/rod/code/ns-proof/results/rock_pool_v6_results.json'
    with open(out, 'w') as f:
        json.dump(results, f, indent=2, default=str)
    flush(f"\nResults saved to {out}")

if __name__ == '__main__':
    main()
