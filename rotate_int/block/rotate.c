#define B 16
int s = 0;
void rotate(int n, int src[n][n], int dst[n][n]) {
    int i, j, i_b, j_b;
    for(i = 0; i < n; i+=B) 
        for(j = 0; j < n; j+=B) {
            int i_e = i+B;
            int j_e = j+B;
            for(i_b = i; i_b < i_e; i_b++)
                for(j_b = j; j_b < j_e; j_b++)
                    dst[n-1-j_b][i_b] = src[i_b][j_b];
        }
    s++;
}
