#!/bin/sh
poll_dsl_lines()
{
    local line_active=0
    local time_cnt=0
    while [ $line_active -eq 0 -a $time_cnt -lt 10 ]; do
        # make sure the command finish in 2 seconds
        echo "Inside while $time_cnt"
        sleep 1
        time_cnt=$((${time_cnt}+1))
        if [ $time_cnt -eq 5 ]; then
            line_active=1
        fi

    done
    echo "Finish"
}

poll_dsl_lines
