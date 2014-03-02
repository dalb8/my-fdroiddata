# Grab Current Version data from another repo
# Todo: check if the Repo: field is the same;  update Auto Name: field too

# Could use this to find packages that are in both repos
#comm -12 <( find metadata/*.txt -printf '%f\n' | sort | uniq ) <( find ~/shroiddata/metadata/*.txt -printf '%f\n' | sort | uniq )

#! /bin/bash
for i in `grep -s -l '#Update Check Mode:' metadata/*.txt`
do N=`basename $i`
   CVC=$(sed -n 's/Current Version Code://p' ~/shroiddata/metadata/$N)
   sed -i "s/Current Version Code:[.0-9]*/Current Version Code:$CVC/" metadata/$N`
   CV=$(sed -n 's/Current Version://p' ~/shroiddata/metadata/$N)
   sed -i "s/Current Version:.*/Current Version:$CV/"  metadata/$N`
done
