#!/bin/sh

cmd='/opt/lantiq/bin/omci_pipe.sh rmr'
index=0
slp=0

#===========299: MD ME===========
#          |txid |msgtype|Dev.ID| Ent.cls|Ent.Ins|MDlvl|MDnameFmt|MDName1|MDName2|MHFCr| SendIDp|
#Create 299@0 NBNMD, MDLevel=6, Inst ID=00,  MDnameFmt=32 (ICC, no MD name needed)
#$omci rmr 11 23   44     0a      01 2b   00 00     06      20                      01      01
#sleep 1
#Create 299@1  ASMD, MDLevel=7, Inst ID=01,  MDnameFmt=32.
#$omci rmr 11 24   44     0a      01 2b   00 01     07      20                        01      01

MsgTypeCreate=44
MsgTypeSet=48

exec_cmd()
{
 "$@"
}


#Create two 299 @0 & @1, with above properties.

echo "======= 299 : MD ME  ========"
#Test parameter for MDName format & Name 1 & 2
MDNameFmt=03
#4-string type
#No MD name present:01
#DNS-like name : 02
#MAC addr and UINT : 03
#ICC-based: 32

case "$MDNameFmt" in
	04)
		MDName1='4e 42 4e 4d 44 41 42 43 44 45 46 47 48 49 00' #NBNMDABCDEFGHI
		MDName2='41 53 4d 44 41 42 43 44 45 46 47 48 49 00' #ASMDABCDEFGHI
		;;
	02)
		MDName1='77 77 77 2e 67 6f 6f 67 6c 65 2e 63 6f 6d 00'	#www.google.com
		MDName2='77 77 77 2e 79 61 68 6f 6f 2e 63 6f 6d 00'	#www.yahoo.com
		;;

	03)
		#Use sample MAC
		MDName1='aa bb cc dd ee ff 11 11 00'
		MDName2='11 22 33 44 55 66 22 22 00'
		;;
	32)
		MDName1='4e 42 4e 4d 44 41 42 43 44 45 46 47 48 49 00' #NBNMDABCDEFGHI
		MDName2='41 53 4d 44 41 42 43 44 45 46 47 48 49 00' #ASMDABCDEFGHI
		;;

	*)
		echo "Error in MDNameFmt"
		exit 1

esac

#299@0 This is the NBN MD.
echo "CREATE: (299@1)"
ClassID=299
EntIns=01
v=$(printf "$cmd 10 %.2d %.2d 0a 01 2b 00 %.2d 06 %.2d 01 01\n" $index $MsgTypeCreate $EntIns $MDNameFmt)
exec_cmd $v
sleep $slp

#299@1 This is the ASMD.
echo "CREATE: (299@2)"
index=$((index+1))
EntIns=$((EntIns+1))
v=$(printf "$cmd 10 %.2d %.2d 0a 01 2b 00 %.2d 07 %.2d 01 01\n" $index $MsgTypeCreate $EntIns $MDNameFmt)
exec_cmd $v
sleep $slp

#SET MD Names 1,2 (Setup the Name1 to be more than 13bytes)
if [ $MDNameFmt -ne 1 ]; then
	echo "SET: (299@1) : MD Name1 & 2"
	index=$((index+1))
	ClassID=299
	MsgType=48
	EntIns=01
	v=$(printf "$cmd 10 %.2d %.2d 0a 01 2b 00 %.2d 20 00 $MDName1\n" $index $MsgTypeSet $EntIns)
	exec_cmd $v
	sleep $slp
	index=$((index+1))
	v=$(printf "$cmd 10 %.2d %.2d 0a 01 2b 00 %.2d 10 00 $MDName2\n" $index $MsgTypeSet $EntIns)
	exec_cmd $v
	sleep $slp

	index=$((index+1))
	EntIns=$((EntIns+1))
	v=$(printf "$cmd 10 %.2d %.2d 0a 01 2b 00 %.2d 20 00 $MDName1\n" $index $MsgTypeSet $EntIns)
	exec_cmd $v
	sleep $slp
	index=$((index+1))
	v=$(printf "$cmd 10 %.2d %.2d 0a 01 2b 00 %.2d 10 00 $MDName2\n" $index $MsgTypeSet $EntIns)
	exec_cmd $v
	sleep $slp
fi
echo "======= 299 : MD ME END ========"

echo "======= 300[1..4] : NBNMA ME ========"

#CREATE 300@0..3 set 4 NBNMAs, MDPtr=00 00 (NBNMD), MAnameformat=2(string), MHF creation is OFF.
#As these points to NBNMD, we shouldn't create MHFs

# 1 - Primary VID(2B), 2- Character string(str len Name1+2), 3 - 2 octet unsigned integer(2B), 4-VPN ID(7B)
MAFormat=02

for i in $(seq 1 4);
do
	echo "CREATE: (300@$i) : MA"
	index=$((index+1))
	ClassID=300
	EntIns=$i
	MDPtr=01
	v=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 00 %.2d $MAFormat 00 01 01\n" $index $MsgTypeCreate $EntIns $MDPtr )
	exec_cmd $v
	sleep $slp

	#MAName/MAFormat
	echo "SET: (300@$i) : MAName1 & 2"
	case "$MAFormat" in
		01)
			MAName1=$(printf "01 1%.1x" $((i+7)))
			;;
		02)
			MAName1=$(printf "4e 42 4e 4d 41 %.2d 00" $((30+i))) #NBNMAx
			MAName2='4e 42 4e 4d 41 4e 41 4d 45 32' #NBNMANAME2
			;;

		03)
			MAName1='01 01'
			MAName1='02 02'
			;;
		04)
			MAName1=$(printf "01 1%.1x 01 02 03 04 05" $((i+7)))
			;;

		*)
			echo "Error in MDNameFmt"
			exit 1
	esac

	#SET the MAName1
	index=$((index+1))
	w=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 20 00 $MAName1\n" $index $MsgTypeSet $EntIns)
	exec_cmd $w
	sleep $slp

	#SET the MAName2
	index=$((index+1))
	w=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 10 00 $MAName2\n" $index $MsgTypeSet $EntIns)
	exec_cmd $w
	sleep $slp

	#SET the VLANS
	echo "SET: (300@$i) : VLANS"
	index=$((index+1))
	VLANID=$(printf "01 1%.1x" $((i+7))) #(01 18 -> 01 1B 280-283)
	w=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 04 00 $VLANID\n" $index $MsgTypeSet $EntIns)
	exec_cmd $w
	sleep $slp

done
echo "======= 300[0..3] : NBNMA ME END ========"

echo "======= 300[4..7] : ASMA ME ========"
#CREATE 300@4..7 set 4 ASMAs, MDPtr=00 01, MAnameformat=2(string), MHF creation is ON.
#As these points to ASMD, we should create up/dn-MHFs
for i in $(seq 5 8);
do
	echo "CREATE: (300@$i) : MA"
	index=$((index+1))
	ClassID=300
	EntIns=$i
	MDPtr=02
	v=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 00 %.2d 02 00 01 01\n" $index $MsgTypeCreate $EntIns $MDPtr )
	exec_cmd $v
	sleep $slp

	#SET the MAName1 = ASMA[1..4].
	echo "SET: (300@$i) : MAName1"
	index=$((index+1))
	MAName1=$(printf "41 53 4d 41 %.2d 00" $((i+30)))
	w=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 20 00 $MAName1\n" $index $MsgTypeSet $EntIns)
	exec_cmd $w
	sleep $slp

	#SET the MAName2 =MANAME2.
	echo "SET: (300@$i) : MAName2"
	index=$((index+1))
	w=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 10 00 4d 41 4e 41 4d 45 32 00\n" $index $MsgTypeSet $EntIns)
	exec_cmd $w
	sleep $slp

	#SET the VLANS
	echo "SET: (300@$i) : VLANS"
	index=$((index+1))
	VLANID=$(printf "01 1%.1x" $((i+3))) #NOTE : Vlans cal with just i.
	w=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 04 00 $VLANID\n" $index $MsgTypeSet $EntIns)
	exec_cmd $w
	sleep $slp

	#SET the MHF Creation
	#$omci rmr 10 30   48     0a     01 2c   00 01    02 00       03
	echo "SET: (300@$i) : MHF Creation"
	index=$((index+1))
	MHFCreation=02
	w=$(printf "$cmd 10 %.2d %.2d 0a 01 2c 00 %.2d 02 00 $MHFCreation\n" $index $MsgTypeSet $EntIns)
	exec_cmd $w
	sleep $slp

done
echo "======= 300[4..7] : ASMA ME END ========"

#CREATE 302@0..3, MAPtr=00 01...00 03,
for i in $(seq 1 4);
do
	echo "CREATE: (302@$i) : MA"
	index=$((index+1))
	ClassID='01 2e' #302
	EntIns=$i
	MAPtr=$((i)) #1..4
	MEPID=$(printf "00 %x\n" $((i+100)))
	MEPCtrl=14
	VLANID=$(printf "01 1%.1x" $((i+7))) 

	BPCD_ID=$(printf "00 %.2d" $((i)))
	v=$(printf "$cmd 10 %.2d %.2d 0a $ClassID 00 %.2d $BPCD_ID 00 00 %.2d $MEPID $MEPCtrl $VLANID 00 01 02 03 04 05 06 07 08 01 01\n" $index $MsgTypeCreate $EntIns $MAPtr)
	exec_cmd $v
	sleep $slp

done
