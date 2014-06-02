# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

## Checking for collapsed headers caused by fdroid checkupdates
#!/bin/bash
for i in metadata/*.txt
do line=$(sed '4!d' $i | grep '^## Originally')
   if [ $? -eq 0 ]
      then
	   echo $i
#           sed -i '3G' $i
   fi
done

for i in metadata/*.txt
do line=$(sed '6!d' $i | grep '^## Originally')
   if [ $? -eq 0 ]
      then
	   echo $i
#           sed -i '5G' $i
   fi
done

