#!/bin/sh
bindir=/opt/lantiq/bin
chr() {
  printf \\$(printf '%03o' $1)
}
MAX_SERIAL_NUM_LEN=32
MAX_VERSION_NUM_LEN=16
SN=190902174900116
empty='0x00'
echo $SN

echo "------------------------------------"
#chr 1
#v=$(printf %s 1273455667 | hexdump -v -e '/1 "%02X "')
ser_num=$(printf %s "$SN" | hexdump -v -e '/1 "0x%02X "')
echo "$ser_num"
chrlen=${#SN}
echo "$chrlen"

while [ "$chrlen" -lt $MAX_SERIAL_NUM_LEN ]; do
    ser_num="$ser_num $empty"
    chrlen=$((chrlen + 1))
done

echo "Final Serial number: $ser_num"
echo "Len = $chrlen"
echo "------------------------------------"



VER_NUM="1.0.3.2"
vn=$(printf %s "$VER_NUM" | hexdump -v -e '/1 "0x%02X "')
echo "$vn"
vn_len=${#VER_NUM}
echo "$vn_len"

while [ "$vn_len" -lt $MAX_VERSION_NUM_LEN ]; do
    vn="$vn $empty"
    vn_len=$((vn_len + 1))
done
echo "Final Version number: $vn"
echo "Len = $vn_len"


echo "------------------------------------"

SYS_VEN_ID="0x0A 0x00 0x4E 0x54 0x42 0x57 0x00 0x00"
cmd="$bindir/dsl_pipe G997_LineInventorySet $SYS_VEN_ID $vn $ser_num"
echo "$cmd"
