#! /bin/bash

simple-mtpfs ~/phone-storage
rsync -av --exclude 'Android' --exclude 'Videos' ~/phone-storage/Mémoire\ de\ stockage\ interne/ ~/p990-backup/

# This is much slower but is OK for the subsequent backups
#curlftpfs -o allow_other ftp:ftp@192.168.1.103:2121/sdcard ~/phone-storage
#rsync -av --exclude '.android_secure/' --exclude 'Videos/' ~/phone-storage/ ~/p990-backup

fusermount -u ~/phone-storage

#adb backup -f ~/p990-backup/backup-$(date +%d%m%Y).ab -noapk -all
# Todo: adbfs: since adb is on for adb backup, it might be convenient

