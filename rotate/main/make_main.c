#include <stdio.h>
#include <stdlib.h>

void write_main(int N, FILE* main_c);
void  write_my_type(char* type, FILE* my_type_h);

int main(int argc, char *argv[]) {
    if(argc != 3) {
        perror("[Usage] Input size of array and type of array\n");
        return 1;
    }
    int N = atoi(argv[1]);
    FILE * main_c = fopen("main/main.c", "w");
    FILE * my_type_h = fopen("main/my_type.h", "w");
    write_main(N, main_c);
    write_my_type(argv[2], my_type_h);
    fclose(main_c);
    return 0;
}

void write_main(int N, FILE* main_c) {
    fprintf(main_c, "#include <stdio.h>\n");
    fprintf(main_c, "#include <stdlib.h>\n");
    fprintf(main_c, "#include \"clock.h\"\n");
    fprintf(main_c, "#include \"rotate.h\"\n");
    fprintf(main_c, "#include \"my_type.h\"\n");
    fprintf(main_c, "#define N %d\n", N);
    fprintf(main_c, "MY_TYPE src[N][N], dst[N][N];\n");
    fprintf(main_c, "int main(int argc, char *argv[]) {\n");
    fprintf(main_c, "    const int trials = 25;\n");
    fprintf(main_c, "    int try_index;\n");
    fprintf(main_c, "    init_src(N, src);\n");
    fprintf(main_c, "    for (try_index = 0; try_index < trials; try_index++) {\n");
    fprintf(main_c, "        start_counter();\n");
    fprintf(main_c, "        rotate(N, src, dst);\n");
    fprintf(main_c, "        double time = get_counter();\n");
    fprintf(main_c, "        printf(%s, time/(N*N));\n", "\"%.4f\\n\"");
    fprintf(main_c, "        use_dst(N, dst);\n");
    fprintf(main_c, "    }\n");
    fprintf(main_c, "return 0;\n");
    fprintf(main_c, "}\n");
}

void  write_my_type(char* type, FILE* my_type_h) {
    fprintf(my_type_h, "#ifndef MY_TYPE_H\n");
    fprintf(my_type_h, "#define MY_TYPE_H\n");
    fprintf(my_type_h, "#define MY_TYPE %s\n", type);
    fprintf(my_type_h, "#endif\n");
}