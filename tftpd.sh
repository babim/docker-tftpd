#!/bin/bash

# This script is a wrapper for https://hub.docker.com/atomney/tftpd


########## VARIABLES
TFTPROOT=`pwd`

echo "Your files will be saved in:"
echo $TFTPROOT

TFTPPORT=69

CONTAINERNAME=tftpd

CURRENTUSER=$(id -u `whoami`)
#echo $CURRENTUSER

########## INSTALL
if [ "$1" = "--install" ]; then

        docker run -d -v $TFTPROOT:/share -p $TFTPPORT:69/udp --name $CONTAINERNAME babim/tftpd
fi


########## TEMP
if [ "$1" = "--temp" ]; then

        docker run -d -p $TFTPPORT:69/udp --name $CONTAINERNAME babim/tftpd
fi


########## REMOVE 
if [ "$1" = "--remove" ]; then

        bash $0 --stop
        docker rm $CONTAINERNAME
fi

########## START 
if [ "$1" = "--start" ]; then

        docker start $CONTAINERNAME
fi

########## STOP 
if [ "$1" = "--stop" ]; then

        docker stop $CONTAINERNAME
fi
