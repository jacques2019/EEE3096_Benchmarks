#!/bin/bash

declare -a times
declare -a temps

echo "Running C Base Benchmarks"

for ((i=0;i<200;i++)) do
	time=( $(make -C C run) )
	times[$i]=${time[21]}
	temp=$(vcgencmd measure_temp)
	temps[$i]=${temp:5:4}

	echo $i ${temps[$i]}
done

printf "%s\n" "${times[@]}" > data/CBaseTimes.txt
printf "%s\n" "${temps[@]}" > data/CBaseTemps.txt

echo "done"
