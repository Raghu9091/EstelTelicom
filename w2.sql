
# Table Names
  * Profile
  * transaction
  * Suser
  * wallet
  * status (select * from ) --- error checking this table
  * api  (how many api we have )
  

1. --Rahul :- For retrieving the wallet transaction report for a day:
 
select * 
from report_sales_journal_report('03/13/2026 00:00:00','03/13/2026 23:59:59', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 'all', 100000);


2. -- Abhilash Duplicate trasaction found will inform internally (5 times in shift)

SELECT transaction_v4,
       transaction_amount,
       COUNT(*) AS transaction_count
FROM transaction
WHERE transaction_api_code = 'WALLETTOPUP'
  AND transaction_result_code = '0'
  AND transaction_v4 IS NOT NULL
  AND transaction_v4 <> ''
  AND transaction_ctc LIKE '28-MAY-26%'
GROUP BY transaction_v4, transaction_amount
HAVING COUNT(*) > 1
ORDER BY transaction_v4, transaction_amount;



3. -- this query for Duplicate check

SELECT transaction_external_ref_id,
       COUNT(*) AS transaction_count
FROM transaction
WHERE transaction_api_code = 'WALLETTOPUP'
  AND transaction_result_code = '0'
  AND transaction_external_ref_id IS NOT NULL
  AND transaction_external_ref_id <> ''
  AND TRUNC(transaction_ctc) = TO_DATE('28-MAY-2026', 'DD-MON-YYYY')
GROUP BY transaction_external_ref_id
HAVING COUNT(*) > 1
ORDER BY transaction_external_ref_id;

(or)

SELECT 
    transaction_external_ref_id, 
    COUNT(*) 
FROM transaction
WHERE transaction_result_code IN ('2038')
  AND transaction_api_code = 'WALLETTOPUP'
  AND transaction_ctc BETWEEN 
      '2026-04-26 00:00:00' 
      AND '2026-04-26 23:59:59'
GROUP BY transaction_external_ref_id
HAVING COUNT(*) > 1
ORDER BY 2 DESC;


4. -- Gyan

SELECT transaction_ctc,
       transaction_api_code,
       transaction_external_ref_id,
       transaction_v4 AS "PO_NUMBER",
       transaction_ext_client_name AS "SALES_ORDER",
       transaction_from_code,
       transaction_to_code,
       transaction_amount,
       transaction_result_desc
FROM transaction
WHERE transaction_api_code = 'WALLETTOPUP'
  AND transaction_result_code = '0'
  AND transaction_external_ref_id IS NOT NULL
  AND transaction_ctc >= TRUNC(SYSDATE)
  AND transaction_ctc < TRUNC(SYSDATE) + 1
  AND transaction_external_ref_id IN (
        SELECT transaction_external_ref_id
        FROM transaction
        WHERE transaction_api_code = 'WALLETTOPUP'
          AND transaction_result_code = '0'
          AND transaction_external_ref_id IS NOT NULL
          AND transaction_ctc >= TRUNC(SYSDATE)
          AND transaction_ctc < TRUNC(SYSDATE) + 1
        GROUP BY transaction_external_ref_id
        HAVING COUNT(*) > 1
  )
ORDER BY transaction_external_ref_id, transaction_ctc;


5. -- Recon status quary (Change Date) kamal (RECON03)

SELECT
    reconsile_main_serial_no,
    reconsile_status_code,
    reconsile_error_code,
    COUNT(*) AS record_count
FROM
    reconsile
WHERE
    reconsile_created_date BETWEEN '2026-05-07 00:00:00' AND '2026-05-07 23:59:59' 
GROUP BY
    reconsile_main_serial_no,
    reconsile_status_code,
    reconsile_error_code
ORDER BY
    record_count DESC;


6. -- Stuck any transaction stuck (check the schedular is running or not) RECON01

SELECT
    reconsile_main_serial_no,
    reconsile_ref_serial_no,
    reconsile_error_code,
    reconsile_retry_counter,
    reconsile_created_date,
    reconsile_change_date,
    reconsile_response_cts,
    reconsile_status_code
FROM reconsile
WHERE DATE(reconsile_created_date) >= '2026-05-28' and reconsile_status_code ='RECON01'
ORDER BY reconsile_created_date DESC;


7. DB 

8. --api code wise check

SELECT 
    transaction_result_desc, 
    COUNT(*) 
FROM transaction
WHERE transaction_api_code = 'WALLETTOPUP'
  AND transaction_ctc BETWEEN 
      '2026-04-26 00:00:00' 
      AND '2026-04-26 23:59:59'
GROUP BY 1
ORDER BY 2 DESC;

9. -- Reload check (change mobile number)
select transaction_initiator,transaction_amount,transaction_request_ts,transaction_to_msisdn,transaction_result_desc,* from transaction 
where date(transaction_request_ts)='2026-05-01' and transaction_to_msisdn in ('60134770094')


============================================================================================
-- Sukraj 
select * from profile where profile_passport_id ='WDS24966'
 
 
select * from suser where suser_company_code ='DS002A1209' ---suser_identity_id
 
select * from suser where suser_identity_id = '369974'
 
='90166131926' ---suser_identity_id
 
select * from wallet where wallet_profile_id ='90166131926' ----1,main,2 Sales,3 Kiosk
 
select * from transaction where transaction_from_code ='369974' order by "transaction".transaction_ctc  
 
 
and transaction_ctc >='2026-03-14'
and transaction_ctc <'2026-03-15'  order by transaction_ctc
 
select * from ledger where l_serial_no   in ('101504931','101508429')
 
='101504931'
 
and transaction_amount ='293.20'
 
where
transaction_subsmsisdn ='60132963548'
and transaction_ctc >='2026-03-20'
and transaction_ctc <='2026-03-21'
 
 
transaction_from_code = 'BSS10925' and transaction_ctc >='2026-03-20'
and transaction_ctc <='2026-03-21' and transaction_amount  > 0 order by transaction_ctc


======================================================

