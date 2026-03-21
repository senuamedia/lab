#!/bin/bash
# Math Test Suite — Run all compiler math tests

SXC="../simplex/build/sxc"
RUNTIME="../simplex/runtime/standalone_runtime.c"
BUILD_DIR="./build"
OPENSSL_PREFIX=$(brew --prefix openssl 2>/dev/null || echo "/usr/local/opt/openssl")
LINK_LIBS="-lm -lssl -lcrypto -L${OPENSSL_PREFIX}/lib"

mkdir -p "$BUILD_DIR"

TESTS=(
    "test_math_arithmetic"
    "test_math_comparisons"
    "test_math_transcendental"
    "test_math_loops"
    "test_math_functions"
)

TOTAL=0
PASSED=0
FAILED=0
FAILED_NAMES=""

echo "========================================================"
echo "  SIMPLEX MATH TEST SUITE"
echo "========================================================"
echo ""

for test in "${TESTS[@]}"; do
    TOTAL=$((TOTAL + 1))
    echo "Compiling ${test}.sx..."

    if ! $SXC "${test}.sx" -o "${BUILD_DIR}/${test}.ll" 2>/dev/null; then
        echo "  COMPILE ERROR: ${test}.sx"
        FAILED=$((FAILED + 1))
        FAILED_NAMES="${FAILED_NAMES} ${test}(compile)"
        echo ""
        continue
    fi

    if ! clang -O0 "${BUILD_DIR}/${test}.ll" "$RUNTIME" -o "${BUILD_DIR}/${test}" $LINK_LIBS 2>/dev/null; then
        echo "  LINK ERROR: ${test}"
        FAILED=$((FAILED + 1))
        FAILED_NAMES="${FAILED_NAMES} ${test}(link)"
        echo ""
        continue
    fi

    echo ""
    if "${BUILD_DIR}/${test}"; then
        PASSED=$((PASSED + 1))
    else
        FAILED=$((FAILED + 1))
        FAILED_NAMES="${FAILED_NAMES} ${test}"
    fi
    echo ""
    echo "--------------------------------------------------------"
    echo ""
done

echo "========================================================"
echo "  MATH TEST RESULTS"
echo "========================================================"
echo "  Total:  ${TOTAL}"
echo "  Passed: ${PASSED}"
echo "  Failed: ${FAILED}"
if [ $FAILED -gt 0 ]; then
    echo "  Failed: ${FAILED_NAMES}"
fi
echo "========================================================"

exit $FAILED
