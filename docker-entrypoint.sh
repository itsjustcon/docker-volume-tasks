#!/bin/bash

if [ -n "$VOL_ERASE" ]; then
    rm -rfv /mnt/vol/*
fi

if [ -n "$VOL_SOURCE_URL" ]; then
    #cd /mnt/vol && { curl -O $VOL_SOURCE_URL ; cd -; }
    cd /mnt/vol && { /usr/bin/curl -O $VOL_SOURCE_URL ; cd -; }
fi

if [ -z "$VOL_DISABLE_TAR" ]; then
    for file in $(find /mnt/vol -maxdepth 1 -name *.tar.gz* -print); do
        echo "Processing $file ..."
        tar $VOL_TAR_ARGS -C /mnt/vol -zxvf $file
        if [ -z "$VOL_DISABLE_RM_TAR" ]; then
            rm $file
        fi
    done
    for file in $(find /mnt/vol -maxdepth 1 -name *.tar* -print); do
        echo "Processing $file ..."
        tar $VOL_TAR_ARGS -C /mnt/vol -xvf $file
        if [ -z "$VOL_DISABLE_RM_TAR" ]; then
            rm $file
        fi
    done
fi

#exec "$@"
