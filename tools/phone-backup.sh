#! /bin/bash

# Todo: adbfs: since adb is on for adb backup, it might be convenient

#adb backup -f ~/misc/p990-backup/backup-$(date +%d%m%Y).ab -noapk -all

#curlftpfs -o allow_other ftp:ftp@192.168.1.103:2121/sdcard ~/phone-backup
#rsync -av ~/phone-backup/ ~/misc/p990-backup

simple-mtpfs ~/phone-backup
rsync -a ~/phone-backup ~/misc/p990-backup/
fusermount -u ~/phone-backup

