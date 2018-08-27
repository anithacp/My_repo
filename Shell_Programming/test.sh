#!/bin/sh

for i in $(seq 0 3);
do
	#VLANID=$(printf "01 f%.1d" $((i+4)))
	VLANID=$(printf "01 1%.1x" $((i+8)))
	echo $VLANID
done

myVLAN=280
bitmask1=65280
bitmask2=255
VLAN0=$(printf "%x" $myVLAN)
#echo $VLAN0

#echo $((255 & 280))
#echo $(($myVLAN & $bitmask2))


VLAN2=$(printf "%d" $(($myVLAN & $bitmask2)))
VLAN1=$(printf "%d" $(($myVLAN & $bitmask1)))
#echo $VLAN1
VLAN3=$(printf "%d" $(($VLAN1 >> 8)))
echo $VLAN3 $VLAN2
FINAL=$(printf "%.2x %.2x" $VLAN3 $VLAN2)
echo $FINAL


echo "..................................................................................................." \
"==================================="
