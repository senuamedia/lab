#!/usr/bin/env python3
"""
Cascade wave experiment — 2D Navier–Stokes on T² = [0, 2π]².

Vorticity–streamfunction formulation, pseudospectral:

    ω_t + u·∇ω = ν Δω,          u = ∇⊥ ψ,    -Δψ = ω

Implemented in Fourier space:

    ω̂_t = -(FT of u·∇ω)_dealiased − ν k² ω̂

Diagnostics per shell K = round(|k|):
  E_K   = (1/2) Σ_{|k|=K} |û_k|² = (1/2) Σ |ω̂_k|² / k²
  Ω_K  = (1/2) Σ_{|k|=K} |ω̂_k|²  (enstrophy)

Expected 2D physics (Kraichnan dual cascade):
  • Initial packet at mid-K:   E cascades to LOW K (inverse)
                               Ω cascades to HIGH K (forward)
  • Cascade velocity (E): NEGATIVE dK/dt
  • Enstrophy bounded for all time (monotone decreasing with ν>0)

Four initial-condition families parallel to 1D and 3D runs.
"""
import sys, os, time
import numpy as np

def flush(s): print(s); sys.stdout.flush()

# ======= Grid =======
N = 64                                                # spatial resolution
x = 2*np.pi * np.arange(N) / N
kx = np.fft.fftfreq(N, d=1.0/N).astype(int)
ky = np.fft.fftfreq(N, d=1.0/N).astype(int)
KX, KY = np.meshgrid(kx, ky, indexing='ij')
K2 = (KX*KX + KY*KY).astype(float)
K2_safe = np.where(K2 == 0, 1.0, K2)                  # avoid div/0 at k=0
Kmag = np.sqrt(K2)
kmax = N // 2
dealias = (np.abs(KX) < (2/3)*kmax) & (np.abs(KY) < (2/3)*kmax)

# Shells: K = 1 .. K_max
K_max = 12
K_list = np.arange(1, K_max + 1)
Kint = np.round(Kmag).astype(int)
shell_masks = [(Kint == K) for K in K_list]

def shell_E(omhat):
    """E_K from vorticity: u = ω/|k|², so |û|² = |ω̂|²/k²."""
    E2d = 0.5 * np.abs(omhat)**2 / K2_safe / (N*N)
    E2d[K2 == 0] = 0.0
    return np.array([float(np.sum(E2d[m])) for m in shell_masks])

def shell_Om(omhat):
    Om2d = 0.5 * np.abs(omhat)**2 / (N*N)
    return np.array([float(np.sum(Om2d[m])) for m in shell_masks])

def total_E_Om(omhat):
    return float(np.sum(shell_E(omhat))), float(np.sum(shell_Om(omhat)))

def shell_complex_amp(omhat):
    """Complex shell amplitude: sum of ω̂_k within each shell (scalar, preserves phase)."""
    return np.array([complex(np.sum(omhat[m])) / (N*N) for m in shell_masks])

N_THETA_BINS = 8  # angular bins for θ = atan2(k_y, k_x) ∈ [-π, π]
THETA_EDGES = np.linspace(-np.pi, np.pi, N_THETA_BINS + 1)
# Precompute per-mode angle
THETA_GRID = np.arctan2(KY.astype(float), KX.astype(float))

def shell_angular_energy(omhat):
    """E(K, θ_bin) — energy in angular bins for 2D.

    θ = atan2(k_y, k_x). Returns array (K_max, N_THETA_BINS).
    """
    E2d = 0.5 * np.abs(omhat)**2 / K2_safe / (N*N)
    E2d[K2 == 0] = 0.0
    out = np.zeros((len(K_list), N_THETA_BINS))
    for j, K in enumerate(K_list):
        m = shell_masks[j]
        angles = THETA_GRID[m]
        energies = E2d[m]
        for b in range(N_THETA_BINS):
            mask_b = (angles >= THETA_EDGES[b]) & (angles < THETA_EDGES[b+1])
            out[j, b] = float(np.sum(energies[mask_b]))
    return out

# ======= Dynamics =======
def rhs(omhat, nu):
    """ω̂_t = − FFT(u·∇ω)·dealias − ν k² ω̂."""
    # Streamfunction ψ̂ = ω̂ / k²
    psihat = omhat / K2_safe
    psihat[K2 == 0] = 0.0
    # u = ∇⊥ ψ = ( ∂_y ψ, −∂_x ψ )
    uhat = 1j * KY * psihat
    vhat = -1j * KX * psihat
    u = np.fft.ifft2(uhat).real
    v = np.fft.ifft2(vhat).real
    # ∇ω
    om_x_hat = 1j * KX * omhat
    om_y_hat = 1j * KY * omhat
    om_x = np.fft.ifft2(om_x_hat).real
    om_y = np.fft.ifft2(om_y_hat).real
    # u·∇ω
    adv = u*om_x + v*om_y
    adv_hat = np.fft.fft2(adv) * dealias
    return -adv_hat - nu * K2 * omhat

def rk4(omhat, dt, nu):
    k1 = rhs(omhat, nu)
    k2 = rhs(omhat + 0.5*dt*k1, nu)
    k3 = rhs(omhat + 0.5*dt*k2, nu)
    k4 = rhs(omhat + dt*k3, nu)
    return omhat + (dt/6)*(k1 + 2*k2 + 2*k3 + k4)

# ======= Initial conditions (set ω̂ with Hermitian symmetry via real IFFT) =======
def _hermitian_random_on_shell(K_target, seed, weight):
    rng = np.random.RandomState(seed)
    omhat = np.zeros((N, N), dtype=complex)
    mask = shell_masks[K_target - 1]
    idxs = np.argwhere(mask)
    for (i, j) in idxs:
        kxv, kyv = KX[i, j], KY[i, j]
        # Process each ±pair once
        ni = (-kxv) % N
        nj = (-kyv) % N
        if (ni, nj) == (i, j):
            continue
        if omhat[i, j] != 0 or omhat[ni, nj] != 0:
            continue
        amp = weight * (rng.randn() + 1j*rng.randn())
        omhat[i, j] = amp
        omhat[ni, nj] = np.conj(amp)
    return omhat

def ic_shell_pulse(K_target, amplitude=4.0, seed=10):
    omhat = _hermitian_random_on_shell(K_target, seed, weight=amplitude*N)
    return omhat

def ic_gaussian_packet(K_center, K_width, amplitude=3.0, seed=20):
    omhat = np.zeros((N, N), dtype=complex)
    for K in K_list:
        w = np.exp(-0.5 * ((K - K_center)/K_width)**2)
        if w < 1e-4:
            continue
        omhat += _hermitian_random_on_shell(K, seed + K, weight=amplitude*w*N)
    return omhat

def ic_broad_spectrum(amplitude=2.0, seed=30):
    omhat = np.zeros((N, N), dtype=complex)
    for K in K_list:
        w = 1.0 / (1 + (K/4.0)**2)
        omhat += _hermitian_random_on_shell(K, seed + K, weight=amplitude*w*N)
    return omhat

# ======= Runner =======
def run(label, omhat_init, T_max, dt, nu):
    n_steps = int(T_max/dt)
    n_record = min(n_steps, 1000)
    rec_every = max(1, n_steps // n_record)

    omhat = omhat_init.copy()
    t_list, E_K_list, Om_K_list, uK_complex_list, E_angular_list = [], [], [], [], []
    E_total, Om_total = [], []
    flush(f"\n{label}: T_max={T_max}, dt={dt}, nu={nu}")
    E0, Om0 = total_E_Om(omhat)
    flush(f"  Initial: E={E0:.4f}, Ω={Om0:.4f}")
    t0 = time.time()
    for step in range(n_steps + 1):
        if step % rec_every == 0:
            t_list.append(step * dt)
            E_K_list.append(shell_E(omhat))
            Om_K_list.append(shell_Om(omhat))
            uK_complex_list.append(shell_complex_amp(omhat))
            E_angular_list.append(shell_angular_energy(omhat))
            E, Om = total_E_Om(omhat)
            E_total.append(E); Om_total.append(Om)
        if step < n_steps:
            omhat = rk4(omhat, dt, nu)
    flush(f"  Final:   E={E_total[-1]:.4f}, Ω={Om_total[-1]:.4f}, runtime={time.time()-t0:.1f}s")

    uK_arr = np.array(uK_complex_list)   # (T, K_max) complex
    E_ang = np.array(E_angular_list)     # (T, K_max, N_THETA_BINS)
    return dict(
        t=np.array(t_list),
        E_K=np.array(E_K_list),
        Om_K=np.array(Om_K_list),
        uK_re=uK_arr.real,
        uK_im=uK_arr.imag,
        E_angular=E_ang,
        K_list=K_list,
        E_total=np.array(E_total),
        Om_total=np.array(Om_total),
        label=label,
    )

def analyse(result):
    t = result['t']
    E_K = result['E_K']
    Om_K = result['Om_K']
    flush(f"\nAnalysis of {result['label']}:")
    flush(f"  {'K':>3} {'E_K(0)':>12} {'E_K(T)':>12} {'Ω_K(0)':>12} {'Ω_K(T)':>12}  peak t(E)")
    for j, K in enumerate(K_list):
        col = E_K[:, j]
        if np.all(col < 1e-14):
            continue
        jpeak = int(np.argmax(col))
        flush(f"  {K:3d} {col[0]:12.4e} {col[-1]:12.4e} "
              f"{Om_K[0,j]:12.4e} {Om_K[-1,j]:12.4e} {t[jpeak]:10.4f}")
    # Dual cascade diagnostic
    E_peak = [(K, t[int(np.argmax(E_K[:, j]))]) for j, K in enumerate(K_list)
              if E_K[:, j].max() > 1e-12]
    Om_peak = [(K, t[int(np.argmax(Om_K[:, j]))]) for j, K in enumerate(K_list)
               if Om_K[:, j].max() > 1e-12]
    if len(E_peak) >= 3:
        Ks = np.array([p[0] for p in E_peak], float)
        ts = np.array([p[1] for p in E_peak], float)
        if ts.std() > 1e-8:
            slope = np.polyfit(ts, Ks, 1)[0]
            flush(f"  E cascade dK/dt = {slope:+.3f} shells/time  (expect <0: inverse)")
    if len(Om_peak) >= 3:
        Ks = np.array([p[0] for p in Om_peak], float)
        ts = np.array([p[1] for p in Om_peak], float)
        if ts.std() > 1e-8:
            slope = np.polyfit(ts, Ks, 1)[0]
            flush(f"  Ω cascade dK/dt = {slope:+.3f} shells/time  (expect >0: forward)")

# ======= Main =======
os.makedirs('results', exist_ok=True)
flush("="*78)
flush("2D NAVIER–STOKES CASCADE EXPERIMENTS")
flush("="*78)
flush(f"Grid: N={N}, K_list={list(K_list)}")

result_A = run("A: K=6 pulse, ν=0", ic_shell_pulse(6, amplitude=2.0, seed=10),
               T_max=2.0, dt=0.001, nu=0.0)
analyse(result_A)

result_B = run("B: K=6 pulse, ν=1e-3", ic_shell_pulse(6, amplitude=2.0, seed=10),
               T_max=2.0, dt=0.001, nu=1e-3)
analyse(result_B)

result_C = run("C: K=6 Gaussian packet", ic_gaussian_packet(6, 1.5, amplitude=1.2, seed=20),
               T_max=2.0, dt=0.001, nu=1e-4)
analyse(result_C)

result_D = run("D: broad spectrum", ic_broad_spectrum(amplitude=1.0, seed=30),
               T_max=2.0, dt=0.001, nu=1e-4)
analyse(result_D)

save_dict = {}
for lab, res in [('A', result_A), ('B', result_B), ('C', result_C), ('D', result_D)]:
    save_dict[f'{lab}_t']         = res['t']
    save_dict[f'{lab}_E_K']       = res['E_K']
    save_dict[f'{lab}_Om_K']      = res['Om_K']
    save_dict[f'{lab}_K_list']    = res['K_list']
    save_dict[f'{lab}_E_total']   = res['E_total']
    save_dict[f'{lab}_Om_total']  = res['Om_total']
    save_dict[f'{lab}_uK_re']     = res['uK_re']
    save_dict[f'{lab}_uK_im']     = res['uK_im']
    save_dict[f'{lab}_E_angular'] = res['E_angular']
np.savez('results/cascade_wave_2d.npz', **save_dict)
flush("\nTrajectories saved to results/cascade_wave_2d.npz")
