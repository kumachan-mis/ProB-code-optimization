#!/bin/sh
if [ $# -ne 1 ]; then
    echo "[ERROR] input size of array"
    exit 1
fi

result="exp1.5/result_$1.csv"
if [ -e ${result} ]; then
    rm ${result}
fi

main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${maker}
unrolling_maker="unrolling/maker.out"
gcc -O2 block_unrolling/make_rotate.c -o ${unrolling_maker}

echo "アンローリング回数, 2, 4, 8, 16, 32, 64" >> ${result}
for type in char int long double
do
    sh exp1.5/single_run.sh unrolling ${result} $1 ${type} ${bn}
done

rm ${main_maker}
rm ${unrolling_maker}