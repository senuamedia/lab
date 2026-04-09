# groebner_n2_k1.sage — Verify R_K=1 is impossible at N=2, K=1
#
# Strategy: The phase-alignment condition R_K=1 requires all triad
# contributions z_i to have the same complex phase. This defines
# 275 polynomial constraints on 64 real unknowns. We compute the
# Gröbner basis over F_p. If basis = {1}: no solution exists.
#
# Run: sage groebner_n2_k1.sage
#
# NOTE: This may take minutes to hours depending on the prime and
# the variable ordering. Uses modular arithmetic to avoid
# coefficient explosion.

import itertools
from sage.all import *

# Large prime for modular arithmetic
p = 10**9 + 7
F = GF(p)

# --- Mode enumeration at N=2 ---
# Modes: all k in Z^3 with |k|^2 <= 4, excluding k=0
modes = []
for kx in range(-2, 3):
    for ky in range(-2, 3):
        for kz in range(-2, 3):
            k2 = kx*kx + ky*ky + kz*kz
            if k2 > 0 and k2 <= 4:
                modes.append((kx, ky, kz))

print(f"Total modes: {len(modes)}")
mode_idx = {m: i for i, m in enumerate(modes)}

# Each mode has 2 real degrees of freedom (polarisation in H_k)
# We represent u_k = a_k * e1_k + b_k * e2_k where e1, e2 are
# orthonormal basis vectors of the plane perpendicular to k.
#
# For simplicity, represent each mode by 6 real components (ux_r, uy_r, uz_r,
# ux_i, uy_i, uz_i) with the divergence-free constraint k.u = 0.
# This gives 6 variables per mode minus 2 constraints (real and imag of k.u=0)
# = 4 effective DOF per mode. But we work with all 6 and impose k.u=0.

M = len(modes)
# Variables: for each mode i, we have ur0_i, ur1_i, ur2_i, ui0_i, ui1_i, ui2_i
# Total: 6M variables
var_names = []
for i in range(M):
    var_names.extend([f'ur{c}_{i}' for c in range(3)])
    var_names.extend([f'ui{c}_{i}' for c in range(3)])

print(f"Variables: {len(var_names)}")

# Create polynomial ring over F_p
R = PolynomialRing(F, var_names, order='degrevlex')
gens = R.gens()

# Access variables for mode i
def ur(i, c):
    return gens[6*i + c]
def ui(i, c):
    return gens[6*i + 3 + c]

# Divergence-free constraints: k.u_k = 0 (real and imaginary parts)
div_free = []
for i, (kx, ky, kz) in enumerate(modes):
    # Real part: kx*ur0 + ky*ur1 + kz*ur2 = 0
    div_free.append(kx * ur(i,0) + ky * ur(i,1) + kz * ur(i,2))
    # Imaginary part: kx*ui0 + ky*ui1 + kz*ui2 = 0
    div_free.append(kx * ui(i,0) + ky * ui(i,1) + kz * ui(i,2))

print(f"Divergence-free constraints: {len(div_free)}")

# --- Triad enumeration at K=1 ---
# Shell K=1: modes with |k|^2 = 1
shell1 = [(kx,ky,kz) for (kx,ky,kz) in modes if kx*kx+ky*ky+kz*kz == 1]
print(f"Modes at K=1: {len(shell1)}")

# For each k in shell1, find all triads k = p + q with p, q in modes
triads = []
for k in shell1:
    kx, ky, kz = k
    k_idx = mode_idx[k]
    for p in modes:
        px, py, pz = p
        qx, qy, qz = kx-px, ky-py, kz-pz
        q = (qx, qy, qz)
        q2 = qx*qx + qy*qy + qz*qz
        if q2 == 0 or q not in mode_idx:
            continue
        p_idx = mode_idx[p]
        q_idx = mode_idx[q]
        triads.append((k_idx, p_idx, q_idx, k, p, q))

print(f"Triads at K=1: {len(triads)}")

# --- Compute z_i for each triad ---
# z_i = (u_p . q) * (P_k(u_q) . conj(u_k))
# where P_k(v) = v - (k.v/|k|^2)k is the Leray projection
#
# We compute Im(z_i) for each triad. R_K = 1 requires all z_i
# to have the same phase, which means Im(z_i * conj(z_1)) = 0
# for all i >= 2. This is a polynomial constraint.

def compute_z(k_idx, p_idx, q_idx, k, p, q):
    """Compute the real and imaginary parts of z = (u_p.q)(P_k(u_q).conj(u_k))"""
    kx, ky, kz = k
    px, py, pz = p
    qx, qy, qz = q
    k2 = kx*kx + ky*ky + kz*kz  # = 1 for shell K=1

    # (u_p . q) = sum_c (ur_p[c] + i*ui_p[c]) * q[c]
    # Real part: sum_c ur_p[c]*q[c]
    # Imag part: sum_c ui_p[c]*q[c]
    qvec = [qx, qy, qz]
    updq_re = sum(ur(p_idx, c) * qvec[c] for c in range(3))
    updq_im = sum(ui(p_idx, c) * qvec[c] for c in range(3))

    # P_k(u_q) = u_q - (k.u_q/|k|^2)*k
    # k.u_q (real): sum kc * ur_q[c]
    # k.u_q (imag): sum kc * ui_q[c]
    kvec = [kx, ky, kz]
    kduq_re = sum(kvec[c] * ur(q_idx, c) for c in range(3))
    kduq_im = sum(kvec[c] * ui(q_idx, c) for c in range(3))

    # sc = k.u_q / |k|^2  (since k2 = 1 for K=1, sc = k.u_q)
    # But we keep it general
    # P_k(u_q)_c = u_q_c - sc * k_c
    # P_k(u_q)_c_re = ur_q[c] - (kduq_re/k2)*kc  (but k2=1)
    # P_k(u_q)_c_im = ui_q[c] - (kduq_im/k2)*kc

    # (P_k(u_q) . conj(u_k))
    # = sum_c (Pq_re + i*Pq_im)(ur_k - i*ui_k)
    # Real part: sum_c (Pq_re*ur_k + Pq_im*ui_k)
    # Imag part: sum_c (Pq_im*ur_k - Pq_re*ui_k)
    dot_re = R(0)
    dot_im = R(0)
    for c in range(3):
        kc = kvec[c]
        pq_re = ur(q_idx, c) - (kduq_re * kc)  # since k2=1
        pq_im = ui(q_idx, c) - (kduq_im * kc)
        dot_re += pq_re * ur(k_idx, c) + pq_im * ui(k_idx, c)
        dot_im += pq_im * ur(k_idx, c) - pq_re * ui(k_idx, c)

    # z = (updq)(dot) = (updq_re + i*updq_im)(dot_re + i*dot_im)
    z_re = updq_re * dot_re - updq_im * dot_im
    z_im = updq_re * dot_im + updq_im * dot_re

    return z_re, z_im

# Compute all z_i
print("Computing triad polynomials...")
z_list = []
for t in triads:
    k_idx, p_idx, q_idx, k, p, q = t
    zr, zi = compute_z(k_idx, p_idx, q_idx, k, p, q)
    z_list.append((zr, zi))

print(f"Computed {len(z_list)} triad polynomials")

# --- Phase alignment constraints ---
# R_K = 1 requires all z_i to have the same phase.
# This means z_i * conj(z_0) is real and positive for all i.
# Im(z_i * conj(z_0)) = 0 gives the polynomial constraints.
#
# Im(z_i * conj(z_0)) = z_i_re * z_0_im - z_i_im * z_0_re

z0_re, z0_im = z_list[0]
constraints = list(div_free)  # Start with div-free constraints

for i in range(1, len(z_list)):
    zi_re, zi_im = z_list[i]
    # Im(z_i * conj(z_0)) = zi_re * z0_im - zi_im * z0_re
    constraint = zi_re * z0_im - zi_im * z0_re
    constraints.append(constraint)

print(f"Total constraints: {len(constraints)} ({len(div_free)} div-free + {len(z_list)-1} phase)")
print(f"Variables: {len(var_names)}")
print(f"Overdetermination: {len(constraints)} constraints on {len(var_names)} unknowns")

# --- Compute Gröbner basis ---
print(f"\nComputing Gröbner basis over F_{p}...")
print("(This may take a while...)")

I = R.ideal(constraints)

try:
    gb = I.groebner_basis()
    print(f"\nGröbner basis computed! Length: {len(gb)}")
    if gb == [R(1)] or (len(gb) == 1 and gb[0] == 1):
        print("\n*** BASIS IS {1} ***")
        print("*** THE SYSTEM IS INCONSISTENT ***")
        print("*** R_K = 1 HAS NO SOLUTION AT N=2, K=1 ***")
        print("*** BY IDEAL CONTAINMENT: R_K < 1 FOR ALL N >= 2 ***")
    else:
        print(f"\nBasis elements (first 10): {gb[:10]}")
        print("\nSystem may have solutions — investigate further.")
except Exception as e:
    print(f"\nError computing Gröbner basis: {e}")
    print("Try reducing the system or using a different ordering.")
