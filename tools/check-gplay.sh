#! /bin/bash
fdroid checkupdates --gplay 2>&1 | tee logs/gplay-$(date +%d%m%Y).log
sed -i '/same version/d' logs/gplay-$(date +%d%m%Y).log
