-- TABLES
	*vms_Channel
	*vms_oparator
	*vms_product --> Erp codes checlk
	*vms_product_category --> Softpin or hard pin check
	*vms_transaction
	*vms_voucher
	*vms_trans_reconciliation -- reserve state checking table


PGPASSWORD='monitor@123#' psql -d vms_digi  -U digi_monitor




vms_order
-- 1. SQL Duplicate Transaction (single line comment) change date
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
==========================================================================================================
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

*/

=========================================================================================================================

--3. user_profile active or inactive checking quary.(internal_Portal also check)

SELECT user_code, user_first_name, status_id
FROM vms_user_profile
WHERE user_code IN (
'V18777X');

=====================================================
-- Application users checking  EWP 

SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id WHERE u.user_code LIKE ANY (ARRAY['%V17434X%','%V17403X%','%V17426X%','%V17413X%','%V17415X%','%V17417X%','%V17419X%','%V17420X%']);

 user_first_name | user_code | user_status | trans_type_code | channel_code | comments | transaction_cts
-----------------+-----------+-------------+-----------------+--------------+----------+-----------------
 MOHD SYAHRIL             | V17421X   | Active      | VOUCHERSTATUSINQUIRY      | EWP          | Search Voucher Inquiry Response  | 14-MAR-26 12:34:25.213
 Yuhanis                  | V17448X   | Active      | DELETEBLACKLISTSUBSCRIBER | IWP          | Delete Query Black List Subscriber Response | 11-FEB-26 10:19:44.397
(2 rows)



SELECT user_code, status_id FROM vms_user_profile WHERE user_code LIKE ANY (ARRAY['%V17434X%','%V17403X%','%V17426X%','%V17413X%','%V17415X%','%V17417X%','%V17419X%','%V17420X%']);

o/p

 user_code | status_id(5=active 6= Inactive 4= delete)
-----------+-----------
 V17417X   |         5
 
 V17417X   |
 =================================================
 
(1 row)
-- user_profile status check
select * from v_all_usr where username='V19549X';

-- 5= active, 6= inactive
select  user_first_name ,user_code, status_id from vms_user_profile where user_code ='V17565X';


===================================================
-- product type hard =5 soft=6 (in portal face value )
select * from vms_voucher limit 1; -- final table

select * from vms_transaction limit 10;

====================================================

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



===========================================================================================================
-- whatsapp lock the vouchern then ask id status, checking  (Reason_ID check below quary)

select * from vms_voucher_status_change 
where id in (select voucher_status_change_id from vms_voucher_status_change_detail where from_serial_number ='33580006311400354043');

-
- Anjali:- voucher status check (lock/active/genarate) --> updating vocher 15 min taking time for updating 

SELECT
    a.serial_number,
    a.current_status_id,
	a.product_type_id,
    b.description,
    a.last_modify_date
FROM
    vms_voucher a
JOIN
    vms_status b
    ON a.current_status_id = b.id
WHERE
    a.serial_number IN ('10283727110004317462')

(or)

-- checking range ganerated and activated..of vouchers WAR ROOM

select current_status_id,description,activation_date,count(*) 
from vms_voucher a,vms_status b 
where a.current_status_id=b.id and serial_number between 10001278129800000001 and 10001278529800009000 group by 1,2,3;


-- Rahul suggested war room voucher genarated count status is high..

select current_status_id,description,count(*)  from vms_voucher a,vms_status b where a.current_status_id=b.id and serial_number between 10001278429800000001 and 10001278429800002300 group by 1,2;

(or)

select current_status_id,description,count(*)  from vms_voucher a,vms_status b where a.current_status_id=b.id group by 1,2;

========================================================================================================================================================

mail : RE:  Transactions went into reconciliation 16-May
-- vouchers check mail
 SELECT
    is_settled,
    COUNT(*)
FROM vms_trans_reconciliation
WHERE DATE(request_cts) = '2026-06-02'
GROUP BY 1;

 is_settled | count
------------+-------
 F          |    36
 T          |   362
(2 rows)

-------

SELECT CASE WHEN optional1 IN (100006000, 101006000) THEN 'Xc' WHEN optional1 = 102 THEN 'Xd' END AS optional_label, is_settled, COUNT(*) AS count
FROM vms_trans_reconciliation a JOIN vms_voucher b ON a.serial_number = b.serial_number JOIN vms_status c ON b.current_status_id = c.id 
WHERE date(a.recharge_date) = '2026-06-02' AND optional1 IN (102, 100006000, 101006000) GROUP BY optional_label, is_settled ORDER BY optional_label, is_settled;
 optional_label | is_settled | count
----------------+------------+-------
 Xc             | F          |    36
 Xc             | T          |   167
 Xd             | T          |   195
(3 rows)

(or)

-- time
Select serial_number,reference_transaction_id,recharge_date,recharge_by,trans_id,recon_result_desc,is_settled 
from vms_trans_reconciliation 
where date(recharge_date)>='2026-05-31' 
order by 3 desc;

--------------------------------------------------------