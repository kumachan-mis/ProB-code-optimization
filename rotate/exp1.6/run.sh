#!/bin/sh
main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${main_maker}
block_maker="block/maker.out"
gcc -O2 block/make_rotate.c -o ${block_maker}
# メイン関数及び左回転関数を生成する実行可能バイナリを生成

result="exp1.6/result.csv"
if [ -e ${result} ]; then
        rm ${result}
fi
# 結果の出力ファイルがもうあれば一旦削除

echo "配列のサイズ n, naive, block" >> ${result}
# CSVに項目名を書き出す.
for n in 63 64 65 127 128 129 255 256 257 511 512 513 1023 1024 1025 2047 2048 2049 4095 4096 4097
do
    printf "$n, " >> ${result}
    for rotate in naive block
    do
        sh exp1.6/single_run.sh ${rotate} ${result} $n int
    done
    # 左回転関数と2次元配列のサイズを一つ固定して, 実験を実行する.
done

rm ${main_maker}
rm ${block_maker}

# 実験1.5を実行する