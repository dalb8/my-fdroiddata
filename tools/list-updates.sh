# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


#! /bin/bash
# Since fdroid update -b doesn't work…
exec > "$MYFDROIDDATA/logs/to-update.log"
for i in $(grep -L '^Disabled:\|^Update Check Mode:Static' $MYFDROIDDATA/metadata/*.txt)
do 	echo "$(basename -s .txt $i):"
        echo " "
	tac $i | grep -m 1 'Build:'
	grep 'disable=' $i
	tac $i | grep -m 1 '^#In Repo:'
        echo " "
	grep '^Update Check Mode:\|^#Update Check Mode:' $i
	grep '^Vercode Operation:' $i
	grep -A 1 'Current Version:' $i
        echo " "
        echo "********** "
done
