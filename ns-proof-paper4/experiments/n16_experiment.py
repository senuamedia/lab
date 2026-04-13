#!/usr/bin/env python3
"""
N=16 cascade wave experiment for Paper 4 validation.
Streams results to S3 in real time.

Runs 4 experiments sequentially (A, B, C, D) at N=16 with 12 angular bins.
Each experiment's output is uploaded to S3 after completion.
Logs are streamed continuously.
"""
import sys, os, time, subprocess
import numpy as np
from itertools import product

S3_BUCKET = "YOUR_S3_BUCKET"
S3_PREFIX = "n16-run"

def s3_upload(local_path, s3_key):
    subprocess.run(["aws", "s3", "cp", local_path, f"s3://{S3_BUCKET}/{S3_PREFIX}/{s3_key}"],
                   capture_output=True)

def flush(s):
    print(s); sys.stdout.flush()

# ======= Setup =======
def setup(N):
    modes = [(x,y,z) for x,y,z in product(range(-N,N+1),repeat=3)
             if 0 < x**2+y**2+z**2 <= N**2]
    mode_idx = {m:i for i,m in enumerate(modes)}
    mode_set = set(modes)
    nm = len(modes)
    kv = np.array(modes, float)
    k2a = np.sum(kv**2, axis=1)

    shell_by_K = {}
    for i, m in enumerate(modes):
        K = int(round(np.sqrt(m[0]**2+m[1]**2+m[2]**2)))
        shell_by_K.setdefault(K, []).append(i)

    K_list = sorted(shell_by_K.keys())
    shells = [(K, np.array(shell_by_K[K])) for K in K_list]

    triad_k, triad_p, triad_q = [], [], []
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
    flush(f"  Precomputed {len(triad_k)} triads")

    return dict(
        N=N, modes=modes, mode_idx=mode_idx, mode_set=mode_set,
        nm=nm, kv=kv, k2a=k2a,
        shells=shells, K_list=K_list,
        triad_k=triad_k, triad_p=triad_p, triad_q=triad_q,
        qv_all=kv[triad_q], kv_all=kv[triad_k], k2_all=k2a[triad_k],
    )

# ======= Shell observables =======
def shell_energies(uh, S):
    out = {}
    for K, idxs in S['shells']:
        out[K] = 0.5 * float(sum(np.sum(np.abs(uh[i])**2) for i in idxs).real)
    return out

def shell_enstrophies(uh, S):
    out = {}
    k2a = S['k2a']
    for K, idxs in S['shells']:
        out[K] = 0.5 * float(sum(k2a[i] * np.sum(np.abs(uh[i])**2) for i in idxs).real)
    return out

N_MU_BINS = 12
MU_EDGES = np.linspace(-1.0, 1.0, N_MU_BINS + 1)

def shell_angular_energy(uh, S):
    kv = S['kv']
    out = {}
    for K, idxs in S['shells']:
        E_bins = np.zeros(N_MU_BINS)
        for i in idxs:
            k_vec = kv[i]
            k_mag = np.sqrt(np.sum(k_vec**2))
            if k_mag < 1e-12: continue
            mu = k_vec[2] / k_mag
            b = int(np.clip(np.searchsorted(MU_EDGES, mu, side='right') - 1, 0, N_MU_BINS - 1))
            E_bins[b] += 0.5 * float(np.sum(np.abs(uh[i])**2).real)
        out[K] = E_bins
    return out

def total_energy_enstrophy(uh, S):
    E = 0.5 * sum(np.sum(np.abs(uh[i])**2) for i in range(S['nm'])).real
    Om = 0.5 * sum(S['k2a'][i] * np.sum(np.abs(uh[i])**2) for i in range(S['nm'])).real
    return float(E), float(Om)

# ======= NL + RK4 =======
def compute_NL(uh, S, nu=0.0):
    nm = S['nm']
    tk, tp, tq = S['triad_k'], S['triad_p'], S['triad_q']
    qv, kv_t, k2 = S['qv_all'], S['kv_all'], S['k2_all']
    up = uh[tp]
    updq = np.sum(up * qv, axis=1)
    uq = uh[tq]
    uqdk = np.sum(uq * kv_t, axis=1)
    P_uq = uq - (uqdk / k2)[:, None] * kv_t
    contrib = -1j * updq[:, None] * P_uq
    F = np.zeros((nm, 3), dtype=complex)
    for i in range(3):
        np.add.at(F[:, i], tk, contrib[:, i])
    if nu > 0:
        F -= nu * S['k2a'][:, None] * uh
    return F

def rk4_step(uh, dt, S, nu):
    k1 = compute_NL(uh, S, nu)
    k2 = compute_NL(uh + dt/2 * k1, S, nu)
    k3 = compute_NL(uh + dt/2 * k2, S, nu)
    k4 = compute_NL(uh + dt * k3, S, nu)
    return uh + dt/6 * (k1 + 2*k2 + 2*k3 + k4)

# ======= ICs =======
def ic_concentrated_at_shell(S, K_target, amplitude=0.5, seed=42):
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'], 3), dtype=complex)
    modes = S['modes']; mode_set = S['mode_set']; mode_idx = S['mode_idx']
    shell_modes = [m for m in modes if round(np.sqrt(m[0]**2+m[1]**2+m[2]**2)) == K_target]
    processed = set()
    for m in shell_modes:
        if m in processed: continue
        neg = (-m[0],-m[1],-m[2])
        k = np.array(m, float); kn = np.linalg.norm(k); kh = k / kn
        v = rng.randn(3) + 1j*rng.randn(3)
        v = v - (np.dot(v, kh)) * kh
        v *= amplitude / max(np.linalg.norm(v), 1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m:
            uh[mode_idx[neg]] = np.conj(v); processed.add(neg)
        processed.add(m)
    return uh

def ic_gaussian_in_K(S, K_center, K_width, amplitude=0.3, seed=42):
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'], 3), dtype=complex)
    modes = S['modes']; mode_set = S['mode_set']; mode_idx = S['mode_idx']
    for m in modes:
        K = round(np.sqrt(m[0]**2+m[1]**2+m[2]**2))
        w = np.exp(-0.5*((K - K_center)/K_width)**2)
        if w < 1e-6: continue
        neg = (-m[0],-m[1],-m[2])
        if neg in mode_set and mode_idx.get(neg, -1) < mode_idx[m]: continue
        k = np.array(m, float); kn = np.linalg.norm(k); kh = k / kn
        v = rng.randn(3) + 1j*rng.randn(3)
        v = v - (np.dot(v, kh)) * kh
        v *= amplitude * w / max(np.linalg.norm(v), 1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m:
            uh[mode_idx[neg]] = np.conj(v)
    return uh

def ic_broad_spectrum(S, amplitude=0.2, seed=99):
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'], 3), dtype=complex)
    modes = S['modes']; mode_set = S['mode_set']; mode_idx = S['mode_idx']
    for m in modes:
        K = round(np.sqrt(m[0]**2+m[1]**2+m[2]**2))
        w = 1.0 / (1 + (K/3.0)**2)
        neg = (-m[0],-m[1],-m[2])
        if neg in mode_set and mode_idx.get(neg, -1) < mode_idx[m]: continue
        k = np.array(m, float); kn = np.linalg.norm(k); kh = k / kn
        v = rng.randn(3) + 1j*rng.randn(3)
        v = v - (np.dot(v, kh)) * kh
        v *= amplitude * w / max(np.linalg.norm(v), 1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m:
            uh[mode_idx[neg]] = np.conj(v)
    return uh

# ======= Run =======
def run_cascade(S, uh_init, T_max, dt, nu, label):
    n_steps = int(T_max / dt)
    n_record = min(n_steps, 1000)
    record_every = max(1, n_steps // n_record)

    uh = uh_init.copy()
    t_list, E_K_list, Om_K_list, E_angular_list = [], [], [], []
    E_total, Om_total = [], []

    flush(f"\n{label}: N={S['N']}, T_max={T_max}, dt={dt}, nu={nu}")
    E0, Om0 = total_energy_enstrophy(uh, S)
    flush(f"  Initial: E={E0:.4f}, Om={Om0:.4f}")

    t0 = time.time()
    for step in range(n_steps + 1):
        if step % record_every == 0:
            t_list.append(step * dt)
            E_K_list.append(shell_energies(uh, S))
            Om_K_list.append(shell_enstrophies(uh, S))
            E_angular_list.append(shell_angular_energy(uh, S))
            E, Om = total_energy_enstrophy(uh, S)
            E_total.append(E); Om_total.append(Om)
            # Progress every 10%
            if step > 0 and step % (n_steps // 10) == 0:
                elapsed = time.time() - t0
                flush(f"  step {step}/{n_steps} ({100*step//n_steps}%), "
                      f"E={E:.4f}, Om={Om:.4f}, t={elapsed:.0f}s")
        if step < n_steps:
            uh = rk4_step(uh, dt, S, nu)

    elapsed = time.time() - t0
    flush(f"  Final: E={E_total[-1]:.4f}, Om={Om_total[-1]:.4f}, runtime={elapsed:.0f}s")

    t_arr = np.array(t_list)
    K_list = S['K_list']
    n_t = len(t_list)
    n_K = len(K_list)
    E_K_arr = np.zeros((n_t, n_K))
    Om_K_arr = np.zeros((n_t, n_K))
    E_ang = np.zeros((n_t, n_K, N_MU_BINS))
    for i in range(n_t):
        for j, K in enumerate(K_list):
            E_K_arr[i, j] = E_K_list[i].get(K, 0.0)
            Om_K_arr[i, j] = Om_K_list[i].get(K, 0.0)
            E_ang[i, j] = E_angular_list[i].get(K, np.zeros(N_MU_BINS))

    return dict(t=t_arr, E_K=E_K_arr, Om_K=Om_K_arr, E_angular=E_ang,
                K_list=K_list, E_total=np.array(E_total),
                Om_total=np.array(Om_total), label=label)

# ======= Main =======
flush("="*78)
flush("N=16 CASCADE WAVE EXPERIMENT — Paper 4 validation")
flush("="*78)

S = setup(16)
flush(f"\nGrid: N=16, {S['nm']} modes, {len(S['K_list'])} shells: {S['K_list']}")

# Save setup info
with open("/tmp/n16_setup.txt", "w") as f:
    f.write(f"N=16, modes={S['nm']}, shells={len(S['K_list'])}, triads={len(S['triad_k'])}\n")
    f.write(f"K_list={S['K_list']}\n")
    for K, idxs in S['shells']:
        f.write(f"  Shell K={K}: n_K={len(idxs)} modes\n")
s3_upload("/tmp/n16_setup.txt", "n16_setup.txt")

experiments = [
    ("A", lambda S: ic_concentrated_at_shell(S, K_target=1, amplitude=0.5, seed=42), 0.0),
    ("B", lambda S: ic_concentrated_at_shell(S, K_target=1, amplitude=0.5, seed=42), 0.01),
    ("C", lambda S: ic_gaussian_in_K(S, K_center=3, K_width=1.0, amplitude=0.3, seed=55), 0.0),
    ("D", lambda S: ic_broad_spectrum(S, amplitude=0.2, seed=99), 0.0),
]

save_dict = {}
for label, ic_fn, nu in experiments:
    flush(f"\n{'='*78}")
    flush(f"EXPERIMENT {label}")
    flush(f"{'='*78}")
    uh = ic_fn(S)
    result = run_cascade(S, uh, T_max=2.0, dt=1e-3, nu=nu,
                         label=f"{label}: nu={nu}")

    for key in ['t', 'E_K', 'Om_K', 'E_angular', 'E_total', 'Om_total']:
        save_dict[f'{label}_{key}'] = result[key]
    save_dict[f'{label}_K_list'] = np.array(result['K_list'])

    # Save per-experiment to S3 immediately
    np.savez(f"/tmp/n16_exp_{label}.npz", **{k: v for k, v in save_dict.items() if k.startswith(label)})
    s3_upload(f"/tmp/n16_exp_{label}.npz", f"n16_exp_{label}.npz")
    flush(f"  Uploaded {label} to S3")

# Save combined
np.savez("/tmp/cascade_wave_n16.npz", **save_dict)
s3_upload("/tmp/cascade_wave_n16.npz", "cascade_wave_n16.npz")
flush("\nAll experiments complete. Combined data uploaded to S3.")
