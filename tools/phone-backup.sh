#! /bin/bash

simple-mtpfs ~/phone-storage
rsync -av --delete --exclude 'Android' ~/phone-storage/Mémoire\ de\ stockage\ interne/ ~/p990-backup/

# This is much slower but is OK for the subsequent backups
#curlftpfs -o allow_other ftp:ftp@192.168.1.103:2121/sdcard ~/phone-storage
#rsync -av --delete --exclude '.android_secure/' --exclude 'Videos/' ~/phone-storage/ ~/p990-backup

fusermount -u ~/phone-storage

#adb backup -f ~/p990-backup/backup-$(date +%d%m%Y).ab -noapk -all
# Todo: adbfs (experimental): since adb is on for adb backup, it might be convenient

# Other options include go-mtpfs and running SSH server e.g. SSHHelper

# List of things to backup adhoc: wikiandpad notes, calendar (to sheet of paper), contacts
# (via export function), Tasks (org.tasks export) list, map POI, text messages
# (slight backup, SMS backup +, owncloud sms), photos (DCIM, Pictures/Telegram to
# separate drive), app list (pm list packages -3), init.d, NLP, gps.conf, hosts,
# feeds/casts (export opml), keepass database, bookmarks (not easy), APKs (pm
# path, Ghost Commander), configs on sdcard (K9, Jota), config other (adb,
# oandbackup)

