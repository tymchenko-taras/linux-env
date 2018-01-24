#!/bin/sh
cp /kts/conf/vsftpd/users.db /kts/conf/vsftpd/users.db_bac
rm -f /kts/conf/vsftpd/users.db
db5.3_load -T -t hash -f /kts/conf/vsftpd/logins.txt /kts/conf/vsftpd/users.db
chmod 0600 /kts/conf/vsftpd/users.db
service vsftpd restart