#!/usr/bin/env python3
"""
Angular-resolved Level-2 fitter — fit the two-timescale PDE to angular-
binned shell energy data E(K, μ, t).

Model:
    dE_{K,j}/dt = D_K · (E_{K+1,j} - 2 E_{K,j} + E_{K-1,j})   (radial)
               + Γ_K · (Ē_K - E_{K,j})                          (angular relaxation)
               - ν K² E_{K,j}                                     (viscous)
               + σ_K · source_from_stretching_{K,j}               (3D only)

where Ē_K = (1/n_j) Σ_j E_{K,j} is the isotropic average.

Key diagnostics:
  - Does Γ_K > D_K?  If yes, angular relaxation is faster than radial
    cascade — isotropy is maintained during cascade (Paper 4 claim).
  - Does Γ_K scale with K?  This determines whether isotropy is harder
    to maintain at high K.

Method:
  1. Compute dE_{K,j}/dt from data
  2. Subtract known viscous term
  3. Build features: radial diffusion, angular relaxation
  4. Regression for D_K and Γ_K (per shell K, or universal)
  5. Forward integrate and score
"""
import sys, os, json, warnings
import numpy as np
from scipy.integrate import solve_ivp
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

def centred_deriv(y, t):
    """Centred FD on axis 0."""
    dy = np.zeros_like(y)
    dt = t[2:] - t[:-2]
    # Broadcast dt to match y dimensions
    shape = [len(dt)] + [1]*(y.ndim - 1)
    dy[1:-1] = (y[2:] - y[:-2]) / dt.reshape(shape)
    dy[0]    = (y[1] - y[0]) / (t[1] - t[0])
    dy[-1]   = (y[-1] - y[-2]) / (t[-1] - t[-2])
    return dy

def load_angular(dim, label, data):
    """Load E_angular (T, N, n_bins)."""
    key = f'{label}_E_angular'
    if key not in data.files:
        return None
    return data[key]

# ============================================================
# Per-shell D_K and Γ_K regression
# ============================================================
def fit_DK_GammaK(all_E_ang, all_t, all_nu, K_arr):
    """Fit D_K and Γ_K per shell K.

    For each shell K:
        dE_{K,j}/dt + ν K² E_{K,j} = D_K (E_{K+1,j} - 2 E_{K,j} + E_{K-1,j})
                                     + Γ_K (Ē_K - E_{K,j})
    This is a 2-parameter linear regression per shell.
    """
    N = len(K_arr)
    D_K = np.zeros(N)
    Gamma_K = np.zeros(N)
    r2_K = np.zeros(N)

    for ki in range(N):
        A_rows, y_rows = [], []
        for E_ang, t, nu in zip(all_E_ang, all_t, all_nu):
            T, N_check, n_bins = E_ang.shape
            dE_dt = centred_deriv(E_ang, t)
            # Target: dE/dt + ν K² E
            y_Kj = dE_dt[:, ki, :] + nu * K_arr[ki]**2 * E_ang[:, ki, :]

            # Feature 1: radial diffusion  (E_{K+1,j} - 2 E_{K,j} + E_{K-1,j})
            if ki > 0:
                E_prev = E_ang[:, ki-1, :]
            else:
                E_prev = E_ang[:, ki, :]  # reflecting
            if ki < N - 1:
                E_next = E_ang[:, ki+1, :]
            else:
                E_next = E_ang[:, ki, :]  # reflecting

            feat_radial = E_next - 2*E_ang[:, ki, :] + E_prev    # (T, n_bins)

            # Feature 2: angular relaxation  (Ē_K - E_{K,j})
            E_bar = np.mean(E_ang[:, ki, :], axis=-1, keepdims=True)  # (T, 1)
            feat_angular = E_bar - E_ang[:, ki, :]                     # (T, n_bins)

            # Stack all time × bin samples
            for ti in range(1, T-1):
                for bi in range(n_bins):
                    A_rows.append([feat_radial[ti, bi], feat_angular[ti, bi]])
                    y_rows.append(y_Kj[ti, bi])

        A = np.array(A_rows)
        y = np.array(y_rows)
        # Ridge
        lam = 1e-8
        AtA = A.T @ A + lam * np.eye(2)
        Aty = A.T @ y
        c = np.linalg.solve(AtA, Aty)
        D_K[ki] = c[0]
        Gamma_K[ki] = c[1]
        residual = A @ c - y
        ss_res = np.sum(residual**2)
        ss_tot = np.sum((y - y.mean())**2) + 1e-30
        r2_K[ki] = 1.0 - ss_res / ss_tot

    return D_K, Gamma_K, r2_K

# ============================================================
# Forward integration
# ============================================================
def make_angular_rhs(D_K, Gamma_K, K_arr, nu, N, n_bins):
    def rhs(t, y_flat):
        E = y_flat.reshape(N, n_bins)
        dE = np.zeros_like(E)
        for ki in range(N):
            E_prev = E[ki-1] if ki > 0 else E[ki]
            E_next = E[ki+1] if ki < N-1 else E[ki]
            E_bar = np.mean(E[ki])
            dE[ki] = (D_K[ki] * (E_next - 2*E[ki] + E_prev)
                      + Gamma_K[ki] * (E_bar - E[ki])
                      - nu * K_arr[ki]**2 * E[ki])
        return dE.flatten()
    return rhs

def integrate_angular(D_K, Gamma_K, E_ang_0, t_eval, K_arr, nu):
    N, n_bins = E_ang_0.shape
    rhs = make_angular_rhs(D_K, Gamma_K, K_arr, nu, N, n_bins)
    sol = solve_ivp(rhs, [t_eval[0], t_eval[-1]], E_ang_0.flatten(),
                    t_eval=t_eval, method='RK45',
                    rtol=1e-5, atol=1e-8, max_step=0.05)
    if not sol.success:
        return None
    return sol.y.reshape(N, n_bins, -1).transpose(2, 0, 1)  # (T, N, n_bins)

def score_angular(D_K, Gamma_K, E_ang, t, K_arr, nu):
    E_sim = integrate_angular(D_K, Gamma_K, E_ang[0], t, K_arr, nu)
    if E_sim is None:
        return float('inf'), float('inf')
    # Shell E comparison
    E_K_dns = np.sum(E_ang, axis=-1)     # (T, N)
    E_K_sim = np.sum(E_sim, axis=-1)
    rE = float(np.sqrt(np.mean((E_K_sim - E_K_dns)**2)) /
               (np.sqrt(np.mean(E_K_dns**2)) + 1e-12))
    # Angular comparison
    rA = float(np.sqrt(np.mean((E_sim - E_ang)**2)) /
               (np.sqrt(np.mean(E_ang**2)) + 1e-12))
    return rE, rA

# ============================================================
# Main
# ============================================================
def main():
    flush("="*78)
    flush("ANGULAR-RESOLVED LEVEL-2 FITTER")
    flush("="*78)

    for dim in ['2D', '3D']:
        path = DATASETS[dim]
        if not os.path.exists(path):
            continue
        data = np.load(path)
        K_arr = data['A_K_list'].astype(float)
        N = len(K_arr)

        flush(f"\n{'='*78}\n{dim}: {N} shells\n{'='*78}")

        all_E_ang, all_t, all_nu = [], [], []
        labels_ok = []
        for label in ['A', 'B', 'C', 'D']:
            E_ang = load_angular(dim, label, data)
            if E_ang is None:
                continue
            all_E_ang.append(E_ang)
            all_t.append(data[f'{label}_t'])
            all_nu.append(NU[dim][label])
            labels_ok.append(label)

        n_bins = all_E_ang[0].shape[2]
        flush(f"  {len(labels_ok)} experiments, {n_bins} angular bins per shell")

        # Fit D_K and Gamma_K
        D_K, Gamma_K, r2_K = fit_DK_GammaK(all_E_ang, all_t, all_nu, K_arr)

        flush(f"\n  Per-shell coefficients:")
        flush(f"  {'K':>3}  {'D_K':>12}  {'Γ_K':>12}  {'Γ_K/D_K':>10}  {'R²':>10}")
        flush("  " + "-"*55)
        for ki in range(N):
            ratio = Gamma_K[ki] / D_K[ki] if abs(D_K[ki]) > 1e-15 else float('inf')
            flush(f"  {int(K_arr[ki]):3d}  {D_K[ki]:+12.4e}  {Gamma_K[ki]:+12.4e}"
                  f"  {ratio:>+10.2f}  {r2_K[ki]:10.6f}")

        # KEY CHECK: is Γ_K > D_K?
        ratio_mean = np.mean(Gamma_K) / (np.mean(np.abs(D_K)) + 1e-15)
        flush(f"\n  ★ MEAN Γ/|D| = {ratio_mean:.2f}")
        if ratio_mean > 1:
            flush(f"  ✓ Angular relaxation FASTER than radial cascade → isotropy maintained")
        else:
            flush(f"  ✗ Angular relaxation SLOWER than radial cascade → isotropy breaks")

        # Forward integration
        flush(f"\n  Forward integration scores:")
        for i, label in enumerate(labels_ok):
            rE, rA = score_angular(D_K, Gamma_K, all_E_ang[i],
                                     all_t[i], K_arr, all_nu[i])
            flush(f"    {label}: rel_rmse(E_K)={rE:.4e}  rel_rmse(angular)={rA:.4e}")

    flush("\nDone.")

if __name__ == '__main__':
    main()
