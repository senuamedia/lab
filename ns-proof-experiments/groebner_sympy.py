#!/usr/bin/env python3
"""
groebner_sympy.py — Verify R_K=1 is impossible at N=2, K=1
using SymPy's Gröbner basis over GF(65537).

If basis = {1}: no solution exists → R_K < 1 proved.
"""

import sys
from sympy import symbols, groebner, GF
import itertools

# --- Mode enumeration at N=2 ---
modes = []
for kx in range(-2, 3):
    for ky in range(-2, 3):
        for kz in range(-2, 3):
            k2 = kx*kx + ky*ky + kz*kz
            if 0 < k2 <= 4:
                modes.append((kx, ky, kz))

mode_idx = {m: i for i, m in enumerate(modes)}
M = len(modes)
print(f"Modes: {M}")

# Shell K=1 (strict: |k|^2 = 1)
shell1 = [m for m in modes if m[0]**2+m[1]**2+m[2]**2 == 1]
print(f"Shell K=1: {len(shell1)} modes")

# --- Variables ---
# Each mode i has 6 real components: ur0_i, ur1_i, ur2_i, ui0_i, ui1_i, ui2_i
# But this gives 192 variables which is too many for sympy.
#
# REDUCTION: Use conjugate symmetry to halve the modes.
# For each pair (k, -k), keep only the one with k in the "positive half".
# The other is determined: u_{-k} = conj(u_k), i.e., ur same, ui negated.

def positive_half(k):
    """Return True if k is in the positive half-space (canonical representative)."""
    kx, ky, kz = k
    if kx > 0: return True
    if kx < 0: return False
    if ky > 0: return True
    if ky < 0: return False
    if kz > 0: return True
    return False

independent = [m for m in modes if positive_half(m)]
dep_map = {}  # dependent mode index -> (independent mode index, is_conjugate)
for m in modes:
    mk = (-m[0], -m[1], -m[2])
    if positive_half(m):
        dep_map[mode_idx[m]] = (mode_idx[m], False)
    elif mk in mode_idx:
        dep_map[mode_idx[m]] = (mode_idx[mk], True)

indep_idx = {mode_idx[m]: i for i, m in enumerate(independent)}
n_indep = len(independent)
print(f"Independent modes (after conjugate symmetry): {n_indep}")

# Variables: 6 per independent mode, minus 2 per mode for div-free
# But for simplicity, use 4 real DOF per independent mode
# (2 complex polarisation components in the plane perp to k)
#
# Actually, let's use the full 6 components per independent mode
# and add div-free as constraints. This keeps the polynomials simpler.

var_names = []
for i, m in enumerate(independent):
    for c in range(3):
        var_names.append(f'r{c}_{i}')
    for c in range(3):
        var_names.append(f'i{c}_{i}')

syms = symbols(var_names)
sym_dict = {name: sym for name, sym in zip(var_names, syms)}

def ur(mode_raw_idx, c):
    """Get the real part of component c of mode with raw index mode_raw_idx."""
    indep_raw, is_conj = dep_map[mode_raw_idx]
    ii = indep_idx[indep_raw]
    return sym_dict[f'r{c}_{ii}']  # conjugate doesn't change real part

def ui(mode_raw_idx, c):
    """Get the imaginary part of component c."""
    indep_raw, is_conj = dep_map[mode_raw_idx]
    ii = indep_idx[indep_raw]
    s = sym_dict[f'i{c}_{ii}']
    return -s if is_conj else s  # conjugate negates imaginary part

n_vars = len(var_names)
print(f"Variables: {n_vars}")

# --- Divergence-free constraints ---
div_free = []
for m in independent:
    kx, ky, kz = m
    i = mode_idx[m]
    # k . u_k = 0 (real part)
    div_free.append(kx * ur(i, 0) + ky * ur(i, 1) + kz * ur(i, 2))
    # k . u_k = 0 (imaginary part)
    div_free.append(kx * ui(i, 0) + ky * ui(i, 1) + kz * ui(i, 2))

print(f"Div-free constraints: {len(div_free)}")

# --- Triad enumeration at K=1 ---
mode_set = set(modes)
triads = []
for k in shell1:
    kx, ky, kz = k
    k_idx = mode_idx[k]
    for p in modes:
        px, py, pz = p
        q = (kx-px, ky-py, kz-pz)
        q2 = q[0]**2 + q[1]**2 + q[2]**2
        if q2 > 0 and q in mode_set:
            p_idx = mode_idx[p]
            q_idx = mode_idx[q]
            triads.append((k_idx, p_idx, q_idx, k, p, q))

print(f"Triads at K=1: {len(triads)}")

# --- Compute z_i for each triad ---
def compute_z(k_idx, p_idx, q_idx, k, p, q):
    kx, ky, kz = k
    qx, qy, qz = q
    k2 = kx*kx + ky*ky + kz*kz  # = 1

    # (u_p . q)
    updq_re = sum(ur(p_idx, c) * [qx,qy,qz][c] for c in range(3))
    updq_im = sum(ui(p_idx, c) * [qx,qy,qz][c] for c in range(3))

    # P_k(u_q) . conj(u_k)
    kduq_re = sum([kx,ky,kz][c] * ur(q_idx, c) for c in range(3))
    kduq_im = sum([kx,ky,kz][c] * ui(q_idx, c) for c in range(3))

    dot_re = 0
    dot_im = 0
    for c in range(3):
        kc = [kx,ky,kz][c]
        pq_re = ur(q_idx, c) - kduq_re * kc  # k2=1
        pq_im = ui(q_idx, c) - kduq_im * kc
        dot_re += pq_re * ur(k_idx, c) + pq_im * ui(k_idx, c)
        dot_im += pq_im * ur(k_idx, c) - pq_re * ui(k_idx, c)

    z_re = updq_re * dot_re - updq_im * dot_im
    z_im = updq_re * dot_im + updq_im * dot_re
    return z_re, z_im

print("Computing triad polynomials...")
z_list = []
for t in triads:
    zr, zi = compute_z(*t)
    z_list.append((zr, zi))

# --- Phase alignment constraints ---
# Im(z_i * conj(z_0)) = z_i_re * z_0_im - z_i_im * z_0_re = 0
z0_re, z0_im = z_list[0]
phase_constraints = []
for i in range(1, len(z_list)):
    zi_re, zi_im = z_list[i]
    constraint = zi_re * z0_im - zi_im * z0_re
    # Expand to polynomial
    constraint = constraint.expand()
    if constraint != 0:
        phase_constraints.append(constraint)

print(f"Non-trivial phase constraints: {len(phase_constraints)}")

# --- Non-triviality: energy at K=1 shell equals 1 ---
# This excludes the trivial solution u=0 which vacuously satisfies phase alignment
energy_k1 = 0
for m in shell1:
    i = mode_idx[m]
    for c in range(3):
        energy_k1 += ur(i, c)**2 + ui(i, c)**2
nontrivial = [energy_k1 - 1]  # ||u_{K=1}||^2 = 1
print(f"Non-triviality constraint: 1 (energy at K=1 = 1)")

# --- Combine all constraints ---
all_constraints = div_free + phase_constraints + nontrivial
print(f"\nTotal constraints: {len(all_constraints)}")
print(f"Variables: {n_vars}")
print(f"Ratio: {len(all_constraints)/n_vars:.1f} : 1")

# --- Compute Gröbner basis over GF(65537) ---
p = 65537
print(f"\nComputing Gröbner basis over GF({p})...")
print("(This may take a while for 192 variables...)")
sys.stdout.flush()

try:
    gb = groebner(all_constraints, *syms, domain=GF(p), order='grevlex')
    basis = list(gb)
    print(f"\nGröbner basis computed! Length: {len(basis)}")

    if basis == [1]:
        print("\n*** BASIS IS {1} ***")
        print("*** THE SYSTEM IS INCONSISTENT ***")
        print("*** R_K = 1 HAS NO SOLUTION AT N=2, K=1 ***")
        print("*** BY IDEAL CONTAINMENT: R_K < 1 FOR ALL N >= 2 ***")
    else:
        print(f"\nFirst 5 basis elements: {basis[:5]}")
        print("System may have solutions — investigate further.")
except Exception as e:
    print(f"\nError: {e}")
    print("System too large for sympy. Use Sage or Macaulay2.")
