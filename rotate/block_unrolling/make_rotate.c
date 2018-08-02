#include <stdio.h>
#include <stdlib.h>

void write_main(int N, FILE* rotate_c);

int main(int argc, char *argv[]) {
    if(argc != 2) {
        perror("[Usage] Input block size\n");
        return 1;
    }
    int B = atoi(argv[1]);
    FILE * rotate_c = fopen("block_unrolling/rotate.c", "w");
    write_main(B, rotate_c);
    fclose(rotate_c);
    return 0;
}

void write_main(int B, FILE* rotate_c) {
    fprintf(rotate_c, "#define B %d\n", B);
    fprintf(rotate_c, "#include \"my_type.h\"\n");
    fprintf(rotate_c, "static int s = 0;\n");
    fprintf(rotate_c, "void rotate(int n, MY_TYPE src[n][n], MY_TYPE dst[n][n]) {\n");
    fprintf(rotate_c, "    int i, j;\n");
    fprintf(rotate_c, "    for(i = 0; i < n; i+=B) \n");
    fprintf(rotate_c, "        for(j = 0; j < n; j+=B) {\n");
    int i_b, j_b;
    for(i_b = 0; i_b < B; i_b++) {
        for(j_b = 0; j_b < B; j_b++) {
            if(!i_b && !j_b) {
    fprintf(rotate_c, "            dst[n-1-j][i] = src[i][j];\n");
            }else if(!i_b) {
    fprintf(rotate_c, "            dst[n-1-j-%d][i] = src[i][j+%d];\n", j_b, j_b);
            }else if(!j_b) {
    fprintf(rotate_c, "            dst[n-1-j][i+%d] = src[i+%d][j];\n", i_b, i_b);
            }else {
    fprintf(rotate_c, "            dst[n-1-j-%d][i+%d] = src[i+%d][j+%d];\n", j_b, i_b, i_b, j_b);
            }
        }
    }
    fprintf(rotate_c, "        }\n");
    fprintf(rotate_c, "    s++;\n");
    fprintf(rotate_c, "}\n");
}
