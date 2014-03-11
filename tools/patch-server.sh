sed -i "/tarball.add(build_dir, tarname, exclude=tarexc)/d" $FDROIDSERVER/fdroidserver/build.py

sed -i "s/'gradle'\]\, 'clean'/'gradle'\]\, '--help'/g" $FDROIDSERVER/fdroidserver/build.py
sed -i "s/'ant', 'clean'/'ant', '-version'/g" $FDROIDSERVER/fdroidserver/build.py

sed -i 's/"-s", dev, "install"/"install", "-r"/g' $FDROIDSERVER/fdroidserver/install.py

sed -i "/writefield('Auto Update Mode')/d" $FDROIDSERVER/fdroidserver/metadata.py
