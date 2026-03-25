"""
ns_galerkin_3d.py — Independent Python implementation of 3D NS Galerkin solver

This is a CLEAN reimplementation from the mathematical definition.
No shared code with triad_kernel_v2.c or v3.c.

Purpose: validate the C kernel results independently.

The NS equation in Fourier space:
  dû_k/dt = -ν|k|²û_k - i Σ_{p+q=k} (û_p · q) P_k(û_q)

Where:
  û_k is the complex Fourier coefficient at wavevector k
  P_k(v) = v - (k·v/|k|²)k is the Leray projection
  The sum is over all p, q in the active mode set with p + q = k

Energy conservation identity (nonlinear term):
  Σ_k Re(conj(û_k) · NL_k) = 0

This implementation uses complex numpy arrays throughout.
"""

import numpy as np
from itertools import product
import time


class NSGalerkin3D:
    """3D Navier-Stokes Galerkin solver with complex Fourier coefficients."""

    def __init__(self, n_max):
        """Enumerate modes and precompute triads for |k| ≤ n_max."""
        self.n_max = n_max
        self._enumerate_modes()
        self._precompute_triads()
        self.state = np.zeros((self.num_modes, 3), dtype=complex)

    def _enumerate_modes(self):
        """Enumerate all k ∈ Z³ with 0 < |k|² ≤ n_max²."""
        n = self.n_max
        modes = []
        for kx, ky, kz in product(range(-n, n+1), repeat=3):
            r2 = kx*kx + ky*ky + kz*kz
            if 0 < r2 <= n*n:
                modes.append((kx, ky, kz))
        self.modes = np.array(modes, dtype=int)
        self.num_modes = len(modes)
        # Build lookup: (kx,ky,kz) -> index
        self.mode_index = {}
        for i, (kx, ky, kz) in enumerate(modes):
            self.mode_index[(kx, ky, kz)] = i
        print(f"N={n}: {self.num_modes} modes enumerated")

    def _precompute_triads(self):
        """For each mode k, find all (p, q) with p + q = k, p and q in mode set."""
        n2 = self.n_max * self.n_max
        self.triads = []  # list of lists: triads[k_idx] = [(p_idx, q_idx), ...]
        total = 0
        for k_idx in range(self.num_modes):
            kx, ky, kz = self.modes[k_idx]
            k_triads = []
            for p_idx in range(self.num_modes):
                px, py, pz = self.modes[p_idx]
                qx, qy, qz = kx - px, ky - py, kz - pz
                q2 = qx*qx + qy*qy + qz*qz
                if q2 > 0 and q2 <= n2:
                    q_key = (qx, qy, qz)
                    if q_key in self.mode_index:
                        q_idx = self.mode_index[q_key]
                        k_triads.append((p_idx, q_idx))
                        total += 1
            self.triads.append(k_triads)
        print(f"  {total} triads precomputed")

    def set_ic_distributed(self, amp):
        """Set distributed IC: û_k = (amp/|k|) * phase, divergence-free."""
        self.state = np.zeros((self.num_modes, 3), dtype=complex)
        for i in range(self.num_modes):
            kx, ky, kz = self.modes[i]
            k2 = float(kx*kx + ky*ky + kz*kz)
            km = np.sqrt(k2)
            if km < 0.001:
                km = 1.0
            va = amp / km
            phase = float(i) * 0.7 + 0.3
            ux = va * np.sin(np.pi * phase)
            uy = va * np.sin(np.pi * (phase + 0.4))
            uz = 0.0
            # Divergence-free: k · û = 0
            if kz != 0:
                uz = -(float(kx)*ux + float(ky)*uy) / float(kz)
            elif ky != 0:
                uy = -float(kx)*ux / float(ky)
            else:
                ux = 0.0
            self.state[i] = [ux, uy, uz]  # real-valued (imaginary = 0)

        # Enforce conjugate symmetry: û_{-k} = conj(û_k)
        # Convention: for each pair (i, j) where j > i, set j = conj(i)
        # This matches the C v3 kernel's c3d_enforce_symmetry()
        for i in range(self.num_modes):
            kx, ky, kz = self.modes[i]
            mk = (-kx, -ky, -kz)
            if mk in self.mode_index:
                j = self.mode_index[mk]
                if j > i:
                    self.state[j] = np.conj(self.state[i])

    def compute_nl_rhs(self):
        """Compute nonlinear RHS: -i Σ_{p+q=k} (û_p · q) P_k(û_q)"""
        rhs = np.zeros((self.num_modes, 3), dtype=complex)

        for k_idx in range(self.num_modes):
            k = self.modes[k_idx].astype(float)
            k2 = np.dot(k, k)

            nl = np.zeros(3, dtype=complex)

            for p_idx, q_idx in self.triads[k_idx]:
                u_p = self.state[p_idx]  # complex 3-vector
                u_q = self.state[q_idx]  # complex 3-vector
                q = self.modes[q_idx].astype(float)  # real wavevector

                # û_p · q (complex dot with real vector)
                up_dot_q = np.dot(u_p, q)  # complex scalar

                # Leray projection: P_k(û_q) = û_q - (k·û_q / |k|²) k
                if k2 > 1e-10:
                    k_dot_uq = np.dot(k, u_q)  # complex scalar
                    proj = u_q - (k_dot_uq / k2) * k
                else:
                    proj = u_q

                # Accumulate: (û_p · q) * P_k(û_q)
                nl += up_dot_q * proj

            # Apply -i factor
            rhs[k_idx] = -1j * nl

        return rhs

    def energy(self):
        """E = (1/2) Σ_k |û_k|²"""
        return 0.5 * np.sum(np.abs(self.state)**2)

    def enstrophy(self):
        """Ω = (1/2) Σ_k |k|² |û_k|²"""
        k2 = np.sum(self.modes**2, axis=1).astype(float)
        return 0.5 * np.sum(k2[:, None] * np.abs(self.state)**2)

    def energy_rate_nl(self):
        """Σ_k Re(conj(û_k) · NL_k) — must be zero for energy conservation."""
        rhs = self.compute_nl_rhs()
        return np.real(np.sum(np.conj(self.state) * rhs))

    def step(self, nu, dt):
        """One time step: exponential diffusion + Euler nonlinear."""
        # Exact diffusion
        k2 = np.sum(self.modes**2, axis=1).astype(float)
        decay = np.exp(-nu * k2 * dt)
        self.state *= decay[:, None]

        # Nonlinear RHS
        rhs = self.compute_nl_rhs()

        # Euler step for nonlinear
        self.state += dt * rhs

    def divergence_check(self):
        """Max |k · û_k| — should be zero for divergence-free field."""
        max_div = 0
        for i in range(self.num_modes):
            k = self.modes[i].astype(float)
            div = np.abs(np.dot(k, self.state[i]))
            if div > max_div:
                max_div = div
        return max_div


def test_energy_conservation():
    """Test 1: Σ Re(conj(û)·NL) must be zero at t=0."""
    print("=" * 60)
    print("TEST 1: Energy conservation of nonlinear term")
    print("=" * 60)
    print()
    print(f"{'N':>4}  {'Modes':>6}  {'Energy':>14}  {'Σ conj(û)·NL':>14}  Status")

    for n in range(2, 7):
        solver = NSGalerkin3D(n)
        solver.set_ic_distributed(0.1)
        E = solver.energy()
        rate = solver.energy_rate_nl()
        status = "CONSERVED" if abs(rate) < 1e-12 else "BROKEN"
        print(f"  {n:>2}  {solver.num_modes:>6}  {E:>14.8f}  {rate:>+14.6e}  {status}")
    print()


def test_energy_multistep():
    """Test 2: Energy at ν=0 over 100 steps."""
    print("=" * 60)
    print("TEST 2: Multi-step energy at ν=0")
    print("=" * 60)
    print()
    print(f"{'N':>4}  {'E(0)':>14}  {'E(T)':>14}  {'ΔE%':>10}")

    for n in range(2, 7):
        solver = NSGalerkin3D(n)
        solver.set_ic_distributed(0.1)
        E0 = solver.energy()
        dt = 0.0001
        for _ in range(100):
            solver.step(0.0, dt)  # ν=0
        ET = solver.energy()
        drift = (ET - E0) / E0 * 100
        print(f"  {n:>2}  {E0:>14.8f}  {ET:>14.8f}  {drift:>+9.4f}%")
    print()


def test_energy_decreases():
    """Test 3: Energy at ν>0 should decrease."""
    print("=" * 60)
    print("TEST 3: Energy at ν=0.01 (should decrease)")
    print("=" * 60)
    print()
    print(f"{'N':>4}  {'E(0)':>14}  {'E(T)':>14}  {'ΔE%':>10}  Decreasing?")

    for n in range(2, 7):
        solver = NSGalerkin3D(n)
        solver.set_ic_distributed(0.1)
        E0 = solver.energy()
        dt = 0.0001
        for _ in range(1000):
            solver.step(0.01, dt)
        ET = solver.energy()
        drift = (ET - E0) / E0 * 100
        dec = "YES" if drift < 0 else "NO ← PROBLEM"
        print(f"  {n:>2}  {E0:>14.8f}  {ET:>14.8f}  {drift:>+9.4f}%  {dec}")
    print()


def test_divergence_free():
    """Test 4: Divergence-free condition preserved."""
    print("=" * 60)
    print("TEST 4: Divergence-free condition")
    print("=" * 60)
    print()

    solver = NSGalerkin3D(4)
    solver.set_ic_distributed(0.1)
    div0 = solver.divergence_check()
    print(f"  max|k·û| at t=0: {div0:.2e}")

    for _ in range(100):
        solver.step(0.01, 0.0001)
    divT = solver.divergence_check()
    print(f"  max|k·û| at t=0.01: {divT:.2e}")
    print(f"  {'PRESERVED' if divT < 1e-10 else 'VIOLATED'}")
    print()


def compare_with_c_kernel():
    """Test 5: Compare energy values with C kernel (if available)."""
    print("=" * 60)
    print("TEST 5: Cross-validation values")
    print("=" * 60)
    print()
    print("  Expected values from v3 C kernel (A=0.1, ν=0.01):")
    print()

    # These are the v3 kernel values from the energy audit
    expected = {
        3: {"E0": 0.24501765, "ET_nu0": 0.24501860, "ET_nu01": 0.24271571},
        4: {"E0": 0.41416940, "ET_nu0": 0.41417329, "ET_nu01": 0.40779723},
        5: {"E0": 0.64605753, "ET_nu0": 0.64607365, "ET_nu01": 0.63095631},
    }

    print(f"  {'N':>4}  {'E(0) Python':>14}  {'E(0) C':>14}  {'Match?':>8}")
    for n in [3, 4, 5]:
        solver = NSGalerkin3D(n)
        solver.set_ic_distributed(0.1)
        E = solver.energy()
        E_c = expected[n]["E0"]
        match = "YES" if abs(E - E_c) / E_c < 0.01 else "NO"
        print(f"  {n:>2}  {E:>14.8f}  {E_c:>14.8f}  {match:>8}")
    print()


if __name__ == "__main__":
    print()
    print("=" * 60)
    print("  NS Galerkin 3D — Independent Python Validation")
    print("  Complex Fourier coefficients, correct -i factor")
    print("=" * 60)
    print()

    t0 = time.time()
    test_energy_conservation()
    test_energy_multistep()
    test_energy_decreases()
    test_divergence_free()
    compare_with_c_kernel()
    elapsed = time.time() - t0

    print(f"Total time: {elapsed:.1f}s")
    print()
    print("=" * 60)
    print("  If all tests pass: the C v3 kernel is independently validated.")
    print("  The NS results are implementation-independent.")
    print("=" * 60)
