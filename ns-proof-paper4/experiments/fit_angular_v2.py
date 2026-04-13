#!/usr/bin/env python3
"""
Angular-resolved Level-2 fitter v2 — richer feature library for 3D.

v1 had only 2 features (radial diffusion + angular relaxation) → R²=0.02
for 3D.  v2 adds:
  - Nonlinear radial flux (Leith-type per angular bin)
  - Vortex stretching (distributed across angular bins proportionally)
  - Angular diffusion (Laplacian in the angular index j)
  - E·Ω cross-coupling per bin
"""
import sys, os, warnings
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

# Also store NU for 1D for completeness (angular not applicable but E_K is)
NU['1D'] = {'A': 1e-4, 'B': 1e-2, 'C': 1e-3, 'D': 1e-3}

def centred_deriv(y, t):
    dy = np.zeros_like(y)
    dt = t[2:] - t[:-2]
    shape = [len(dt)] + [1]*(y.ndim - 1)
    dy[1:-1] = (y[2:] - y[:-2]) / dt.reshape(shape)
    dy[0]    = (y[1] - y[0]) / (t[1] - t[0])
    dy[-1]   = (y[-1] - y[-2]) / (t[-1] - t[-2])
    return dy

# Feature names for the regression
FEAT_NAMES = [
    'radial_diff',      # E_{K+1,j} - 2 E_{K,j} + E_{K-1,j}
    'angular_relax',    # Ē_K - E_{K,j}
    'angular_diff',     # E_{K,j+1} - 2 E_{K,j} + E_{K,j-1}  (periodic in j)
    'leith_div',        # div of √(E_{K,j} · E_{K+1,j})
    'stretch_source',   # K · √(Σ E_{K,j} · Σ Ω_{K,j}) · (E_{K,j}/Σ E_{K,j})
    'E_times_Om',       # E_{K,j} · Ω_{K,j}  (if Ω angular available, else Ω_K * E_{K,j}/E_K)
    'K2_E',             # K² · E_{K,j}  (captures K-dependent transfer)
]
N_FEAT = len(FEAT_NAMES)

def build_features(E_ang, Om_K, t, K_arr, nu):
    """Build feature matrix for dE_{K,j}/dt regression.

    E_ang: (T, N, n_bins)
    Om_K:  (T, N) — scalar enstrophy per shell (no angular resolution for Ω)
    Returns A (T*N*n_bins, N_FEAT), y (T*N*n_bins)
    """
    T, N, n_bins = E_ang.shape
    dE_dt = centred_deriv(E_ang, t)
    # Target: dE/dt + ν K² E
    K2 = (K_arr**2)[None, :, None]
    y = dE_dt + nu * K2 * E_ang

    E_pos = np.clip(E_ang, 0, None)

    # Feature arrays (T, N, n_bins) each
    feats = np.zeros((T, N, n_bins, N_FEAT))

    # 1. Radial diffusion
    E_prev = np.zeros_like(E_pos); E_prev[:, 1:, :] = E_pos[:, :-1, :]
    E_prev[:, 0, :] = E_pos[:, 0, :]   # reflecting
    E_next = np.zeros_like(E_pos); E_next[:, :-1, :] = E_pos[:, 1:, :]
    E_next[:, -1, :] = E_pos[:, -1, :]  # reflecting
    feats[:, :, :, 0] = E_next - 2*E_pos + E_prev

    # 2. Angular relaxation to mean
    E_bar = np.mean(E_pos, axis=-1, keepdims=True)  # (T, N, 1)
    feats[:, :, :, 1] = E_bar - E_pos

    # 3. Angular diffusion (periodic in j)
    E_jm1 = np.roll(E_pos, 1, axis=-1)
    E_jp1 = np.roll(E_pos, -1, axis=-1)
    feats[:, :, :, 2] = E_jp1 - 2*E_pos + E_jm1

    # 4. Leith flux divergence per angular bin
    base_next = np.sqrt(E_pos * np.clip(E_next, 0, None))
    base_self = np.sqrt(np.clip(E_prev, 0, None) * E_pos)
    feats[:, :, :, 3] = base_self - base_next

    # 5. Vortex stretching source (distributed proportionally to E_{K,j}/E_K)
    E_K_total = np.sum(E_pos, axis=-1, keepdims=True) + 1e-30  # (T, N, 1)
    Om_K_exp = Om_K[:, :, None]                                  # (T, N, 1)
    stretch_total = K_arr[None, :, None] * np.sqrt(
        np.clip(E_K_total * Om_K_exp, 0, None))                  # (T, N, 1)
    frac = E_pos / E_K_total                                      # (T, N, n_bins)
    feats[:, :, :, 4] = stretch_total * frac

    # 6. E × Ω cross-coupling per bin (Ω not angular, distribute by E share)
    Om_per_bin = Om_K_exp * frac                                  # (T, N, n_bins)
    feats[:, :, :, 5] = E_pos * Om_per_bin

    # 7. K² · E_{K,j}
    feats[:, :, :, 6] = K2 * E_pos

    A = feats.reshape(-1, N_FEAT)
    y_flat = y.reshape(-1)
    return A, y_flat

def ridge(A, y, lam=1e-6):
    M = A.shape[1]
    AtA = A.T @ A + lam * np.eye(M)
    Aty = A.T @ y
    c = np.linalg.solve(AtA, Aty)
    res = A @ c - y
    r2 = 1.0 - np.sum(res**2) / (np.sum((y - y.mean())**2) + 1e-30)
    return c, r2

# ============================================================
# Forward integration
# ============================================================
def make_rhs(coeffs, K_arr, nu, n_bins):
    N = len(K_arr)
    K2 = K_arr**2
    def rhs(t, y_flat):
        E = np.clip(y_flat.reshape(N, n_bins), 0, None)
        dE = np.zeros((N, n_bins))

        E_prev = np.zeros_like(E); E_prev[1:] = E[:-1]; E_prev[0] = E[0]
        E_next = np.zeros_like(E); E_next[:-1] = E[1:]; E_next[-1] = E[-1]
        E_bar = np.mean(E, axis=-1, keepdims=True)
        E_jm1 = np.roll(E, 1, axis=-1)
        E_jp1 = np.roll(E, -1, axis=-1)
        base_next = np.sqrt(E * np.clip(E_next, 0, None))
        base_self = np.sqrt(np.clip(E_prev, 0, None) * E)
        E_K_total = np.sum(E, axis=-1, keepdims=True) + 1e-30
        # Approximate Om_K from K² E_K (enstrophy ≈ K² energy for isotropic)
        Om_K = K2[:, None] * E_K_total
        stretch_total = K_arr[:, None] * np.sqrt(np.clip(E_K_total * Om_K, 0, None))
        frac = E / E_K_total
        Om_per_bin = Om_K * frac

        feats = np.zeros((N, n_bins, N_FEAT))
        feats[:, :, 0] = E_next - 2*E + E_prev
        feats[:, :, 1] = E_bar - E
        feats[:, :, 2] = E_jp1 - 2*E + E_jm1
        feats[:, :, 3] = base_self - base_next
        feats[:, :, 4] = stretch_total * frac
        feats[:, :, 5] = E * Om_per_bin
        feats[:, :, 6] = K2[:, None] * E

        for i in range(N_FEAT):
            dE += coeffs[i] * feats[:, :, i]
        dE -= nu * K2[:, None] * E
        return dE.flatten()
    return rhs

def integrate_and_score(coeffs, E_ang, Om_K, t, K_arr, nu):
    N, n_bins = E_ang.shape[1], E_ang.shape[2]
    rhs = make_rhs(coeffs, K_arr, nu, n_bins)
    sol = solve_ivp(rhs, [t[0], t[-1]], E_ang[0].flatten(),
                    t_eval=t, method='RK45',
                    rtol=1e-4, atol=1e-7, max_step=0.05)
    if not sol.success:
        return float('inf'), float('inf')
    E_sim = sol.y.reshape(N, n_bins, -1).transpose(2, 0, 1)
    E_K_dns = np.sum(E_ang, axis=-1)
    E_K_sim = np.sum(E_sim, axis=-1)
    rE = float(np.sqrt(np.mean((E_K_sim - E_K_dns)**2)) /
               (np.sqrt(np.mean(E_K_dns**2)) + 1e-12))
    rA = float(np.sqrt(np.mean((E_sim - E_ang)**2)) /
               (np.sqrt(np.mean(E_ang**2)) + 1e-12))
    return rE, rA

# ============================================================
# Main
# ============================================================
def main():
    flush("="*78)
    flush("ANGULAR-RESOLVED v2: 7-FEATURE LIBRARY")
    flush("="*78)

    for dim in ['2D', '3D']:
        path = DATASETS[dim]
        if not os.path.exists(path): continue
        data = np.load(path)
        K_arr = data['A_K_list'].astype(float)
        N = len(K_arr)

        flush(f"\n{'='*78}\n{dim}: {N} shells\n{'='*78}")

        all_A, all_y = [], []
        exps = []
        for label in ['A','B','C','D']:
            key_ang = f'{label}_E_angular'
            key_om = f'{label}_Om_K'
            if key_ang not in data.files: continue
            E_ang = data[key_ang]
            Om_K = data[key_om] if key_om in data.files else np.zeros((E_ang.shape[0], N))
            t = data[f'{label}_t']
            nu = NU[dim][label]
            A, y = build_features(E_ang, Om_K, t, K_arr, nu)
            all_A.append(A); all_y.append(y)
            exps.append((label, E_ang, Om_K, t, nu))

        n_bins = exps[0][1].shape[2]
        flush(f"  {len(exps)} experiments, {n_bins} angular bins, {N_FEAT} features")

        # Universal fit
        A = np.vstack(all_A); y = np.concatenate(all_y)
        coeffs, r2 = ridge(A, y, lam=1e-6)
        flush(f"\n  Universal regression R² = {r2:.6f}")
        flush(f"\n  Coefficients:")
        for name, val in zip(FEAT_NAMES, coeffs):
            flush(f"    {name:<20s}: {val:+.4e}")

        flush(f"\n  Forward integration scores (universal):")
        for label, E_ang, Om_K, t, nu in exps:
            rE, rA = integrate_and_score(coeffs, E_ang, Om_K, t, K_arr, nu)
            flush(f"    {label}: rel_rmse(E_K)={rE:.4e}  rel_rmse(angular)={rA:.4e}")

        # Per-experiment fit
        flush(f"\n  Per-experiment fit:")
        for i, (label, E_ang, Om_K, t, nu) in enumerate(exps):
            ci, r2i = ridge(all_A[i], all_y[i], lam=1e-6)
            rE, rA = integrate_and_score(ci, E_ang, Om_K, t, K_arr, nu)
            flush(f"    {label}: R²={r2i:.4f}  rel_rmse(E_K)={rE:.4e}  rel_rmse(angular)={rA:.4e}")

    flush("\nDone.")

if __name__ == '__main__':
    main()
