#!/bin/sh
num_ports=1

for i in $(seq 0 $(($num_ports - 1)) ); do
	printf "$i"
done
