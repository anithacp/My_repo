#!/bin/sh
for i in $(seq 1 254);
do
	for j in $(seq 1 254);
		 do ping -c 1 -W 1 192.168.$i.$j | grep 'bytes from'
	done
done

