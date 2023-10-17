#!/bin/bash

DIR_IPXE=/data

if [ ! -d "$DIR_IPXE" ]; then 
    echo "Please ensure '$DIR_IPXE' directory exists and is readable."
    exit 1
fi

DIR_LOGS=/log

if [ ! -d "$DIR_LOGS" ]; then 
    echo "Please ensure '$DIR_LOGS' directory exists and is readable."
    exit 1
fi

ln -s /tmp/src/ipxe $DIR_IPXE/sources