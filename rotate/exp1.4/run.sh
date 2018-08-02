#!/bin/sh
if [ $# -ne 1 ]; then
    echo "[ERROR] input size of array"
    exit 1
fi

result="exp1.4/result_$1.csv"
if [ -e ${result} ]; then
    rm ${result}
fi

main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${maker}
block_maker="block/maker.out"
gcc -O2 block/make_rotate.c -o ${block_maker}
block_unrolling_maker="block_unrolling/maker.out"
gcc -O2 block_unrolling/make_rotate.c -o ${block_unrolling_maker}

echo "ブロックサイズ, 2, 4, 8, 16, 32, 64" >> ${result}
for type in char int long double
do
    sh exp1.4/single_run.sh block ${result} $1 ${type}
    sh exp1.4/single_run.sh block_unrolling ${result} $1 ${type} ${bn}
done

rm ${main_maker}
rm ${block_maker}
rm ${block_unrolling_maker}