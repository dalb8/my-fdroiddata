sed -i "/tarball.add(build_dir, tarname, exclude=tarexc)/d" fdroidserver/build.py
sed -i "s/'gradle'\]\, 'clean'/'gradle'\]\, '--help'/g" fdroidserver/build.py
#sed -i "/'ant'\, 'clean'/d" fdroidserver/build.py
sed -i 's/"install"/"install", "-r"/g' fdroidserver/install.py
