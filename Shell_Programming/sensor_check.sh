#!/bin/sh

# Thresholds for the current, voltage and temperature for LTC2943 chip
# Current: 1A +/- 0.5A. Specified below in uA
LOW_THRESH_CURRENT=500000
HIGH_THRESH_CURRENT=1500000
# Voltage: 12 V +/- 1 V. Specified below in uV
LOW_THRESH_VOLTAGE=11000000
HIGH_THRESH_VOLTAGE=13000000
#Temperature: 10 degrees C to 90 degrees C. Specified below in 0.01 degrees C.
LOW_THRESH_TEMP=1000
HIGH_THRESH_TEMP=9000

SENSOR_CHIP_DIR=/home/anitha/GIT/Shell_Programming

boundary_check()
{
    if [ $1 -lt $2 ] || [ $1 -gt $3 ]; then
        echo "+++++++++++++++[`date`] $1 out of valid range ($2, $3) Error $4 +++++++++++++++"
        exit
    fi
}

# Do the LTC2943 sensor chip test. Validate that the reported
# current, voltage and temperature are within the permissible
# limits.
sensor_chip_check()
{
    #pts_log "+++++++++++++++ Sensor Test Begin +++++++++++++++"
    vol=$(cat $SENSOR_CHIP_DIR/dpu_voltage)
    echo "Vol" $vol
    if [ $? -ne 0 ]; then
        echo "Failed to get dpu_voltage. Sensor chip"
    fi
    boundary_check "$vol" $LOW_THRESH_VOLTAGE $HIGH_THRESH_VOLTAGE $SENSOR_VOL_CHECK_ERR

    curr=$( cat $SENSOR_CHIP_DIR/dpu_current)
    echo "curr" $curr
    if [ $? -ne 0 ]; then
        echo $SENSOR_CHECK_ERR "Failed to get dpu_current. Sensor chip"
    fi
    boundary_check "$curr" $LOW_THRESH_CURRENT $HIGH_THRESH_CURRENT $SENSOR_CURR_CHECK_ERR

    temp=$( cat $SENSOR_CHIP_DIR/dpu_temperature)
    echo "temp" $temp
    if [ $? -ne 0 ]; then
        action_on_error $SENSOR_CHECK_ERR "Failed to get dpu_temparature. Sensor chip"
    fi
    boundary_check "$temp" $LOW_THRESH_TEMP $HIGH_THRESH_TEMP $SENSOR_TEMP_CHECK_ERR
    #pts_log "+++++++++++++++ Sensor Test End +++++++++++++++"
}

sensor_chip_check
