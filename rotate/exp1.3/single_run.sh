#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

main/maker.out $3 $4
printf "$1 $3, " >> $2
# CSVに項目名を書き出す

gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
${out} >> $2
# 全体をコンパイルして実行
echo "" >> $2
# 改行

rm ${out}
# 2次元配列のサイズnと型が1つ固定されたとして, 全体をコンパイルして実行する.