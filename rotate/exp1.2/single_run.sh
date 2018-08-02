#!/bin/sh
rotate="$1/rotate.c"
if [ ! -r ${rotate} ]; then
    echo "${rotate}: [ERROR] Cannot find."
    exit 1
fi

printf "$1, " >> $2
for option in O0 O1 O2 O3
do
    gcc -Wall -${option} -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o $1/a.out
    $1/a.out >> $2
    if [ $n -ne O3 ]; then
        printf ", " >> $2
    else
        echo "" >> $2
    fi
done
rm $1/a.out
