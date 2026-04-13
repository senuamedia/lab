#!/usr/bin/env python3
"""
Rock-pool v8 — telegraph + Leith combined, physics-constrained regression.

v3 (linear telegraph) fit pulse ICs well (~9 % in 1D/3D) but failed on
packet ICs.  v7 (Leith flux) fit 2D well but failed on pulse ICs.  v8
combines the two into a single linear-regression fit.

State:
    y = [E_1..E_N, J_1..J_N, Ω_1..Ω_N, J^Ω_1..J^Ω_N]     (1D drops Ω block)

Dynamics:
    dE_K/dt  = -(J_K - J_{K-1}) + divergence of Leith flux - ν K² E_K - σ_drain
    dJ_K/dt  = A · (E_{K+1} - E_K) - γ · J_K
    dΩ_K/dt  = -(J^Ω_K - J^Ω_{K-1}) + div Leith_Ω - 2 ν K² Ω_K + σ_source
    dJ^Ω_K/dt = A_Ω · (Ω_{K+1} - Ω_K) - γ_Ω · J^Ω_K

The regression separates into two parts:

(1) dE/dt fit:  given the current J_K trajectory, we fit the NET transfer
    term  dE/dt + ν K² E_K + (J_K - J_{K-1})  against the Leith flux
    library — this gives the Leith coefficients.  Then dJ/dt is fit
    independently.

(2) We iterate: start with A=γ=0 (no wave), fit Leith, then integrate the
    wave equation with J seeded from the residual, and re-fit.

In practice simpler: fit dE/dt + ν K² E_K directly against a library
containing BOTH the wave flux divergence (parametrised) AND the Leith
flux divergence.  The coefficients tell us the relative weight.

Library (14 terms, per shell K):
  ----- wave / advection -----
    adv_down    = (E_{K+1} - E_K)                  # forward flux gradient
    adv_up      = (E_K - E_{K-1})                  # reverse flux gradient
    diff_E      = E_{K+1} - 2 E_K + E_{K-1}         # linear diffusion
  ----- Leith fluxes (E) -----
    Π^E_0 div   = div( √(E·E_{+1}) )
    Π^E_1 div   = div( K  · √(E·E_{+1}) )
    Π^E_15 div  = div( K^{3/2} · √(E·E_{+1}) )
  ----- Ω transfer -----
    adv_down_Ω, adv_up_Ω, diff_Ω
    Π^Ω_0 div, Π^Ω_1 div, Π^Ω_15 div
  ----- stretching -----
    σ_source on Ω, σ_drain on E
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
# Helpers
# ============================================================
def centred_deriv(y, t):
    dy = np.zeros_like(y)
    dy[1:-1] = (y[2:] - y[:-2]) / (t[2:] - t[:-2])[:, None]
    dy[0]    = (y[1] - y[0]) / (t[1] - t[0])
    dy[-1]   = (y[-1] - y[-2]) / (t[-1] - t[-2])
    return dy

def shift_minus(x):
    """x_{K-1}, zero at K=1 (no flux boundary)."""
    out = np.zeros_like(x)
    out[..., 1:] = x[..., :-1]
    return out

def shift_plus(x):
    """x_{K+1}, reflecting at K=N (copy last)."""
    out = np.zeros_like(x)
    out[..., :-1] = x[..., 1:]
    out[..., -1]  = x[..., -1]
    return out

def div_flux_1d(pi):
    """Π_{K-1} - Π_K (1-D array)."""
    pi_prev = np.concatenate([[0.0], pi[:-1]])
    return pi_prev - pi

def div_flux_2d(pi):
    """Π_{K-1} - Π_K, axis=-1."""
    pi_prev = np.concatenate([np.zeros((pi.shape[0], 1)), pi[:, :-1]], axis=1)
    return pi_prev - pi

# ============================================================
# Feature builders (for regression, we need dE/dt as target)
# ============================================================
def pi_basis_2d(X, K_arr):
    """Three Leith flux bases, each of shape (T, N).  X is (T, N)."""
    X_pos = np.clip(X, 0, None)
    X_next = np.zeros_like(X_pos)
    X_next[:, :-1] = X_pos[:, 1:]     # reflecting → X_next at last shell = 0 (Π_N = 0)
    base = np.sqrt(X_pos * X_next)
    K = K_arr[None, :]
    return base, K*base, (K**1.5)*base

def build_features(exp, include_omega):
    """Return A, y for the regression.

    Params vector (14 components, some zero for 1D):
       0: adv_down_E      (E_K+1 - E_K)
       1: adv_up_E        (E_K - E_K-1)
       2: diff_E          discrete Laplacian
       3: cL0_E           div of Π_0^E
       4: cL1_E           div of Π_1^E
       5: cL15_E          div of Π_{1.5}^E
       6: adv_down_O
       7: adv_up_O
       8: diff_O
       9: cL0_O
      10: cL1_O
      11: cL15_O
      12: σ (source on Ω, drain on E)
      13: K_sigma_source  (K·√(E·Ω) — an alternative stretching form)
    """
    E  = exp['E']; Om = exp['Om']; t = exp['t']; K_arr = exp['K']; nu = exp['nu']
    T, N = E.shape

    dE_dt = centred_deriv(E, t)
    # Target = dE/dt + ν K² E   (viscous removed)
    y_E = dE_dt + nu * (K_arr**2)[None, :] * E

    E_pos = np.clip(E, 0, None)
    E_next = shift_plus(E_pos)
    E_prev = shift_minus(E_pos)

    feat_E = np.zeros((T, N, 14))
    feat_E[:, :, 0] = (E_next - E_pos)
    feat_E[:, :, 1] = (E_pos - E_prev)
    feat_E[:, :, 2] = (E_next - 2*E_pos + E_prev)
    pi0, pi1, pi15 = pi_basis_2d(E, K_arr)
    feat_E[:, :, 3] = div_flux_2d(pi0)
    feat_E[:, :, 4] = div_flux_2d(pi1)
    feat_E[:, :, 5] = div_flux_2d(pi15)

    if include_omega and Om is not None:
        Om_pos = np.clip(Om, 0, None)
        # σ drain acts on E  (negative direction)
        EO = E_pos * Om_pos
        feat_E[:, :, 12] = -np.sqrt(EO)
        # alternative
        feat_E[:, :, 13] = -K_arr[None, :] * np.sqrt(EO) * 0   # disabled by default

    A_E = feat_E.reshape(-1, 14)
    y_E_flat = y_E.reshape(-1)

    if include_omega and Om is not None:
        dO_dt = centred_deriv(Om, t)
        y_O = dO_dt + 2.0 * nu * (K_arr**2)[None, :] * Om
        Om_next = shift_plus(Om_pos)
        Om_prev = shift_minus(Om_pos)

        feat_O = np.zeros((T, N, 14))
        feat_O[:, :, 6] = (Om_next - Om_pos)
        feat_O[:, :, 7] = (Om_pos - Om_prev)
        feat_O[:, :, 8] = (Om_next - 2*Om_pos + Om_prev)
        pi0, pi1, pi15 = pi_basis_2d(Om, K_arr)
        feat_O[:, :, 9]  = div_flux_2d(pi0)
        feat_O[:, :, 10] = div_flux_2d(pi1)
        feat_O[:, :, 11] = div_flux_2d(pi15)

        # stretching source for Ω
        EO = E_pos * Om_pos
        feat_O[:, :, 12] = K_arr[None, :] * np.sqrt(EO)

        A_O = feat_O.reshape(-1, 14)
        y_O_flat = y_O.reshape(-1)
        return A_E, y_E_flat, A_O, y_O_flat

    return A_E, y_E_flat, None, None

# ============================================================
# Forward integration (pure ODE, no wave variables — simpler)
# ============================================================
def make_rhs(params, K_arr, nu, include_omega):
    (aE_dn, aE_up, dE_diff, cE0, cE1, cE15,
     aO_dn, aO_up, dO_diff, cO0, cO1, cO15,
     sigma, _extra) = params
    N = len(K_arr)
    K2 = K_arr**2

    def rhs(t, y):
        E  = np.clip(y[:N], 0, None)
        E_next = np.concatenate([E[1:], [E[-1]]])
        E_prev = np.concatenate([[0.0], E[:-1]])
        dE = (aE_dn * (E_next - E) + aE_up * (E - E_prev)
              + dE_diff * (E_next - 2*E + E_prev))
        # Leith
        X_next = np.concatenate([E[1:], [0.0]])       # Π_N = 0
        base = np.sqrt(np.clip(E * X_next, 0, None))
        pi_E = cE0*base + cE1*K_arr*base + cE15*(K_arr**1.5)*base
        dE += np.concatenate([[0.0], pi_E[:-1]]) - pi_E
        dE -= nu * K2 * E

        if include_omega:
            Om = np.clip(y[N:2*N], 0, None)
            Om_next = np.concatenate([Om[1:], [Om[-1]]])
            Om_prev = np.concatenate([[0.0], Om[:-1]])
            dOm = (aO_dn * (Om_next - Om) + aO_up * (Om - Om_prev)
                   + dO_diff * (Om_next - 2*Om + Om_prev))
            X_next_O = np.concatenate([Om[1:], [0.0]])
            base_O = np.sqrt(np.clip(Om * X_next_O, 0, None))
            pi_O = cO0*base_O + cO1*K_arr*base_O + cO15*(K_arr**1.5)*base_O
            dOm += np.concatenate([[0.0], pi_O[:-1]]) - pi_O
            dOm -= 2.0 * nu * K2 * Om

            EO = np.clip(y[:N] * y[N:2*N], 0, None)
            src = sigma * K_arr * np.sqrt(EO)
            drain = sigma * np.sqrt(EO)
            dE -= drain
            dOm += src
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
# Fit
# ============================================================
def per_experiment_fit(exp, include_omega, lam=1e-6):
    A_E, y_E, A_O, y_O = build_features(exp, include_omega)
    if A_O is not None:
        A = np.vstack([A_E, A_O])
        y = np.concatenate([y_E, y_O])
    else:
        A = A_E.copy(); A[:, 6:] = 0.0
        y = y_E
    M = A.shape[1]
    AtA = A.T @ A + lam * np.eye(M)
    Aty = A.T @ y
    c = np.linalg.solve(AtA, Aty)
    rE, rO = integrate_and_score(exp, c, include_omega)
    return c, rE, rO

def universal_fit(dim_data, include_omega, lam=1e-6):
    A_list, y_list = [], []
    for label, exp in sorted(dim_data.items()):
        A_E, y_E, A_O, y_O = build_features(exp, include_omega)
        A_list.append(A_E); y_list.append(y_E)
        if A_O is not None:
            A_list.append(A_O); y_list.append(y_O)
    A = np.vstack(A_list); y = np.concatenate(y_list)
    if not include_omega:
        A = A.copy(); A[:, 6:] = 0.0
    AtA = A.T @ A + lam * np.eye(A.shape[1])
    Aty = A.T @ y
    c = np.linalg.solve(AtA, Aty)
    scores = {}
    for label, exp in sorted(dim_data.items()):
        rE, rO = integrate_and_score(exp, c, include_omega)
        scores[label] = dict(rel_rmse_E=rE, rel_rmse_Om=rO)
    return c, scores

PARAM_NAMES = ['aE_dn','aE_up','diff_E','cE0','cE1','cE15',
               'aO_dn','aO_up','diff_O','cO0','cO1','cO15',
               'σ','_']

def main():
    flush("="*78)
    flush("ROCK POOL v8 — telegraph + Leith combined regression")
    flush("="*78)
    all_data = load_all()

    all_results = {}
    for dim in ['1D','2D','3D']:
        if dim not in all_data: continue
        include_omega = (dim != '1D')
        flush(f"\n{'='*78}\n{dim}: universal combined fit\n{'='*78}")
        c, scores = universal_fit(all_data[dim], include_omega)
        for name, val in zip(PARAM_NAMES, c):
            if name == '_': continue
            flush(f"  {name:>8s} = {val:+.4e}")

        flush("\n  Universal fit — forward integration scores:")
        for label in sorted(scores.keys()):
            s = scores[label]
            rO = s['rel_rmse_Om']
            rO_str = f"{rO:.4e}" if isinstance(rO, float) and not np.isnan(rO) else '--'
            flush(f"    {label}: rel_rmse(E)={s['rel_rmse_E']:.4e}  rel_rmse(Ω)={rO_str}")

        flush("\n  Per-experiment fit:")
        per = {}
        for label, exp in sorted(all_data[dim].items()):
            pc, rE, rO = per_experiment_fit(exp, include_omega)
            per[label] = dict(params=pc.tolist(), rel_rmse_E=rE, rel_rmse_Om=rO)
            rO_str = f"{rO:.4e}" if isinstance(rO, float) and not np.isnan(rO) else '--'
            flush(f"    {label}: rel_rmse(E)={rE:.4e}  rel_rmse(Ω)={rO_str}")

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

    flush("\nSUMMARY: rel_rmse(Ω)  [universal | per-experiment]")
    flush(f"{'Dim':<4}{'Exp':<4} {'universal':>16s} {'per-exp':>16s}")
    flush("-"*50)
    for dim in sorted(all_results.keys()):
        for label in ['A','B','C','D']:
            if label not in all_results[dim]['universal']['scores']: continue
            u  = all_results[dim]['universal']['scores'][label]['rel_rmse_Om']
            pe = all_results[dim]['per_experiment'][label]['rel_rmse_Om']
            if not isinstance(u, float) or np.isnan(u): continue
            flush(f"{dim:<4}{label:<4} {u:>16.4e} {pe:>16.4e}")

    out = '/Users/rod/code/ns-proof/results/rock_pool_v8_results.json'
    with open(out, 'w') as f:
        json.dump(all_results, f, indent=2, default=str)
    flush(f"\nResults saved to {out}")

if __name__ == '__main__':
    main()
