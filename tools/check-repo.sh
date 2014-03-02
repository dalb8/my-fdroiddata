#! /bin/bash
fdroid checkupdates 2>&1 | tee logs/repo-$(date +%d%m%Y).log
sed -i '/up to date/d;/Finished/d' logs/repo-$(date +%d%m%Y).log

