#!/bin/sh
main_maker="main/maker.out"
result="exp1.1/result.csv"
rotate="naive/rotate.c"
out="naive/a.out"

gcc -O2 main/make_main_all.c -o ${main_maker}
${main_maker} 2048 int
rm ${main_maker}

gcc -Wall -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out} -O2
${out} > ${result}
rm ${out}