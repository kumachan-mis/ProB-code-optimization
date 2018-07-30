int s = 0;
void rotate(int n, int src[n][n], int dst[n][n]) {
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            dst[n-1-j][i] = src[i][j];
        }
    }
    s++;
}