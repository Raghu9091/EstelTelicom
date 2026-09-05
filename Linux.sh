Linux commands
VMS ---> interface
# how many channels canme requests showing below cmd. (current traffic) 

grep 'data  send  to dte' digi_*_moderator_20260312_*.log | cut -d ',' -f4,5 | sort | uniq -c



# APP Rahul 7 Abhilash authentication failed (recharge card not supported )
grep -i '1001' digi_*_splunk.log | cut -d '|' -f13,15 | sort | uniq -c | sort -nr |head -20









# using the file asking some 
find /data -name "*VMS_VOUCHER*" 2>/dev/null

du -shx *  # space checking which one is consuming high
df -h /
du -xh --max-depth=1 /opt/path |sort -rh |head -10  # high cosuption files





=================================================================================
1.	Lock the user account :
#usermod -L <username>
passwd -S <username>  #Validate user ID is locked :
 
2.	Expire the account:
#chage -E 0 <username>

Validate password expiry :
# chage -l <username>

=================================================================================

AGi : -- Reserch of Ai in machine


 pwd
 cd ..
 pwd
 ls -lrth
 cd ErefillRest
 ls -lrth
 cd /
 coreengine  –l
 coreengine_dd
 coreengine -l
 ErefillRest  stop
 ErefillRest  start
 ErefillRest_DWP stop
 ErefillRest_DWP start
 ErefillAuth stop
 ErefillAuth start
 coreengine –d erefill
 coreengine -d
 coreengine -s
 coreengine -l
 coreengine -d erefill
 coreengine -s erefill
 coreengine -l
 coreengine -restart all
 coreengine -r all
 coreengine -l
 coreengine -s erefill
 
 
 
 
 SELECT transaction_from_code,
       transaction_api_code,
       transaction_to_msisdn,
       transaction_payment_method,
       transaction_amount,
       transaction_product_code
FROM transaction
WHERE transaction_to_msisdn = '60178825229';
