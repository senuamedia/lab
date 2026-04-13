#!/usr/bin/env python3
"""
Cascade wave experiment: the "rock pools" picture.

Hypothesis (Higgins): the shells act like rock pools on a headland, with
a main cascade wave propagating outward from low K to high K, reflecting
off the truncation boundary K=N, and leaving sub-waves "ringing" in each
shell.

Measurements:
  - E_K(t) for each shell K at fine time resolution
  - T_K(t) = shell flux = dE_K/dt + 2ν K² E_K  (the nonlinear input)
  - Phase velocity of the cascade front
  - Reflection at K = N
  - Sub-shell ringing (FFT of E_K(t) for each K)

Initial conditions:
  - IC_A: energy sharply concentrated at K=1 only (impulsive pulse)
  - IC_B: Gaussian in K around K_0 with narrow width (wave packet)
  - IC_C: broad spectrum (baseline for comparison)

We test with and without viscosity to see dissipation vs reflection.
"""
import sys, time, numpy as np
from itertools import product

def flush(s): print(s); sys.stdout.flush()

# ======= Setup =======
def setup(N):
    modes = [(x,y,z) for x,y,z in product(range(-N,N+1),repeat=3)
             if 0 < x**2+y**2+z**2 <= N**2]
    mode_idx = {m:i for i,m in enumerate(modes)}
    mode_set = set(modes)
    nm = len(modes)
    kv = np.array(modes, float)
    k2a = np.sum(kv**2, axis=1)

    # Group modes by shell (round definition)
    shell_by_K = {}
    max_K = int(np.ceil(np.sqrt(N*N)))
    for i, m in enumerate(modes):
        K = int(round(np.sqrt(m[0]**2+m[1]**2+m[2]**2)))
        shell_by_K.setdefault(K, []).append(i)

    # Sorted list of shell K values
    K_list = sorted(shell_by_K.keys())
    shells = [(K, np.array(shell_by_K[K])) for K in K_list]

    # PRECOMPUTE ALL TRIADS (k_idx, p_idx, q_idx) with p+q=k
    # This is for ALL output modes k (not just shell K), enabling vectorised NL.
    triad_k = []
    triad_p = []
    triad_q = []
    for k_idx in range(nm):
        for p_idx in range(nm):
            q = (modes[k_idx][0]-modes[p_idx][0],
                 modes[k_idx][1]-modes[p_idx][1],
                 modes[k_idx][2]-modes[p_idx][2])
            q2 = q[0]**2+q[1]**2+q[2]**2
            if q2 <= 0 or q2 > N*N: continue
            if q not in mode_set: continue
            triad_k.append(k_idx)
            triad_p.append(p_idx)
            triad_q.append(mode_idx[q])
    triad_k = np.array(triad_k, dtype=np.int64)
    triad_p = np.array(triad_p, dtype=np.int64)
    triad_q = np.array(triad_q, dtype=np.int64)
    print(f"  Precomputed {len(triad_k)} triads")

    return dict(
        N=N, modes=modes, mode_idx=mode_idx, mode_set=mode_set,
        nm=nm, kv=kv, k2a=k2a,
        shells=shells, K_list=K_list,
        triad_k=triad_k, triad_p=triad_p, triad_q=triad_q,
        # Pre-indexed arrays for vectorised NL
        qv_all=kv[triad_q],  # q-vectors for each triad
        kv_all=kv[triad_k],  # k-vectors for each triad
        k2_all=k2a[triad_k],  # |k|^2 for each triad
    )

def shell_energies(uh, S):
    """Return E_K for each shell K."""
    out = {}
    for K, idxs in S['shells']:
        E_K = 0.5 * float(sum(np.sum(np.abs(uh[i])**2) for i in idxs).real)
        out[K] = E_K
    return out

def shell_enstrophies(uh, S):
    """Return Ω_K = (1/2) Σ_{k∈shell K} |k|² |û_k|² for each shell K."""
    out = {}
    k2a = S['k2a']
    for K, idxs in S['shells']:
        Om_K = 0.5 * float(sum(k2a[i] * np.sum(np.abs(uh[i])**2) for i in idxs).real)
        out[K] = Om_K
    return out

def shell_complex_amplitudes(uh, S):
    """Return u_K^complex = Σ_{k∈shell K} û_k (complex 3-vector sum per shell).
    This gives the shell-averaged complex amplitude, preserving phase info."""
    out = {}
    for K, idxs in S['shells']:
        u_K = np.zeros(3, dtype=complex)
        for i in idxs:
            u_K += uh[i]
        out[K] = u_K
    return out

N_MU_BINS = 12  # angular bins for μ = k_z/|k| ∈ [-1, 1]
MU_EDGES = np.linspace(-1.0, 1.0, N_MU_BINS + 1)

def shell_angular_energy(uh, S):
    """Return E(K, μ_bin) — energy distributed over angular bins.

    μ = k_z / |k|.  Bins are equal-width in μ from -1 to 1.
    Returns dict {K: array of shape (N_MU_BINS,)}.
    """
    kv = S['kv']
    out = {}
    for K, idxs in S['shells']:
        E_bins = np.zeros(N_MU_BINS)
        for i in idxs:
            k_vec = kv[i]
            k_mag = np.sqrt(np.sum(k_vec**2))
            if k_mag < 1e-12:
                continue
            mu = k_vec[2] / k_mag  # k_z / |k|
            # Find bin
            b = int(np.clip(np.searchsorted(MU_EDGES, mu, side='right') - 1, 0, N_MU_BINS - 1))
            E_bins[b] += 0.5 * float(np.sum(np.abs(uh[i])**2).real)
        out[K] = E_bins
    return out

def total_energy_enstrophy(uh, S):
    E = 0.5 * sum(np.sum(np.abs(uh[i])**2) for i in range(S['nm'])).real
    Om = 0.5 * sum(S['k2a'][i] * np.sum(np.abs(uh[i])**2) for i in range(S['nm'])).real
    return float(E), float(Om)

def compute_NL(uh, S, nu=0.0):
    """Vectorised NL computation.

    F_k = -i sum_{p+q=k} (u_p . q) P_k(u_q) - nu |k|^2 u_k
    """
    nm = S['nm']
    tk = S['triad_k']
    tp = S['triad_p']
    tq = S['triad_q']
    qv = S['qv_all']    # (n_triads, 3)
    kv = S['kv_all']    # (n_triads, 3)
    k2 = S['k2_all']    # (n_triads,)

    # Contribution per triad (vectorised):
    # (u_p . q): complex scalar per triad
    up = uh[tp]  # (n_triads, 3) complex
    updq = np.sum(up * qv, axis=1)  # (n_triads,)

    # P_k(u_q) = u_q - (u_q . k / |k|^2) k
    uq = uh[tq]
    uqdk = np.sum(uq * kv, axis=1)
    P_uq = uq - (uqdk / k2)[:, None] * kv  # (n_triads, 3)

    # Contribution to NL_{tk}: -i * updq * P_uq
    contrib = -1j * updq[:, None] * P_uq  # (n_triads, 3)

    # Sum contributions by output mode tk
    F = np.zeros((nm, 3), dtype=complex)
    for i in range(3):
        # Use np.add.at for scatter-add
        np.add.at(F[:, i], tk, contrib[:, i])

    # Viscous term
    if nu > 0:
        F -= nu * S['k2a'][:, None] * uh

    return F

def rk4_step(uh, dt, S, nu):
    k1 = compute_NL(uh, S, nu)
    k2 = compute_NL(uh + dt/2 * k1, S, nu)
    k3 = compute_NL(uh + dt/2 * k2, S, nu)
    k4 = compute_NL(uh + dt * k3, S, nu)
    return uh + dt/6 * (k1 + 2*k2 + 2*k3 + k4)

# ======= Divergence-free initial conditions =======
def ic_concentrated_at_shell(S, K_target, amplitude=0.3, seed=42):
    """Put all energy at shell K_target with random div-free polarizations."""
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'], 3), dtype=complex)
    modes = S['modes']
    mode_set = S['mode_set']
    mode_idx = S['mode_idx']

    # Find independent modes in shell K_target
    shell_modes = [m for m in modes
                   if round(np.sqrt(m[0]**2+m[1]**2+m[2]**2)) == K_target]
    # Track processed ± pairs
    processed = set()
    for m in shell_modes:
        if m in processed: continue
        neg = (-m[0],-m[1],-m[2])
        # Random complex vector perpendicular to m
        k = np.array(m, float)
        kn = np.linalg.norm(k)
        kh = k / kn
        # Two random perpendicular components
        v = rng.randn(3) + 1j*rng.randn(3)
        v = v - (np.dot(v, kh)) * kh  # Leray project
        v *= amplitude / max(np.linalg.norm(v), 1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m:
            uh[mode_idx[neg]] = np.conj(v)
            processed.add(neg)
        processed.add(m)
    return uh

def ic_gaussian_in_K(S, K_center, K_width, amplitude=0.3, seed=42):
    """Gaussian envelope in K centered at K_center with width K_width."""
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'], 3), dtype=complex)
    modes = S['modes']
    mode_set = S['mode_set']
    mode_idx = S['mode_idx']

    processed = set()
    for m in modes:
        if m in processed: continue
        neg = (-m[0],-m[1],-m[2])
        K = np.sqrt(m[0]**2+m[1]**2+m[2]**2)
        weight = np.exp(-((K - K_center)/K_width)**2)
        k = np.array(m, float)
        kn = np.linalg.norm(k)
        kh = k / kn
        v = rng.randn(3) + 1j*rng.randn(3)
        v = v - (np.dot(v, kh)) * kh
        v *= amplitude * weight / max(np.linalg.norm(v), 1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m:
            uh[mode_idx[neg]] = np.conj(v)
            processed.add(neg)
        processed.add(m)
    return uh

# ======= Run a trajectory and record shell energies =======
def run_cascade(S, uh_init, T_max, dt, nu, label):
    """Run NS and record E_K(t) for each shell."""
    n_steps = int(T_max / dt)
    n_record = min(n_steps, 2000)
    record_every = max(1, n_steps // n_record)

    uh = uh_init.copy()
    t_list = []
    E_K_list = []  # list of dicts {K: E_K}
    Om_K_list = []  # list of dicts {K: Ω_K}
    uK_complex_list = []  # list of dicts {K: complex 3-vec}
    E_angular_list = []   # list of dicts {K: array(N_MU_BINS)}
    E_total = []
    Om_total = []

    flush(f"\n{label}: N={S['N']}, T_max={T_max}, dt={dt}, nu={nu}")
    E0, Om0 = total_energy_enstrophy(uh, S)
    flush(f"  Initial: E={E0:.4f}, Ω={Om0:.4f}")

    t0 = time.time()
    for step in range(n_steps + 1):
        if step % record_every == 0:
            t_list.append(step * dt)
            E_K_list.append(shell_energies(uh, S))
            Om_K_list.append(shell_enstrophies(uh, S))
            uK_complex_list.append(shell_complex_amplitudes(uh, S))
            E_angular_list.append(shell_angular_energy(uh, S))
            E, Om = total_energy_enstrophy(uh, S)
            E_total.append(E)
            Om_total.append(Om)
        if step < n_steps:
            uh = rk4_step(uh, dt, S, nu)

    flush(f"  Final:   E={E_total[-1]:.4f}, Ω={Om_total[-1]:.4f}, runtime={time.time()-t0:.0f}s")

    # Build E_K arrays: one per shell K
    t_arr = np.array(t_list)
    K_list = S['K_list']
    n_t = len(t_list)
    n_K = len(K_list)
    E_K_arr = np.zeros((n_t, n_K))
    Om_K_arr = np.zeros((n_t, n_K))
    uK_re = np.zeros((n_t, n_K, 3))    # real part of complex shell amplitude
    uK_im = np.zeros((n_t, n_K, 3))    # imag part
    E_ang = np.zeros((n_t, n_K, N_MU_BINS))  # angular-binned energy
    for i in range(n_t):
        for j, K in enumerate(K_list):
            E_K_arr[i, j] = E_K_list[i].get(K, 0.0)
            Om_K_arr[i, j] = Om_K_list[i].get(K, 0.0)
            uc = uK_complex_list[i].get(K, np.zeros(3, dtype=complex))
            uK_re[i, j] = uc.real
            uK_im[i, j] = uc.imag
            ea = E_angular_list[i].get(K, np.zeros(N_MU_BINS))
            E_ang[i, j] = ea

    return dict(
        t=t_arr, E_K=E_K_arr, Om_K=Om_K_arr, K_list=K_list,
        E_total=np.array(E_total), Om_total=np.array(Om_total),
        uK_re=uK_re, uK_im=uK_im,     # complex shell amplitudes
        E_angular=E_ang,                 # angular-binned energy (T, K, n_mu)
        label=label,
    )

def analyze_cascade(result):
    """Analyse shell-energy evolution: peak time per shell, cascade velocity, etc."""
    t = result['t']
    E_K = result['E_K']
    K_list = result['K_list']

    flush(f"\nAnalysis of {result['label']}:")
    flush(f"  {'K':>3} {'E_K(0)':>12} {'E_K(T/2)':>12} {'E_K(T)':>12} {'peak t':>10} {'peak E_K':>12}")

    peak_times = []
    for j, K in enumerate(K_list):
        if np.all(E_K[:, j] < 1e-14):
            continue
        idx_peak = int(np.argmax(E_K[:, j]))
        t_peak = t[idx_peak]
        E_peak = E_K[idx_peak, j]
        mid_idx = len(t) // 2
        flush(f"  {K:>3} {E_K[0, j]:>12.4e} {E_K[mid_idx, j]:>12.4e} "
              f"{E_K[-1, j]:>12.4e} {t_peak:>10.4f} {E_peak:>12.4e}")
        peak_times.append((K, t_peak))

    # Cascade phase velocity: fit linear K vs t_peak
    if len(peak_times) >= 3:
        Ks = np.array([p[0] for p in peak_times])
        ts = np.array([p[1] for p in peak_times])
        # Only use peaks where t_peak > 0 (non-trivial)
        valid = ts > 1e-6
        if valid.sum() >= 3:
            slope, intercept = np.polyfit(ts[valid], Ks[valid], 1)
            flush(f"  Cascade velocity (fit K vs t_peak): dK/dt ≈ {slope:.3f} shells/time")

    # Count sign changes of dE_K/dt per shell (oscillation check)
    flush(f"\n  Oscillation per shell (sign changes in dE_K/dt):")
    flush(f"  {'K':>3} {'#sign_changes':>15}  {'interpretation':>20}")
    for j, K in enumerate(K_list):
        if np.all(E_K[:, j] < 1e-10): continue
        dE = np.gradient(E_K[:, j], t)
        sign_changes = int(np.sum(np.diff(np.sign(dE)) != 0))
        interp = "oscillating" if sign_changes >= 2 else ("ringing" if sign_changes == 1 else "monotone")
        flush(f"  {K:>3} {sign_changes:>15}  {interp:>20}")

# ======= MAIN =======
flush("="*75)
flush("CASCADE WAVE EXPERIMENT: the rock pools picture")
flush("="*75)
flush("""
Measuring E_K(t) for each shell K as the energy cascade propagates
through the truncated Fourier space.  Initial conditions localised at
low K should show a wave front propagating outward; each shell acts as
a 'rock pool' that fills, rings, and spills to the next.
""")

# Use N=8 for more shells (K=1..8), better angular resolution
S = setup(8)
flush(f"\nGrid: N=8, {S['nm']} modes, {len(S['K_list'])} shells: {S['K_list']}")

# EXPERIMENT A: concentrated pulse at K=1, ν=0
flush("\n" + "="*75)
flush("EXPERIMENT A: Pulse at K=1, inviscid (ν=0)")
flush("="*75)
uh_A = ic_concentrated_at_shell(S, K_target=1, amplitude=0.5, seed=42)
result_A = run_cascade(S, uh_A, T_max=2.0, dt=2e-3, nu=0.0, label="A: K=1 pulse, ν=0")
analyze_cascade(result_A)

# EXPERIMENT B: concentrated pulse at K=1, ν=0.01
flush("\n" + "="*75)
flush("EXPERIMENT B: Pulse at K=1, viscous (ν=0.01)")
flush("="*75)
uh_B = ic_concentrated_at_shell(S, K_target=1, amplitude=0.5, seed=42)
result_B = run_cascade(S, uh_B, T_max=2.0, dt=2e-3, nu=0.01, label="B: K=1 pulse, ν=0.01")
analyze_cascade(result_B)

# EXPERIMENT C: Gaussian packet centered at K=2, width 0.8
flush("\n" + "="*75)
flush("EXPERIMENT C: Gaussian packet at K=2, width 0.8, inviscid")
flush("="*75)
uh_C = ic_gaussian_in_K(S, K_center=2, K_width=0.8, amplitude=0.5, seed=42)
result_C = run_cascade(S, uh_C, T_max=2.0, dt=2e-3, nu=0.0, label="C: K=2 packet, ν=0")
analyze_cascade(result_C)

# EXPERIMENT D: broad spectrum (control)
flush("\n" + "="*75)
flush("EXPERIMENT D: Broad spectrum (control)")
flush("="*75)
uh_D = ic_gaussian_in_K(S, K_center=3, K_width=3.0, amplitude=0.3, seed=42)
result_D = run_cascade(S, uh_D, T_max=2.0, dt=2e-3, nu=0.0, label="D: broad spectrum, ν=0")
analyze_cascade(result_D)

# Save all trajectories
import os
os.makedirs('results', exist_ok=True)
save_dict = {}
for lab, res in [('A', result_A), ('B', result_B), ('C', result_C), ('D', result_D)]:
    save_dict[f'{lab}_t']         = res['t']
    save_dict[f'{lab}_E_K']       = res['E_K']
    save_dict[f'{lab}_Om_K']      = res['Om_K']
    save_dict[f'{lab}_K_list']    = np.array(res['K_list'])
    save_dict[f'{lab}_E_total']   = res['E_total']
    save_dict[f'{lab}_Om_total']  = res['Om_total']
    save_dict[f'{lab}_uK_re']     = res['uK_re']       # (T, K, 3) complex shell amp real
    save_dict[f'{lab}_uK_im']     = res['uK_im']       # (T, K, 3) complex shell amp imag
    save_dict[f'{lab}_E_angular'] = res['E_angular']    # (T, K, n_mu) angular-binned energy
np.savez('results/cascade_wave.npz', **save_dict)
flush("\n\nTrajectories saved to results/cascade_wave.npz")
