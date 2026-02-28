
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


##Resource Monitoring Prod, Pre-prod (Shared to whatsapp)
05:30

Web 1/2
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
    
	
	


########### Archival Report APP 1 ###

```
cd /applogs/DIGVIJAY/VMS/PROCESS;ls -lrth
```







######## localhost_access_log.2026-02-25.txt ########
8:00-8:30
Need to check Tomcat request status count on on Web1/2 and Int 1 /2 server
```
cd /applogs/tomcat/logs; ls -lrth
tail -f localhost_access_log.2026-02-28.txt 
# ( change date )
cat localhost_access_log.2026-02-28.txt |wc -l 
#( change date )
```

cd /applogs/tomcat/logs; ls -lrth
tail -f localhost_access_log.2026-02-25.txt
cat localhost_access_log.2026-02-25.txt |wc -l 


###### catalina.out check to INT 01/02 ################
8:30
Need to check topup transaction on Int tomcat int 1/2 
cd /applogs/tomcat/logs; ls -lrth
cd /applogs/tomcat/logs ; tail -f catalina.out

#### Nginx access.log ##############
cd /var/log/nginx; ls -ltrs






####Shift Once MS DB TPS

select to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date ,count(*) as TPS from vms_transaction where request_cts >= TO_TIMESTAMP('25/02/2026 00:00:00','DD/MM/YYYY HH24:MI:SS') and request_cts <= TO_TIMESTAMP('25/02/2026 23:59:59','DD/MM/YYYY HH24:MI:SS')group by 1 having count(*) >30;

## below mount points check app1

9:30 PM
cd /data/outbound/dms/used_vouchers/new;ls -lrth
cd /data/outbound/aep/product/new;ls -lrth
cd /data/outbound/aep/status/new;ls -lrth
cd /data/outbound/aep/product_cat/new;ls -lrth
cd /data/outbound/aep/operator/new;ls -lrth
cd /data/outbound/aep/voucher/new;ls -lrth
cd /data/outbound/rafm/voucher/new;ls -lrth

===========================================================


 

###Need to check Transaction timeout in splunk log  APP 1
9:30

Path= cd /applogs/engine/coreengine
grep -i "Failure" digi_*_splunk.log
grep -i "Time out" digi_*_splunk.log


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

* Search the below path log transaction 
Logs Path
1. Tomcat /applogs/tomcat/logs/
2. Mod /applogs/engine/modengine/
3. Core /applogs/engine/coreengine 

```
grep -i "Transaction_ID" *.log
```



=======================
```

SELECT CURRENT_DATABASE();

```




