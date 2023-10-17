#!/bin/bash

DIR_IPXE=/data
DIR_LOG=/log
CONFIG_DIR=/config/bios

# Write log to file
exec &>$DIR_LOG/bios_build.log

if [ -d "$DIR_IPXE/sources" ] && [ -d "$CONFIG_DIR" ]; then
    
    cd $DIR_IPXE/sources/src || exit
    echo "Building ipxe..."

    make bin/undionly.kpxe && cp bin/undionly.kpxe $DIR_IPXE/bios/bin
    make bin/ipxe.pxe && cp bin/ipxe.pxe $DIR_IPXE/bios/bin
    make bin/undionly.kkpxe && cp bin/undionly.kkpxe $DIR_IPXE/bios/bin
    make bin/intel.pxe && cp bin/intel.pxe $DIR_IPXE/bios/bin

    # make bin/undionly.kpxe EMBED=$CONFIG_DIR/ipxescript && cp bin/undionly.kpxe $DIR_IPXE/bios/bin
    # make bin/ipxe.pxe EMBED=$CONFIG_DIR/ipxescript && cp bin/ipxe.pxe $DIR_IPXE/bios/bin
    # make bin/undionly.kkpxe EMBED=$CONFIG_DIR/ipxescript && cp bin/undionly.kkpxe $DIR_IPXE/bios/bin
    # make bin/intel.pxe EMBED=$CONFIG_DIR/ipxescript && cp bin/intel.pxe $DIR_IPXE/bios/bin
    
    echo "****** BUILD FINISHED ******"
fi