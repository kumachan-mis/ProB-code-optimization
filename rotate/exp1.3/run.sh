#!/bin/sh
main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${main_maker}
naive_maker="naive/maker.out"
gcc -O2 block/make_rotate.c -o ${block_maker}

for type in char int long double
do
    result="exp1.3/result_${type}.csv"
    if [ -e ${result} ]; then
        rm ${result}
    fi
    echo ", " >> ${result}
    for n in 63 64 65 127 128 129 255 256 257 511 512 513 1023 1024 1025 2047 2048 2049 4095 4096 4097
    do
    sh exp1.3/single_run.sh naive ${result} $n ${type}
    done
done

rm ${main_maker}
rm ${naive_maker}