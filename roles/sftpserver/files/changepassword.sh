#!/bin/bash
set -e # Exit if non-zero return code
set -o pipefail

if [ $1 ]
then

        FTPUSER=$1

        /opt/proftpd/bin/ftpasswd --passwd --file=/ftp-data/etc/ftpd.passwd --name=$FTPUSER  --change-password
else
        echo $0 \<username\>
        echo
fi
