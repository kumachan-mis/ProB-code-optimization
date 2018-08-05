#!/bin/sh
main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${main_maker}
unrolling_maker="unrolling/maker.out"
gcc -O2 unrolling/make_rotate.c -o ${unrolling_maker}
# メイン関数及び左回転関数を生成する実行可能バイナリを生成

for type in char int long double
do
    result="exp1.5/result_${type}.csv"
    if [ -e ${result} ]; then
        rm ${result}
    fi
    # 結果の出力ファイルがもうあれば一旦削除
    echo "アンローリング回数, 2, 4, 8, 16, 32, 64" >> ${result}
    # CSVに項目名を書き出す.
    for n in 64 128 256 512 1024 2048 4096
    do
        sh exp1.5/single_run.sh unrolling ${result} $n ${type}
        # 2次元配列のサイズnと型を一つ固定して,  実験を実行する.
    done
done

rm ${main_maker}
rm ${unrolling_maker}

# 実験1.5を実行する