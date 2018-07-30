#!/bin/sh
if [ $# -ne 3 ]; then
    echo "[Usage] Input directory name, size of array and type of array."
    exit 1
fi
rotate="$1/rotate.c"
if [ ! -r ${rotate} ]; then
    echo "${rotate}: [ERROR] Cannot find."
    exit 1
fi

maker="main/maker.out"
no_op="$1/no_op.out"
og="$1/Og.out"
o1="$1/O1.out"
o2="$1/O2.out"
compile="gcc -Wall -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o"

gcc -O2 main/make_main.c -o ${maker}
${maker} $2 $3

${compile} ${no_op}
${compile} ${og} -Og
${compile} ${o1} -O1
${compile} ${o2} -O2

echo "run: ${no_op}"
${no_op}
echo "run: ${og}"
${og}
echo "run: ${o1}"
${o1}
echo "run: ${o2}"
${o2}