#define U 16
#include "my_type.h"
int s = 0;
void rotate(int n, MY_TYPE src[n][n], MY_TYPE dst[n][n]) {
    int i, j;
    for(i = 0; i < n; i++) 
        for(j = 0; j < n; j+=U) {
            dst[n-1-j][i] = src[i][j];
            dst[n-1-j+1][i] = src[i][j+1];
            dst[n-1-j+2][i] = src[i][j+2];
            dst[n-1-j+3][i] = src[i][j+3];
            dst[n-1-j+4][i] = src[i][j+4];
            dst[n-1-j+5][i] = src[i][j+5];
            dst[n-1-j+6][i] = src[i][j+6];
            dst[n-1-j+7][i] = src[i][j+7];
            dst[n-1-j+8][i] = src[i][j+8];
            dst[n-1-j+9][i] = src[i][j+9];
            dst[n-1-j+10][i] = src[i][j+10];
            dst[n-1-j+11][i] = src[i][j+11];
            dst[n-1-j+12][i] = src[i][j+12];
            dst[n-1-j+13][i] = src[i][j+13];
            dst[n-1-j+14][i] = src[i][j+14];
            dst[n-1-j+15][i] = src[i][j+15];
        }
        for(;j < n; j++) dst[n-1-j][i] = src[i][j];
    s++;
}
