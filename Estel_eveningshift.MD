
#Evening Shift
Every 30 min check
##### Reserve status (MIS-DB)
3:00--10:00
```
SELECT serial_number, current_status_id, previous_status_id, last_modify_date 
FROM vms_voucher 
WHERE current_status_id = 15 
ORDER BY last_modify_date;
```
(or)

```
select serial_number,current_status_id,previous_status_id,last_modify_date from vms_voucher where current_status_id = 15 order by 4;
```



#######
======================================================================
--> check internet speed and web portals check working properly or not

1. Voucher Generation Status (Generation Status wise count)
2. Generation and Activation Voucher Count of VMS softpin
3. Resource Monitoring Prod, Pre-prod (Shared to whatsapp)



# Voucher Generation status
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


STEP 5 : Generation and activation voucher count of VMS softpin.
Action: Check the generation and activation voucher count for VMS softpin using the query below on MIS DB (172.27.128.7):

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


##Resource Monitoring Prod, Pre-prod (Shared to whatsapp)


05:30

Web 1/2 .....
``` 
df -h ; free -h ; date; top ;ps -ef |grep tomcat ; ps -ef |grep redis ; service nginx status 
```
App-1/2 -
``` 
df -h ; free -h ; date ;top ;coreengine -l ; VMSBatchScheduler_digi_qa status 
```
MIS APP-
``` 
df -h ;free -h ; ps -ef |grep redis ; ps -ef |grep report ; date; top
```
Interface 1/2  
```
df -h ; free -h  ; date; top; ps -ef |grep tomcat ; ps -ef |grep redis ; service nginx status; modengine_digi -l 
```
DB1/2-
```
df -h ; free -h ; ps -ef |grep walsender ; date ;top
```
MISDB -
``` 
df -h ; free -h ;date ;top
```
	
=========================================================================================
# DB Replication Monitoring

``` 
ps -ef | grep walsender
```


### Check report generation/activation on below mount point (App1/App2/MISAPP)
5:45
```
cd /data/outbound/erp/activation_response/new;ls -lrth |wc -l
cd /data/inbound/erp/generation/new;ls -lrth
cd /data/inbound/erp/activation/new;ls -lrth
cd /data/outbound/dms/batch_file/new;ls -lrth
cd /data/outbound/dms/activation_response/new;ls -lrth
cd /data/outbound/dms/activation_response/new;ls -lrth
cd /data/outbound/erp/generation_response/new;ls -lrth |wc -l

```


4.VMS batch_schedular(MIS app)

```
VMSBatchScheduler_digi_qa status
```

6.Dynatrace top up controller (Symphony)
    
	

### Archival Report MIS_APP ###

```
cd /applogs/DIGVIJAY/VMS/PROCESS;ls -lrth
tail -f Archive_Table_Report_$(date +%F).csv

```
(or)
```
tail -f /applogs/DIGVIJAY/VMS/PROCESS/Archive_Table_Report_$(date +%F).csv
```





######## localhost_access_log.2026-02-25.txt ########
8:00-8:30
Need to check Tomcat request status count on on Web1/2 and Int 1 /2 server

```
cd /applogs/tomcat/logs; ls -lrth
tail -f localhost_access_log.$(date +%F).txt
cat localhost_access_log.$(date +%F).txt |wc -l 

```
example file (localhost_access_log.2026-03-01.txt (Date automatically Taken)
# int 02
```
cd /applogs/tomcat/log/ ; ls -lrth && tail -f localhost_access_log.$(date +%F).txt
cat localhost_access_log.$(date +%F).txt |wc -l 
```


###### catalina.out check to INT 01/02 ################
8:30
Need to check topup transaction on Int tomcat int 1/2 
cd /applogs/tomcat/logs; ls -lrth
cd /applogs/tomcat/logs ; tail -f catalina.out

#### Nginx access.log ##############
```
cd /var/log/nginx; ls -lrtsh
```





####Shift Once MS DB TPS

select to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date ,count(*) as TPS from vms_transaction where request_cts >= TO_TIMESTAMP('25/02/2026 00:00:00','DD/MM/YYYY HH24:MI:SS') and request_cts <= TO_TIMESTAMP('25/02/2026 23:59:59','DD/MM/YYYY HH24:MI:SS')group by 1 having count(*) >30;

## below mount points check app1

9:30 PM
```
cd /data/outbound/dms/used_vouchers/new;ls -lrth
cd /data/outbound/aep/product/new;ls -lrth
cd /data/outbound/aep/status/new;ls -lrth
cd /data/outbound/aep/product_cat/new;ls -lrth
cd /data/outbound/aep/operator/new;ls -lrth
cd /data/outbound/aep/voucher/new;ls -lrth
cd /data/outbound/rafm/voucher/new;ls -lrth
```

===========================================================


 

###Need to check Transaction timeout in splunk log  APP 1
9:30
```
cd /applogs/engine/coreengine
grep -i "Failure" digi_*_splunk.log
grep -i "Time out" digi_*_splunk.log

```

STEP:21 
Please run this query for Tps once the shift (Change Date) 
```
select to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date ,count(*) as TPS from vms_transaction where request_cts >= TO_TIMESTAMP('30/12/2024 00:00:00','DD/MM/YYYY HH24:MI:SS') and request_cts <= TO_TIMESTAMP('30/12/2024 23:59:59','DD/MM/YYYY HH24:MI:SS')group by 1 having count(*) >19;
```


```
select 
to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date,
count(*) as TPS 
FROM vms_transaction 
where request_cts >= TO_TIMESTAMP('01/03/2026 00:00:00','DD/MM/YYYY HH24:MI:SS') 
and request_cts <= TO_TIMESTAMP('01/03/2026 23:59:59','DD/MM/YYYY HH24:MI:SS')
group by 1 
having count(*) >19;

```
Please run this query for Duplicate Trasaction once the shift (Change Date) 

```
SELECT reference_transaction_id 
FROM public.vms_transaction
WHERE result_code = '0000'
  AND trans_type_code = 'TOPUP'
  AND DATE(transaction_cts) > '2025-02-16'
GROUP BY reference_transaction_id
HAVING COUNT(reference_transaction_id) > 1;
```

========================================
##Reconcillation (change_date)
```
SELECT 
    serial_number, 
    reference_transaction_id, 
    recharge_date, 
    recharge_by, 
    trans_id, 
    recon_result_desc, 
    is_settled 
FROM vms_trans_reconciliation 
WHERE DATE(recharge_date) >= '2026-02-06' 
ORDER BY recharge_date DESC;
```

(or) date taking Automatically

```
SELECT 
    serial_number, 
    reference_transaction_id, 
    recharge_date, 
    recharge_by, 
    trans_id, 
    recon_result_desc, 
    is_settled 
FROM vms_trans_reconciliation 
WHERE DATE(recharge_date) >= CURRENT_DATE
ORDER BY recharge_date DESC;
```

========================================================================================================

Please run this query for Tps once the shift
 select to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date ,count(*) as TPS from vms_transaction where request_cts >= TO_TIMESTAMP('30/12/2024 00:00:00','DD/MM/YYYY HH24:MI:SS') and request_cts <= TO_TIMESTAMP('30/12/2024 23:59:59','DD/MM/YYYY HH24:MI:SS')group by 1 having count(*) >19;


```
select 
to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date,
count(*) as TPS 
FROM vms_transaction 
where request_cts >= TO_TIMESTAMP('01/03/2026 00:00:00','DD/MM/YYYY HH24:MI:SS') 
and request_cts <= TO_TIMESTAMP('01/03/2026 23:59:59','DD/MM/YYYY HH24:MI:SS')
group by 1 
having count(*) >19;

```



* Search the below path log transaction 
Logs Path
1. Tomcat /applogs/tomcat/logs/
2. Mod /applogs/engine/modengine/
3. Core /applogs/engine/coreengine 

```
grep -i "Transaction_ID" *.log
```


=======================

# We are using PSSQL

```
SELECT CURRENT_DATABASE();

```


====================================================## 9:30 ## ==========

# Weekly_sheets update
1.Archival report 
2.Reconcillation 
3.TPS--int01/02 
4.hardpin vs softpin
5.Digicelicom evg report
6.Transaction SLA

## Weekly SHEET ARCHIVAL report(MIS-APP)

Change the date
```
cd /applogs/DIGVIJAY/VMS/PROCESS;ls -lrt
```
```
tail -f Archive_Table_Report_2026-02-28.csv
```



