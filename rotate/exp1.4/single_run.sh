#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

main/maker.out $3 $4
# メイン関数を生成する
printf "$1 $3, " >> $2
# CSVに項目名を書き出す

for bn in 2 4 8 16 32 64
do
    $1/maker.out ${bn}
    # 左回転関数を生成する
    gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
    ${out} >> $2
    if [ ${bn} -ne 64 ]; then
        printf ", " >> $2
    else
        echo "" >> $2
    fi
    # CSVで途中の区切りはコンマ, 最後は改行するように.
done
# 各ブロックサイズについて, 全体をコンパイルして実行する.
rm ${out}

# 2次元配列のサイズnと型が1つ固定されたとして, 全体をコンパイルして実行する.
