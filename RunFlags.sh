#!/bin/bash

param=(O1 O2 O3 Ofast Os Og funroll-loops)

echo "starting"

for ((i=0;i<7;i++)) do
    echo ${param[$i]}

    $(make -C C ${param[$i]})
    $(./RunCBase.sh)
    $(cp data/CBaseTemps.txt data/CBaseTemps_${param[$i]})
    $(cp data/CBaseTemps.txt data/CBaseTemps_${param[$i]})
done

echo "done"