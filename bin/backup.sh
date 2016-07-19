#!/bin/bash
# Script de backup
# Path to backup directories
DIRS="/etc/nginx /var/www"
 
# Store todays date
NOW=$(date +"%F")
 
# Store backup path
BACKUP="/srv/backup/$NOW"
 
# Backup file name hostname.time.tar.gz 
BFILE="$(hostname).$(date +'%T').tar.gz"
PFILE="$(hostname).$(date +'%T').pg.sql.gz"
MFILE="$(hostname).$(date +'%T').mysql.sql.xz"
 
# Set Pgsql username
PGSQLUSER=""
 
# Set MySQL username and password
MYSQLUSER="debian-sys-maint"
MYSQLPASSWORD=""
 
# Remote SSH server setup
SSHSERVER="" # remote ssh server
SSHUSER=""
SSHDUMPDIR="~/backup/"    # remote ssh server directory to store dumps
SSHPORT=""
 
# Paths for binary files
TAR="/bin/tar"
#PGDUMP="/usr/bin/pg_dump"
MYSQLDUMP="/usr/bin/mysqldump"
GZIP="/bin/gzip"
SCP="/usr/bin/scp"
SSH="/usr/bin/ssh"
LOGGER="/usr/bin/logger"
 
 
# make sure backup directory exists
[ ! -d $BACKUP ] && mkdir -p ${BACKUP}
 
# Log backup start time in /var/log/messages
$LOGGER "$0: *** Backup iniciou @ $(date) ***"
 
# Backup websever dirs
$TAR Jcvf ${BACKUP}/${BFILE} ${DIRS}
 
# Backup PgSQL
#$PGDUMP -x -D -U${PGSQLUSER} | $GZIP -c > ${BACKUP}/${PFILE}
 
# Backup MySQL
$MYSQLDUMP -u ${MYSQLUSER} -h localhost -p${MYSQLPASSWORD} --all-databases | $GZIP -9 > ${BACKUP}/${MFILE}
 
# Dump all local files to failsafe remote UNIX ssh server / home server
$SSH -p $SSHPORT ${SSHUSER}@${SSHSERVER} mkdir -p ${SSHDUMPDIR}/${NOW}
$SCP -P $SSHPORT -r ${BACKUP}/* ${SSHUSER}@${SSHSERVER}:${SSHDUMPDIR}/${NOW}
 
# Log backup end time in /var/log/messages
$LOGGER "$0: *** Backup Terminou @ $(date) ***"
