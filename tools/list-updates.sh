#! /bin/bash
# Since fdroid update -b doesn't work…
exec > "logs/to-update.log"
for i in metadata/*.txt
do 	echo "$(basename -s .txt $i):"
        echo " "
	grep -A 1 'Build:' $i
        echo " "
	grep -A 0 'Current Version Code:' $i
        echo " "
        echo "********** "
done
