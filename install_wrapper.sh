#!/bin/sh
# Wrapper to call ISPmanager installation script with args

/usr/bin/wget http://download.ispsystem.com/install.sh -O /usr/local/src/install.sh
/usr/bin/chmod +x /usr/local/src/install.sh
/usr/bin/hostname build.docker.com
/bin/sh -c "/usr/local/src/install.sh --osfamily REDHAT --osversion 7 --release stable --disable-fail2ban --silent ISPmanager-Lite"
