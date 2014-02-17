sed -i "/tarball.add(build_dir, tarname, exclude=tarexc)/d" ~/fdroidserver/fdroidserver/build.py

sed -i "s/'gradle'\]\, 'clean'/'gradle'\]\, '--help'/g" ~/fdroidserver/fdroidserver/build.py
sed -i "s/'ant', 'clean'/'ant', '-version'/g" ~/fdroidserver/fdroidserver/build.py

sed -i 's/"-s", dev, "install"/"install", "-r"/g' ~/fdroidserver/fdroidserver/install.py
