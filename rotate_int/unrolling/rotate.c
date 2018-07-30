#define U 6
int s = 0;
void rotate(int n, int src[n][n], int dst[n][n]) {
    int i, j;
    for(i = 0; i < n; i++) 
        for(j = 0; j < n; j+=U) {
            dst[n-1-j][i] = src[i][j];
            dst[n-1-j+1][i] = src[i][j+1];
            dst[n-1-j+2][i] = src[i][j+2];
            dst[n-1-j+3][i] = src[i][j+3];
            dst[n-1-j+4][i] = src[i][j+4];
            dst[n-1-j+5][i] = src[i][j+5];
        }
        for(;j < n; j++) dst[n-1-j][i] = src[i][j];
    s++;
}
