#!/bin/sh

display_cmds() {
  echo "In display_cmds()"
  echo "GetLineStatus <Line Number>"
  echo "GetLineRate <Line Number>"
  echo "GetUserPayloadRate <Line Number>"
  echo "GetVDSL2ProfileType <Line Number>"
  echo "GetVDSL2TrafficCounters <Line Number>"
}

cmd_line_state_get() {
  echo "In cmd_line_state_get()"
#set -x
  local usageLineStatus="Command: LineStatus Input Parameter: Line Number Output Parameter: Line status"
  local nLine=${1}
  local cmdOutput
  local nLineStatus

  if [ $nLine -ge 0 ]; then
    echo "Inside if"
    #/opt/lantiq/bin/dsl_pipe lsg $nLine > cmdOutput
    #echo $cmdOutput
    #nLineStatus=`awk '/nLineState=/ {print $3}' cmdOutput | cut -d '=' -f2`
    nLineStatus=`/opt/lantiq/bin/dsl_pipe lsg $nLine | awk '/nLineState=/ {print $3}' | cut -d '=' -f2`
    echo "Line status for line ${nLine} = $nLineStatus"
  else
    echo $usageLineStatus
  fi
#set +x
}

main() {

  echo "###################"
  echo "NCW DSL Command Utility"
  echo "###################"
  nNumArgs=$#
  nCmdType=$1
  nLine=$2
  
  if [ $nNumArgs -eq 0 ]; then
    display_cmds
    exit
  fi

  echo "Total num of args passed = $nNumArgs"
  echo "Args passed = $nCmdType $nLine $3 $4 $5"

  case $nCmdType in
    LineStatus)
      sMsg="Printing Line status"
      cmd_line_state_get $nLine
      ;;
    *)
      echo "Unexpected Command"
      ;;
  esac

  echo "###################"
  echo "Bye"
}

main "$@"


