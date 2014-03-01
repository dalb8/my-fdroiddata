#! /bin/bash
#curlftpfs -o allow_other ftp:ftp@192.168.1.103:2121/sdcard ~/phone-backup/Mémoire\ de\ stockage\ interne
simple-mtpfs  ~/phone-backup
#rsync -av ~/phone-backup/ ~/misc/p990-backup/Mémoire\ de\ stockage\ interne
rsync -a ~/phone-backup/Mémoire\ de\ stockage\ interne ~/misc/p990-backup/
fusermount -u ~/phone-backup
adb backup -f ~/misc/p990-backup/backup-$(date +%d%m%Y).ab -noapk -all

