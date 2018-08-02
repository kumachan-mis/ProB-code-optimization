#!/bin/sh
rotate="$1/rotate.c"
if [ ! -r ${rotate} ]; then
    echo "${rotate}: [ERROR] Cannot find."
    exit 1
fi

printf "$1, " >> $2
for n in  64 128 256 512 1024 2048 4096
do
    main/maker.out $n int
    gcc -Wall -O2 -fno-inline -Imain/ main/main.c main/rotate_helper.c ${rotate} main/clock64.o -o $1/a.out
    $1/a.out >> $2
    if [ $n -ne 4096 ]; then
        printf ", " >> $2
    else
        echo "" >> $2
    fi
done
rm $1/a.out
