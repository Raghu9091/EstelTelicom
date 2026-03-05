1. cash Ref ID :- PO260303174613451



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


CDWALLET
Performance MONITORING

1. INT-01/02/03
```
hostname;date;w;uptime;df -h; fre -h;modengine_dd -l; service nginx satus; ps -ef|grep -i apache
```
2. APP-01/02/03
```
hostname;date;w;uptime;df -kh; fre -gh;coreengine_dd -l;for R in ErefillAuth ErefillRest ErefillRest_DWP ErefillScheduler;do echo "=====  $R  ======="
```
3. MIS-APP
```
date;w;df -h;free -h; systemctl status redis
```
4. Web:- 01/02
```
w;date;df -h; free -h;w;systemctl status nginx;
```

5. DB:- 01/02
```
date;df -h;free -h;w;hostname;ps -ef | grep walsender
```

6. MIS DB:

```
w;hostname;date;date;free -h; df -h
```


** APP server Checking status commands Services
/opt/estel/scripts/coreengine_dd -l
/opt/estel/scripts/ErefillAuth status

/opt/estel/scripts/ErefillRest status
/opt/estel/scripts/ErefillRest_DWP status


