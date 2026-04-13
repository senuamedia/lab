#!/usr/bin/env python3
"""
Local convergence analysis: run the cascade wave experiment at multiple N
values and fit the angular model at each to extract c5(N) and d3(N).

This script runs entirely locally — no AWS, no S3. Results are saved to
the results/ directory.

Requirements:
    pip install numpy scipy

Estimated runtimes (Apple M-series or equivalent):
    N=4:   ~4 min  (4 shells,   256 modes,    30K triads)
    N=6:   ~53 min (6 shells,   924 modes,   398K triads)
    N=8:   ~5 hrs  (8 shells, 2,108 modes,  2.1M triads)
    N=10:  ~18 hrs (10 shells, 4,168 modes,  8.1M triads) — use AWS
    N=12:  ~54 hrs (12 shells, 7,152 modes, 23.9M triads) — use AWS

For N >= 10, we recommend using the AWS scripts:
    experiments/n10_experiment.py
    experiments/n16_experiment.py
    deploy/launch_n16.sh (edit instance type and N as needed)

Usage:
    # Quick test (N=4 only, ~4 min):
    python3 run_convergence_local.py --quick

    # Full local run (N=4 and N=6, ~1 hr):
    python3 run_convergence_local.py

    # Include N=8 (~5 hrs total):
    python3 run_convergence_local.py --include-n8
"""
import sys, os, time, argparse, warnings
import numpy as np
from itertools import product
from scipy.integrate import solve_ivp
from scipy.optimize import minimize
warnings.filterwarnings('ignore')
np.seterr(all='ignore')

def flush(s): print(s); sys.stdout.flush()

RESULTS_DIR = os.path.join(os.path.dirname(__file__), '..', 'results')

# ============================================================
# DNS engine (same as cascade_wave.py / n16_experiment.py)
# ============================================================
N_MU_BINS = 12
MU_EDGES = np.linspace(-1.0, 1.0, N_MU_BINS + 1)

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
    flush(f"  Building triads for N={N} ({nm} modes)...")
    for k_idx in range(nm):
        for p_idx in range(nm):
            q = (modes[k_idx][0]-modes[p_idx][0],
                 modes[k_idx][1]-modes[p_idx][1],
                 modes[k_idx][2]-modes[p_idx][2])
            q2 = q[0]**2+q[1]**2+q[2]**2
            if 0 < q2 <= N*N and q in mode_set:
                triad_k.append(k_idx); triad_p.append(p_idx)
                triad_q.append(mode_idx[q])
    triad_k = np.array(triad_k, dtype=np.int64)
    triad_p = np.array(triad_p, dtype=np.int64)
    triad_q = np.array(triad_q, dtype=np.int64)
    flush(f"  {len(triad_k):,} triads")
    return dict(N=N, modes=modes, mode_idx=mode_idx, mode_set=mode_set,
                nm=nm, kv=kv, k2a=k2a, shells=shells, K_list=K_list,
                triad_k=triad_k, triad_p=triad_p, triad_q=triad_q,
                qv_all=kv[triad_q], kv_all=kv[triad_k], k2_all=k2a[triad_k])

def shell_energies(uh, S):
    out = {}
    for K, idxs in S['shells']:
        out[K] = 0.5 * float(sum(np.sum(np.abs(uh[i])**2) for i in idxs).real)
    return out

def shell_enstrophies(uh, S):
    out = {}
    for K, idxs in S['shells']:
        out[K] = 0.5 * float(sum(S['k2a'][i]*np.sum(np.abs(uh[i])**2) for i in idxs).real)
    return out

def shell_angular_energy(uh, S):
    kv = S['kv']; out = {}
    for K, idxs in S['shells']:
        E_bins = np.zeros(N_MU_BINS)
        for i in idxs:
            k_vec = kv[i]; k_mag = np.sqrt(np.sum(k_vec**2))
            if k_mag < 1e-12: continue
            mu = k_vec[2] / k_mag
            b = int(np.clip(np.searchsorted(MU_EDGES, mu, side='right')-1, 0, N_MU_BINS-1))
            E_bins[b] += 0.5 * float(np.sum(np.abs(uh[i])**2).real)
        out[K] = E_bins
    return out

def total_energy_enstrophy(uh, S):
    E = 0.5 * sum(np.sum(np.abs(uh[i])**2) for i in range(S['nm'])).real
    Om = 0.5 * sum(S['k2a'][i]*np.sum(np.abs(uh[i])**2) for i in range(S['nm'])).real
    return float(E), float(Om)

def compute_NL(uh, S, nu=0.0):
    nm = S['nm']; tk=S['triad_k']; tp=S['triad_p']; tq=S['triad_q']
    qv=S['qv_all']; kv_t=S['kv_all']; k2=S['k2_all']
    up = uh[tp]; updq = np.sum(up*qv, axis=1)
    uq = uh[tq]; uqdk = np.sum(uq*kv_t, axis=1)
    P_uq = uq - (uqdk/k2)[:,None]*kv_t
    contrib = -1j * updq[:,None] * P_uq
    F = np.zeros((nm,3), dtype=complex)
    for i in range(3): np.add.at(F[:,i], tk, contrib[:,i])
    if nu > 0: F -= nu * S['k2a'][:,None] * uh
    return F

def rk4_step(uh, dt, S, nu):
    k1=compute_NL(uh,S,nu); k2=compute_NL(uh+dt/2*k1,S,nu)
    k3=compute_NL(uh+dt/2*k2,S,nu); k4=compute_NL(uh+dt*k3,S,nu)
    return uh + dt/6*(k1+2*k2+2*k3+k4)

def ic_concentrated(S, K_target, amplitude=0.5, seed=42):
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'],3), dtype=complex)
    modes=S['modes']; mode_set=S['mode_set']; mode_idx=S['mode_idx']
    shell_modes = [m for m in modes if round(np.sqrt(m[0]**2+m[1]**2+m[2]**2))==K_target]
    processed = set()
    for m in shell_modes:
        if m in processed: continue
        neg = (-m[0],-m[1],-m[2])
        k=np.array(m,float); kh=k/np.linalg.norm(k)
        v = rng.randn(3)+1j*rng.randn(3); v = v-np.dot(v,kh)*kh
        v *= amplitude/max(np.linalg.norm(v),1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m: uh[mode_idx[neg]]=np.conj(v); processed.add(neg)
        processed.add(m)
    return uh

def ic_gaussian(S, K_center, K_width, amplitude=0.3, seed=55):
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'],3), dtype=complex)
    modes=S['modes']; mode_set=S['mode_set']; mode_idx=S['mode_idx']
    for m in modes:
        K = round(np.sqrt(m[0]**2+m[1]**2+m[2]**2))
        w = np.exp(-0.5*((K-K_center)/K_width)**2)
        if w < 1e-6: continue
        neg = (-m[0],-m[1],-m[2])
        if neg in mode_set and mode_idx.get(neg,-1)<mode_idx[m]: continue
        k=np.array(m,float); kh=k/np.linalg.norm(k)
        v = rng.randn(3)+1j*rng.randn(3); v = v-np.dot(v,kh)*kh
        v *= amplitude*w/max(np.linalg.norm(v),1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m: uh[mode_idx[neg]]=np.conj(v)
    return uh

def ic_broad(S, amplitude=0.2, seed=99):
    rng = np.random.RandomState(seed)
    uh = np.zeros((S['nm'],3), dtype=complex)
    modes=S['modes']; mode_set=S['mode_set']; mode_idx=S['mode_idx']
    for m in modes:
        K = round(np.sqrt(m[0]**2+m[1]**2+m[2]**2))
        w = 1.0/(1+(K/3.0)**2)
        neg = (-m[0],-m[1],-m[2])
        if neg in mode_set and mode_idx.get(neg,-1)<mode_idx[m]: continue
        k=np.array(m,float); kh=k/np.linalg.norm(k)
        v = rng.randn(3)+1j*rng.randn(3); v = v-np.dot(v,kh)*kh
        v *= amplitude*w/max(np.linalg.norm(v),1e-15)
        uh[mode_idx[m]] = v
        if neg in mode_set and neg != m: uh[mode_idx[neg]]=np.conj(v)
    return uh

def run_cascade(S, uh_init, T_max, dt, nu, label):
    n_steps = int(T_max/dt); n_record = min(n_steps,1000)
    record_every = max(1, n_steps//n_record)
    uh = uh_init.copy()
    t_list, E_K_list, Om_K_list, E_angular_list = [],[],[],[]
    E_total, Om_total = [],[]
    flush(f"\n  {label}: T_max={T_max}, dt={dt}, nu={nu}")
    E0, Om0 = total_energy_enstrophy(uh, S)
    flush(f"    Initial: E={E0:.4f}, Om={Om0:.4f}")
    t0 = time.time()
    for step in range(n_steps+1):
        if step % record_every == 0:
            t_list.append(step*dt)
            E_K_list.append(shell_energies(uh,S))
            Om_K_list.append(shell_enstrophies(uh,S))
            E_angular_list.append(shell_angular_energy(uh,S))
            E,Om = total_energy_enstrophy(uh,S)
            E_total.append(E); Om_total.append(Om)
        if step < n_steps: uh = rk4_step(uh, dt, S, nu)
        if step > 0 and step % (n_steps//5) == 0:
            flush(f"    {100*step//n_steps}% ({time.time()-t0:.0f}s)")
    flush(f"    Done: E={E_total[-1]:.4f}, Om={Om_total[-1]:.4f}, {time.time()-t0:.0f}s")
    t_arr = np.array(t_list); K_list = S['K_list']
    n_t = len(t_list); n_K = len(K_list)
    E_K_arr = np.zeros((n_t,n_K)); Om_K_arr = np.zeros((n_t,n_K))
    E_ang = np.zeros((n_t,n_K,N_MU_BINS))
    for i in range(n_t):
        for j,K in enumerate(K_list):
            E_K_arr[i,j]=E_K_list[i].get(K,0.0)
            Om_K_arr[i,j]=Om_K_list[i].get(K,0.0)
            E_ang[i,j]=E_angular_list[i].get(K,np.zeros(N_MU_BINS))
    return dict(t=t_arr, E_K=E_K_arr, Om_K=Om_K_arr, E_angular=E_ang,
                K_list=K_list, E_total=np.array(E_total), Om_total=np.array(Om_total))

# ============================================================
# Angular fitter (same as fit_angular_v4.py)
# ============================================================
PARAM_NAMES = ['c1','c2','c3','c4','c5','c6','d1','d2','d3']

def make_rhs(params, K_arr, nu, n_bins):
    c1,c2,c3,c4,c5,c6,d1,d2,d3 = params
    N = len(K_arr); K2 = K_arr**2
    def rhs(t, y_flat):
        E = np.clip(y_flat[:N*n_bins].reshape(N,n_bins),0,None)
        Om = np.clip(y_flat[N*n_bins:],0,None)
        E_prev=np.zeros_like(E); E_prev[1:]=E[:-1]; E_prev[0]=E[0]
        E_next=np.zeros_like(E); E_next[:-1]=E[1:]; E_next[-1]=E[-1]
        E_bar=np.mean(E,axis=-1,keepdims=True)
        E_jm1=np.roll(E,1,axis=-1); E_jp1=np.roll(E,-1,axis=-1)
        base_next=np.sqrt(np.clip(E*E_next,0,None))
        base_self=np.sqrt(np.clip(E_prev*E,0,None))
        E_K=np.sum(E,axis=-1)+1e-30; frac=E/E_K[:,None]
        EO=np.clip(E_K*Om,0,None); stretch_K=K_arr*np.sqrt(EO)
        dE=(c1*(E_next-2*E+E_prev)+c2*(E_bar-E)+c3*(E_jp1-2*E+E_jm1)
            +c4*(base_self-base_next)+c5*stretch_K[:,None]*frac
            +c6*E*Om[:,None]/E_K[:,None]-nu*K2[:,None]*E)
        Om_prev=np.zeros(N); Om_prev[1:]=Om[:-1]; Om_prev[0]=Om[0]
        Om_next=np.zeros(N); Om_next[:-1]=Om[1:]; Om_next[-1]=Om[-1]
        bOn=np.sqrt(np.clip(Om*Om_next,0,None))
        bOs=np.sqrt(np.clip(Om_prev*Om,0,None))
        dOm=(d1*(Om_next-2*Om+Om_prev)+d2*(bOs-bOn)+d3*stretch_K-2*nu*K2*Om)
        return np.concatenate([dE.flatten(),dOm])
    return rhs

def fit_coefficients(data, K_arr, nu_dict):
    """Fit 9-parameter angular model to all 4 experiments."""
    N_sh = len(K_arr)
    exps = []
    for label in ['A','B','C','D']:
        E_ang=data[f'{label}_E_angular']; Om_K=data[f'{label}_Om_K']; t=data[f'{label}_t']
        # Subsample to 30 points
        idx = np.linspace(0,len(t)-1,30).astype(int)
        exps.append((E_ang[idx], Om_K[idx], t[idx], nu_dict[label]))
    n_bins = exps[0][0].shape[2]

    def loss(params):
        total = 0.0
        for E_ang,Om_K,t,nu in exps:
            y = np.concatenate([E_ang[0].flatten(), Om_K[0]])
            rhs_fn = make_rhs(params, K_arr, nu, n_bins)
            for i in range(len(t)-1):
                dt=t[i+1]-t[i]
                k1=rhs_fn(0,y); k2=rhs_fn(0,y+.5*dt*k1)
                k3=rhs_fn(0,y+.5*dt*k2); k4=rhs_fn(0,y+dt*k3)
                y=y+(dt/6)*(k1+2*k2+2*k3+k4)
                if np.any(np.isnan(y)) or np.any(np.abs(y)>1e6): return 1e10
            E_sim=y[:N_sh*n_bins].reshape(N_sh,n_bins)
            sE=np.sqrt(np.mean(E_ang**2))+1e-12
            total += np.sum((E_sim-E_ang[-1])**2)/sE**2
        return float(total)

    seeds = [
        np.array([0.05,0.1,0.02,0.05,-0.05,0.0,0.1,0.05,0.1]),
        np.array([0.1,0.3,0.05,0.1,-0.1,0.0,0.3,0.1,0.2]),
        np.array([0.01,0.01,0.01,0.01,-0.01,0.0,0.01,0.01,0.01]),
        np.array([-0.01,0.05,0.01,-0.02,-0.5,-0.01,0.05,-0.01,0.05]),
    ]
    bounds = [(-2,2)]*9
    best_fun = float('inf'); best_x = None
    for i,x0 in enumerate(seeds):
        r = minimize(loss, x0, method='L-BFGS-B', bounds=bounds,
                     options={'maxiter':40,'ftol':1e-5})
        if r.fun < best_fun:
            best_fun=r.fun; best_x=r.x
            flush(f"    seed {i}: loss={r.fun:.4e}")
    return best_x

# ============================================================
# Main
# ============================================================
def main():
    parser = argparse.ArgumentParser(description='Run convergence analysis locally')
    parser.add_argument('--quick', action='store_true', help='N=4 only (~4 min)')
    parser.add_argument('--include-n8', action='store_true', help='Include N=8 (~5 hrs)')
    args = parser.parse_args()

    if args.quick:
        N_values = [4]
    elif args.include_n8:
        N_values = [4, 6, 8]
    else:
        N_values = [4, 6]

    os.makedirs(RESULTS_DIR, exist_ok=True)

    NU = {'A': 0.0, 'B': 0.01, 'C': 0.0, 'D': 0.0}
    convergence = []

    for N_val in N_values:
        flush(f"\n{'='*60}")
        flush(f"N = {N_val}")
        flush(f"{'='*60}")

        S = setup(N_val)
        flush(f"  {S['nm']} modes, {len(S['triad_k']):,} triads, {len(S['K_list'])} shells")
        flush(f"  n_K per shell: {[len(idxs) for _,idxs in S['shells']]}")

        # Run 4 experiments
        save_dict = {}
        experiments = [
            ("A", ic_concentrated(S, K_target=1, amplitude=0.5, seed=42), 0.0),
            ("B", ic_concentrated(S, K_target=1, amplitude=0.5, seed=42), 0.01),
            ("C", ic_gaussian(S, K_center=3, K_width=1.0, amplitude=0.3, seed=55), 0.0),
            ("D", ic_broad(S, amplitude=0.2, seed=99), 0.0),
        ]
        for label, uh, nu in experiments:
            result = run_cascade(S, uh, T_max=2.0, dt=1e-3, nu=nu, label=f"Exp {label}")
            for key in ['t','E_K','Om_K','E_angular','E_total','Om_total']:
                save_dict[f'{label}_{key}'] = result[key]
            save_dict[f'{label}_K_list'] = np.array(result['K_list'])

        # Save DNS data
        npz_path = os.path.join(RESULTS_DIR, f'cascade_wave_n{N_val}.npz')
        np.savez(npz_path, **save_dict)
        flush(f"\n  DNS data saved to {npz_path}")

        # Fit angular model
        flush(f"\n  Fitting angular model...")
        data = np.load(npz_path)
        K_arr = data['A_K_list'].astype(float)
        coeffs = fit_coefficients(data, K_arr, NU)

        c5 = coeffs[4]; d3 = coeffs[8]; c2 = coeffs[1]
        convergence.append((N_val, S['nm'], len(S['triad_k']),
                            len(S['K_list']), c5, d3, c2))

        flush(f"\n  *** N={N_val}: c5 = {c5:+.4f}, d3 = {d3:+.4f}, c2 = {c2:+.4f} ***")

    # Print convergence table
    flush(f"\n{'='*60}")
    flush(f"CONVERGENCE TABLE")
    flush(f"{'='*60}")
    flush(f"{'N':>4} {'shells':>6} {'modes':>6} {'triads':>10} {'c5':>10} {'d3':>10} {'c2':>10}")
    flush("-"*60)
    for N_val, nm, nt, ns, c5, d3, c2 in convergence:
        flush(f"{N_val:4d} {ns:6d} {nm:6d} {nt:10,d} {c5:+10.4f} {d3:+10.4f} {c2:+10.4f}")

    flush(f"\nKey question: does c5 remain negative for N >= 8?")
    flush(f"Key bound: d3 < 2*nu = 0.02?")

if __name__ == '__main__':
    main()
