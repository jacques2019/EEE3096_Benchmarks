#!/bin/bash

declare -a times
declare -a temps

echo "Running C 16 bit Threaded Benchmark"

for ((i=0;i<200;i++)) do
	time=( $(make -C C run_threaded) )
	times[$i]=${time[23]}
	temp=$(vcgencmd measure_temp)
	temps[$i]=${temp:5:4}

	echo $i ${temps[$i]}

done

printf "%s\n" "{$times[@]}" > data/C16BitThreadedTimes.txt
printf "%s\n" "{$temps[@]}" > data/C16BitThreadedTemps.txt

echo "done"
