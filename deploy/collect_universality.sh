#!/bin/bash
# Collect all universality results from EC2 instances
# Usage: bash deploy/collect_universality.sh IP1 IP2 ... IP7

KEY="$HOME/.ssh/ns-proof-key.pem"
USER="ubuntu"
OUT_DIR="$(cd "$(dirname "$0")/.." && pwd)/results/universality"

mkdir -p "$OUT_DIR"

echo "=== Collecting universality results ==="
echo "Output: $OUT_DIR"
echo ""

for IP in "$@"; do
    echo "--- $IP ---"
    scp -i $KEY -q $USER@$IP:~/ns-proof/results/*.txt "$OUT_DIR/" 2>/dev/null || echo "  (no results yet)"
    echo "  Done"
done

echo ""
echo "=== Generating summary ==="

# Parse all result files for the summary line
echo ""
echo "================================================================"
echo "  UNIVERSALITY SUMMARY TABLE"
echo "================================================================"
printf "%-12s %-8s %-14s %-8s %-8s %-8s %-8s %-6s %-6s\n" \
    "ν" "A" "IC" "C_s" "C_L" "γ" "Ω_max" "N_stab" "Pass"
echo "----------------------------------------------------------------"

for f in "$OUT_DIR"/nu*.txt; do
    [ -f "$f" ] || continue
    NU=$(grep "ν = " "$f" | head -1 | awk '{print $3}' | tr -d ',')
    AMP=$(grep "A = " "$f" | head -1 | awk '{print $3}' | tr -d ',')
    IC=$(grep "IC = " "$f" | head -1 | awk '{print $3}')
    CS=$(grep "C_s = " "$f" | tail -1 | awk '{print $3}')
    CL=$(grep "C_L = " "$f" | tail -1 | awk '{print $3}')
    GAMMA=$(grep "γ = " "$f" | tail -1 | awk '{print $3}')
    OMAX=$(grep "Ω_max = " "$f" | tail -1 | awk '{print $3}')
    NSTAB=$(grep "N_stable = " "$f" | tail -1 | awk '{print $3}')
    RESULT=$(grep "RESULT:" "$f" | tail -1 | awk '{print $2}')

    printf "%-12s %-8s %-14s %-8s %-8s %-8s %-8s %-6s %-6s\n" \
        "$NU" "$AMP" "$IC" "$CS" "$CL" "$GAMMA" "$OMAX" "$NSTAB" "$RESULT"
done

echo "================================================================"
echo ""
echo "Key: C_s ≤ 0.123 and γ < 2 at ALL configs → universality confirmed"
echo ""
echo "Results saved to: $OUT_DIR"
