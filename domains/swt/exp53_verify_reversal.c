/*
 * Experiment 53: Verify predicted reversals
 *
 * Targets from exp52:
 *   π(12,7)-π(12,1): predicted reversal at 10^8.2
 *   π(12,11)-π(12,1): predicted at 10^8.2
 *   π(8,7)-π(8,1): predicted at 10^8.6
 *
 * Sieve to 2B. Find the actual reversal points.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define SIEVE_LIMIT 2000000000LL
#define SIEVE_BYTES ((SIEVE_LIMIT / 8) + 1)

static unsigned char *sieve_bits;
static inline void set_composite(long long n){sieve_bits[n>>3]|=(1<<(n&7));}
static inline int is_composite(long long n){return(sieve_bits[n>>3]>>(n&7))&1;}

int main(void) {
    setvbuf(stdout,NULL,_IONBF,0);
    printf("=== Experiment 53: Verify Predicted Reversals ===\n\n");
    printf("Sieving to %lldB...\n", SIEVE_LIMIT/1000000000);
    time_t t0=time(NULL);

    sieve_bits = calloc(SIEVE_BYTES, 1);
    if (!sieve_bits) { printf("FATAL: alloc\n"); return 1; }
    set_composite(0); set_composite(1);
    for(long long i=2;i*i<=SIEVE_LIMIT;i++)
        if(!is_composite(i)) for(long long j=i*i;j<=SIEVE_LIMIT;j+=i) set_composite(j);
    printf("Sieve done (%.0fs).\n\n", difftime(time(NULL),t0));

    /* track all target pairs simultaneously */
    typedef struct { int q; int b; long long c1; long long cb; long long first_rev; int n_rev; int leading; } Track;
    Track pairs[] = {
        {12, 7,  0,0,-1,0,0},
        {12,11,  0,0,-1,0,0},
        {12, 5,  0,0,-1,0,0},
        { 8, 7,  0,0,-1,0,0},
        { 8, 3,  0,0,-1,0,0},
        { 8, 5,  0,0,-1,0,0},
        {24,17,  0,0,-1,0,0},
        {24, 7,  0,0,-1,0,0},
        {24,11,  0,0,-1,0,0},
        { 3, 2,  0,0,-1,0,0},
        {19, 3,  0,0,-1,0,0},
    };
    int np = 11;

    printf("  Scanning to 2B for reversals...\n\n");

    time_t last_report = time(NULL);

    for (long long x = 2; x <= SIEVE_LIMIT; x++) {
        if (!is_composite(x)) {
            int r3=x%3, r8=x%8, r12=x%12, r19=x%19, r24=x%24;
            for (int p=0; p<np; p++) {
                int q=pairs[p].q, b=pairs[p].b;
                int r = q==3?r3 : q==8?r8 : q==12?r12 : q==19?r19 : r24;
                if (r==1) pairs[p].c1++;
                if (r==b) pairs[p].cb++;
            }
        }

        /* check for reversals every 1000 primes-ish */
        if (x % 10000 == 0) {
            for (int p=0; p<np; p++) {
                int now = (pairs[p].cb > pairs[p].c1) ? 1 : (pairs[p].c1 > pairs[p].cb) ? -1 : 0;
                if (now != 0 && pairs[p].leading != 0 && now != pairs[p].leading) {
                    pairs[p].n_rev++;
                    if (pairs[p].first_rev < 0) {
                        pairs[p].first_rev = x;
                        printf("  *** REVERSAL: π(%d,%d) vs π(%d,1) at x = %lld (10^%.2f)\n",
                               pairs[p].q, pairs[p].b, pairs[p].q, x, log10((double)x));
                        fflush(stdout);
                    }
                }
                if (now != 0) pairs[p].leading = now;
            }
        }

        time_t now = time(NULL);
        if (difftime(now, last_report) > 30) {
            double pct = 100.0 * x / SIEVE_LIMIT;
            printf("  [%.1f%% — x=%lld — %.0fs]\n", pct, x, difftime(now,t0));
            fflush(stdout);
            last_report = now;
        }
    }

    printf("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
    printf("RESULTS\n");
    printf("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n");

    printf("  q  │ 1 vs b │ First reversal       │ Total rev │ Predicted 10^ │ Status\n");
    printf("  ───┼────────┼──────────────────────┼───────────┼───────────────┼───────\n");

    double predictions[] = {8.2, 8.2, 9.5, 8.6, 9.7, 9.5, 9.7, 8.3, 9.9, 9.5, 8.3};

    for (int p=0; p<np; p++) {
        printf("  %2d │  1 v %2d│", pairs[p].q, pairs[p].b);
        if (pairs[p].first_rev > 0) {
            double actual_log = log10((double)pairs[p].first_rev);
            double error = fabs(actual_log - predictions[p]) / predictions[p] * 100;
            printf(" %20lld │  %8d │    %5.1f       │ FOUND %.0f%% err\n",
                   pairs[p].first_rev, pairs[p].n_rev, predictions[p], error);
        } else {
            printf("         none ≤ 2B │         0 │    %5.1f       │ not yet\n", predictions[p]);
        }
    }

    printf("\n  Time: %.0f seconds.\n", difftime(time(NULL),t0));
    free(sieve_bits);
    return 0;
}
