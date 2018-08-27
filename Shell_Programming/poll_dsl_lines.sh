
#!/bin/sh

poll_dsl_lines()
{
    local line_active=0
    local line_state

    eval line_state="nLineState=$2"
    #echo $line_state
    /opt/lantiq/bin/dsl_pipe LineStateGet $1 | awk '{ print "'$line_state'"; if ($3 == "'$line_state'") exit 0; exit 1;}'
    #/opt/lantiq/bin/dsl_pipe LineStateGet $1 | awk '{ print $3 }'
    if [ $? -eq 0 ]; then
        line_active=1
    fi

    if [ $line_active -ne 1 ]; then
        echo "Line $1 in wrong state"
    else
        echo " Line $1 in correct state "
    fi
}

poll_dsl_lines "0" "100"
poll_dsl_lines "1" "100"
~

