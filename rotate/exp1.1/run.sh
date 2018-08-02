#!/bin/sh
rotate="naive/rotate.c"
if [ ! -r ${rotate} ]; then
    echo "${rotate}: [ERROR] Cannot find."
    exit 1
fi

maker="main/maker.out"
gcc -O2 main/make_main_all.c -o ${maker}
${maker} 2048 int
rm ${maker}

out="naive/a.out"
gcc -Wall -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out} -O2
${out} > "exp1.1/result.csv"
rm ${out}