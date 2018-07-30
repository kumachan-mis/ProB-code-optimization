int s = 0;
void rotate(int n, int src[n][n], int dst[n][n]) {
    int loop;
    const int loop_max = n-1;
    int i, j;
    for(loop = 0; loop <= loop_max; ++loop) {
        for(i = 0; i <= loop; ++i) {
            j = loop - i;
            dst[loop_max-j][i] = src[i][j];
        }
    }
    const int loop_max2 = 2*loop_max;
    for(loop = loop_max+1; loop <= loop_max2; ++loop) {
        int j_end = loop - loop_max;
        for(j = loop_max; j >= j_end; --j) {
            i = loop - j;
            dst[loop_max-j][i] = src[i][j];
        }
    }
    s++;
}
