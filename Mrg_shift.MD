Morning_Shift

*** Hourly Transaction count and Error Monitoring.
*** Share VMS Hourly Count Report in Digi MS Support Skype Group.
*** Service Request and Incident Monitoring
*** Reconciliation Monitoring
*** Reserve Status and 
*** DB Repllication Status.
  
# Reconsillation
```
select serial_number,reference_transaction_id,recharge_date,recharge_by,trans_id,recon_result_desc,is_settled from vms_trans_reconciliation where date(recharge_date)>='2026-03-17' order by 3 desc;
``` 
 
# Every 30 min check


**  Reserve status (MIS-DB)
```
SELECT serial_number, current_status_id, previous_status_id, last_modify_date 
FROM vms_voucher 
WHERE current_status_id = 15 
ORDER BY last_modify_date;
```

===============================================

** Voucher Generation status

```
SELECT 
    b.description, 
    COUNT(*) AS total_batches, 
    SUM(a.batch_quantity) AS Voucher_Count
FROM vms_order_batches a
INNER JOIN vms_status b ON a.batch_process_status = b.id
GROUP BY b.description
ORDER BY b.description;
```

** Generation and activation voucher count of VMS softpin.

```
SELECT 
    current_status_id,
    CASE 
        WHEN generation_method_id IN (1, 2) THEN 'VMS' 
        WHEN generation_method_id IN (3, 4) THEN 'UVC' 
    END AS UVC_VMS, 
    CASE 
        WHEN product_type_id = 5 THEN 'Hard Pin' 
        WHEN product_type_id = 6 THEN 'Soft Pin' 
    END AS Pin_type,
    COUNT(*)
FROM vms_voucher 
WHERE current_status_id IN (10, 11) 
  AND product_type_id = 6 
  AND generation_method_id IN (1, 2)
GROUP BY 1, 2, 3;
```


**  Archival Report (MIS_APP) 
 
```
tail -f /applogs/DIGVIJAY/VMS/PROCESS/Archive_Table_Report_$(date +%F).csv
```


** Check report generation/activation on below mount point (App1)/App2

```
cd /data/outbound/erp/activation_response/new;ls -lrth |wc -l
cd /data/inbound/erp/generation/new;ls -lrth
cd /data/inbound/erp/activation/new;ls -lrth
cd /data/outbound/dms/batch_file/new;ls -lrth
cd /data/outbound/dms/activation_response/new;ls -lrth
cd /data/inbound/dms/activation/new;ls -lrth
cd /data/outbound/erp/generation_response/new;ls -lrth |wc -l
```

** DB Replication Monitoring APP 1(Primary)

``` 
ps -ef | grep walsender
```
(or)DB 02 replicate below 
```
ps -ef | grep -i receiver
```


============================================================


** Please check vms_process_status in prod & preprod MIS DB

```
select * from vms_process_status where status = 'Running';
```


** Please run this query for Tps once the shift
```
select to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date ,count(*) as TPS 
FROM vms_transaction where request_cts >= TO_TIMESTAMP('14/03/2026 00:00:00','DD/MM/YYYY HH24:MI:SS') 
AND request_cts <= TO_TIMESTAMP('14/03/2026 23:59:59','DD/MM/YYYY HH24:MI:SS')
GROUP BY 1 having count(*) >19;

```

** Duplicate Transaction Finding(YYYY-MM-DD)

```
SELECT reference_transaction_id 
from public.vms_transaction 
where result_code='0000' and trans_type_code='TOPUP' and date(transaction_cts) > '2026-03-14' 
group by reference_transaction_id 
HAVING count(reference_transaction_id)>1;

```



** localhost_access

** Need to check Tomcat request status count on on Web1/2 and Int 1 /2 server

```
cd /applogs/tomcat/logs; ls -lrth
tail -f localhost_access_log.$(date +%F).txt
```

-- int 02

```
cd /applogs/tomcat/log/ ; ls -lrth && tail -f localhost_access_log.$(date +%F).txt
cat localhost_access_log.$(date +%F).txt |wc -l 
```


###### catalina.out check to INT 01/02 ################
8:30
Need to check topup transaction on Int tomcat int 1/2 
cd /applogs/tomcat/logs; ls -lrth

```
cd /applogs/tomcat/logs && tail -f catalina.out
```

#Nginx access.log (Web 01/02, Int 01/02)
9:00
```
cd /var/log/nginx; ls -lrtsh && tail -f access.log
```

** Timeout & timeout in splunk log  APP 1 and APP 2

```
cd /applogs/engine/coreengine; ls -lrth
grep -i "Failure" digi_*_splunk.log
grep -i "Time out" digi_*_splunk.log
```
or

```
tail -f digi_*_splunk.log
```







grep -aRH "\[F788BC035AD5442EB5233EF\]" erefill_*


** memory percentage calculate
# top or htop

free | awk 'FNR==2{printf "Memory Usage: %.2f%%\n", $3/$2*100}'

awk '/MemTotal/ {total=$2} /MemAvailable/ {available=$2} END {printf "Memory Usage: %.2f%%\n", (total-available)/total*100}' /proc/meminfo