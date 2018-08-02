#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

printf "$1, " >> $2

for option in `seq 0 3`
do
    gcc -Wall -O${option} -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
    ${out} >> $2
    if [ ${option} -ne 3 ]; then
        printf ", " >> $2
    else
        echo "" >> $2
    fi
done
rm ${out}
