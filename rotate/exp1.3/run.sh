#!/bin/sh
main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${main_maker}
naive_maker="naive/maker.out"
gcc -O2 block/make_rotate.c -o ${naive_maker}

for type in char int long double
do
    result="exp1.3/result_${type}.csv"
    if [ -e ${result} ]; then
        rm ${result}
    fi
    echo ", " >> ${result}
    for n in 64 128 256 512 1024 2048 4096
    do
    sh exp1.3/single_run.sh naive ${result} $n ${type}
    done
done

rm ${main_maker}
rm ${naive_maker}