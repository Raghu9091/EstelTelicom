-- PROFILE
SELECT * FROM profile where profile_company_code='powner'

SELECT * FROM wallet where wallet_profile_id='373029'

Select * FROM suser limit 10;
Select * FROM status; --Table active codes 
Select * FROM api;


-- ledger
SELECT * FROM ledger 1 where 1_serial_no='1'





-- Reconsile
SELECT * FROM reconsile where reconsile_main_serial_no='106276397'
SELECT * FROM reconsile order by 1 desc;

select * from reconsile r where reconsile_ref_serial_no is null and r.reconsile_retry_counter not in (3) order by 1 desc limit 20;

--  Error in DB
select t.transaction_request_ts,t.transaction_amount,* from transaction t where   t.transaction_result_desc in ('Error in DB') order by transaction_serial_no desc limit 20;
 



--Transaction 

-- data fetching quary kamal has given retailer check CD-WALLAET

SELECT *
FROM "transaction" t
WHERE t.transaction_ext_trans::text LIKE '%CBS:118100321%' -- change the as per requirement CBS
  AND t.transaction_ctc >= CURRENT_DATE - INTERVAL '1 day'
  AND t.transaction_ctc < CURRENT_DATE
ORDER BY t.transaction_ctc DESC;

-- serial NUMBER
SELECT * FROM transaction 
WHERE transaction_serial_no='10002765' --replace your transaction 

-- mobile 

SELECT transaction_from_code,
       transaction_api_code,
       transaction_to_msisdn,
       transaction_payment_method,
       transaction_amount,
       transaction_product_code
FROM transaction
WHERE transaction_to_msisdn = '0168134599';


-- BILLPAY SR557876 (the perticular time range AND t.transaction_ctc BETWEEN '2026-03-03 00:00:00' AND '2026-03-17 23:59:59')

SELECT *
FROM "transaction" t
WHERE t.transaction_api_code = 'BILLPAY'
  AND t.transaction_ctc >= DATE '2026-03-03'
  AND t.transaction_ctc < DATE '2026-03-18'
ORDER BY t.transaction_ctc DESC;

-- o/p want to file location
\o /tmp/output_.txt
SELECT * FROM transaction;
\o

-- amount 