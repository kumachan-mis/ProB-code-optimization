#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

main/maker.out $3 $4

if [ $1 = block ]; then 
    if [ $3 -lt 255 ]; then
        bn=32
    else
        bn=8
    fi
    echo ${bn}
    $1/maker.out ${bn}
fi

gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
${out} >> $2
if [ $1 = block ]; then
    echo "" >> $2
else
    printf ", " >> $2
fi
rm ${out}
