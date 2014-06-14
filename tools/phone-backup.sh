#! /bin/bash

# Todo: adbfs: since adb is on for adb backup, it might be convenient

#adb backup -f ~/misc/p990-backup/backup-$(date +%d%m%Y).ab -noapk -all

curlftpfs -o allow_other ftp:ftp@192.168.1.103:2121/sdcard ~/phone-storage
rsync -av --exclude '.android_secure/' --exclude 'Videos/' ~/phone-storage/ ~/misc/p990-backup

#simple-mtpfs ~/phone-storage
#rsync -a --exclude 'Carte SD' --exclude 'Mémoire de stockage interne/Android/' --exclude 'Mémoire de stockage interne/Videos' ~/phone-storage/ ~/misc/p990-backup/
fusermount -u ~/phone-storage

