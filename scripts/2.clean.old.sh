#!/bin/bash

DIR_IPXE=/data

if [ -d "$DIR_IPXE/bios/bin" ]; then
    rm -rf $DIR_IPXE/bios/bin
    mkdir -p $DIR_IPXE/bios/bin
else
    mkdir -p $DIR_IPXE/bios/bin
fi

if [ -d "$DIR_IPXE/uefi/x86/bin" ]; then
    rm -rf $DIR_IPXE/uefi/x86/bin
    mkdir -p $DIR_IPXE/uefi/x86/bin
else
    mkdir -p $DIR_IPXE/uefi/x86/bin
fi

if [ -d "$DIR_IPXE/uefi/x64/bin" ]; then
    rm -rf $DIR_IPXE/uefi/x64/bin
    mkdir -p $DIR_IPXE/uefi/x64/bin
else
    mkdir -p $DIR_IPXE/uefi/x64/bin
fi