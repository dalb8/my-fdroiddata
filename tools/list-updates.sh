#! /bin/bash
# Since fdroid update -b doesn't work…
exec > "$MYFDROIDDATA/logs/to-update.log"
for i in $MYFDROIDDATA/metadata/*.txt
do 	echo "$(basename -s .txt $i):"
        echo " "
	grep -A 1 'Build:' $i
        echo " "
	grep -A 0 'Current Version Code:' $i
        echo " "
        echo "********** "
done
