#! /bin/bash
fdroid checkupdates --gplay 2>&1 | tee logs/gplay-$(date +%d%m%Y).log
sed -i '/same version/d;/not in the Play Store/d;/Varies with device/d' logs/gplay-$(date +%d%m%Y).log

