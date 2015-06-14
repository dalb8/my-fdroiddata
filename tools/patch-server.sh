sed -i "/tarball.add(build_dir, tarname, exclude=tarexc)/d" $FDROIDSERVER/fdroidserver/build.py

sed -i "s/'gradle'\]\, 'clean'/'gradle'\]\, '-v'/g" $FDROIDSERVER/fdroidserver/build.py

# Enable for Linphone
#sed -i "s/'ant', 'clean'/'ant', '-version'/g" $FDROIDSERVER/fdroidserver/build.py

sed -i 's/"-s", dev, "install"/"install", "-r"/g' $FDROIDSERVER/fdroidserver/install.py

sed -i "/writefield('Auto Update Mode')/d" $FDROIDSERVER/fdroidserver/metadata.py

sed -i '/f.write(".\\n")/a\\t\tf.write("\\n")\n\t\tf.write("Current Version Code:9999999\\n\\n")' $FDROIDSERVER/fdroidserver/update.py
