# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


#! /bin/bash
for i in $(grep -s -l '^Update Check Mode:RepoMan\|^Update Check Mode:Tags' metadata/*.txt)
do N=$(basename --suffix=.txt $i)
   fdroid checkupdates $N 2>&1 | tee -a logs/repo-$(date +%d%m%Y).log
done
sed -e '/Reading/d;/up to date/d;/Finished/d' -e 's/^Processing/    Processing/' -i logs/repo-$(date +%d%m%Y).log

