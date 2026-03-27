#!/bin/bash
# Build neural gate scaffold experiments
set -e

cd "$(dirname "$0")"

echo "=== Building neural gate scaffold ==="

clang -O3 -c src/gate_solver.c -o build/gate_solver.o
clang -O3 -c src/experiment_gate_scaffold.c -o build/exp.o
clang -O2 build/exp.o build/gate_solver.o -o build/gate_scaffold -lm

echo "=== Built: build/gate_scaffold ==="
echo "Run: ./build/gate_scaffold | tee results/scaffold_run.txt"
