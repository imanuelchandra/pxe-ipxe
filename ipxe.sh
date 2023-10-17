#!/bin/bash

set -uo pipefail

trap "stop; exit 0;" SIGTERM SIGINT

stop(){
    echo "Terminated."
    exit
}

init(){
    # declare directory required by this image in array
    declare -a dir_req=("/config" "/data" "/scripts" "/log")
 
    # loop through the array of directory list required by this image
    for i in "${dir_req[@]}"
    do
        # check for required directory, if it is does not exits, throw exit code 1
        if [ ! -d "$i" ]; then
            echo "Please ensure config, data, scripts, and log directory exists."
            exit 1
        fi

        # check for required directory, scripts
        # list the content of scripts directory, and pipe into IO
        # and execute the script
        if [ $i = "/scripts" ]; then
            cd $i
            for scripts in $(find . -type f -atime -1 -name '*.*' | sed 's_.*/__' | sort -n);
            do
                if [ -n "$scripts" ]; then

                    if [ -x  "$scripts" ]; then
                        chmod +x $scripts
                        ./$scripts
                    fi
                fi
            done;
        fi
    done

}

start(){
init

}

if [ $# -eq 1 -a -n "$1" ]; then
    if ! which "$1" >/dev/null; then
        start
    fi
else
    exec ${@}
fi