#!/usr/bin/env bash

#AUTHOR: Douglas Mueller <superbob@dthm.net>
#Purpose: is to prep a fresh Docker container to run mumble from the mount volume to preserve settings.

# VARS -
mumbleServerConfig=/etc/mumble-server.ini
mumbleServerDb=/var/lib/mumble-server/mumble-server.sqlite
dockerVolume=/mumble-server

if [ ! -f ${dockerVolume}/mumble-server.ini ]; then
    echo "Mumble Configuration files not found. Replacing"
    cp -v ${mumbleServerConfig} ${dockerVolume}
#    String to replace logfile=/var/log/mumble-server/mumble-server.log
    sed -i '/logfile=/c\logfile=/mumble-server/mumble-server.log' ${dockerVolume}/mumble-server.ini
#    String to replace database=/var/lib/mumble-server/mumble-server.sqlite
    sed -i '/database=/c\database=/mumble-server/mumble-server.sqlite' ${dockerVolume}/mumble-server.ini
fi

#if [ ! -f /${dockerVolume}/mumble-server.sqlite ]; then
#    echo "Mumble Database file not found. Replacing"
#    cp -v ${mumbleServerDb} ${dockerVolume}
#fi

# Continue with CMD
exec "$@"