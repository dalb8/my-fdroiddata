# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


# Grab Current Version data from another repo
# Todo: check if the Repo: field is the same;  update Auto Name: field too

# Could use this to find packages that are in both repos
#comm -12 <( find $MYFDROIDDATA/metadata/*.txt -printf '%f\n' | sort | uniq ) <( find $FDROIDDATA/metadata/*.txt -printf '%f\n' | sort | uniq )

#! /bin/bash
for i in `grep -s -l '^#Update Check Mode:' $MYFDROIDDATA/metadata/*.txt`
do N=`basename $i`
   CVC=$(sed -n 's/Current Version Code://p' $FDROIDDATA/metadata/$N)
   sed -i "s/Current Version Code:[.0-9]*/Current Version Code:$CVC/" $MYFDROIDDATA/metadata/$N`
   CV=$(sed -n 's/Current Version://p' $FDROIDDATA/metadata/$N)
   sed -i "s/Current Version:.*/Current Version:$CV/"  $MYFDROIDDATA/metadata/$N`
done
