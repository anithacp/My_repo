#!/bin/sh
#lineStatus=`cut -d '\\n' -f{$2} dsl_output | cut -d ' ' -f3`
AlllineStatus=`cut -d ' ' -f3 dsl_output`
#lineStatus=`cut -d '\n' -f{$2} dsl_output`
echo $AlllineStatus

lineState=`awk '/nLineState=/ {print $3}' dsl_output | cut -d '=' -f2`
echo $lineState



