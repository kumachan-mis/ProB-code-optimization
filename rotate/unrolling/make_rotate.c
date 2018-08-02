#include <stdio.h>
#include <stdlib.h>

void write_main(int N, FILE* rotate_c);

int main(int argc, char *argv[]) {
    if(argc != 2) {
        perror("[Usage] Input num of unrolling.\n");
        return 1;
    }
    int U = atoi(argv[1]);
    FILE * rotate_c = fopen("unrolling/rotate.c", "w");
    write_main(U, rotate_c);
    fclose(rotate_c);
    return 0;
}

void write_main(int U, FILE* rotate_c) {
    fprintf(rotate_c, "#define U %d\n", U);
    fprintf(rotate_c, "#include \"my_type.h\"\n");
    fprintf(rotate_c, "static int s = 0;\n");
    fprintf(rotate_c, "void rotate(int n, MY_TYPE src[n][n], MY_TYPE dst[n][n]) {\n");
    fprintf(rotate_c, "    int i, j;\n");
    fprintf(rotate_c, "    for(i = 0; i < n; i++) \n");
    fprintf(rotate_c, "        for(j = 0; j < n; j+=U) {\n");
    fprintf(rotate_c, "            dst[n-1-j][i] = src[i][j];\n");
    int unrolling;
    for(unrolling = 1; unrolling < U; unrolling++)
    fprintf(rotate_c, "            dst[n-1-j-%d][i] = src[i][j+%d];\n", unrolling, unrolling);

    fprintf(rotate_c, "        }\n");
    fprintf(rotate_c, "        for(;j < n; j++) dst[n-1-j][i] = src[i][j];\n");
    fprintf(rotate_c, "    s++;\n");
    fprintf(rotate_c, "}\n");
}
