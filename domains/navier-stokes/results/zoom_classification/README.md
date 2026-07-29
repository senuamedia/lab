# Blowup-type classification (limit-object reduction paper)

Companion experiments for "Global Regularity of 3D Navier-Stokes:
Reduction of the Cascade Hypotheses to a Liouville Property of Ancient
Solutions" (Zenodo, 2026).

- `experiments/zoom_classification.py` — Type I / Type II / regular
  classification via the local scale-invariant energies A(r), E(r), C(r)
  of Caffarelli-Kohn-Nirenberg: synthetic collapsing families with known
  blowup rates validate the classifier; pseudo-spectral runs from smooth
  data (Taylor-Green + random seeds, 64^3, 2/3-dealiased) all report the
  regular signature.
- `results/zoom_classification/` — run log and raw slope data.

Run: `python3 experiments/zoom_classification.py` (numpy only).
