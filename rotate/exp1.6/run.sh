#!/bin/sh
main_maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${main_maker}
block_maker="block/maker.out"
gcc -O2 block/make_rotate.c -o ${block_maker}
result="exp1.6/result.csv"
if [ -e ${result} ]; then
        rm ${result}
fi
echo "配列のサイズ n, naive, block" >> ${result}
for n in 63 64 65 127 128 129 255 256 257 511 512 513 1023 1024 1025 2047 2048 2049 4095 4096 4097
do
    printf "$n, " >> ${result}
    for rotate in naive block
    do
        sh exp1.6/single_run.sh ${rotate} ${result} $n int
    done
done

rm ${main_maker}
rm ${block_maker}