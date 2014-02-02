awk '{$0=$2." "$1" "$3; print $0}' stats/total_downloads_app.txt |sort -nr 
