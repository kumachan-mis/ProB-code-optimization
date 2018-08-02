#define B 8
#include "my_type.h"
static int s = 0;
void rotate(int n, MY_TYPE src[n][n], MY_TYPE dst[n][n]) {
    int i, j;
    for(i = 0; i < n; i+=B) 
        for(j = 0; j < n; j+=B) {
            dst[n-1-j][i] = src[i][j];
            dst[n-1-j-1][i] = src[i][j+1];
            dst[n-1-j-2][i] = src[i][j+2];
            dst[n-1-j-3][i] = src[i][j+3];
            dst[n-1-j-4][i] = src[i][j+4];
            dst[n-1-j-5][i] = src[i][j+5];
            dst[n-1-j-6][i] = src[i][j+6];
            dst[n-1-j-7][i] = src[i][j+7];
            dst[n-1-j][i+1] = src[i+1][j];
            dst[n-1-j-1][i+1] = src[i+1][j+1];
            dst[n-1-j-2][i+1] = src[i+1][j+2];
            dst[n-1-j-3][i+1] = src[i+1][j+3];
            dst[n-1-j-4][i+1] = src[i+1][j+4];
            dst[n-1-j-5][i+1] = src[i+1][j+5];
            dst[n-1-j-6][i+1] = src[i+1][j+6];
            dst[n-1-j-7][i+1] = src[i+1][j+7];
            dst[n-1-j][i+2] = src[i+2][j];
            dst[n-1-j-1][i+2] = src[i+2][j+1];
            dst[n-1-j-2][i+2] = src[i+2][j+2];
            dst[n-1-j-3][i+2] = src[i+2][j+3];
            dst[n-1-j-4][i+2] = src[i+2][j+4];
            dst[n-1-j-5][i+2] = src[i+2][j+5];
            dst[n-1-j-6][i+2] = src[i+2][j+6];
            dst[n-1-j-7][i+2] = src[i+2][j+7];
            dst[n-1-j][i+3] = src[i+3][j];
            dst[n-1-j-1][i+3] = src[i+3][j+1];
            dst[n-1-j-2][i+3] = src[i+3][j+2];
            dst[n-1-j-3][i+3] = src[i+3][j+3];
            dst[n-1-j-4][i+3] = src[i+3][j+4];
            dst[n-1-j-5][i+3] = src[i+3][j+5];
            dst[n-1-j-6][i+3] = src[i+3][j+6];
            dst[n-1-j-7][i+3] = src[i+3][j+7];
            dst[n-1-j][i+4] = src[i+4][j];
            dst[n-1-j-1][i+4] = src[i+4][j+1];
            dst[n-1-j-2][i+4] = src[i+4][j+2];
            dst[n-1-j-3][i+4] = src[i+4][j+3];
            dst[n-1-j-4][i+4] = src[i+4][j+4];
            dst[n-1-j-5][i+4] = src[i+4][j+5];
            dst[n-1-j-6][i+4] = src[i+4][j+6];
            dst[n-1-j-7][i+4] = src[i+4][j+7];
            dst[n-1-j][i+5] = src[i+5][j];
            dst[n-1-j-1][i+5] = src[i+5][j+1];
            dst[n-1-j-2][i+5] = src[i+5][j+2];
            dst[n-1-j-3][i+5] = src[i+5][j+3];
            dst[n-1-j-4][i+5] = src[i+5][j+4];
            dst[n-1-j-5][i+5] = src[i+5][j+5];
            dst[n-1-j-6][i+5] = src[i+5][j+6];
            dst[n-1-j-7][i+5] = src[i+5][j+7];
            dst[n-1-j][i+6] = src[i+6][j];
            dst[n-1-j-1][i+6] = src[i+6][j+1];
            dst[n-1-j-2][i+6] = src[i+6][j+2];
            dst[n-1-j-3][i+6] = src[i+6][j+3];
            dst[n-1-j-4][i+6] = src[i+6][j+4];
            dst[n-1-j-5][i+6] = src[i+6][j+5];
            dst[n-1-j-6][i+6] = src[i+6][j+6];
            dst[n-1-j-7][i+6] = src[i+6][j+7];
            dst[n-1-j][i+7] = src[i+7][j];
            dst[n-1-j-1][i+7] = src[i+7][j+1];
            dst[n-1-j-2][i+7] = src[i+7][j+2];
            dst[n-1-j-3][i+7] = src[i+7][j+3];
            dst[n-1-j-4][i+7] = src[i+7][j+4];
            dst[n-1-j-5][i+7] = src[i+7][j+5];
            dst[n-1-j-6][i+7] = src[i+7][j+6];
            dst[n-1-j-7][i+7] = src[i+7][j+7];
        }
    s++;
}
