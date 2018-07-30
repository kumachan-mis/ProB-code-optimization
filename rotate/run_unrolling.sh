#!/bin/sh
if [ $# -ne 3 ]; then
    echo "[Usage] Input size of array, type of array and num of unrolling."
    exit 1
fi

maker="unrolling/maker.out"
gcc -O2 unrolling/make_rotate.c -o ${maker}
${maker} $3

sh run.sh unrolling $1 $2