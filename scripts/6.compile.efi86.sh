#!/bin/bash

DIR_IPXE=/data
DIR_LOG=/log
CONFIG_DIR=/config/uefi

# Write log to file
exec &>$DIR_LOG/efi_x86_build.log

if [ -d "$DIR_IPXE/sources" ] && [ -d "$CONFIG_DIR" ]; then
    
    cd $DIR_IPXE/sources/src || exit
    echo "Building ipxe..."
   
    make bin-i386-efi/ipxe.efi && cp bin-i386-efi/ipxe.efi $DIR_IPXE/uefi/x86/bin
    make bin-i386-efi/snponly.efi && cp bin-i386-efi/snponly.efi $DIR_IPXE/uefi/x86/bin
    make bin-i386-efi/intel.efi && cp bin-i386-efi/intel.efi $DIR_IPXE/uefi/x86/bin

    # make bin-i386-efi/ipxe.efi EMBED=$CONFIG_DIR/ipxescript && cp bin-i386-efi/ipxe.efi $DIR_IPXE/uefi/x86/bin
    # make bin-i386-efi/snponly.efi EMBED=$CONFIG_DIR/ipxescript && cp bin-i386-efi/snponly.efi $DIR_IPXE/uefi/x86/bin
    # make bin-i386-efi/intel.efi EMBED=$CONFIG_DIR/ipxescript && cp bin-i386-efi/intel.efi $DIR_IPXE/uefi/x86/bin
        
    echo "****** BUILD FINISHED ******"
fi