#!/bin/sh
if [ $# -ne 1 ]; then
    echo "[Usage] Input size of array."
    exit 1
fi

sh run.sh slanting $1