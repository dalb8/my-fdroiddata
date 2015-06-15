# Copyright (c) 2014 David Black.
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


# Might need to use a mid-2014 fdroidserver commit

#! /bin/bash
fdroid checkupdates --gplay 2>&1 | tee logs/gplay-$(date +%d%m%Y).log
sed -i '/same version/d;/not in the Play Store/d;/Varies with device/d' logs/gplay-$(date +%d%m%Y).log

