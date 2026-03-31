/* Quick: compute Σ|A| for all 3 conjectures at key zero counts */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define MAX_Z 2100000
static double g[MAX_Z]; static int nz=0;
static double est_zp(double gamma){return 1.8*sqrt(log(gamma>2?gamma:2));}
int main(void){
    setvbuf(stdout,NULL,_IONBF,0);
    FILE*f=fopen("zero_tables/zeros.txt","r"); char line[256];
    while(fgets(line,sizeof(line),f)&&nz<MAX_Z){double v;if(sscanf(line,"%lf",&v)==1&&v>0)g[nz++]=v;}
    fclose(f);
    printf("Loaded %d zeros (γ_max=%.1f)\n\n",nz,g[nz-1]);
    printf("  Zeros    │ Mertens  │ Liouville │  Skewes  │ M>1? │ S>1?\n");
    printf("  ─────────┼──────────┼───────────┼──────────┼──────┼─────\n");
    double ms=0,ls=0,ss=0;
    int checks[]={10,30,100,300,1000,3000,10000,30000,100000,300000,1000000,2000000};
    int ci=0;
    for(int i=0;i<nz&&ci<12;i++){
        double rho=sqrt(0.25+g[i]*g[i]);
        double zp=est_zp(g[i]);
        ms+=2.0/(rho*zp);
        ls+=2.0/zp;
        ss+=2.0/(rho*zp*log(rho));
        if(i+1==checks[ci]){
            printf("  %8d │  %7.3f │ %9.1f │  %7.4f │ %s  │ %s\n",
                   i+1,ms,ls,ss,ms>1?"YES":" no",ss>1?"YES":" no");
            fflush(stdout);
            ci++;
        }
    }
    printf("\n  SKEWES crosses 1.0 at: ");
    if(ss>1.0)printf("already crossed!\n");
    else printf("needs more zeros (current %.4f)\n",ss);
    printf("  MERTENS Σ|A| with 2M zeros: %.3f\n",ms);
    printf("  SKEWES Σ|A| with 2M zeros: %.4f\n",ss);
    return 0;
}
