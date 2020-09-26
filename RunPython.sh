#!/bin/bash

declare -a times
declare -a temps

echo "Running Python Benchmarks"

for ((i=0;i<200;i++)) do
	time=( $(Python/PythonHeterodyning.py) )
	times[$i]=${time[23]:6}
	temp=$(vcgencmd measure_temp)
	temps[$i]=${temp:5:4}

	echo $i ${temps[$i]}
done

printf "%s\n" "${times[@]}" > data/PythonTimes.txt
printf "%s\n" "${temps[@]}" > data/PythonTemps.txt

echo "done"
