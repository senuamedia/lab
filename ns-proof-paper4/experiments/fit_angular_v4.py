#!/usr/bin/env python3
"""
Angular-resolved v4: coupled (E_angular, Omega_K) with INDEPENDENT Omega.

v3 had a critical flaw: it approximated Omega_K = K^2 E_K, making the
stretching feature S = K sqrt(E Omega) degenerate with K^2 E. This
corrupted the 3D coefficients (sigma_net = 0.18 was an artifact).

v4 fixes this by co-evolving Omega_K as an independent state variable:

  State: y = [E_{1,1}...E_{N,n_mu}, Omega_1...Omega_N]

  dE_{K,j}/dt = c1 * radial_diff(E)_j + c2 * (E_bar - E_{K,j})
              + c3 * angular_diff(E)_j + c4 * leith_div(E)_j
              + c5 * K sqrt(E_K * Omega_K) * E_{K,j}/E_K       [stretching drain]
              + c6 * E_{K,j} * Omega_K / E_K                   [cross-coupling]
              - nu * K^2 * E_{K,j}

  dOmega_K/dt = d1 * (Omega_{K+1} - 2 Omega_K + Omega_{K-1})  [radial diff]
              + d2 * leith_div(Omega)                           [Leith flux]
              + d3 * K sqrt(E_K * Omega_K)                      [stretching source]
              - 2 nu K^2 Omega_K

Now c5 (stretching) and K^2 E are NOT degenerate because Omega_K is
independent of E_K. The optimizer MUST give c5 its true stretching value.

Parameters: c1..c6 for E equation, d1..d3 for Omega equation = 9 total.
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

FEAT_NAMES_E = ['c1_radial', 'c2_ang_relax', 'c3_ang_diff',
                'c4_leith', 'c5_stretch', 'c6_EO_coupling']
FEAT_NAMES_O = ['d1_radial', 'd2_leith', 'd3_stretch']
PARAM_NAMES = FEAT_NAMES_E + FEAT_NAMES_O
N_PARAMS = len(PARAM_NAMES)  # 9

def subsample(t, E_ang, Om_K, n_keep=30):
    if len(t) <= n_keep:
        return t, E_ang, Om_K
    idx = np.linspace(0, len(t)-1, n_keep).astype(int)
    return t[idx], E_ang[idx], Om_K[idx]

# ============================================================
# RHS: coupled (E_angular, Omega_K)
# ============================================================
def make_rhs(params, K_arr, nu, n_bins):
    c1, c2, c3, c4, c5, c6, d1, d2, d3 = params
    N = len(K_arr)
    K2 = K_arr**2
    state_len = N * n_bins + N  # E_angular + Omega_K

    def rhs(t, y_flat):
        E = np.clip(y_flat[:N*n_bins].reshape(N, n_bins), 0, None)
        Om = np.clip(y_flat[N*n_bins:], 0, None)  # (N,)

        # E shifts
        E_prev = np.zeros_like(E); E_prev[1:] = E[:-1]; E_prev[0] = E[0]
        E_next = np.zeros_like(E); E_next[:-1] = E[1:]; E_next[-1] = E[-1]
        E_bar = np.mean(E, axis=-1, keepdims=True)
        E_jm1 = np.roll(E, 1, axis=-1)
        E_jp1 = np.roll(E, -1, axis=-1)

        # Leith flux for E (per angular bin)
        base_next = np.sqrt(np.clip(E * E_next, 0, None))
        base_self = np.sqrt(np.clip(E_prev * E, 0, None))

        # Shell totals
        E_K = np.sum(E, axis=-1) + 1e-30  # (N,)
        frac = E / E_K[:, None]             # (N, n_bins)

        # Stretching: uses INDEPENDENT Omega_K
        EO_product = np.clip(E_K * Om, 0, None)  # (N,)
        stretch_K = K_arr * np.sqrt(EO_product)    # (N,)

        # E equation
        dE = (c1 * (E_next - 2*E + E_prev)         # radial diffusion
            + c2 * (E_bar - E)                       # angular relaxation
            + c3 * (E_jp1 - 2*E + E_jm1)            # angular diffusion
            + c4 * (base_self - base_next)           # Leith flux
            + c5 * stretch_K[:, None] * frac         # stretching drain (distributed)
            + c6 * E * Om[:, None] / E_K[:, None]   # E*Omega coupling
            - nu * K2[:, None] * E)                  # viscous dissipation

        # Omega equation
        Om_prev = np.zeros(N); Om_prev[1:] = Om[:-1]; Om_prev[0] = Om[0]
        Om_next = np.zeros(N); Om_next[:-1] = Om[1:]; Om_next[-1] = Om[-1]

        base_Om_next = np.sqrt(np.clip(Om * Om_next, 0, None))
        base_Om_self = np.sqrt(np.clip(Om_prev * Om, 0, None))

        dOm = (d1 * (Om_next - 2*Om + Om_prev)     # radial diffusion
             + d2 * (base_Om_self - base_Om_next)   # Leith flux
             + d3 * stretch_K                        # stretching source
             - 2.0 * nu * K2 * Om)                  # viscous dissipation (factor 2)

        return np.concatenate([dE.flatten(), dOm])
    return rhs

def build_y0(E_ang_0, Om_K_0):
    return np.concatenate([E_ang_0.flatten(), Om_K_0])

def integrate_fast(params, E_ang_0, Om_K_0, t_eval, K_arr, nu):
    """Fixed-step RK4 — much faster than adaptive solve_ivp for optimisation."""
    N, n_bins = E_ang_0.shape
    y = build_y0(E_ang_0, Om_K_0)
    rhs_fn = make_rhs(params, K_arr, nu, n_bins)
    n_state = len(y)

    results_E = [E_ang_0.copy()]
    results_O = [Om_K_0.copy()]
    for i in range(len(t_eval) - 1):
        dt = t_eval[i+1] - t_eval[i]
        try:
            k1 = rhs_fn(0, y)
            k2 = rhs_fn(0, y + 0.5*dt*k1)
            k3 = rhs_fn(0, y + 0.5*dt*k2)
            k4 = rhs_fn(0, y + dt*k3)
            y = y + (dt/6)*(k1 + 2*k2 + 2*k3 + k4)
            if np.any(np.isnan(y)) or np.any(np.abs(y) > 1e6):
                return None, None
        except Exception:
            return None, None
        results_E.append(y[:N*n_bins].reshape(N, n_bins).copy())
        results_O.append(y[N*n_bins:].copy())

    return np.array(results_E), np.array(results_O)

def integrate(params, E_ang_0, Om_K_0, t_eval, K_arr, nu):
    """Adaptive solve_ivp — used for final scoring only."""
    N, n_bins = E_ang_0.shape
    y0 = build_y0(E_ang_0, Om_K_0)
    rhs = make_rhs(params, K_arr, nu, n_bins)
    sol = solve_ivp(rhs, [t_eval[0], t_eval[-1]], y0,
                    t_eval=t_eval, method='RK45',
                    rtol=1e-5, atol=1e-8, max_step=0.05)
    if not sol.success:
        return None, None
    E_sim = sol.y[:N*n_bins].reshape(N, n_bins, -1).transpose(2, 0, 1)
    Om_sim = sol.y[N*n_bins:].T
    return E_sim, Om_sim

def loss_one(params, E_ang, Om_K, t, K_arr, nu):
    E_sim, Om_sim = integrate_fast(params, E_ang[0], Om_K[0], t, K_arr, nu)
    if E_sim is None:
        return 1e10
    sE = np.sqrt(np.mean(E_ang**2)) + 1e-12
    sO = np.sqrt(np.mean(Om_K**2)) + 1e-12
    rE = np.sum((E_sim - E_ang)**2) / (sE**2 * E_ang.size)
    rO = np.sum((Om_sim - Om_K)**2) / (sO**2 * Om_K.size)
    return float(rE + rO)

def loss_all(params, exps):
    return sum(loss_one(params, *e) for e in exps)

def rel_rmse(params, E_ang, Om_K, t, K_arr, nu):
    E_sim, Om_sim = integrate(params, E_ang[0], Om_K[0], t, K_arr, nu)
    if E_sim is None:
        return float('inf'), float('inf'), float('inf')
    E_K_dns = np.sum(E_ang, axis=-1)
    E_K_sim = np.sum(E_sim, axis=-1)
    rE = float(np.sqrt(np.mean((E_K_sim - E_K_dns)**2)) /
               (np.sqrt(np.mean(E_K_dns**2)) + 1e-12))
    rA = float(np.sqrt(np.mean((E_sim - E_ang)**2)) /
               (np.sqrt(np.mean(E_ang**2)) + 1e-12))
    rO = float(np.sqrt(np.mean((Om_sim - Om_K)**2)) /
               (np.sqrt(np.mean(Om_K**2)) + 1e-12))
    return rE, rA, rO

# ============================================================
# Main
# ============================================================
def main():
    flush("="*78)
    flush("ANGULAR v4: COUPLED (E, Omega) — INDEPENDENT ENSTROPHY")
    flush("="*78)

    for dim in ['2D', '3D']:
        path = DATASETS[dim]
        if not os.path.exists(path): continue
        data = np.load(path)
        K_arr = data['A_K_list'].astype(float)
        N = len(K_arr)

        flush(f"\n{'='*78}\n{dim}: {N} shells\n{'='*78}")

        exps_full, exps_sub, labels = [], [], []
        for label in ['A','B','C','D']:
            if f'{label}_E_angular' not in data.files: continue
            if f'{label}_Om_K' not in data.files: continue
            E_ang = data[f'{label}_E_angular']
            Om_K  = data[f'{label}_Om_K']
            t     = data[f'{label}_t']
            nu    = NU[dim][label]
            exps_full.append((E_ang, Om_K, t, K_arr, nu))
            t_s, E_s, O_s = subsample(t, E_ang, Om_K, n_keep=60)
            exps_sub.append((E_s, O_s, t_s, K_arr, nu))
            labels.append(label)

        n_bins = exps_full[0][0].shape[2]
        flush(f"  {len(labels)} experiments, {n_bins} angular bins, "
              f"{N_PARAMS} parameters (6 E + 3 Omega)")

        # Bounds: allow signed coefficients but bounded
        bounds = [(-2, 2)]*N_PARAMS

        # Seeds
        seeds = [
            np.array([0.05, 0.1, 0.02, 0.05, -0.05, 0.0, 0.1, 0.05, 0.1]),
            np.array([0.1, 0.3, 0.05, 0.1, -0.1, 0.0, 0.3, 0.1, 0.2]),
            np.array([0.01, 0.01, 0.01, 0.01, -0.01, 0.0, 0.01, 0.01, 0.01]),
            np.array([-0.01, 0.05, 0.01, -0.02, -0.02, -0.01, 0.05, -0.01, 0.05]),
        ]
        rng = np.random.default_rng(42)
        for _ in range(2):
            seeds.append(0.1 * rng.standard_normal(N_PARAMS))

        # Universal fit
        flush("\n  Fitting universal (integration-based)...")
        obj = lambda c: loss_all(c, exps_sub)
        best_fun = float('inf'); best_x = None
        t0 = time.time()
        for i, x0 in enumerate(seeds):
            x0 = np.clip(x0, -2, 2)
            try:
                r = minimize(obj, x0, method='L-BFGS-B', bounds=bounds,
                             options={'maxiter': 40, 'ftol': 1e-5})
                if r.fun < best_fun:
                    best_fun = r.fun; best_x = r.x
                    flush(f"    seed {i}: loss={r.fun:.6e} (new best)")
            except Exception:
                continue

        # Polish on full data
        obj_full = lambda c: loss_all(c, exps_full)
        polish = minimize(obj_full, best_x, method='L-BFGS-B', bounds=bounds,
                          options={'maxiter': 150, 'ftol': 1e-8})
        coeffs = polish.x
        elapsed = time.time() - t0
        flush(f"  Universal fit done in {elapsed:.1f}s")
        flush(f"\n  Coefficients:")
        for name, val in zip(PARAM_NAMES, coeffs):
            flush(f"    {name:<16s}: {val:+.6f}")

        # Key diagnostic: is c5 (stretching) now decoupled from K²E?
        flush(f"\n  *** CRITICAL: c5_stretch = {coeffs[4]:+.6f} ***")
        flush(f"  *** This is the TRUE vortex-stretching coefficient ***")
        flush(f"  *** (no longer degenerate with K²E) ***")

        flush(f"\n  Forward integration scores (universal):")
        for i, label in enumerate(labels):
            E_ang, Om_K, t, K_arr_l, nu = exps_full[i]
            rE, rA, rO = rel_rmse(coeffs, E_ang, Om_K, t, K_arr_l, nu)
            flush(f"    {label}: rel_rmse(E_K)={rE:.4e}  angular={rA:.4e}  Omega={rO:.4e}")

        # Per-experiment
        flush(f"\n  Per-experiment fit:")
        for i, label in enumerate(labels):
            obj_i = lambda c: loss_one(c, *exps_sub[i])
            best_i = float('inf'); best_xi = None
            for x0 in [coeffs] + seeds[:3]:
                x0 = np.clip(x0, -2, 2)
                try:
                    r = minimize(obj_i, x0, method='L-BFGS-B', bounds=bounds,
                                 options={'maxiter': 80, 'ftol': 1e-6})
                    if r.fun < best_i:
                        best_i = r.fun; best_xi = r.x
                except Exception:
                    continue
            obj_i_full = lambda c: loss_one(c, *exps_full[i])
            pi = minimize(obj_i_full, best_xi, method='L-BFGS-B', bounds=bounds,
                          options={'maxiter': 100, 'ftol': 1e-8})
            E_ang, Om_K, t, K_arr_l, nu = exps_full[i]
            rE, rA, rO = rel_rmse(pi.x, E_ang, Om_K, t, K_arr_l, nu)
            flush(f"    {label}: rE={rE:.4e} rA={rA:.4e} rO={rO:.4e}")
            flush(f"      c5_stretch={pi.x[4]:+.6f}  d3_stretch={pi.x[8]:+.6f}")

    flush("\nDone.")

if __name__ == '__main__':
    main()
