-- 1. SQL Duplicate Transaction (single line comment)
--------------------------
SELECT reference_transaction_id 
FROM public.vms_transaction 
where result_code='0000' and trans_type_code='TOPUP' and date(transaction_cts) > '2026-03-8' 
group by reference_transaction_id HAVING count(reference_transaction_id)>1;

/*
o/p
 reference_transaction_id
--------------------------
(0 rows)
the multi-line-comment
*/

==================================================

-- 2.for TPS count Quary (ChangeDate)

select to_char(request_cts,'mm/dd/yyyy hh24:mi:ss AM') as date ,count(*) as TPS 
FROM vms_transaction
WHERE request_cts >= TO_TIMESTAMP('11/03/2026 00:00:00','DD/MM/YYYY HH24:MI:SS') and request_cts <= TO_TIMESTAMP('11/03/2026 23:59:59','DD/MM/YYYY HH24:MI:SS')
group by 1 
having count(*) >12;

/* 
 o/p
          date          | tps
------------------------+-----
 03/11/2026 00:15:00 AM |  14
 03/11/2026 07:51:21 AM |  13
 03/11/2026 08:27:28 AM |  14
 03/11/2026 07:38:51 AM |  13
 03/11/2026 07:37:56 AM |  13
 03/11/2026 07:41:26 AM |  13
 03/11/2026 00:40:53 AM |  19
 03/11/2026 08:26:37 AM |  13
 03/11/2026 00:47:33 AM |  14
 03/11/2026 08:01:00 AM |  14
 03/11/2026 00:42:23 AM |  13
 03/11/2026 00:30:16 AM |  14
*/

=========================================================================================

-- 3. user active or inactive checking quary.(internal_Portal also check)
SELECT user_code, user_first_name, status_id
FROM vms_user_profile
WHERE user_code IN (
'V17163X',
'V17161X',
'V17155X',
'V17151X',
'V17145X',
'V17235X',
'V17233X',
'V17263X',
'V16853X',
'V17105X',
'V17098X',
'V17096X',
'V17548X',
'V17552X',
'V17504X',
'V17502X',
'V17487X',
'V17484X',
'V17489X',
'V17462X',
'V17760X',
'V17587X',
'V17644X',
'V17630X',
'V17607X',
'V17604X',
'V17424X',
'V17421X',
'V17417X',
'V17563X',
'V17569X',
'V17565X',
'V17549X',
'V17710X'
);

-- 5= active, 6= inactive
select  user_first_name ,user_code, status_id from vms_user_profile where user_code ='V17565X';

-- single user check
select user_code,trans_id,trans_type_code,value,channel_code,product_code, voucher_serial_number,comments,transaction_cts 
from vms_transaction where user_code ='V18155X';

-- 



-- data fetching quary kamal has given retailer check CD-WALLAET
SELECT *
FROM "transaction" t
WHERE t.transaction_ext_trans::text LIKE '%CBS:118100321%' -- change the as per requirement CBS
  AND t.transaction_ctc >= CURRENT_DATE - INTERVAL '1 day'
  AND t.transaction_ctc < CURRENT_DATE
ORDER BY t.transaction_ctc DESC;



====================================================================