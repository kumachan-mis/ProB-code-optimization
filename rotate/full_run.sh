#!/bin/sh
for exp_index in `seq 1 5`
do
    sh exp1.${exp_index}/run.sh
    echo "exp1.${exp_index} finished"
done