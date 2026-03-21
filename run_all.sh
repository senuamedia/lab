#!/bin/bash
# Theorem Validation — Run All Experiments
#
# Compiles and runs all 6 experiments in order.
# Reports pass/fail for each and overall.

set -e

SXC="../simplex/build/sxc"
RUNTIME="../simplex/runtime/standalone_runtime.c"
BUILD_DIR="./build"

mkdir -p "$BUILD_DIR"

EXPERIMENTS=(
    "exp_contraction"
    "exp_gradient_interference"
    "exp_lyapunov"
    "exp_invariants"
    "exp_timescale"
    "exp_composition"
)

TOTAL=0
PASSED=0
FAILED=0
FAILED_NAMES=""

echo "========================================================"
echo "  THEOREM VALIDATION — UNIFIED ADAPTATION CONVERGENCE"
echo "========================================================"
echo ""

for exp in "${EXPERIMENTS[@]}"; do
    TOTAL=$((TOTAL + 1))
    echo "Compiling ${exp}.sx..."

    # Step 1: Compile .sx to .ll (LLVM IR)
    if ! $SXC "${exp}.sx" -o "${BUILD_DIR}/${exp}.ll" 2>/dev/null; then
        echo "  COMPILE ERROR: ${exp}.sx (sxc failed)"
        FAILED=$((FAILED + 1))
        FAILED_NAMES="${FAILED_NAMES} ${exp}(sxc)"
        echo ""
        continue
    fi

    # Step 2: Link with runtime using clang
    OPENSSL_PREFIX=$(brew --prefix openssl 2>/dev/null || echo "/usr/local/opt/openssl")
    LINK_LIBS="-lm -lssl -lcrypto -L${OPENSSL_PREFIX}/lib"
    if ! clang -O2 "${BUILD_DIR}/${exp}.ll" "$RUNTIME" -o "${BUILD_DIR}/${exp}" $LINK_LIBS 2>/dev/null; then
        echo "  LINK ERROR: ${exp} (clang failed)"
        FAILED=$((FAILED + 1))
        FAILED_NAMES="${FAILED_NAMES} ${exp}(link)"
        echo ""
        continue
    fi

    echo ""
    if "${BUILD_DIR}/${exp}"; then
        PASSED=$((PASSED + 1))
    else
        FAILED=$((FAILED + 1))
        FAILED_NAMES="${FAILED_NAMES} ${exp}"
    fi
    echo ""
    echo "--------------------------------------------------------"
    echo ""
done

echo "========================================================"
echo "  OVERALL RESULTS"
echo "========================================================"
echo "  Total:  ${TOTAL}"
echo "  Passed: ${PASSED}"
echo "  Failed: ${FAILED}"

if [ $FAILED -eq 0 ]; then
    echo ""
    echo "  *** ALL EXPERIMENTS PASSED ***"
    echo "  Proceed to TASK-063 (Unified Pipeline) and"
    echo "  TASK-064 (Geometric Contraction Framework)"
    echo ""
else
    echo "  Failed: ${FAILED_NAMES}"
    echo ""
    echo "  *** DECISION GATE: DO NOT PROCEED ***"
    echo "  Investigate failures before committing architecture."
    echo ""
fi
echo "========================================================"

exit $FAILED
