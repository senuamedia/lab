#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

static inline double bits_to_f64(int64_t bits) {
    union { int64_t i; double d; } u; u.i = bits; return u.d;
}
static inline int64_t f64_to_bits_fn(double d) {
    union { double d; int64_t i; } u; u.d = d; return u.i;
}

int64_t f64_parse(const char* str) {
    double val = atof(str);
    union { double d; int64_t i; } u;
    u.d = val;
    return u.i;
}

int64_t sx_f64_add(int64_t a, int64_t b) {
    return f64_to_bits_fn(bits_to_f64(a) + bits_to_f64(b));
}

int main() {
    int64_t a = f64_parse("3.0");
    int64_t b = f64_parse("4.0");
    int64_t c = sx_f64_add(a, b);
    printf("a bits = %lld, as f64 = %g\n", a, bits_to_f64(a));
    printf("b bits = %lld, as f64 = %g\n", b, bits_to_f64(b));
    printf("c bits = %lld, as f64 = %g\n", c, bits_to_f64(c));
    return 0;
}
