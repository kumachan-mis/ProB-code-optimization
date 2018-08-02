#!/bin/sh
rotate="$1/rotate.c"
out="$1/a.out"

main/maker.out $3 $4
printf "$1 $3, " >> $2

gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o ${out}
${out} >> $2
echo "" >> $2

rm ${out}
