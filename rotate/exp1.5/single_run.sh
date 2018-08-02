#!/bin/sh
rotate="$1/rotate.c"
if [ ! -r ${rotate} ]; then
    echo "${rotate}: [ERROR] Cannot find."
    exit 1
fi

main/maker.out $3 $4
printf "$1 $4, " >> $2

for un in 2 4 8 16 32 64
do
    $1/maker.out ${bn}
    gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o $1/a.out
    $1/a.out >> $2
    if [ ${un} -ne 64 ]; then
        printf ", " >> $2
    else
        echo "" >> $2
    fi
done