#!/usr/bin/env python3
"""
Comprehensive transversality battery for the geometric-repulsion hypothesis.

Tests whether the NS flow systematically moves states away from the
alignment variety V_K = {R_K = 1}, across:
  - Multiple (N, K) configurations
  - Multiple maximizers at each configuration
  - Random high-R_K starting points (not just optimizer outputs)
  - Full time evolution (not just linearized)
  - With and without viscosity

Each data point reports:
  - R_K(u_start)
  - Linear term: ∇R_K · F  (= "flow direction of R_K")
  - Quadratic curvature: F^T H F / ||F||^2
  - R_K decay under full NS evolution
"""
import sys, time, numpy as np
from scipy.optimize import minimize
from itertools import product

def flush(s): print(s); sys.stdout.flush()

# ======= Shared setup helpers =======
def setup(N, K_target):
    """Build all the data structures for a given (N, K) pair."""
    modes = [(x,y,z) for x,y,z in product(range(-N,N+1),repeat=3)
             if 0 < x**2+y**2+z**2 <= N**2]
    mode_idx = {m:i for i,m in enumerate(modes)}
    mode_set = set(modes)
    nm = len(modes)

    ind_modes = []
    seen = set()
    for m in modes:
        neg = (-m[0],-m[1],-m[2])
        if neg not in seen:
            ind_modes.append(m); seen.add(m); seen.add(neg)
    n_ind = len(ind_modes)

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

    # Shell K triads. Use strict |k|^2 convention at K=1 and "rounded" at K>=2.
    if K_target == 1:
        shell_K = [m for m in modes if m[0]**2+m[1]**2+m[2]**2 == 1]
    else:
        shell_K = [m for m in modes
                   if round(np.sqrt(m[0]**2+m[1]**2+m[2]**2)) == K_target]

    triads = []
    for k in shell_K:
        for p in modes:
            q = (k[0]-p[0], k[1]-p[1], k[2]-p[2])
            q2 = q[0]**2+q[1]**2+q[2]**2
            if 0 < q2 <= N**2 and q in mode_set:
                triads.append((mode_idx[k], mode_idx[p], mode_idx[q]))

    nt = len(triads)
    if nt == 0:
        return None

    tk = np.array([t[0] for t in triads])
    tp_idx = np.array([t[1] for t in triads])
    tq_idx = np.array([t[2] for t in triads])
    kv = np.array(modes, float)
    k2a = np.sum(kv**2, axis=1)

    return dict(
        N=N, K=K_target,
        modes=modes, mode_idx=mode_idx, nm=nm,
        ind_modes=ind_modes, n_ind=n_ind,
        e1_arr=e1_arr, e2_arr=e2_arr,
        shell_K=shell_K, triads=triads, nt=nt,
        tk=tk, tp_idx=tp_idx, tq_idx=tq_idx,
        kv=kv, k2a=k2a,
        qv_triads=kv[tq_idx],
        kv_triads=kv[tk],
        k2_triads=k2a[tk],
    )

def compute_RK(uh, S):
    up = uh[S['tp_idx']]
    updq = np.sum(up * S['qv_triads'], axis=1)
    uq = uh[S['tq_idx']]
    uqdk = np.sum(uq * S['kv_triads'], axis=1)
    Pq = uq - (uqdk / S['k2_triads'])[:, None] * S['kv_triads']
    uk_arr = uh[S['tk']]
    d2 = np.sum(Pq * np.conj(uk_arr), axis=1)
    z = updq * d2
    sa = np.sum(np.abs(z))
    if sa < 1e-30:
        return 0.0
    return float(abs(np.sum(z)) / sa)

def x_to_uhat(x, S):
    nm = S['nm']; n_ind = S['n_ind']
    mode_idx = S['mode_idx']; ind_modes = S['ind_modes']
    e1_arr = S['e1_arr']; e2_arr = S['e2_arr']
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

def neg_RK_fn(S):
    def f(x):
        norm = np.linalg.norm(x)
        if norm < 1e-15: return 0.0
        x = x / norm
        uh = x_to_uhat(x, S)
        return -compute_RK(uh, S)
    return f

def find_maximiser(S, n_restarts, seed):
    """Run L-BFGS-B to find a high-R_K field."""
    ndim = 4 * S['n_ind']
    neg_RK = neg_RK_fn(S)
    best_rk = 0.0
    best_x = None
    rng = np.random.RandomState(seed)
    for trial in range(n_restarts):
        x0 = rng.randn(ndim); x0 /= np.linalg.norm(x0)
        result = minimize(neg_RK, x0, method='L-BFGS-B',
                          options={'maxiter': 500, 'ftol': 1e-15})
        rk = -result.fun
        if rk > best_rk:
            best_rk = rk
            best_x = result.x / np.linalg.norm(result.x)
    return best_x, best_rk

# ======= NS velocity =======
def compute_F(uh, S, nu=0.0):
    """Compute NS velocity F_k = -i sum_{p+q=k} (u_p . q) P_k(u_q) - nu*|k|^2 u_k."""
    modes = S['modes']; mode_idx = S['mode_idx']; mode_set = set(modes)
    nm = S['nm']; N = S['N']
    F = np.zeros((nm, 3), dtype=complex)
    for k_idx in range(nm):
        k = np.array(modes[k_idx], float)
        k2 = float(k @ k)
        for p_idx in range(nm):
            q_t = (modes[k_idx][0]-modes[p_idx][0],
                   modes[k_idx][1]-modes[p_idx][1],
                   modes[k_idx][2]-modes[p_idx][2])
            q2 = q_t[0]**2+q_t[1]**2+q_t[2]**2
            if q2 <= 0 or q2 > N*N: continue
            if q_t not in mode_set: continue
            q_idx = mode_idx[q_t]
            q_vec = np.array(q_t, float)
            updq = np.dot(uh[p_idx], q_vec)
            uqdk = np.dot(uh[q_idx], k)
            P_uq = uh[q_idx] - (uqdk / k2) * k
            F[k_idx] += -1j * updq * P_uq
        if nu > 0:
            F[k_idx] -= nu * k2 * uh[k_idx]
    return F

def field_norm(uh):
    return float(np.sqrt(sum(np.sum(np.abs(uh[i])**2) for i in range(len(uh))).real))

# ======= Core transversality measurement =======
def transversality(uh_start, S, nu=0.0):
    """Compute the first and second order response of R_K under NS flow."""
    rk_0 = compute_RK(uh_start, S)
    F = compute_F(uh_start, S, nu=nu)
    F_norm = field_norm(F)
    u_norm = field_norm(uh_start)

    # Evaluate R_K at ±eps * F for multiple eps
    eps_list = [-1e-2, -1e-3, -1e-4, 0, 1e-4, 1e-3, 1e-2]
    rks = []
    for eps in eps_list:
        uh_p = uh_start + eps * F
        rks.append(compute_RK(uh_p, S))

    # Quadratic fit: R_K(eps) = c + a*eps + b*eps^2
    eps_arr = np.array(eps_list)
    rk_arr = np.array(rks)
    A = np.column_stack([np.ones_like(eps_arr), eps_arr, eps_arr**2])
    coeffs, _, _, _ = np.linalg.lstsq(A, rk_arr, rcond=None)
    c, a, b = coeffs

    # Finite-time evolution (NL only, small dt, RK4-ish)
    dt = 1e-3
    uh_t = uh_start.copy()
    rk_traj = [rk_0]
    t_traj = [0.0]
    for step in range(20):
        F_t = compute_F(uh_t, S, nu=nu)
        uh_t = uh_t + dt * F_t
        rk_traj.append(compute_RK(uh_t, S))
        t_traj.append((step+1)*dt)

    return dict(
        rk_0=rk_0, F_norm=F_norm, u_norm=u_norm,
        linear_a=a, quadratic_b=b,
        normalized_curvature=(2*b/(F_norm**2)) if F_norm > 0 else 0,
        rk_traj=rk_traj, t_traj=t_traj,
        rk_at_t02=rk_traj[-1],  # after 20*dt = 0.02 time units
    )

def random_high_rk(S, target_rk, max_trials=500, seed=0):
    """Generate a random field, keep it if R_K > target_rk."""
    ndim = 4 * S['n_ind']
    rng = np.random.RandomState(seed)
    for t in range(max_trials):
        x = rng.randn(ndim)
        x /= np.linalg.norm(x)
        uh = x_to_uhat(x, S)
        rk = compute_RK(uh, S)
        if rk > target_rk:
            return uh, rk
    return None, None

# ======= RUN THE BATTERY =======
flush("="*75)
flush("TRANSVERSALITY BATTERY: geometric repulsion across configurations")
flush("="*75)

# ------- Phase A: Robustness at N=2, K=1 -------
flush("\n" + "="*75)
flush("PHASE A: Multiple maximisers at N=2, K=1")
flush("="*75)

S21 = setup(2, 1)
flush(f"N=2 K=1: {S21['nm']} modes, {S21['nt']} triads")

phase_a_results = []
for seed in range(5):
    t0 = time.time()
    best_x, best_rk = find_maximiser(S21, n_restarts=60, seed=seed*100+1)
    uh_star = x_to_uhat(best_x, S21)
    r = transversality(uh_star, S21, nu=0.0)
    phase_a_results.append((seed, best_rk, r))
    flush(f"  seed {seed}: R_K={best_rk:.8f}, linear_a={r['linear_a']:+.4e}, "
          f"quad_b={r['quadratic_b']:+.4e}, R_K(t=0.02)={r['rk_at_t02']:.6f}  "
          f"(t={time.time()-t0:.0f}s)")

flush("\nSummary of Phase A:")
n_repulsive = sum(1 for _, _, r in phase_a_results if r['quadratic_b'] < 0)
n_linear_neg = sum(1 for _, _, r in phase_a_results if r['linear_a'] < 0)
flush(f"  {n_repulsive}/{len(phase_a_results)} have b < 0 (quadratic repulsion)")
flush(f"  {n_linear_neg}/{len(phase_a_results)} have a < 0 (first-order downhill)")
decays = sum(1 for _, rk0, r in phase_a_results if r['rk_at_t02'] < rk0)
flush(f"  {decays}/{len(phase_a_results)} show R_K decay over t=0.02")

# ------- Phase B: Other (N, K) configurations -------
flush("\n" + "="*75)
flush("PHASE B: Different (N, K) — including interior shells")
flush("="*75)

config_results = {}
configs = [(3, 1), (3, 2), (4, 1), (4, 2)]
for N, K in configs:
    S = setup(N, K)
    if S is None:
        flush(f"\nN={N}, K={K}: no triads; skipping")
        continue
    flush(f"\nN={N}, K={K}: {S['nm']} modes, {S['nt']} triads, "
          f"{len(S['shell_K'])} shell modes")

    # Two maximisers with different seeds
    results_here = []
    for seed in range(3):
        t0 = time.time()
        n_rs = 20 if N >= 4 else 40  # fewer restarts at higher N for speed
        best_x, best_rk = find_maximiser(S, n_restarts=n_rs, seed=seed*37+N*K)
        uh_star = x_to_uhat(best_x, S)
        r = transversality(uh_star, S, nu=0.0)
        results_here.append((seed, best_rk, r))
        flush(f"  seed {seed}: R_K={best_rk:.6f}, a={r['linear_a']:+.3e}, "
              f"b={r['quadratic_b']:+.3e}, R_K(t=0.02)={r['rk_at_t02']:.6f}  "
              f"(t={time.time()-t0:.0f}s)")
    config_results[(N, K)] = results_here

# ------- Phase C: Random high-R_K starting points (not optimised) -------
flush("\n" + "="*75)
flush("PHASE C: Random high-R_K points (generic starting points)")
flush("="*75)
flush("For N=2, K=1: generate random div-free fields, keep those with")
flush("R_K > 0.5, then run transversality.  Tests whether repulsion holds")
flush("at generic high-R_K points, not just local maxima of the optimizer.")

phase_c_results = []
n_samples = 15
for trial in range(n_samples):
    uh, rk = random_high_rk(S21, target_rk=0.5, max_trials=200, seed=trial*13+1)
    if uh is None:
        continue
    r = transversality(uh, S21, nu=0.0)
    phase_c_results.append((trial, rk, r))
    if trial < 10 or trial % 3 == 0:
        flush(f"  sample {trial}: R_K(0)={rk:.4f}, a={r['linear_a']:+.3e}, "
              f"b={r['quadratic_b']:+.3e}, R_K(t=0.02)={r['rk_at_t02']:.6f}")

flush("\nSummary of Phase C:")
n_downhill = sum(1 for _, rk0, r in phase_c_results if r['rk_at_t02'] < rk0)
n_linear = sum(1 for _, _, r in phase_c_results if r['linear_a'] < 0)
flush(f"  {n_downhill}/{len(phase_c_results)} samples: NS moves to lower R_K over t=0.02")
flush(f"  {n_linear}/{len(phase_c_results)} samples: linear term a<0 (first-order downhill)")

# ------- Phase D: Longer NS evolution at a maximiser -------
flush("\n" + "="*75)
flush("PHASE D: Longer NS evolution (t up to 0.5) at best N=2 K=1 maximiser")
flush("="*75)

best_x, best_rk = find_maximiser(S21, n_restarts=100, seed=1234)
uh_star = x_to_uhat(best_x, S21)
flush(f"Starting R_K = {best_rk:.8f}")

# No viscosity
uh_t = uh_star.copy()
dt = 1e-3
flush("\nNo viscosity (ν=0):")
flush(f"{'t':>8}  {'R_K':>12}")
for step in range(501):
    t = step * dt
    if step % 50 == 0:
        rk = compute_RK(uh_t, S21)
        flush(f"{t:>8.3f}  {rk:>12.8f}")
    F = compute_F(uh_t, S21, nu=0.0)
    uh_t = uh_t + dt * F

# With viscosity
uh_t = uh_star.copy()
dt = 1e-3
flush("\nWith viscosity (ν=0.01):")
flush(f"{'t':>8}  {'R_K':>12}")
for step in range(501):
    t = step * dt
    if step % 50 == 0:
        rk = compute_RK(uh_t, S21)
        flush(f"{t:>8.3f}  {rk:>12.8f}")
    F = compute_F(uh_t, S21, nu=0.01)
    uh_t = uh_t + dt * F

# ------- Final summary -------
flush("\n" + "="*75)
flush("FINAL SUMMARY")
flush("="*75)
flush("""
Key question: does the NS flow systematically reduce R_K?
We measure this at (a) local maxima, (b) interior shells, (c) random
high-R_K points, and (d) long time evolution.
""")
