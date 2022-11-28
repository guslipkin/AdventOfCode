#!/bin/bash

cd ~
cd /Users/guslipkin/Documents/GitHub/AdventOfCode/2022
DD=$(expr $(date +%d) + 1)
if [[ ${#DD} -lt 2 ]] ; then
    DD="00${DD}"
    DD="${DD: -2}"
fi
mkdir "$DD"
./aocdl -wait -force -output "$DD"/input.txt