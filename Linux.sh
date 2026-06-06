Linux commands
VMS ---> interface
# how many channels canme requests showing below cmd. (current traffic) 

grep 'data  send  to dte' digi_*_moderator_20260312_*.log | cut -d ',' -f4,5 | sort | uniq -c




# using the file asking some 
find /data -name "*VMS_VOUCHER*" 2>/dev/null

du -shx *  # space checking which one is consuming high
