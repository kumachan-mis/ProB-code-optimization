#include <stdio.h>
#include <stdlib.h>
#include "clock.h"
#include "rotate.h"
#include "my_type.h"
#define N 2048
MY_TYPE src[N][N], dst[N][N];
int main(int argc, char *argv[]) {
    const int trials = 25;
    int try_index;
    init_src(N, src);
    for (try_index = 0; try_index < trials; try_index++) {
        start_counter();
        rotate(N, src, dst);
        double time = get_counter();
        if(try_index < trials - 1) printf("%.4f, ", time/(N*N));
        else                       printf("%.4f\n", time/(N*N));
        use_dst(N, dst);
    }
return 0;
}
