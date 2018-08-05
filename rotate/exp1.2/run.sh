#!/bin/sh
main_maker="main/maker.out"
result="exp1.2/result.csv"

if [ -e ${result} ]; then
    rm ${result}
fi
# 結果の出力ファイルがもうあれば一旦削除
echo "最適化レベル, O0, O1, O2, O3" >> ${result}
# CSVに項目名を書き出す

gcc -O2 main/make_main_min.c -o ${main_maker}
${main_maker} 2048 int
rm ${main_maker}
# 2次元配列のサイズn = 2048, int型としてメイン関数を生成する

sh exp1.2/single_run.sh naive ${result}
# 左回転関数を一つ固定して,  実験を実行する

for rotate in unrolling block block_unrolling
do
    rotate_maker="${rotate}/maker.out"
    gcc -O2 ${rotate}/make_rotate.c -o ${rotate_maker}
    ${rotate_maker} 8
    rm ${rotate_maker}
    # ブロックサイズ及びループアンローリングの回数を8として左回転関数を生成

    sh exp1.2/single_run.sh ${rotate} ${result}
    # 左回転関数を一つ固定して,  実験を実行する
done

# 実験1.2を実行する