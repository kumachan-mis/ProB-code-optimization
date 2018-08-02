#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

printf "$1, " >> $2

for option in O0 O1 O2 O3
do
    gcc -Wall -${option} -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
    ${out} >> $2
    if [ ${option} -ne O3 ]; then
        printf ", " >> $2
    else
        echo "" >> $2
    fi
done
rm ${out}
