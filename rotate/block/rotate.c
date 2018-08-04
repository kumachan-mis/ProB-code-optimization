#define B 8
#include "my_type.h"
static int s = 0;
int min_int(int a, int b) {
    return a < b? a : b;
}
void rotate(int n, MY_TYPE src[n][n], MY_TYPE dst[n][n]) {
    int i, j, i_b, j_b;
    for(i = 0; i < n; i+=B) 
        for(j = 0; j < n; j+=B) {
            int i_e = min_int(i+B, n);
            int j_e = min_int(j+B, n);
            for(i_b = i; i_b < i_e; i_b++)
                for(j_b = j; j_b < j_e; j_b++)
                    dst[n-1-j_b][i_b] = src[i_b][j_b];
        }
    s++;
}
