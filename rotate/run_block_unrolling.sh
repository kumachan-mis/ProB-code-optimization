#!/bin/sh
if [ $# -ne 3 ]; then
    echo "[Usage] Input size of array, type of array, and size of block."
    exit 1
fi

if [ ! $1 -ge $3 ] || [ $(($1 % $3)) -ne 0 ]; then
    echo "[ERROR] Unexpected argument."
    exit 1
fi

maker="block_unrolling/maker.out"
gcc -O2 block_unrolling/make_rotate.c -o ${maker}
${maker} $3

sh run.sh block_unrolling $1 $2