#!/bin/sh
#  ###################
#  NCW DSL Command Utility
#  ###################

BEGINCOMMENT="if [ ]; then"
ENDCOMMENT="fi"

BIN_DIR=/opt/lantiq/bin
DSL_LINE_ALL=-1
DSL_START_LINE_NUM=0
DSL_END_LINE_NUM=7

DSL_CHANNEL=0
DIRECTION_US=0
DIRECTION_DS=1

RET_UNINITIALIZED=-1
RET_SUCCESS=0
RET_ERR_DIRECTION=1

#DSL_PROFILES=( PROFILE_8A PROFILE_8B PROFILE_8C PROFILE_8D PROFILE_12A PROFILE 12B PROFILE_17A PROFILE_30A PROFILE_17B )

display_cmds() {
  echo "###################"
  echo "Commands available"
  echo "###################"

  echo "GetLineStatus <Line Number>"
  echo "GetLineRate <Line Number> <Direction>"
  echo "GetUserPayloadRate <Line Number> <Direction>"
  echo "GetVDSL2ProfileType <Line Number>"
  echo "GetVDSL2TrafficCounters <Line Number>"
}

check_direction() {
  local nDirection=$1
  if [ -z $nDirection ]; then
    return $RET_ERR_DIRECTION
  fi    
 
  if [ $nDirection -ne $DIRECTION_US -a $nDirection -ne $DIRECTION_DS ]; then
    return $RET_ERR_DIRECTION
  fi
  
  return $RET_SUCCESS
}

get_dsl_traffic_cntrs() {
  local cmdUsage="Command: GetVDSL2TrafficCounters Input Parameter: Line Number(0-7) Output Parameter: Number of Frames transmitted, Number of Frames received, Number of Frames Check Sequence Errors"
  local nLine=${1}
  local nFramesTx nFramesRx nFCSError

  if [ ! -z $nLine ]; then
    nFramesTx=`$BIN_DIR/dsl_pipe lpctg $nLine $DSL_CHANNEL | awk '/ / {print $4}' | cut -d '=' -f2`
    nFramesRx=`$BIN_DIR/dsl_pipe lpctg $nLine $DSL_CHANNEL | awk '/ / {print $5}' | cut -d '=' -f2`
    nFCSError=`$BIN_DIR/dsl_pipe lpctg $nLine $DSL_CHANNEL | awk '/ / {print $6}' | cut -d '=' -f2`
    echo "For Line ${nLine} Number of Frames transmitted to User = $nFramesTx Number of Frames received from User = $nFramesRx Number of Frames Check Sequence Errors = $nFCSError"
  else
    echo $cmdUsage
  fi

}

get_profile_type() {                                                                                                                                        
  local cmdUsage="Command: GetVDSL2ProfileType Input Parameter: Line Number(0-7) Output Parameter: Profile BandPlan"                                         
  local nLine=${1}                                                                                                                                          
  local nProfile nBandPlan sProfile sBandPlan                                                                                                                                            
                                                                                                                                                            
  if [ ! -z $nLine ]; then                                                                                                                                  
    nProfile=`$BIN_DIR/dsl_pipe bpcg $nLine | awk '/ / {print $4}' | cut -d '=' -f2`
    nBandPlan=`$BIN_DIR/dsl_pipe bpcg $nLine | awk '/ / {print $3}' | cut -d '=' -f2`
    case $nProfile in
      0)
        sProfile="PROFILE_8A"
        ;;
      1)
        sProfile="PROFILE_8B"
        ;;
      2)
        sProfile="PROFILE_8C"
        ;;
      3)
        sProfile="PROFILE_8D"
        ;;
      4)
        sProfile="PROFILE_12A"
        ;;
      5)
        sProfile="PROFILE_12B"
        ;;
      6)
        sProfile="PROFILE_17A"
        ;;
      7)
        sProfile="PROFILE_30A"
        ;;
      8)
        sProfile="PROFILE_17B"
        ;;
    esac
    echo "For Line ${nLine} Profile Type = $sProfile and Band Plan is $nBandPlan"
  else
    echo $cmdUsage
  fi
}                               

get_user_payload_rate() {
  local cmdUsage="Command: GetUserPayloadRate Input Parameter: Line Number(0-7) Direction(0-Upstream 1-Downstream) Output Parameter: User Payload Rate(bps)"
  local nLine=${1}
  local nPayloadRate
  local nDirection=${2}
  local nRetVal=$RET_UNINITIALIZED

  check_direction $nDirection
  nRetVal=$?

  if [ $nRetVal -ne $RET_SUCCESS ]; then
    echo $cmdUsage
    return $RET_SUCCESS
  fi    
 
  if [ ! -z $nLine ]; then
    nPayloadRate=`$BIN_DIR/dsl_pipe g997csg $nLine $DSL_CHANNEL $nDirection | awk '/ / {print $5}' | cut -d '=' -f2`
    if [ $nDirection -eq $DIRECTION_US ];then
      echo "Upstream Line rate for line ${nLine} = $nPayloadRate"
    else
      echo "Downstream Line rate for line ${nLine} = $nPayloadRate"
    fi
  else
    echo $cmdUsage
  fi
}

get_line_rate() {
  local cmdUsage="Command: GetLineRate Input Parameter: Line Number(0-7) Direction(0-Upstream 1-Downstream) Output Parameter: Net Line Rate(bps)"
  local nLine=${1}
  local nLineRate
  local nDirection=${2}
  local nRetVal=$RET_UNINITIALIZED

  check_direction $nDirection
  nRetVal=$?

  if [ $nRetVal -ne $RET_SUCCESS ]; then
    echo $cmdUsage
    return $RET_SUCCESS
  fi    
 
  if [ ! -z $nLine ]; then
    nLineRate=`$BIN_DIR/dsl_pipe ltsg $nLine $nDirection | awk '/ / {print $5}' | cut -d '=' -f2`
    if [ $nDirection -eq $DIRECTION_US ];then
      echo "Upstream Line rate for line ${nLine} = $nLineRate"
    else
      echo "Downstream Line rate for line ${nLine} = $nLineRate"
    fi
  else
    echo $cmdUsage
  fi
}

get_line_state() {
#set -x
  local cmdUsage="Command: GetLineStatus Input Parameter: Line Number(0-7) Output Parameter: Line status"
  local nLine=${1}
  local nLineStatus
  local nLineState

  if [ ! -z $nLine ]; then
    nLineState=`$BIN_DIR/dsl_pipe lsg $nLine | awk '/nLineState=/ {print $3}' | cut -d '=' -f2`
    case $nLineState in
      000)
        nLineStatus="Un-initialized"
        ;;
      100)
        nLineStatus="Idle"
        ;;
      200)
        nLineStatus="Silent"
        ;;
      300)
        nLineStatus="Handshake"
        ;;
      380)
        nLineStatus="Full Init"
        ;;
      400)
        nLineStatus="Discovery"
        ;;
      500)
        nLineStatus="Training"
        ;;
      600)
        nLineStatus="Analysis"
        ;;
      700)
        nLineStatus="Exchange"
        ;;
      800)
        nLineStatus="Showtime - no sync"
        ;;
      801)
        nLineStatus="Showtime - tc sync"
        ;;
    esac
    echo "Line status for line ${nLine} = $nLineStatus ($nLineState)"
  else
    echo $cmdUsage
  fi

#set +x
}

main() {
#set -x
  nNumArgs=$#
  nCmdType=$1

  if [ $nNumArgs -le 1 ]; then
    display_cmds
    exit
  fi

  nLine=$2

  if [ $nLine -gt $DSL_END_LINE_NUM -o $nLine -lt $DSL_LINE_ALL ]; then
    echo "Invalid line number. Range ($DSL_START_LINE_NUM,$DSL_END_LINE_NUM)"
    exit
  fi

#  echo "Total num of args passed = $nNumArgs"
#  echo "Args passed = $nCmdType $nLine $3 $4 $5"

  case $nCmdType in
    GetLineStatus)
      get_line_state $nLine
      ;;
    
    GetLineRate)
      nDirection=$3
      get_line_rate $nLine $nDirection
      ;;

    GetUserPayloadRate)
      nDirection=$3
      get_user_payload_rate $nLine $nDirection
      ;;

    GetVDSL2ProfileType)
      get_profile_type $nLine
      ;;
    
    GetVDSL2TrafficCounters)
      get_dsl_traffic_cntrs $nLine
      ;;
    
    *)
      echo "Unexpected Command"
      ;;
  esac
#set +x
}

main "$@"

