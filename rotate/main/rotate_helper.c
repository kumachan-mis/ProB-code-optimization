#include <stdio.h>
#include "my_type.h"
void init_src(int n, MY_TYPE src[n][n])
{
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            src[i][j] = n*n - (n*i+j);
        }
    }
}
// srcの初期化

void use_dst(int n, MY_TYPE dst[n][n])
{
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            dst[n-1-j][i] += 1;
        }
    }
}
// dstの使用

void print_min(int trials, double time[trials]) {
    double min = time[0];
    int try_index;
    for(try_index = 1; try_index < trials; try_index++) {
        double t = time[try_index];
        if(min > t) min = t;
    }
    printf("%.4f", min);
}

// CPEの最小値を改行なしで出力. CSVへの成形はシェルスクリプトに任せる.