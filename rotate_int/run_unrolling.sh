#!/bin/sh
if [ $# -ne 2 ]; then
    echo "[Usage] Input size of array and num of unrolling."
    exit 1
fi

maker="unrolling/maker.out"
gcc -O2 unrolling/make_rotate.c -o ${maker}
${maker} $2

sh run.sh unrolling $1