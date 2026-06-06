
# channel info checking traffic
grep 'data  send  to dte' digi_*_moderator_20260312_*.log | cut -d ',' -f4,5 | sort | uniq -c

o/P
===
[t1-ops-v6970@shtvvmsnvispr01 modengine]$ grep 'data  send  to dte' digi_*_moderator_20260312_*.log | cut -d ',' -f4,5 | sort | uniq -c
   2701 "channel":{"id":"201","name":"UMB"}
    424 "channel":{"id":"208","name":"OCS"}
  40346 "channel":{"id":"223","name":"NGCA"}
 144203 "channel":{"id":"24","name":"UMB"}
  16379 "channel":{"id":"26","name":"OCS"}
      5 "channel":{"id":"500001","name":"CLA"}
     43 "channel":{"id":"500003","name":"Valyou helloSim"}
   2929 "channel":{"id":"500007","name":"PG"}
   

-- checking voucher status

SELECT a.current_status_id, b.description, COUNT(*)
FROM vms_voucher a, vms_status b
WHERE a.current_status_id = b.id
AND serial_number BETWEEN 35081505211200764721 AND 35081505211200764750
GROUP BY 1,2;



To Check Voucher status and ID : ( From Backend )
===========================
 
 
select * 
from vms_voucher_status_change where id in (select voucher_status_change_id from vms_voucher_status_change_detail where from_serial_number ='31052601129800149408');