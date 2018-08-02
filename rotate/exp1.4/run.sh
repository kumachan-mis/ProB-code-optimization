#!/bin/sh
main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${main_maker}
block_maker="block/maker.out"
gcc -O2 block/make_rotate.c -o ${block_maker}
block_unrolling_maker="block_unrolling/maker.out"
gcc -O2 block_unrolling/make_rotate.c -o ${block_unrolling_maker}

for type in char int long double
do
    result="exp1.4/result_${type}.csv"
    if [ -e ${result} ]; then
        rm ${result}
    fi
    echo "ブロックサイズ, 2, 4, 8, 16, 32, 64" >> ${result}
    for n in 64 128 256 512 1024 2048 4096
    do
        sh exp1.4/single_run.sh block           ${result} $n ${type}
        sh exp1.4/single_run.sh block_unrolling ${result} $n ${type}
    done
done

rm ${main_maker}
rm ${block_maker}
rm ${block_unrolling_maker}