#!/usr/bin/env python3
"""
Cascade wave experiment — 1D Burgers on T¹ = [0, 2π].

Pseudospectral simulation of

    u_t + u u_x = ν u_xx

with the four initial-condition families mirroring cascade_wave.py:

  A: pulse at shell K=1,    ν = 1e-4 (quasi-inviscid, no shocks in window)
  B: pulse at shell K=1,    ν = 1e-2 (viscous)
  C: Gaussian packet at K=4
  D: broad spectrum

Output: results/cascade_wave_1d.npz with the same key layout as the 3D
version (E_K and a dummy Om_K filled with K² E_K, so rock_pool_v3 can
treat all three dimensions uniformly).
"""
import sys, os, time
import numpy as np

def flush(s): print(s); sys.stdout.flush()

# ======= Grid =======
N_x = 128                      # spatial resolution
x = 2*np.pi * np.arange(N_x) / N_x
k = np.fft.fftfreq(N_x, d=1.0/N_x).astype(int)     # integer wavenumbers
kmax = N_x // 2
# 2/3 dealias
dealias = np.abs(k) < (2.0/3.0) * kmax

# Shells: bin by |k|, take K = 1..K_max
K_max = 12                     # match 3D shell range roughly
K_list = np.arange(1, K_max + 1)
shell_masks = [np.abs(k) == K for K in K_list]

def shell_E(uhat):
    """E_K = (1/2) Σ_{|k|=K} |û_k|² / N²  (Parseval with numpy FFT)."""
    return np.array([0.5 * float(np.sum(np.abs(uhat[m])**2)) / (N_x*N_x)
                     for m in shell_masks])

def shell_Om(uhat):
    """Ω_K = (1/2) Σ_{|k|=K} k² |û_k|² / N² (enstrophy analogue)."""
    k2 = k.astype(float)**2
    return np.array([0.5 * float(np.sum(k2[m] * np.abs(uhat[m])**2)) / (N_x*N_x)
                     for m in shell_masks])

def total_E_Om(uhat):
    E = float(np.sum(shell_E(uhat)))
    Om = float(np.sum(shell_Om(uhat)))
    return E, Om

def shell_complex_amp(uhat):
    """Complex shell amplitude: û_K = Σ_{|k|=K} û_k / N  (preserves phase)."""
    return np.array([complex(np.sum(uhat[m])) / N_x for m in shell_masks])

# ======= Dynamics (Fourier space) =======
def rhs(uhat, nu):
    # -u u_x = -(1/2) (u²)_x
    u = np.fft.ifft(uhat).real
    u2hat = np.fft.fft(u*u)
    u2hat *= dealias
    nl = -0.5 * 1j * k * u2hat
    visc = -nu * (k.astype(float)**2) * uhat
    return nl + visc

def rk4(uhat, dt, nu):
    k1 = rhs(uhat, nu)
    k2 = rhs(uhat + 0.5*dt*k1, nu)
    k3 = rhs(uhat + 0.5*dt*k2, nu)
    k4 = rhs(uhat + dt*k3, nu)
    return uhat + (dt/6) * (k1 + 2*k2 + 2*k3 + k4)

# ======= Initial conditions =======
def ic_pulse_at_K(K_target, amplitude=1.0, seed=0):
    """Real-valued pulse with energy at a single shell K."""
    rng = np.random.RandomState(seed)
    uhat = np.zeros(N_x, dtype=complex)
    # Pick amplitude and random phase at k = +K; enforce Hermitian at -K
    phase = rng.uniform(0, 2*np.pi)
    idx_pos = np.where(k == K_target)[0][0]
    idx_neg = np.where(k == -K_target)[0][0]
    uhat[idx_pos] = amplitude * N_x * np.exp(1j*phase) / 2
    uhat[idx_neg] = np.conj(uhat[idx_pos])
    return uhat

def ic_gaussian_packet(K_center, K_width, amplitude=1.0, seed=1):
    rng = np.random.RandomState(seed)
    uhat = np.zeros(N_x, dtype=complex)
    for K in K_list:
        w = np.exp(-0.5 * ((K - K_center)/K_width)**2)
        phase = rng.uniform(0, 2*np.pi)
        idx_pos = np.where(k == K)[0][0]
        idx_neg = np.where(k == -K)[0][0]
        uhat[idx_pos] = amplitude * w * N_x * np.exp(1j*phase) / 2
        uhat[idx_neg] = np.conj(uhat[idx_pos])
    return uhat

def ic_broad_spectrum(amplitude=1.0, seed=2):
    rng = np.random.RandomState(seed)
    uhat = np.zeros(N_x, dtype=complex)
    for K in K_list:
        w = 1.0 / (1 + (K/3.0)**2)     # mild rolloff
        phase = rng.uniform(0, 2*np.pi)
        idx_pos = np.where(k == K)[0][0]
        idx_neg = np.where(k == -K)[0][0]
        uhat[idx_pos] = amplitude * w * N_x * np.exp(1j*phase) / 2
        uhat[idx_neg] = np.conj(uhat[idx_pos])
    return uhat

# ======= Runner =======
def run(label, uhat_init, T_max, dt, nu):
    n_steps = int(T_max/dt)
    n_record = min(n_steps, 1000)
    rec_every = max(1, n_steps // n_record)

    uhat = uhat_init.copy()
    t_list, E_K_list, Om_K_list, uK_complex_list, E_total, Om_total = [], [], [], [], [], []
    flush(f"\n{label}: T_max={T_max}, dt={dt}, nu={nu}")
    E0, Om0 = total_E_Om(uhat)
    flush(f"  Initial: E={E0:.4f}, Ω={Om0:.4f}")
    t0 = time.time()
    for step in range(n_steps + 1):
        if step % rec_every == 0:
            t_list.append(step * dt)
            E_K_list.append(shell_E(uhat))
            Om_K_list.append(shell_Om(uhat))
            uK_complex_list.append(shell_complex_amp(uhat))
            E, Om = total_E_Om(uhat)
            E_total.append(E); Om_total.append(Om)
        if step < n_steps:
            uhat = rk4(uhat, dt, nu)
    flush(f"  Final:   E={E_total[-1]:.4f}, Ω={Om_total[-1]:.4f}, runtime={time.time()-t0:.1f}s")

    uK_arr = np.array(uK_complex_list)  # (T, K_max) complex
    return dict(
        t=np.array(t_list),
        E_K=np.array(E_K_list),
        Om_K=np.array(Om_K_list),
        uK_re=uK_arr.real,   # (T, K_max) float
        uK_im=uK_arr.imag,   # (T, K_max) float
        K_list=K_list,
        E_total=np.array(E_total),
        Om_total=np.array(Om_total),
        label=label,
    )

def analyse(result):
    t = result['t']
    E_K = result['E_K']
    flush(f"\nAnalysis of {result['label']}:")
    flush(f"  {'K':>3} {'E_K(0)':>12} {'E_K(T)':>12} {'peak t':>10} {'peak E_K':>12}")
    peak_times = []
    for j, K in enumerate(K_list):
        col = E_K[:, j]
        if np.all(col < 1e-14):
            continue
        jpeak = int(np.argmax(col))
        peak_times.append((K, t[jpeak]))
        flush(f"  {K:3d} {col[0]:12.4e} {col[-1]:12.4e} {t[jpeak]:10.4f} {col[jpeak]:12.4e}")
    if len(peak_times) >= 3:
        Ks = np.array([pt[0] for pt in peak_times], float)
        ts = np.array([pt[1] for pt in peak_times], float)
        if ts.std() > 1e-8:
            slope = np.polyfit(ts, Ks, 1)[0]
            flush(f"  Cascade velocity (dK/dt): {slope:+.3f} shells/time "
                  f"(+: forward, -: inverse)")

# ======= Main =======
os.makedirs('results', exist_ok=True)
flush("="*78)
flush("1D BURGERS CASCADE EXPERIMENTS")
flush("="*78)
flush(f"Grid: N_x={N_x}, kmax={kmax}, K_list={list(K_list)}")

result_A = run("A: K=1 pulse, ν=1e-4",
               ic_pulse_at_K(1, amplitude=1.0, seed=10),
               T_max=1.5, dt=0.001, nu=1e-4)
analyse(result_A)

result_B = run("B: K=1 pulse, ν=1e-2",
               ic_pulse_at_K(1, amplitude=1.0, seed=10),
               T_max=1.5, dt=0.001, nu=1e-2)
analyse(result_B)

result_C = run("C: K=4 Gaussian packet (w=1.0), ν=1e-3",
               ic_gaussian_packet(4, 1.0, amplitude=0.7, seed=20),
               T_max=1.5, dt=0.001, nu=1e-3)
analyse(result_C)

result_D = run("D: broad spectrum, ν=1e-3",
               ic_broad_spectrum(amplitude=0.5, seed=30),
               T_max=1.5, dt=0.001, nu=1e-3)
analyse(result_D)

save_dict = {}
for lab, res in [('A', result_A), ('B', result_B), ('C', result_C), ('D', result_D)]:
    save_dict[f'{lab}_t']         = res['t']
    save_dict[f'{lab}_E_K']       = res['E_K']
    save_dict[f'{lab}_Om_K']      = res['Om_K']
    save_dict[f'{lab}_K_list']    = res['K_list']
    save_dict[f'{lab}_E_total']   = res['E_total']
    save_dict[f'{lab}_Om_total']  = res['Om_total']
    save_dict[f'{lab}_uK_re']     = res['uK_re']     # (T, K_max) complex amp real
    save_dict[f'{lab}_uK_im']     = res['uK_im']     # (T, K_max) complex amp imag
np.savez('results/cascade_wave_1d.npz', **save_dict)
flush("\nTrajectories saved to results/cascade_wave_1d.npz")
