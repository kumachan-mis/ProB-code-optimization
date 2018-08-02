#!/bin/sh
result="exp1.2/result.csv"
if [ -e ${result} ]; then
    rm ${result}
fi

echo "最適化レベル, O0, O1, O2, O3" >> ${result}

maker="main/maker.out"
gcc -O2 main/make_main_min.c -o ${maker}
${maker} 2048 int
rm ${maker}

sh exp1.2/single_run.sh naive ${result}

maker="unrolling/maker.out"
gcc -O2 unrolling/make_rotate.c -o ${maker}
${maker} 8
rm ${maker}
sh exp1.2/single_run.sh unrolling ${result}

maker="block/maker.out"
gcc -O2 block/make_rotate.c -o ${maker}
${maker} 8
rm ${maker}
sh exp1.2/single_run.sh block ${result}

maker="block_unrolling/maker.out"
gcc -O2 block_unrolling/make_rotate.c -o ${maker}
${maker} 8
rm ${maker}
sh exp1.2/single_run.sh block_unrolling ${result}