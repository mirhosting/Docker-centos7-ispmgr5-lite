#!/bin/bash
# ISPmanager 5 Lite Post-Install script.
# Instalated: LogRotate, MPM-ITK for HTTPD, Nginx, PHP, AwStat, Exim, RoundCube mail, Named, PhpMyAdmin, FTP-server

cd /usr/local/mgr5
echo "Directoru mgr5"

sbin/pkginstall.sh zip ispmgr feature.check
echo "zip installed"

sbin/pkginstall.sh ispmanager-pkg-logrotate ispmgr feature.check
echo "logrotate installed"

sbin/pkginstall.sh ispmanager-pkg-httpd-itk ispmgr feature.check
echo "httpd-itk installed"

sbin/pkginstall.sh ispmanager-pkg-nginx ispmgr feature.check
echo "nginx installed"

sbin/pkginstall.sh ispmanager-pkg-php ispmgr feature.check
echo "php installed"

sbin/pkginstall.sh ispmanager-pkg-awstats ispmgr feature.check
echo "awstats installed"

sbin/pkginstall.sh ispmanager-pkg-exim ispmgr feature.check
echo "exim installed"

sbin/pkginstall.sh ispmanager-pkg-roundcube ispmgr feature.check
echo "roundcube installed"

sbin/pkginstall.sh ispmanager-pkg-bind ispmgr feature.check
echo "bind installed"

sbin/pkginstall.sh ispmanager-pkg-myadmin ispmgr feature.check
echo "myadmin installed"

sbin/pkginstall.sh ispmanager-pkg-pureftpd ispmgr feature.check
echo "pureftpd installed"

sbin/mgrctl -m ispmgr feature.check sok=ok
echo "MGR software update"

echo "DefaultARecords www ftp mail smtp pop
DomainContact root@example.com
NameServers ns1.docker.com. ns2.docker.com.
MailServers mail mail" >> /usr/local/mgr5/etc/ispmgr.conf
echo "ispmgr.conf changed"

#Delete license-file
rm -f /usr/local/mgr5/etc/ispmgr.lic
echo "License-file was been deleted"

# Listen all IP's iHttpd
sed -i -n -e :a -e '1,4!{P;N;D;};N;ba' /usr/local/mgr5/etc/ihttpd.conf
echo "listen {
ip *
}" >> /usr/local/mgr5/etc/ihttpd.conf
echo "ihttpd.conf was been changed"
