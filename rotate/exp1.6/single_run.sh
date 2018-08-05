#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

main/maker.out $3 $4
# メイン関数を生成する

if [ $1 = block ]; then 
    if [ $3 -lt 255 ]; then
        bn=32
    else
        bn=8
    fi
    echo ${bn}
    $1/maker.out ${bn}
fi
# blockについて左回転関数を生成する

gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
${out} >> $2
# 全体をコンパイルして実行

if [ $1 = block ]; then
    echo "" >> $2
else
    printf ", " >> $2
fi
# CSVで途中の区切りはコンマ, 最後は改行するように.
rm ${out}

# 左回転関数と2次元配列のサイズを一つ固定されたとして, 全体をコンパイルして実行する.