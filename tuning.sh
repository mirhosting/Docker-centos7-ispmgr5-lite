#!/bin/bash

#Mysql tuning
echo "[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
symbolic-links=0
local-infile=0
#ignore_builtin_innodb
default_storage_engine=MyISAM
innodb_file_per_table=1
skip-external-locking
query_cache_limit=64K
query_cache_size=32M
max_user_connections=100
max_connections=200
thread_cache_size=64
key_buffer_size=128M
join_buffer_size=16K
max_connect_errors=20
max_allowed_packet=1M
table_open_cache=64
sort_buffer_size=1M
read_buffer_size=1M
read_rnd_buffer_size=1M
thread_concurrency=2
myisam_sort_buffer_size=8M
net_buffer_length = 4K
collation-server=utf8_unicode_ci
character_set_server=utf8

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
open_files_limit=8192

[mysqldump]
quick
max_allowed_packet=16M

[mysql]
no-auto-rehash

[isamchk]
key_buffer=8M
sort_buffer=8M
read_buffer=4M
write_buffer=4M

[myisamchk]
key_buffer=8M
sort_buffer=8M
read_buffer=4M
write_buffer=4M

[mysqlhotcopy]
interactive-timeout

[client]
default-character-set=utf8" > /etc/my.cnf

#Tuning default iptables
cp /etc/sysconfig/iptables /etc/sysconfig/iptables.save
echo > /etc/sysconfig/iptables
echo "Tuned"
