#!/bin/sh
main_maker="main/maker.out"
result="exp1.1/result.csv"
rotate="naive/rotate.c"
out="naive/a.out"

gcc -O2 main/make_main_all.c -o ${main_maker}
${main_maker} 2048 int
rm ${main_maker}
# メイン関数を生成する

gcc -Wall -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out} -O2
${out} > ${result}
rm ${out}
# 全体をコンパイルして実行

# 実験1.1を実行する