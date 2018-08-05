#!/bin/sh
main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${main_maker}
# メイン関数を生成する実行可能バイナリを生成

for type in char int long double
do
    result="exp1.3/result_${type}.csv"
    if [ -e ${result} ]; then
        rm ${result}
    fi
    # 結果の出力ファイルがもうあれば一旦削除
    echo ", " >> ${result}
    for n in 64 128 256 512 1024 2048 4096
    do
    sh exp1.3/single_run.sh naive ${result} $n ${type}
    # 2次元配列のサイズnと型を一つ固定して,  実験を実行する
    done
done

rm ${main_maker}

# 実験1.3を実行する