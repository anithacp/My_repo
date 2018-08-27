#!/bin/sh
V_PRODUCT="nbn_ndd1100"
: '
CONFIG_VERSION_NICK="4100"
CONFIG_VERSION_PRODUCT="NetComm Wireless NDD-4100 FTTdp unit (4 port)"
if [ "$V_PRODUCT"=="nbn_ndd1100" ]; then
        CONFIG_VERSION_NICK="1100"
        CONFIG_VERSION_PRODUCT="NetComm Wireless NDD-1100 FTTdp unit (1 port)"
fi

echo $CONFIG_VERSION_NICK
echo $CONFIG_VERSION_PRODUCT
'
#NICK=`sed -e 's/nbn_ndd.*/\1/' $V_PRODUCT`
#echo $V_PRODUCT | sed 's|nbn_ndd.*|\1|g'
#echo $NICK
#SUBSTRING=$(echo $V_PRODUCT| cut -d 'nbn_ndd' -f 2) 
#echo $SUBSTRING

NICK=`echo $V_PRODUCT | sed -n 's/nbn_ndd\(.*\)/\1/p'`
PORT=`echo $V_PRODUCT | sed -n 's/nbn_ndd\(.*\)100/\1/p'`
echo $NICK $PORT
PRODUCT_STR="NetComm Wireless NDD-$NICK FTTdp unit ($PORT port)"
echo $PRODUCT_STR
#echo 'nice12343game' | sed -n 's/nice\(.*\)game/\1/p'
#sed 's@^CONFIG_VERSION_NICK=".*"$$@CONFIG_VERSION_NICK="$(NICK)"@' config_Echidna > .config
#sed -i "s/^CONFIG_VERSION_NICK=".*"/CONFIG_VERSION_NICK=\""$NICK"\"/" config_Echidna
#sed -i "s/^CONFIG_VERSION_PORT=".*"/CONFIG_VERSION_PORT=\""$PORT"\"/" config_Echidna
cat config_Echidna | sed "s/^CONFIG_VERSION_NICK=.*$/CONFIG_VERSION_NICK=$NICK/" >.config
cat config_Echidna | sed "s/^CONFIG_VERSION_PORT=.*$/CONFIG_VERSION_PORT=\"$PORT\"/" >.config


RELEASE="X.X.X"
echo "$RELEASE" | sed -r 's/[\.]+/-/g' > $RELEASE
RELEASE=`sed -r 's/[\.]+/-/g' $RELEASE`
echo $RELEASE

echo 'This is a sentence. This is another sentence.' | awk  '{gsub(/\./,"",$0);print $0}' 
echo "$RELEASE" | awk '{gsub(/\./,"-",$0);print $0}'
