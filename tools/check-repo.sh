#! /bin/bash
for i in $(grep -s -l '^Update Check Mode:RepoMan\|^Update Check Mode:Tags' metadata/*.txt)
do N=$(basename --suffix=.txt $i)
   fdroid checkupdates $N 2>&1 | tee -a logs/repo-$(date +%d%m%Y).log
done
sed -e '/Reading/d;/up to date/d;/Finished/d' -e 's/^Processing/    Processing/' -i logs/repo-$(date +%d%m%Y).log

