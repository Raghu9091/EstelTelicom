1. cash Ref ID :- PO260303174613451

https://cdwalletadmin.celcomdigi.com

IWP   https://cdwalletadmin.celcomdigi.com/#/feature/search/search-transaction

DWP  https://cdwallet.celcomdigi.com:8443




Every one using DB credentials
================================
User: db_readonly
Password: D6L1@202b#!

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
hostname;date;w;uptime;df -h; fre -h;coreengine_dd -l;
```
3. MIS-APP
```
date;w;df -h;free -h; systemctl status redis
```
4. Web:- 01/02
```
date;df -h; free -h;w;systemctl status nginx;
```

5. DB:- 01/02
```
date;df -h;free -h;w;hostname;ps -ef | grep walsender
```

6. MIS DB:

```
w;hostname;date;date;free -h; df -h
```
