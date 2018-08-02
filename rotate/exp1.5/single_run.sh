#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

main/maker.out $3 $4
printf "$1 $3, " >> $2

for un in 2 4 8 16 32 64
do
    $1/maker.out ${un}
    gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
    ${out} >> $2
    if [ ${un} -ne 64 ]; then
        printf ", " >> $2
    else
        echo "" >> $2
    fi
done
rm ${out}
