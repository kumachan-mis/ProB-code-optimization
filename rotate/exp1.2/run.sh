#!/bin/sh
main_maker="main/maker.out"
result="exp1.2/result.csv"

if [ -e ${result} ]; then
    rm ${result}
fi
echo "最適化レベル, O0, O1, O2, O3" >> ${result}

gcc -O2 main/make_main_min.c -o ${main_maker}
${main_maker} 2048 int
rm ${main_maker}

sh exp1.2/single_run.sh naive ${result}

for rotate in unrolling block block_unrolling
do
    rotate_maker="${rotate}/maker.out"
    gcc -O2 ${rotate}/make_rotate.c -o ${rotate_maker}
    ${rotate_maker} 8
    rm ${rotate_maker}
    sh exp1.2/single_run.sh ${rotate} ${result}
done