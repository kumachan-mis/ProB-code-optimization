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

void use_dst(int n, MY_TYPE dst[n][n])
{
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            dst[n-1-j][i] += 1;
        }
    }
}