#!/bin/sh
if [ $# -ne 2 ]; then
    echo "[Usage] Input size of array and type of array."
    exit 1
fi

sh run.sh naive $1 $2