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
o3="$1/O3.out"
ofast="$1/Ofast.out"
compile="gcc -Wall -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o"

gcc -O2 main/make_main.c -o ${maker}
${maker} $2 $3

${compile} ${no_op}
${compile} ${og} -Og
${compile} ${o1} -O1
${compile} ${o2} -O2
${compile} ${o3} -O3
${compile} ${ofast} -Ofast

printf "${no_op}, "
${no_op}
printf "${og}, "
${og}
printf "${o1}, "
${o1}
printf "${o2}, "
${o2}
printf "${o3}, "
${o3}
printf "${ofast}, "
${ofast}


rm ${no_op}
rm ${og}
rm ${o1}
rm ${o2}
rm ${o3}
rm ${ofast}
