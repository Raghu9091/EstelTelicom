1. cash Ref ID :- PO260303174613451
2.hypercare ticket MONITORING
3.hourly monitoring error
4.datadog monitoring


L1. Monitoring:
================

IWP  https://cdwalletadmin.celcomdigi.com
DWP  https://cdwallet.celcomdigi.com:8443


2. Blockout Flag reset issue?
=================================================
3. top-up blackout We need to settle 8 transaction from cashin (shared by DMS):

DMSPO260303184214758
DMSPO260303180804439
DMSPO260303180802904
DMSPO260303180616912
DMSPO260303180551605
DMSPO260303175942044
DMSPO260303175940558
DMSPO260303175924521

After the Wallet top-up blackout scenario disabled, it got success
How do we settle them ?
==============================================
!! mail


CDWALLET
Performance MONITORING


1. INT-01/02/03
```
hostname;date;w;uptime;df -h; free -h;modengine_dd -l; systemctl status nginx ; ps -ef|grep -i apache
```
2. APP-01/02/03
```
hostname;date;w;uptime;df -kh;free -gh;coreengine_dd -l;for R in ErefillAuth ErefillRest ErefillRest_DWP ErefillScheduler; do echo "=====  $R ======="; $R status; done

df -h ;free -h ;hostname ;w;date;coreengine_dd -l;for s in ErefillAuth ErefillRest ErefillRest_DWP ErefillScheduler; do echo "===== $s ====="; $s status; done
```
Pre-prod
hostname;date;w;uptime;df -kh;free -gh;coreengine -l; for R in ErefillAuth ErefillRest ErefillRest_DWP ErefillScheduler; do echo "=====  $R ======="; $R status; done

3. MIS-APP
```
hostname;date;w;df -h;free -h; systemctl status redis;ErefillReport status
```
4. Web:- 01/02
```
hostname;w;date;df -h; free -h; systemctl status nginx;
```

5. DB:- 01/02
```

hostname;w;date;df -h;free -h;w;ps -ef | grep walsender
(or)
date;df -h;free -h;w;hostname;ps -ef | grep -i receiver
```

6. MIS DB:

```
hostname;date;w;free -h; df -h;Ere
```

satish.bandi@inforientasia.com
cd /applogs/engine/coreengine/ && grep -aRH 100939277 erefill_*_splunk*.log
cd /applogs/engine/coreengine/ && grep -aiRH "Transaction Not Found" erefill_*_splunk*.log
** APP server Checking status commands Services(Cyber Arc)

/opt/estel/scripts/coreengine_dd -l
/opt/estel/scripts/ErefillAuth status
/opt/estel/scripts/ErefillRest status
/opt/estel/scripts/ErefillRest_DWP status

# EFM throug cluster status:- shtvdwsdbapppro2 --(MIS-DB)
check date and uptime if somebody will ask.

```
/user/edb/efm-4.8/bin/efm cluster-status efm
```



# CR16671

select transaction_result_desc, count(*) from transaction where transaction_ctc BETWEEN '2026-06-05 00:00:00' AND '2026-06-05 23:59:59' group by 1 order by 2 desc;
 
select transaction_result_desc, count(*) from transaction where transaction_api_code='WALLETTOPUP' and transaction_ctc 
BETWEEN '2026-06-05 00:00:00' AND '2026-06-05 23:59:59' group by 1 order by 2 desc;


==========================
DB tasks check (primary, secondery, witness)
 /usr/edb/efm-4.8/bin/efm cluster-status efm  # view the status info