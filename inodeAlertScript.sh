#!/bin/bash

send_alert_email(){
    EMAILMESSAGE="/tmp/inodeAlertmessage.txt"

    echo "Subject: INODE ALERT -  $HOSTNAME  $1% inode usage"> $EMAILMESSAGE
    echo "Delete some files on $HOSTNAME to free up some inodes">> $EMAILMESSAGE
    df -h >> $EMAILMESSAGE
    EMAIL="your-email-address@goes-here.co.uk"
    sendmail "$EMAIL" <  $EMAILMESSAGE
}

if [ -z "$1" ]; then
    rootpath=/dev/sda1
else
    rootpath="$1"
fi;
inodetest=$(df -i | grep "$rootpath" | awk '{ print $5 }' | tr -d '%');
echo $inodetest;
if [ $inodetest -gt 80 ]; then
    echo "ALERT"
    send_alert_email $inodetest;
else
   echo "OKAY"
fi;
