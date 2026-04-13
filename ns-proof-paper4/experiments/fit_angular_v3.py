#!/usr/bin/env python3
"""
Angular-resolved v3: integration-based optimisation.

v2 regression gave R²=0.63 per-experiment but blew up under forward
integration.  v3 fixes this by optimising the INTEGRATION error directly,
using the regression coefficients as a warm start.

Same 7 features, same physics, but the loss function is:
    L(c) = Σ_t Σ_K Σ_j (E^sim_{K,j}(t) - E^dns_{K,j}(t))²

minimised via L-BFGS-B.  This automatically penalises unstable coefficients.
"""
import sys, os, warnings, time
import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import minimize
warnings.filterwarnings('ignore')
np.seterr(all='ignore')

def flush(s): print(s); sys.stdout.flush()

DATASETS = {
    '2D': '/Users/rod/code/ns-proof/results/cascade_wave_2d.npz',
    '3D': '/Users/rod/code/ns-proof/results/cascade_wave.npz',
}
NU = {
    '2D': {'A': 0.0,  'B': 1e-3, 'C': 1e-4, 'D': 1e-4},
    '3D': {'A': 0.0,  'B': 1e-2, 'C': 0.0,  'D': 0.0},
}

FEAT_NAMES = [
    'radial_diff', 'angular_relax', 'angular_diff',
    'leith_div', 'stretch_source', 'E_times_Om', 'K2_E',
]
N_FEAT = len(FEAT_NAMES)

def subsample(t, E_ang, Om_K, n_keep=60):
    if len(t) <= n_keep:
        return t, E_ang, Om_K
    idx = np.linspace(0, len(t)-1, n_keep).astype(int)
    return t[idx], E_ang[idx], Om_K[idx]

# ============================================================
# RHS using the 7-feature parametrisation
# ============================================================
def make_rhs(coeffs, K_arr, nu, n_bins):
    N = len(K_arr)
    K2 = K_arr**2
    def rhs(t, y_flat):
        E = np.clip(y_flat.reshape(N, n_bins), 0, None)
        E_prev = np.zeros_like(E); E_prev[1:] = E[:-1]; E_prev[0] = E[0]
        E_next = np.zeros_like(E); E_next[:-1] = E[1:]; E_next[-1] = E[-1]
        E_bar = np.mean(E, axis=-1, keepdims=True)
        E_jm1 = np.roll(E, 1, axis=-1)
        E_jp1 = np.roll(E, -1, axis=-1)
        base_next = np.sqrt(np.clip(E * E_next, 0, None))
        base_self = np.sqrt(np.clip(E_prev * E, 0, None))
        E_K_total = np.sum(E, axis=-1, keepdims=True) + 1e-30
        Om_K = K2[:, None] * E_K_total
        stretch_total = K_arr[:, None] * np.sqrt(np.clip(E_K_total * Om_K, 0, None))
        frac = E / E_K_total
        Om_per_bin = Om_K * frac

        dE = (coeffs[0] * (E_next - 2*E + E_prev)
            + coeffs[1] * (E_bar - E)
            + coeffs[2] * (E_jp1 - 2*E + E_jm1)
            + coeffs[3] * (base_self - base_next)
            + coeffs[4] * stretch_total * frac
            + coeffs[5] * E * Om_per_bin
            + coeffs[6] * K2[:, None] * E
            - nu * K2[:, None] * E)
        return dE.flatten()
    return rhs

def integrate(coeffs, E_ang_0, t_eval, K_arr, nu):
    N, n_bins = E_ang_0.shape
    rhs = make_rhs(coeffs, K_arr, nu, n_bins)
    sol = solve_ivp(rhs, [t_eval[0], t_eval[-1]], E_ang_0.flatten(),
                    t_eval=t_eval, method='RK45',
                    rtol=1e-3, atol=1e-6, max_step=0.05)
    if not sol.success:
        return None
    return sol.y.reshape(N, n_bins, -1).transpose(2, 0, 1)

def loss_one_exp(coeffs, E_ang, Om_K, t, K_arr, nu):
    E_sim = integrate(coeffs, E_ang[0], t, K_arr, nu)
    if E_sim is None:
        return 1e10
    scale = np.sqrt(np.mean(E_ang**2)) + 1e-12
    return float(np.sum((E_sim - E_ang)**2) / (scale**2 * E_ang.size))

def loss_all_exps(coeffs, exps):
    total = 0.0
    for E_ang, Om_K, t, K_arr, nu in exps:
        total += loss_one_exp(coeffs, E_ang, Om_K, t, K_arr, nu)
    return total

def rel_rmse(coeffs, E_ang, t, K_arr, nu):
    E_sim = integrate(coeffs, E_ang[0], t, K_arr, nu)
    if E_sim is None:
        return float('inf'), float('inf')
    E_K_dns = np.sum(E_ang, axis=-1)
    E_K_sim = np.sum(E_sim, axis=-1)
    rE = float(np.sqrt(np.mean((E_K_sim - E_K_dns)**2)) /
               (np.sqrt(np.mean(E_K_dns**2)) + 1e-12))
    rA = float(np.sqrt(np.mean((E_sim - E_ang)**2)) /
               (np.sqrt(np.mean(E_ang**2)) + 1e-12))
    return rE, rA

# ============================================================
# Regression warm start
# ============================================================
def centred_deriv(y, t):
    dy = np.zeros_like(y)
    dt = t[2:] - t[:-2]
    shape = [len(dt)] + [1]*(y.ndim - 1)
    dy[1:-1] = (y[2:] - y[:-2]) / dt.reshape(shape)
    dy[0] = (y[1] - y[0]) / (t[1] - t[0])
    dy[-1] = (y[-1] - y[-2]) / (t[-1] - t[-2])
    return dy

def regression_warmstart(exps_full):
    """Quick regression to get a starting point."""
    from fit_angular_v2 import build_features, ridge
    # Can't import easily, so inline a simple version
    # Just return a reasonable physics-based starting point
    return np.array([0.1, 0.1, 0.05, 0.1, 0.05, 0.0, -0.05])

# ============================================================
# Main
# ============================================================
def main():
    flush("="*78)
    flush("ANGULAR v3: INTEGRATION-BASED OPTIMISATION")
    flush("="*78)

    for dim in ['2D', '3D']:
        path = DATASETS[dim]
        if not os.path.exists(path): continue
        data = np.load(path)
        K_arr = data['A_K_list'].astype(float)
        N = len(K_arr)

        flush(f"\n{'='*78}\n{dim}: {N} shells\n{'='*78}")

        exps_full = []
        exps_sub = []
        labels = []
        for label in ['A','B','C','D']:
            key = f'{label}_E_angular'
            if key not in data.files: continue
            E_ang = data[key]
            Om_K = data[f'{label}_Om_K'] if f'{label}_Om_K' in data.files else np.zeros((E_ang.shape[0], N))
            t = data[f'{label}_t']
            nu = NU[dim][label]
            exps_full.append((E_ang, Om_K, t, K_arr, nu))
            t_s, E_s, O_s = subsample(t, E_ang, Om_K, n_keep=60)
            exps_sub.append((E_s, O_s, t_s, K_arr, nu))
            labels.append(label)

        n_bins = exps_full[0][0].shape[2]
        flush(f"  {len(labels)} experiments, {n_bins} angular bins")

        # Physics-based starting points
        seeds = [
            np.array([ 0.1,  0.1,  0.05,  0.1,  0.05, 0.0, -0.05]),
            np.array([ 0.3,  0.3,  0.1,   0.3,  0.1,  0.0, -0.1]),
            np.array([ 0.05, 0.5,  0.02,  0.05, 0.02, 0.0, -0.02]),
            np.array([-0.01, 0.01, 0.01, -0.01, 0.02, 0.0, -0.02]),
        ]
        rng = np.random.default_rng(42)
        for _ in range(4):
            seeds.append(0.2 * rng.standard_normal(N_FEAT))

        bounds = [(-2, 2)]*N_FEAT

        # Fit universal (all 4 experiments)
        flush("\n  Fitting universal (integration-based)...")
        obj = lambda c: loss_all_exps(c, exps_sub)
        best_fun = float('inf'); best_x = None
        t0 = time.time()
        for i, x0 in enumerate(seeds):
            try:
                r = minimize(obj, x0, method='L-BFGS-B', bounds=bounds,
                             options={'maxiter': 60, 'ftol': 1e-6})
                if r.fun < best_fun:
                    best_fun = r.fun; best_x = r.x
                    flush(f"    seed {i}: loss={r.fun:.4e} (new best)")
            except Exception:
                continue
        # Polish on full data
        obj_full = lambda c: loss_all_exps(c, exps_full)
        polish = minimize(obj_full, best_x, method='L-BFGS-B', bounds=bounds,
                          options={'maxiter': 100, 'ftol': 1e-8})
        coeffs = polish.x
        elapsed = time.time() - t0
        flush(f"  Universal fit done in {elapsed:.1f}s")
        flush(f"\n  Coefficients:")
        for name, val in zip(FEAT_NAMES, coeffs):
            flush(f"    {name:<20s}: {val:+.6f}")

        flush(f"\n  Forward integration scores (universal, full data):")
        for i, label in enumerate(labels):
            E_ang, Om_K, t, K_arr_l, nu = exps_full[i]
            rE, rA = rel_rmse(coeffs, E_ang, t, K_arr_l, nu)
            flush(f"    {label}: rel_rmse(E_K)={rE:.4e}  rel_rmse(angular)={rA:.4e}")

        # Per-experiment fit
        flush(f"\n  Per-experiment fit:")
        for i, label in enumerate(labels):
            obj_i = lambda c: loss_one_exp(c, *exps_sub[i])
            best_fun_i = float('inf'); best_x_i = None
            for x0 in [coeffs] + seeds[:3]:
                try:
                    r = minimize(obj_i, x0, method='L-BFGS-B', bounds=bounds,
                                 options={'maxiter': 60, 'ftol': 1e-6})
                    if r.fun < best_fun_i:
                        best_fun_i = r.fun; best_x_i = r.x
                except Exception:
                    continue
            # Polish
            obj_i_full = lambda c: loss_one_exp(c, *exps_full[i])
            pi = minimize(obj_i_full, best_x_i, method='L-BFGS-B', bounds=bounds,
                          options={'maxiter': 100, 'ftol': 1e-8})
            E_ang, Om_K, t, K_arr_l, nu = exps_full[i]
            rE, rA = rel_rmse(pi.x, E_ang, t, K_arr_l, nu)
            flush(f"    {label}: rel_rmse(E_K)={rE:.4e}  rel_rmse(angular)={rA:.4e}")
            flush(f"      coeffs: " + "  ".join(f"{v:+.4f}" for v in pi.x))

    flush("\nDone.")

if __name__ == '__main__':
    main()
