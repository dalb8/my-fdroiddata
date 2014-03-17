#! /bin/bash
# Since fdroid update -b doesn't work…
exec > "$MYFDROIDDATA/logs/to-update.log"
for i in $MYFDROIDDATA/metadata/*.txt
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
