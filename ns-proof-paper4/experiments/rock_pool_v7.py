#!/usr/bin/env python3
"""
Rock-pool v7 — physics-constrained linear regression.

v6 SINDy blew up because unconstrained feature regression produced
anti-viscous coefficients that diverge under forward integration.  v7
fixes this by:

  (1) Enforcing flux-form conservation.  Inter-shell transfer appears as
      the discrete divergence of a flux Π_K, so Σ_K transfer = boundary
      terms only — total energy is automatically conserved modulo the
      viscous sink.
  (2) Hard-coding the viscous term −ν K² E_K (known from the DNS setup)
      and subtracting it from dE/dt before regression.
  (3) A small, physics-curated flux basis with three K-exponents:
          Π^E_K = (c_0 + c_1·K + c_2·K^{3/2}) · √(E_K · E_{K+1})
          Π^Ω_K = (d_0 + d_1·K + d_2·K^{3/2}) · √(Ω_K · Ω_{K+1})
  (4) Vortex-stretching cross-term
          S_K = σ · K · √(E_K · Ω_K)         (Ω source)
          drain_K = σ · √(E_K · Ω_K)         (E sink)
  (5) ONE universal coefficient vector per dimension, fitted to all 4
      experiments simultaneously via least squares.

Parameters (per dimension): c_0, c_1, c_2, d_0, d_1, d_2, σ  — only 7.
For 1D the (d_i, σ) block is forced to zero (no vorticity observable).
"""
import sys, os, json, warnings
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

def load_all():
    out = {}
    for d, path in DATASETS.items():
        if not os.path.exists(path): continue
        data = np.load(path)
        out[d] = {}
        for label in ['A','B','C','D']:
            if f'{label}_t' not in data.files: continue
            out[d][label] = dict(
                t  = data[f'{label}_t'],
                E  = data[f'{label}_E_K'],
                Om = data[f'{label}_Om_K'] if f'{label}_Om_K' in data.files else None,
                K  = data[f'{label}_K_list'].astype(float),
                nu = NU[d][label],
            )
    return out

# ============================================================
# Flux helpers
# ============================================================
def pi_E_terms(E, K_arr):
    """Return three basis fluxes (N,) each:  K^p · √(E_K · E_{K+1})  for p in {0, 1, 1.5}.

    Π_{K=N} is set to 0 (reflecting top boundary).
    """
    E_pos = np.clip(E, 0, None)
    E_next = np.concatenate([E_pos[1:], [0.0]])   # Π_N = 0 ⇒ E_{N+1} = 0
    base = np.sqrt(E_pos * E_next)
    return (base, K_arr * base, (K_arr**1.5) * base)

def div_flux(pi):
    """Π_{K-1} - Π_K with Π_0 = 0."""
    pi_prev = np.concatenate([[0.0], pi[:-1]])
    return pi_prev - pi

def centred_deriv(y, t):
    dy = np.zeros_like(y)
    dy[1:-1] = (y[2:] - y[:-2]) / (t[2:] - t[:-2])[:, None]
    dy[0]    = (y[1] - y[0]) / (t[1] - t[0])
    dy[-1]   = (y[-1] - y[-2]) / (t[-1] - t[-2])
    return dy

# ============================================================
# Build features and targets for one experiment
# ============================================================
def build_features_one_exp(exp, include_omega):
    """
    Returns (A_E, y_E, A_O, y_O) where
      A_E · [c_0 c_1 c_2 (d_0 d_1 d_2 σ)] = y_E        (7 columns)
      A_O · [same]                          = y_O
    Both stacked as (T*N, 7) linear systems. Unused columns are zero.
    """
    E  = exp['E']
    Om = exp['Om']
    t  = exp['t']
    K_arr = exp['K']
    nu = exp['nu']
    T, N = E.shape

    dE_dt = centred_deriv(E, t)
    # y_E = dE/dt + ν K² E   (remove known viscous sink)
    y_E = dE_dt + nu * (K_arr**2)[None, :] * E

    feat_E = np.zeros((T, N, 7))                 # c_0..c_2 act on E; (d,σ) zero
    for ti in range(T):
        pi0, pi1, pi15 = pi_E_terms(E[ti], K_arr)
        feat_E[ti, :, 0] = div_flux(pi0)          # c_0
        feat_E[ti, :, 1] = div_flux(pi1)          # c_1
        feat_E[ti, :, 2] = div_flux(pi15)         # c_2

    if include_omega and Om is not None:
        dO_dt = centred_deriv(Om, t)
        y_O = dO_dt + 2.0 * nu * (K_arr**2)[None, :] * Om
        feat_O = np.zeros((T, N, 7))
        for ti in range(T):
            pi0, pi1, pi15 = pi_E_terms(Om[ti], K_arr)
            feat_O[ti, :, 3] = div_flux(pi0)      # d_0
            feat_O[ti, :, 4] = div_flux(pi1)      # d_1
            feat_O[ti, :, 5] = div_flux(pi15)     # d_2
            # Stretching source (affects Ω positively, E negatively)
            EO = np.clip(E[ti]  * Om[ti],  0, None)
            S = K_arr * np.sqrt(EO)
            feat_O[ti, :, 6] = S                  # σ (source for Ω)
            feat_E[ti, :, 6] = -np.sqrt(EO)       # σ (drain for E)
        # Flatten
        return feat_E.reshape(-1, 7), y_E.reshape(-1), \
               feat_O.reshape(-1, 7), y_O.reshape(-1)
    return feat_E.reshape(-1, 7), y_E.reshape(-1), None, None

# ============================================================
# Forward-integrate the fitted universal model
# ============================================================
def make_rhs(params, K_arr, nu, include_omega):
    c0, c1, c2, d0, d1, d2, sigma = params
    N = len(K_arr)
    def rhs(t, y):
        E  = np.clip(y[:N],  0, None)
        Om = np.clip(y[N:2*N], 0, None) if include_omega else None

        pi0, pi1, pi15 = pi_E_terms(E, K_arr)
        piE = c0*pi0 + c1*pi1 + c2*pi15
        dE = div_flux(piE) - nu*(K_arr**2)*E

        if include_omega:
            pO0, pO1, pO15 = pi_E_terms(Om, K_arr)
            piO = d0*pO0 + d1*pO1 + d2*pO15
            EO = np.clip(y[:N] * y[N:2*N], 0, None)
            src = sigma * K_arr * np.sqrt(EO)
            drain = sigma * np.sqrt(EO)
            dE  -= drain
            dOm = div_flux(piO) - 2.0*nu*(K_arr**2)*Om + src
            return np.concatenate([dE, dOm])
        return dE
    return rhs

def integrate_and_score(exp, params, include_omega):
    N = exp['E'].shape[1]
    if include_omega and exp['Om'] is not None:
        y0 = np.concatenate([exp['E'][0], exp['Om'][0]])
    else:
        y0 = exp['E'][0]
    rhs = make_rhs(params, exp['K'], exp['nu'], include_omega)
    try:
        sol = solve_ivp(rhs, [exp['t'][0], exp['t'][-1]], y0,
                        t_eval=exp['t'], method='RK45',
                        rtol=1e-5, atol=1e-8, max_step=0.05)
        if not sol.success:
            return float('inf'), float('inf')
        E_sim = sol.y[:N].T
        rE = float(np.sqrt(np.mean((E_sim - exp['E'])**2)) /
                   (np.sqrt(np.mean(exp['E']**2)) + 1e-12))
        rO = float('nan')
        if include_omega and exp['Om'] is not None:
            Om_sim = sol.y[N:2*N].T
            rO = float(np.sqrt(np.mean((Om_sim - exp['Om'])**2)) /
                       (np.sqrt(np.mean(exp['Om']**2)) + 1e-12))
        return rE, rO
    except Exception:
        return float('inf'), float('inf')

# ============================================================
# Per-experiment fit (gives best possible, not universal)
# ============================================================
def per_experiment_fit(dim_data, include_omega):
    results = {}
    for label, exp in sorted(dim_data.items()):
        A_E, y_E, A_O, y_O = build_features_one_exp(exp, include_omega)
        if A_O is not None:
            A = np.vstack([A_E, A_O])
            y = np.concatenate([y_E, y_O])
        else:
            A = A_E
            y = y_E
            # Zero-out enstrophy columns for 1D (d_i, σ)
            A = A.copy()
            A[:, 3:] = 0.0
        # Least squares
        AtA = A.T @ A + 1e-8*np.eye(A.shape[1])
        Aty = A.T @ y
        c = np.linalg.solve(AtA, Aty)
        rE, rO = integrate_and_score(exp, c, include_omega)
        results[label] = dict(params=c.tolist(), rel_rmse_E=rE, rel_rmse_Om=rO)
    return results

# ============================================================
# Universal fit (one parameter vector per dimension)
# ============================================================
def universal_fit(dim_data, include_omega):
    A_list, y_list = [], []
    for label, exp in sorted(dim_data.items()):
        A_E, y_E, A_O, y_O = build_features_one_exp(exp, include_omega)
        A_list.append(A_E); y_list.append(y_E)
        if A_O is not None:
            A_list.append(A_O); y_list.append(y_O)
    A = np.vstack(A_list); y = np.concatenate(y_list)
    if not include_omega:
        A = A.copy()
        A[:, 3:] = 0.0
    AtA = A.T @ A + 1e-8*np.eye(A.shape[1])
    Aty = A.T @ y
    c = np.linalg.solve(AtA, Aty)

    # Score on each experiment
    scores = {}
    for label, exp in sorted(dim_data.items()):
        rE, rO = integrate_and_score(exp, c, include_omega)
        scores[label] = dict(rel_rmse_E=rE, rel_rmse_Om=rO)
    return c, scores

# ============================================================
# Main
# ============================================================
PARAM_NAMES = ['c_0', 'c_1', 'c_2', 'd_0', 'd_1', 'd_2', 'σ']

def main():
    flush("="*78)
    flush("ROCK POOL v7 — physics-constrained flux regression")
    flush("="*78)
    all_data = load_all()

    all_results = {}
    for dim in ['1D','2D','3D']:
        if dim not in all_data: continue
        include_omega = (dim != '1D')
        flush(f"\n{'='*78}\n{dim}: universal flux fit\n{'='*78}")

        c, scores = universal_fit(all_data[dim], include_omega)
        for name, val in zip(PARAM_NAMES, c):
            flush(f"  {name:>4s} = {val:+.4e}")

        flush("\n  Universal fit — forward integration scores:")
        for label in sorted(scores.keys()):
            s = scores[label]
            rO = s['rel_rmse_Om']
            rO_str = f"{rO:.4e}" if isinstance(rO, float) and not np.isnan(rO) else '--'
            flush(f"    {label}: rel_rmse(E)={s['rel_rmse_E']:.4e}  rel_rmse(Ω)={rO_str}")

        # Per-experiment fit (best possible with this ansatz)
        flush("\n  Per-experiment fit (upper bound of what this ansatz can do):")
        per = per_experiment_fit(all_data[dim], include_omega)
        for label in sorted(per.keys()):
            p = per[label]
            rO = p['rel_rmse_Om']
            rO_str = f"{rO:.4e}" if isinstance(rO, float) and not np.isnan(rO) else '--'
            flush(f"    {label}: rel_rmse(E)={p['rel_rmse_E']:.4e}  rel_rmse(Ω)={rO_str}")

        all_results[dim] = dict(
            universal = dict(params=c.tolist(), scores=scores),
            per_experiment = per,
        )

    # Summary
    flush("\n" + "="*78)
    flush("SUMMARY: rel_rmse(E)  [universal | per-experiment]")
    flush("="*78)
    flush(f"{'Dim':<4}{'Exp':<4} {'universal':>16s} {'per-exp':>16s}")
    flush("-"*50)
    for dim in sorted(all_results.keys()):
        for label in ['A','B','C','D']:
            if label not in all_results[dim]['universal']['scores']: continue
            u  = all_results[dim]['universal']['scores'][label]['rel_rmse_E']
            pe = all_results[dim]['per_experiment'][label]['rel_rmse_E']
            flush(f"{dim:<4}{label:<4} {u:>16.4e} {pe:>16.4e}")

    flush("\nSUMMARY: rel_rmse(Ω)")
    flush(f"{'Dim':<4}{'Exp':<4} {'universal':>16s} {'per-exp':>16s}")
    flush("-"*50)
    for dim in sorted(all_results.keys()):
        for label in ['A','B','C','D']:
            if label not in all_results[dim]['universal']['scores']: continue
            u  = all_results[dim]['universal']['scores'][label]['rel_rmse_Om']
            pe = all_results[dim]['per_experiment'][label]['rel_rmse_Om']
            if not isinstance(u, float) or np.isnan(u):
                continue
            flush(f"{dim:<4}{label:<4} {u:>16.4e} {pe:>16.4e}")

    out = '/Users/rod/code/ns-proof/results/rock_pool_v7_results.json'
    with open(out, 'w') as f:
        json.dump(all_results, f, indent=2, default=str)
    flush(f"\nResults saved to {out}")

if __name__ == '__main__':
    main()
