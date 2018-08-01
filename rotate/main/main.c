#include <stdio.h>
#include <stdlib.h>
#include "clock.h"
#include "rotate.h"
#include "my_type.h"
#define N 2048
#define TRIALS 25
MY_TYPE src[N][N], dst[N][N];
int main(int argc, char *argv[]) {
    double time[TRIALS];
    int try_index;
    init_src(N, src);
    for (try_index = 0; try_index < TRIALS; try_index++) {
        start_counter();
        rotate(N, src, dst);
        double t = get_counter()/(N*N);
        time[try_index] = t;
        printf("%.4f, ", t);
        use_dst(N, dst);
    }
    print_data(TRIALS, time);
return 0;
}
