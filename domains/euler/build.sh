#!/bin/bash
# Build Euler scaffold experiments
# Usage: bash build.sh [AMP] [N_MAX] [IC_TYPE] [T_FINAL]

set -e

AMP=${1:-0.3}
N_MAX=${2:-8}
IC_TYPE=${3:-0}
T_FINAL=${4:-2.0}

TAG="A${AMP}_N${N_MAX}_ic${IC_TYPE}_T${T_FINAL}"

echo "=== Building Euler scaffold: $TAG ==="

cd "$(dirname "$0")"

clang -O3 -c src/triad_kernel_v3.c -o build/kernel.o

clang -O3 -c src/experiment_euler_scaffold.c -o build/exp.o \
    -DPARAM_AMP=$AMP \
    -DPARAM_N_MAX=$N_MAX \
    -DPARAM_IC_TYPE=$IC_TYPE \
    -DPARAM_T_FINAL=$T_FINAL

clang -O2 build/exp.o build/kernel.o -o build/euler_$TAG -lm

echo "=== Built: build/euler_$TAG ==="
echo "Run: ./build/euler_$TAG | tee results/$TAG.txt"
