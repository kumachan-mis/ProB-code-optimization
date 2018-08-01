#!/bin/sh
if [ $# -ne 2 ]; then
    echo "[Usage] Input size of array and type of array."
    exit 1
fi

sh run.sh slanting $1 $2