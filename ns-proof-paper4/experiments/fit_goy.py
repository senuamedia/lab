#!/usr/bin/env python3
"""
GOY shell-model fitter — fit triadic coupling constants to complex
amplitude trajectories from 1D, 2D, and 3D DNS.

The GOY model for N shells with complex amplitudes u_K:

    du_K/dt = i · (a_K u_{K+1} u_{K+2}^*
                 + b_K u_{K-1} u_{K+1}^*
                 + c_K u_{K-1} u_{K-2})  − ν K² u_K

With the standard Sabra parametrisation:
    a_K = K,   b_K = -δ·K/2,   c_K = -(1-δ)·K/4
where δ is a free parameter (δ = 0.5 gives energy conservation).

Method:
  1. Reconstruct u_K(t) = uK_re + i·uK_im from the DNS data
  2. Compute du_K/dt by centred finite differences
  3. Subtract the viscous term to get the NL contribution
  4. Fit: for 1D (scalar u_K), regress du_K/dt_NL against the GOY
     basis terms {u_{K+1}·u_{K+2}^*, u_{K-1}·u_{K+1}^*, u_{K-1}·u_{K-2}}
  5. For 3D (vector u_K ∈ ℂ³), fit a scalar GOY model on |u_K| with phase
  6. Validate by forward integration
"""
import sys, os, json, warnings
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
NU = {
    '1D': {'A': 1e-4, 'B': 1e-2, 'C': 1e-3, 'D': 1e-3},
    '2D': {'A': 0.0,  'B': 1e-3, 'C': 1e-4, 'D': 1e-4},
    '3D': {'A': 0.0,  'B': 1e-2, 'C': 0.0,  'D': 0.0},
}

def load_complex(dim, label, data):
    """Load complex shell amplitudes as 1D array (T, N)."""
    uK_re = data[f'{label}_uK_re']
    uK_im = data[f'{label}_uK_im']
    if uK_re.ndim == 3:
        # 3D case: (T, N, 3) → project to scalar by taking magnitude with phase
        # u_K_scalar = |u_K_vec| · exp(i · arg(u_K_vec[0]))
        # This preserves the dominant phase while collapsing the vector
        u_vec = uK_re + 1j * uK_im    # (T, N, 3)
        mag = np.sqrt(np.sum(np.abs(u_vec)**2, axis=-1))  # (T, N)
        phase = np.angle(u_vec[:, :, 0])                  # phase from z-component
        return mag * np.exp(1j * phase)
    return uK_re + 1j * uK_im

def centred_deriv(y, t):
    dy = np.zeros_like(y)
    dy[1:-1] = (y[2:] - y[:-2]) / (t[2:] - t[:-2])[:, None]
    dy[0]    = (y[1] - y[0]) / (t[1] - t[0])
    dy[-1]   = (y[-1] - y[-2]) / (t[-1] - t[-2])
    return dy

# ============================================================
# GOY basis terms
# ============================================================
def goy_basis(u_K, K_arr):
    """Compute the three GOY basis terms for each shell and time.

    Returns three arrays (T, N) complex:
      term1_K = u_{K+1} · u_{K+2}^*
      term2_K = u_{K-1} · u_{K+1}^*
      term3_K = u_{K-1} · u_{K-2}
    """
    T, N = u_K.shape
    # Shifted arrays (zero-padded at boundaries)
    u_m2 = np.zeros_like(u_K); u_m2[:, 2:] = u_K[:, :-2]
    u_m1 = np.zeros_like(u_K); u_m1[:, 1:] = u_K[:, :-1]
    u_p1 = np.zeros_like(u_K); u_p1[:, :-1] = u_K[:, 1:]
    u_p2 = np.zeros_like(u_K); u_p2[:, :-2] = u_K[:, 2:]

    term1 = u_p1 * np.conj(u_p2)       # u_{K+1} u_{K+2}^*
    term2 = u_m1 * np.conj(u_p1)       # u_{K-1} u_{K+1}^*
    term3 = u_m1 * u_m2                  # u_{K-1} u_{K-2}
    return term1, term2, term3

# ============================================================
# Regression: fit a, b, c per shell K (or universal)
# ============================================================
def fit_goy_universal(all_u, all_t, all_nu, K_arr):
    """Fit universal GOY coefficients (a, b, c) across all experiments.

    du_K/dt + ν K² u_K = i · (a · K · term1 + b · K · term2 + c · K · term3)
    """
    A_rows, y_rows = [], []
    for u_K, t, nu in zip(all_u, all_t, all_nu):
        du_dt = centred_deriv(u_K, t)
        # Subtract viscous term
        nl = du_dt + nu * (K_arr**2)[None, :] * u_K
        term1, term2, term3 = goy_basis(u_K, K_arr)
        T, N = u_K.shape
        # Each sample gives a complex equation: nl = i(a K t1 + b K t2 + c K t3)
        # Rewrite: nl / (i K) = a t1 + b t2 + c t3
        K_safe = np.where(K_arr == 0, 1.0, K_arr)[None, :]
        rhs = nl / (1j * K_safe)
        # Stack real and imaginary parts for real-valued regression
        for ti in range(1, T-1):  # skip endpoints (bad derivatives)
            for ki in range(N):
                r = rhs[ti, ki]
                t1 = term1[ti, ki]; t2 = term2[ti, ki]; t3 = term3[ti, ki]
                # real part: Re(r) = a Re(t1) + b Re(t2) + c Re(t3)
                A_rows.append([t1.real, t2.real, t3.real])
                y_rows.append(r.real)
                # imag part
                A_rows.append([t1.imag, t2.imag, t3.imag])
                y_rows.append(r.imag)

    A = np.array(A_rows)
    y = np.array(y_rows)
    # Ridge regression
    lam = 1e-6
    AtA = A.T @ A + lam * np.eye(3)
    Aty = A.T @ y
    c = np.linalg.solve(AtA, Aty)
    residual = A @ c - y
    ss_res = np.sum(residual**2)
    ss_tot = np.sum((y - y.mean())**2) + 1e-30
    r2 = 1.0 - ss_res / ss_tot
    return c, r2

# ============================================================
# Forward integration
# ============================================================
def goy_rhs(t, y_flat, abc, K_arr, nu, N):
    u = y_flat[:N] + 1j * y_flat[N:]
    a, b, c = abc
    term1, term2, term3 = goy_basis(u.reshape(1, -1), K_arr)
    K = K_arr
    du = 1j * K * (a * term1[0] + b * term2[0] + c * term3[0]) - nu * K**2 * u
    return np.concatenate([du.real, du.imag])

def integrate_goy(abc, u0, t_eval, K_arr, nu):
    N = len(K_arr)
    y0 = np.concatenate([u0.real, u0.imag])
    sol = solve_ivp(lambda t, y: goy_rhs(t, y, abc, K_arr, nu, N),
                    [t_eval[0], t_eval[-1]], y0,
                    t_eval=t_eval, method='RK45',
                    rtol=1e-5, atol=1e-8, max_step=0.05)
    if not sol.success:
        return None
    u_sim = sol.y[:N].T + 1j * sol.y[N:].T
    return u_sim

def score_goy(abc, u_K, t, K_arr, nu):
    u_sim = integrate_goy(abc, u_K[0], t, K_arr, nu)
    if u_sim is None:
        return float('inf'), float('inf')
    # E_K comparison (shell energy)
    E_dns = 0.5 * np.sum(np.abs(u_K)**2, axis=-1) if u_K.ndim == 3 else 0.5 * np.abs(u_K)**2
    E_sim = 0.5 * np.abs(u_sim)**2
    rE = float(np.sqrt(np.mean((E_sim - E_dns)**2)) / (np.sqrt(np.mean(E_dns**2)) + 1e-12))
    # Phase comparison
    phase_dns = np.angle(u_K) if u_K.ndim == 2 else np.angle(u_K[:,:,0])
    phase_sim = np.angle(u_sim)
    dphase = np.abs(np.exp(1j*phase_sim) - np.exp(1j*phase_dns))
    rP = float(np.mean(dphase))
    return rE, rP

# ============================================================
# Main
# ============================================================
def main():
    flush("="*78)
    flush("GOY SHELL-MODEL FITTER")
    flush("="*78)

    for dim in ['1D', '2D', '3D']:
        path = DATASETS[dim]
        if not os.path.exists(path):
            continue
        data = np.load(path)
        K_arr = data['A_K_list'].astype(float)
        flush(f"\n{'='*78}\n{dim}: {len(K_arr)} shells\n{'='*78}")

        all_u, all_t, all_nu = [], [], []
        for label in ['A', 'B', 'C', 'D']:
            if f'{label}_t' not in data.files:
                continue
            u_K = load_complex(dim, label, data)
            all_u.append(u_K)
            all_t.append(data[f'{label}_t'])
            all_nu.append(NU[dim][label])

        # Universal fit
        abc, r2 = fit_goy_universal(all_u, all_t, all_nu, K_arr)
        flush(f"  Universal GOY fit: a={abc[0]:+.4f}, b={abc[1]:+.4f}, c={abc[2]:+.4f}")
        flush(f"  R² (regression) = {r2:.6f}")

        # Sabra check: a + b + c should = 0 for energy conservation
        flush(f"  a+b+c = {sum(abc):+.6f} (expect ≈ 0 for energy conservation)")

        # Score by forward integration
        flush("\n  Forward integration scores:")
        for i, label in enumerate(['A', 'B', 'C', 'D']):
            if i >= len(all_u):
                continue
            rE, rP = score_goy(abc, all_u[i], all_t[i], K_arr, all_nu[i])
            flush(f"    {label}: rel_rmse(E)={rE:.4e}  mean_phase_err={rP:.4f}")

    flush("\nDone.")

if __name__ == '__main__':
    main()
