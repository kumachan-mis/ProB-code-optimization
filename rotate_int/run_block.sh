#!/bin/sh
if [ $# -ne 2 ]; then
    echo "[Usage] Input size of array and size of block."
    exit 1
fi

if [ ! $1 -ge $2 ] || [ $(($1 % $2)) -ne 0 ]; then
    echo "[ERROR] Unexpected argument."
    exit 1
fi

maker="block/maker.out"
gcc -O2 block/make_rotate.c -o ${maker}
${maker} $2

sh run.sh block $1