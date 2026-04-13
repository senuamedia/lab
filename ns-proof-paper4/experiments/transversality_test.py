#!/usr/bin/env python3
"""
Transversality test: does the NS velocity push trajectories AWAY from
the alignment variety V_K = {R_K = 1}?

At N=2, K=1:
  1. Find the L-BFGS-B maximiser u* where R_K ≈ 0.9999
  2. Compute NS velocity F(u*) = -i P_k NL_k (no viscous term; we test the
     purely nonlinear contribution)
  3. Evaluate R_K at u* + ε F(u*) for a range of ε (both signs)
  4. Fit quadratic: R_K(ε) ≈ R_K(0) + aε + bε²
  5. Interpret:
     - a ≈ 0 (expected: u* is a local max, gradient vanishes)
     - b < 0 required (u* is a max)
     - |b| / ||F||² gives the normalized "repulsion rate"
     - if b is near zero relative to the scale of the Hessian's largest
       negative eigenvalue, F is near-tangent to V_K (weak repulsion)
     - if b is comparable to the Hessian's largest negative eigenvalue,
       F is transverse to V_K (strong repulsion)
"""
import sys, time, numpy as np
from scipy.optimize import minimize
from itertools import product

def flush(s): print(s); sys.stdout.flush()

# ======= Setup (identical to groebner_quick.py) =======
N = 2
modes = [(x,y,z) for x,y,z in product(range(-N,N+1),repeat=3)
         if 0 < x**2+y**2+z**2 <= N**2]
mode_idx = {m:i for i,m in enumerate(modes)}
mode_set = set(modes)
nm = len(modes)
flush(f"N={N}: {nm} modes")

ind_modes = []
seen = set()
for m in modes:
    neg = (-m[0],-m[1],-m[2])
    if neg not in seen:
        ind_modes.append(m); seen.add(m); seen.add(neg)
n_ind = len(ind_modes)
flush(f"Independent modes: {n_ind}")

def perp_basis(k):
    k = np.array(k, float); kh = k/np.linalg.norm(k)
    if abs(kh[0]) <= abs(kh[1]) and abs(kh[0]) <= abs(kh[2]):
        aux = np.array([1.,0,0])
    elif abs(kh[1]) <= abs(kh[2]):
        aux = np.array([0,1.,0])
    else:
        aux = np.array([0,0,1.])
    e1 = aux - np.dot(aux,kh)*kh; e1 /= np.linalg.norm(e1)
    return e1, np.cross(kh, e1)

e1_arr = np.zeros((n_ind, 3)); e2_arr = np.zeros((n_ind, 3))
for i, m in enumerate(ind_modes):
    e1_arr[i], e2_arr[i] = perp_basis(m)

# Shell K=1 triads
shell_K = [m for m in modes if m[0]**2+m[1]**2+m[2]**2 == 1]
flush(f"Shell K=1: {len(shell_K)} modes")

triads = []
for k in shell_K:
    for p in modes:
        q = (k[0]-p[0], k[1]-p[1], k[2]-p[2])
        q2 = q[0]**2+q[1]**2+q[2]**2
        if 0 < q2 <= N**2 and q in mode_set:
            triads.append((mode_idx[k], mode_idx[p], mode_idx[q]))

nt = len(triads)
flush(f"Triads at shell K=1: {nt}")

tk = np.array([t[0] for t in triads])
tp_idx = np.array([t[1] for t in triads])
tq_idx = np.array([t[2] for t in triads])
kv = np.array(modes, float)
k2a = np.sum(kv**2, axis=1)
qv_triads = kv[tq_idx]
kv_triads = kv[tk]
k2_triads = k2a[tk]

# ======= R_K function (complex fields) =======
def compute_RK(uh):
    up = uh[tp_idx]
    updq = np.sum(up * qv_triads, axis=1)  # (nt,)
    uq = uh[tq_idx]
    uqdk = np.sum(uq * kv_triads, axis=1)
    Pq = uq - (uqdk / k2_triads)[:, None] * kv_triads
    uk_arr = uh[tk]
    d2 = np.sum(Pq * np.conj(uk_arr), axis=1)
    z = updq * d2  # (nt,) complex
    sa = np.sum(np.abs(z))
    if sa < 1e-30:
        return 0.0, z
    return float(abs(np.sum(z)) / sa), z

def x_to_uhat(x):
    """Convert parameter vector to complex field with Hermitian symmetry."""
    uh = np.zeros((nm, 3), dtype=complex)
    for i in range(n_ind):
        a = complex(x[4*i], x[4*i+1])
        b = complex(x[4*i+2], x[4*i+3])
        vec = a * e1_arr[i] + b * e2_arr[i]
        m = ind_modes[i]
        uh[mode_idx[m]] = vec
        neg_idx = mode_idx[(-m[0], -m[1], -m[2])]
        uh[neg_idx] = np.conj(vec)
    return uh

def neg_RK(x):
    norm = np.linalg.norm(x)
    if norm < 1e-15:
        return 0.0
    x = x / norm
    uh = x_to_uhat(x)
    rk, _ = compute_RK(uh)
    return -rk

# ======= Find the maximiser =======
flush("\nOptimising R_K via L-BFGS-B...")
ndim = 4 * n_ind
best_rk = 0.0
best_x = None
np.random.seed(42)
t0 = time.time()

for trial in range(100):
    x0 = np.random.randn(ndim); x0 /= np.linalg.norm(x0)
    result = minimize(neg_RK, x0, method='L-BFGS-B',
                      options={'maxiter': 500, 'ftol': 1e-15})
    rk = -result.fun
    if rk > best_rk:
        best_rk = rk
        best_x = result.x / np.linalg.norm(result.x)
        if trial < 20 or rk > 0.998:
            flush(f"  Trial {trial}: R_K = {rk:.8f}")
    if trial % 25 == 24:
        flush(f"  ... trial {trial+1}, best = {best_rk:.8f}, t={time.time()-t0:.1f}s")

flush(f"\nMaximiser found: R_K = {best_rk:.10f}")
uh_star = x_to_uhat(best_x)
rk_star, z_star = compute_RK(uh_star)
flush(f"Verified R_K(u*) = {rk_star:.10f}")

# ======= Compute NS velocity F at u* =======
# F_k = -i sum_{p+q=k} (u_p . q) P_k(u_q)
# This is the full NL contribution (no viscosity).
flush("\nComputing NS velocity F(u*)...")

# We need NL_k for ALL modes k (not just shell K=1), because the flow
# evolves all modes.
# To get F_k for all k: iterate over all triads (k, p, q) with p+q=k.

F = np.zeros((nm, 3), dtype=complex)
for k_idx in range(nm):
    k = np.array(modes[k_idx], float)
    k2 = float(k @ k)
    # Sum over p with p+q=k, both p, q in mode set
    for p_idx in range(nm):
        q_tuple = (modes[k_idx][0] - modes[p_idx][0],
                   modes[k_idx][1] - modes[p_idx][1],
                   modes[k_idx][2] - modes[p_idx][2])
        q2 = q_tuple[0]**2 + q_tuple[1]**2 + q_tuple[2]**2
        if q2 <= 0 or q2 > N*N:
            continue
        if q_tuple not in mode_set:
            continue
        q_idx = mode_idx[q_tuple]
        q_vec = np.array(q_tuple, float)

        # (u_p . q)
        updq = np.dot(uh_star[p_idx], q_vec)  # complex
        # P_k(u_q) = u_q - (u_q . k / k^2) k
        uqdk = np.dot(uh_star[q_idx], k)
        P_uq = uh_star[q_idx] - (uqdk / k2) * k  # complex 3-vec
        # Contribution to NL_k
        F[k_idx] += -1j * updq * P_uq

# Enforce Hermitian symmetry on F (should already be by construction)
F_norm = 0
for i in range(nm):
    F_norm += np.sum(np.abs(F[i])**2)
F_norm = np.sqrt(F_norm.real)
flush(f"||F(u*)|| = {F_norm:.6e}")

u_star_norm = 0
for i in range(nm):
    u_star_norm += np.sum(np.abs(uh_star[i])**2)
u_star_norm = np.sqrt(u_star_norm.real)
flush(f"||u*||    = {u_star_norm:.6e}")

flush(f"||F||/||u*|| = {F_norm/u_star_norm:.6e}")

# ======= Evaluate R_K at u* + eps*F for a range of eps =======
flush("\n===== TRANSVERSALITY TEST =====")
flush("Evaluating R_K(u* + ε F) for various ε:\n")
flush(f"{'ε':>14} {'R_K':>14} {'R_K - R_K(u*)':>20} {'normalized':>16}")
flush("-"*70)

eps_list = [-1e-2, -1e-3, -1e-4, -1e-5, -1e-6, 0,
            1e-6, 1e-5, 1e-4, 1e-3, 1e-2]

results = []
for eps in eps_list:
    uh_perturbed = uh_star + eps * F
    rk_pert, _ = compute_RK(uh_perturbed)
    delta = rk_pert - rk_star
    # Normalized: delta / (eps * ||F||)^2 gives curvature in the F direction
    if eps != 0:
        denom = (eps * F_norm)**2
        norm_curv = delta / denom if denom > 0 else 0
    else:
        norm_curv = 0
    flush(f"{eps:>+14.2e} {rk_pert:>14.10f} {delta:>+20.6e} {norm_curv:>+16.4e}")
    results.append((eps, rk_pert, delta))

# ======= Fit quadratic: R_K(ε) = R_K(0) + a*ε + b*ε^2 =======
flush("\n===== QUADRATIC FIT =====")
eps_arr = np.array([r[0] for r in results])
rk_arr = np.array([r[1] for r in results])

# Fit quadratic using least squares
A = np.column_stack([np.ones_like(eps_arr), eps_arr, eps_arr**2])
coeffs, residuals, _, _ = np.linalg.lstsq(A, rk_arr, rcond=None)
c, a, b = coeffs
flush(f"R_K(ε) ≈ {c:.10f} + ({a:+.4e}) ε + ({b:+.4e}) ε²")
flush(f"c = R_K(u*) = {c:.10f} (expected ≈ {rk_star:.10f})")
flush(f"a (linear term, expect ≈ 0 at local max) = {a:+.4e}")
flush(f"b (quadratic term, expect ≤ 0 at local max) = {b:+.4e}")

# Normalized curvature in F direction
# Curvature = F^T Hess(R_K) F / ||F||^2 (if F is treated as a velocity vector)
# For the second-order change: ΔR_K ≈ (1/2) F^T H F * ε^2 = b * ε^2
# So F^T H F = 2b
FHF = 2 * b
flush(f"\nSecond-order response in F direction:")
flush(f"  F^T Hess(R_K) F ≈ 2b = {FHF:+.4e}")
flush(f"  F^T H F / ||F||² = {FHF/(F_norm**2):+.4e}  (dimensional curvature)")

# ======= Interpretation =======
flush("\n===== INTERPRETATION =====")
if abs(a) > 1e-6 * abs(rk_star):
    flush(f"WARNING: linear term a = {a:+.4e} is not negligible.")
    flush("This suggests the L-BFGS-B maximiser is not a true local maximum,")
    flush("or the gradient of R_K isn't zero there. Treat cautiously.")
else:
    flush(f"✓ Linear term a ≈ 0 (correctly at local max)")

if b > 0:
    flush(f"✗ UNEXPECTED: b = {b:+.4e} > 0")
    flush("This would mean u* is not a local max of R_K — contradicts the")
    flush("L-BFGS-B finding.  Check: maybe higher-order accuracy needed.")
elif b > -1e-3 * abs(rk_star):
    flush(f"~ b = {b:+.4e} is small (near zero)")
    flush("F is approximately TANGENT to the R_K level sets at u*.")
    flush("The NS flow does not repel strongly from V_K.")
    flush("→ Weak or no geometric repulsion.")
else:
    flush(f"✓ b = {b:+.4e} is strongly negative")
    flush("F is TRANSVERSE to the R_K level sets at u*.")
    flush("The NS flow actively moves the state away from V_K.")
    flush("→ Genuine geometric repulsion at the maximum.")

# Quantitative: time scale of R_K change
# R_K(ε) = R_K(0) + b*ε² → characteristic ε at which R_K drops by Δ is ε ≈ sqrt(|Δ/b|)
if b < 0:
    delta_RK = 0.01  # how long to drop R_K from 0.9999 to 0.9899
    eps_char = np.sqrt(delta_RK / abs(b))
    flush(f"\nCharacteristic ε for R_K to drop by {delta_RK}: ε ≈ {eps_char:.4e}")
    flush(f"In physical units, this corresponds to time t ≈ ε / ||F|| = {eps_char/F_norm:.4e}")
    flush(f"(the NS flow reduces R_K from the max by {delta_RK} in ~{eps_char/F_norm:.2e} time units)")
