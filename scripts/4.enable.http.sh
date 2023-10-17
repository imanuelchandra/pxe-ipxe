#!/bin/bash

DIR_IPXE=/data

if [ -d "$DIR_IPXE/sources" ]; then
    # Enable NFS support
    sed -i 's/#undef\tDOWNLOAD_PROTO_HTTP/#define\tDOWNLOAD_PROTO_HTTP/' $DIR_IPXE/sources/src/config/general.h
fi