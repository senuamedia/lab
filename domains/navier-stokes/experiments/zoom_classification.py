"""Type I / Type II / regular classification via local scale-invariant
energies, for Paper 8 (limit-object reduction).

Quantities (Caffarelli-Kohn-Nirenberg / Seregin):
  A(r) = sup_{t in (t0-r^2, t0)} (1/r) int_{B(r)} |v|^2 dx
  E(r) = (1/r) int_{t0-r^2}^{t0} int_{B(r)} |grad v|^2 dx dt
  C(r) = (1/r^2) int_{t0-r^2}^{t0} int_{B(r)} |v|^3 dx dt
computed at dyadic radii about a centre point. Classifier: the fitted
log-log slope of each quantity vs r as r decreases.
  slope > 0   : all three vanish as r -> 0   -> regular point
  slope ~ 0   : bounded, non-vanishing       -> Type I rate
  slope < 0   : divergence                   -> Type II rate

Part 1 validates the classifier on synthetic velocity fields with known
blowup rate: a frozen smooth field (regular), an exactly self-similar
profile v = l(t) V(l(t) x), l = (T*-t)^{-1/2} (Type I), and a
super-self-similar profile v = l^{1+2b} V(l x), b > 0 (Type II).

Part 2 applies the identical pipeline to pseudo-spectral solutions of
incompressible NS on T^3 (64^3, 2/3-dealiased, RK4) from smooth data
(Taylor-Green and two random solenoidal seeds), evaluated at the
enstrophy peak, centred at the point of maximum |omega|.

The computations illustrate and validate the classifier; they do not,
and cannot, verify the Liouville property (L).
"""

from __future__ import annotations

import json
import os
import time

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
OUT_DIR = os.path.join(HERE, "..", "results", "zoom_classification")
PROGRESS = os.path.join(OUT_DIR, "progress.txt")


def log(msg: str) -> None:
    os.makedirs(OUT_DIR, exist_ok=True)
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    with open(PROGRESS, "a") as f:
        f.write(line + "\n")


def fit_slope(r: np.ndarray, q: np.ndarray) -> float:
    mask = (q > 0) & np.isfinite(q)
    if mask.sum() < 3:
        return float("nan")
    return float(np.polyfit(np.log(r[mask]), np.log(q[mask]), 1)[0])


# ---------------------------------------------------------------------
# shared pipeline: per-snapshot ball integrals -> windowed A, E, C
# ---------------------------------------------------------------------

def ball_integrals(v: np.ndarray, dist2: np.ndarray, radii: np.ndarray,
                   dV: float, grad_sq: np.ndarray) -> dict:
    """Per-snapshot integrals over balls B(r) about the centre encoded in
    dist2 (squared distance field). v: (3, N, N, N)."""
    v2 = np.sum(v * v, axis=0)
    v3 = v2 ** 1.5
    out = {"I2": [], "I3": [], "Ig": []}
    for r in radii:
        m = dist2 <= r * r
        out["I2"].append(float(np.sum(v2[m]) * dV))
        out["I3"].append(float(np.sum(v3[m]) * dV))
        out["Ig"].append(float(np.sum(grad_sq[m]) * dV))
    return out


def windowed_AEC(times: list[float], snaps: list[dict],
                 radii: np.ndarray, t0: float) -> dict:
    """A, E, C at evaluation time t0 from per-snapshot ball integrals."""
    ts = np.asarray(times)
    A, E, C = [], [], []
    for i, r in enumerate(radii):
        w = (ts > t0 - r * r) & (ts <= t0 + 1e-12)
        if w.sum() < 2:
            w = ts >= ts[-2]  # fall back to last two snapshots
        I2 = np.asarray([s["I2"][i] for s in snaps])[w]
        I3 = np.asarray([s["I3"][i] for s in snaps])[w]
        Ig = np.asarray([s["Ig"][i] for s in snaps])[w]
        tw = ts[w]
        A.append(float(I2.max() / r))
        E.append(float(np.trapezoid(Ig, tw) / r))
        C.append(float(np.trapezoid(I3, tw) / r ** 2))
    return {"A": A, "E": E, "C": C}


# ---------------------------------------------------------------------
# Part 1: synthetic profiles
# ---------------------------------------------------------------------

def synthetic_case(kind: str, N: int = 192) -> dict:
    """Collapsing self-similar families with known blowup rate.

      v(x, t) = tau^{-(1+beta)/2} V(x / sqrt(tau)),   tau = T* - t,
      V(y) = (-y2, y1, 0) (eps0 + |y|^2)^{-(2+beta)/2},  eps0 = 0.1,
    so |V| ~ |y|^{-(1+beta)} from |y| of order sqrt(eps0). Smooth at
    every t < T*, singular only in the limit — like a real blowup.
    Continuum scalings of the windowed quantities at the centre:
      beta = 0    (self-similar rate, Type I) : A, E, C ~ r^0
      beta = 1/2  (super rate, Type II)       : A, E ~ r^{-1}, C ~ r^{-1.7}
      regular (frozen smooth swirl)           : all slopes positive.
    Snapshots are log-spaced in tau down to the resolution scale, so the
    windowed pipeline is exercised exactly as in the NS runs."""
    L = 2 * np.pi
    x = np.linspace(-L / 2, L / 2, N, endpoint=False)
    dx = x[1] - x[0]
    dV = dx ** 3
    X, Y, Z = np.meshgrid(x, x, x, indexing="ij")
    dist2 = X * X + Y * Y + Z * Z
    radii = np.geomspace(6 * dx, 1.4, 7)[::-1]  # descending
    beta = {"regular": 0.0, "type1": 0.0, "type2": 0.5}[kind]
    eps0 = 0.1

    def field(tau: float) -> np.ndarray:
        if kind == "regular":
            f = np.exp(-dist2 / 2.0)
            return np.stack([-Y * f, X * f, np.zeros_like(X)])
        s = tau ** -0.5
        R2y = dist2 * s * s
        f = (eps0 + R2y) ** (-(2 + beta) / 2)
        amp = tau ** (-(1 + beta) / 2) * s  # (-Yy, Xy, 0) = s*(-Y, X, 0)
        return amp * np.stack([-Y * f, X * f, np.zeros_like(X)])

    if kind == "regular":
        taus = np.arange(float(radii[0]) ** 2 + 0.05, 0.02, -0.05)
    else:
        taus = np.geomspace(float(radii[0]) ** 2, (1.5 * dx) ** 2, 28)
    times = [-float(t) for t in taus]  # ascending toward t0 = -tau_min
    snaps = []
    for tau in taus:
        v = field(float(tau))
        g = sum(np.sum(np.stack(np.gradient(v[c], dx)) ** 2, axis=0)
                for c in range(3))
        snaps.append(ball_integrals(v, dist2, radii, dV, g))
    q = windowed_AEC(times, snaps, radii, t0=times[-1])
    slopes = {k: fit_slope(radii, np.asarray(q[k])) for k in "AEC"}
    log(f"synthetic {kind:8s} (beta={beta})  slopes  A {slopes['A']:+.2f}  "
        f"E {slopes['E']:+.2f}  C {slopes['C']:+.2f}")
    return {"kind": kind, "beta": beta, "radii": [float(r) for r in radii],
            **q, "slopes": slopes}


# ---------------------------------------------------------------------
# Part 2: pseudo-spectral NS on T^3
# ---------------------------------------------------------------------

class Spectral3D:
    def __init__(self, N: int, nu: float):
        self.N, self.nu = N, nu
        k1 = np.fft.fftfreq(N, 1.0 / N)
        self.KX = k1[:, None, None]
        self.KY = k1[None, :, None]
        self.KZ = np.fft.rfftfreq(N, 1.0 / N)[None, None, :] * 1.0
        self.K2 = self.KX**2 + self.KY**2 + self.KZ**2
        self.K2s = np.where(self.K2 == 0, 1.0, self.K2)
        kmax = N // 3
        self.dealias = ((np.abs(self.KX) <= kmax) &
                        (np.abs(self.KY) <= kmax) &
                        (np.abs(self.KZ) <= kmax))
        self.x = np.linspace(0, 2 * np.pi, N, endpoint=False)

    def project(self, vh):
        kdv = self.KX * vh[0] + self.KY * vh[1] + self.KZ * vh[2]
        return np.stack([vh[0] - self.KX * kdv / self.K2s,
                         vh[1] - self.KY * kdv / self.K2s,
                         vh[2] - self.KZ * kdv / self.K2s])

    def curl_hat(self, vh):
        i = 1j
        return np.stack([i * (self.KY * vh[2] - self.KZ * vh[1]),
                         i * (self.KZ * vh[0] - self.KX * vh[2]),
                         i * (self.KX * vh[1] - self.KY * vh[0])])

    def rhs(self, vh):
        v = np.stack([np.fft.irfftn(vh[c]) for c in range(3)])
        w = np.stack([np.fft.irfftn(h) for h in self.curl_hat(vh)])
        vxw = np.stack([v[1] * w[2] - v[2] * w[1],
                        v[2] * w[0] - v[0] * w[2],
                        v[0] * w[1] - v[1] * w[0]])
        nh = np.stack([np.fft.rfftn(vxw[c]) for c in range(3)])
        nh *= self.dealias
        return self.project(nh) - self.nu * self.K2 * vh

    def step(self, vh, dt):
        k1 = self.rhs(vh)
        k2 = self.rhs(vh + 0.5 * dt * k1)
        k3 = self.rhs(vh + 0.5 * dt * k2)
        k4 = self.rhs(vh + dt * k3)
        return vh + dt / 6.0 * (k1 + 2 * k2 + 2 * k3 + k4)


def initial_field(sim: Spectral3D, kind: str, seed: int = 0):
    N = sim.N
    X, Y, Z = np.meshgrid(sim.x, sim.x, sim.x, indexing="ij")
    if kind == "taylor_green":
        v = np.stack([np.sin(X) * np.cos(Y) * np.cos(Z),
                      -np.cos(X) * np.sin(Y) * np.cos(Z),
                      np.zeros((N, N, N))])
        return np.stack([np.fft.rfftn(v[c]) for c in range(3)])
    rng = np.random.default_rng(seed)
    vh = np.stack([np.fft.rfftn(rng.standard_normal((N, N, N)))
                   for _ in range(3)])
    spec = np.sqrt(sim.K2) ** 2 * np.exp(-(np.sqrt(sim.K2) / 3.0) ** 2)
    vh = sim.project(vh * spec)
    v = np.stack([np.fft.irfftn(vh[c]) for c in range(3)])
    e0 = 0.5 * np.mean(np.sum(v * v, axis=0))
    return vh * np.sqrt(1.0 / max(e0, 1e-12))


def grad_sq_spectral(sim: Spectral3D, vh: np.ndarray) -> np.ndarray:
    """Pointwise |grad v|^2 from the nine spectral derivatives."""
    g = np.zeros((sim.N, sim.N, sim.N))
    for c in range(3):
        for K in (sim.KX, sim.KY, sim.KZ):
            g += np.fft.irfftn(1j * K * vh[c]) ** 2
    return g


def ns_case(name: str, ic: str, seed: int, nu: float = 0.01,
            N: int = 64, T: float = 6.0, dt: float = 5e-3,
            sample_every: float = 0.05) -> dict:
    """Two-pass, memory-flat: pass 1 locates the enstrophy peak and its
    max-|omega| centre; pass 2 (identical deterministic run) accumulates
    per-snapshot ball integrals about that fixed centre."""
    sim = Spectral3D(N, nu)
    dx = 2 * np.pi / N
    dV = dx ** 3
    radii = np.geomspace(5 * dx, 2.2, 6)[::-1]
    nsteps = int(round(T / dt))
    every = int(round(sample_every / dt))

    # ---- pass 1: peak time + centre ----
    vh = initial_field(sim, ic, seed)
    omega_max, centres, times = [], [], []
    E0 = None
    for n in range(nsteps + 1):
        if n % every == 0:
            wmag2 = np.zeros((N, N, N))
            for h in sim.curl_hat(vh):
                wmag2 += np.fft.irfftn(h) ** 2
            centres.append(np.unravel_index(np.argmax(wmag2), wmag2.shape))
            omega_max.append(float(np.sqrt(wmag2.max())))
            times.append(n * dt)
            if E0 is None:
                v = np.stack([np.fft.irfftn(vh[c]) for c in range(3)])
                E0 = float(0.5 * np.mean(np.sum(v * v, 0)) * (2 * np.pi) ** 3)
        vh = sim.step(vh, dt)
    ipk = max(int(np.argmax(omega_max)), 2)
    cidx = centres[ipk]
    cx = (sim.x[cidx[0]], sim.x[cidx[1]], sim.x[cidx[2]])
    X, Y, Z = np.meshgrid(sim.x, sim.x, sim.x, indexing="ij")
    d = [np.minimum(np.abs(A - c), 2 * np.pi - np.abs(A - c))
         for A, c in zip((X, Y, Z), cx)]
    dist2 = d[0] ** 2 + d[1] ** 2 + d[2] ** 2

    # ---- pass 2: ball integrals about the fixed centre ----
    vh = initial_field(sim, ic, seed)
    ints = []
    for n in range(nsteps + 1):
        if n % every == 0:
            v = np.stack([np.fft.irfftn(vh[c]) for c in range(3)])
            g = grad_sq_spectral(sim, vh)
            ints.append(ball_integrals(v, dist2, radii, dV, g))
        vh = sim.step(vh, dt)
    q = windowed_AEC(times, ints, radii, t0=times[ipk])
    slopes = {k: fit_slope(radii, np.asarray(q[k])) for k in "AEC"}
    log(f"NS {name:14s} nu={nu}  t_peak={times[ipk]:.2f}  "
        f"max|w|={omega_max[ipk]:.2f}  slopes A {slopes['A']:+.2f}  "
        f"E {slopes['E']:+.2f}  C {slopes['C']:+.2f}")
    return {"name": name, "nu": nu, "N": N, "t_peak": times[ipk],
            "omega_max": omega_max[ipk], "E0": E0,
            "radii": [float(r) for r in radii], **q, "slopes": slopes}


def main() -> None:
    import sys
    os.makedirs(OUT_DIR, exist_ok=True)
    t0 = time.time()
    out_path = os.path.join(OUT_DIR, "zoom_classification.json")
    synth_only = "--synth-only" in sys.argv
    log("Part 1: synthetic profile validation")
    synth = [synthetic_case(k) for k in ("regular", "type1", "type2")]
    if synth_only and os.path.exists(out_path):
        with open(out_path) as f:
            payload = json.load(f)
        payload["synthetic"] = synth
    else:
        log("Part 2: pseudo-spectral NS runs (T^3, 64^3, 2/3-dealiased)")
        runs = [
            ns_case("taylor_green", "taylor_green", 0, nu=0.01),
            ns_case("random_seed1", "random", 1, nu=0.008),
            ns_case("random_seed2", "random", 2, nu=0.012),
        ]
        payload = {"synthetic": synth, "ns_runs": runs}
    payload["elapsed_s"] = time.time() - t0
    with open(out_path, "w") as f:
        json.dump(payload, f, indent=2)
    log(f"done in {time.time() - t0:.0f}s; wrote zoom_classification.json")


if __name__ == "__main__":
    main()
