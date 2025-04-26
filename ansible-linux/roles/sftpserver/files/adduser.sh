#!/bin/bash
set -e # Exit if non-zero return code
set -o pipefail

if [ $1 ]
then

        FTPUSER=$1

        mkdir -p /ftp-data/home/$FTPUSER
        chown ftpusers:ftpusers /ftp-data/home/$FTPUSER
        chmod 775 /ftp-data/home/$FTPUSER
        
        /opt/proftpd/bin/ftpasswd --file=/ftp-data/etc/ftpd.passwd --passwd --name=$FTPUSER --home=/ftp-data/home/$FTPUSER --shell=/bin/false --uid=2121 --gid=2121
else
        echo $0 \<username\>
        echo
fi
