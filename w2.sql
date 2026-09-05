
# Table Names
  * Profile --company code
  * transaction
  * Suser
  * wallet
  * status (select * from ) --- error checking this table
  * api  (how many api we have )
  * general_ledger -- ammount check)
  * application_channel (58 channels is availabe in this table)
  

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
  AND transaction_ctc LIKE '08-AUG-26%'
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
  AND TRUNC(transaction_ctc) = TO_DATE('05-JUN-2026', 'DD-MON-YYYY')
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
      '2026-06-16 00:00:00' 
      AND '2026-06-16 23:59:59'
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
    reconsile_created_date BETWEEN '2026-08-08 00:00:00' AND '2026-08-08 23:59:59'
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
WHERE DATE(reconsile_created_date) >= '2026-08-17' and reconsile_status_code ='RECON01'
ORDER BY reconsile_created_date DESC;



-- Recon04  Time-Out

SELECT reconsile_main_serial_no,reconsile_ref_serial_no,reconsile_status_code,reconsile_created_date,reconsile_response_cts,reconsile_error_code FROM reconsile ORDER BY reconsile_main_serial_no DESC LIMIT 20; \watch 20
 
select count(*) from reconsile where reconsile_status_code='RECON03' and date(reconsile_created_date)='2026-06-19';
 
UPDATE reconsile SET reconsile_status_code='RECON03' where reconsile_status_code='RECON01' and reconsile_error_code='500';
 

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

--Surjith giving errors find AND Duplicate 

select transaction_result_desc, count(*) from transaction where transaction_ctc BETWEEN '2026-08-04 00:00:00' AND '2026-08-04 23:59:59' group by 1 order by 2 desc;
 
 
 
select transaction_result_desc, count(*) from transaction where transaction_api_code='WALLETTOPUP' and transaction_ctc 
BETWEEN '2026-08-04 00:00:00' AND '2026-07-23 23:59:59' group by 1 order by 2 desc;

o/P
 transaction_result_desc | count
-------------------------+-------
 Success                 | 19852
(1 row)

=======================================

SELECT transaction_external_ref_id,transaction_from_msisdn,transaction_result_desc,transaction_initiator,transaction_from_code, transaction_from_name, transaction_to_msisdn, transaction_product_code,transaction_product_type_code,transaction_ctc, transaction_serial_no,transaction_api_code,transaction_application_channel_code, transaction_payment_method,transaction_remark, transaction_amount 
FROM transaction where transaction_api_code ='RELOAD' AND transaction_result_desc='Success'AND transaction_external_ref_id in ('CDW000140120794');


Daily voucher statistics reports:
----------------------------------
SELECT reporting_date AS "Reporting Date", package_id AS "Package ID", v_partnercode AS "Partner Code", partner_name AS "Partner Name", voucher_beid AS "Voucher BE ID", v_product_type AS "Product Type", voucher_status AS "Voucher Status", quantity AS "Quantity", facevalue AS "Face Value(RM)", total_rechargeamt AS "Recharge Value(RM)", (quantity * facevalue) AS "Total Face Value Amount(RM)", total_rechargeamt AS "Total Recharge Amount(RM)" FROM report_digivms_daily_voucherstatus_statistics_test('31/03/2026','31/03/2026','all','all')



SELECT * FROM transaction t WHERE t.transaction_initiator = '10565024' ORDER BY t.transaction_request_ts DESC LIMIT 1;


--hourly count Status (total not giving currectly)
SELECT
    COALESCE(hour, 'TOTAL') AS "Hour",
    SUM(total) AS "Total",
    SUM(success) AS "Success",
    SUM(failure) AS "Failure"
FROM (
    SELECT
        to_char(date_trunc('hour', transaction_ctc), 'HH24:MI') AS hour,
        COUNT(*) AS total,
        COUNT(*) FILTER (WHERE transaction_result_desc = 'Success') AS success,
        COUNT(*) FILTER (WHERE transaction_result_desc <> 'Success') AS failure
    FROM transaction
    WHERE transaction_ctc BETWEEN '2026-07-23 00:00:00'
                              AND '2026-07-23 23:59:59'
    GROUP BY date_trunc('hour', transaction_ctc)

    UNION ALL
    SELECT
        NULL,
        COUNT(*),
        COUNT(*) FILTER (WHERE transaction_result_desc = 'Success'),
        COUNT(*) FILTER (WHERE transaction_result_desc <> 'Success')
    FROM transaction
    WHERE transaction_ctc BETWEEN '2026-07-23 00:00:00'
                              AND '2026-07-23 23:59:59'
) t
GROUP BY ROLLUP(hour)
HAVING hour IS NOT NULL OR GROUPING(hour) = 1
ORDER BY
    CASE WHEN hour IS NULL THEN 1 ELSE 0 END,
    hour;
	
(or)


SELECT
    COALESCE(to_char(date_trunc('hour', transaction_ctc), 'HH24:MI'), 'TOTAL') AS "Hour",
    COUNT(*) AS "Total",
    COUNT(*) FILTER (WHERE transaction_result_desc = 'Success') AS "Success",
    COUNT(*) FILTER (WHERE transaction_result_desc <> 'Success') AS "Failure"
FROM transaction
WHERE transaction_ctc BETWEEN '2026-07-23 00:00:00'
                          AND '2026-07-23 23:59:59'
GROUP BY ROLLUP(date_trunc('hour', transaction_ctc))
ORDER BY
    CASE
        WHEN date_trunc('hour', transaction_ctc) IS NULL THEN 1
        ELSE 0
    END,
    date_trunc('hour', transaction_ctc);

-- 
--- channel wise traffic check wallet (Anjali) 

SELECT transaction_application_channel_code,
       COUNT(*) cnt
FROM transaction
WHERE transaction_request_ts BETWEEN '2026-08-12 00:00:00'
                                AND '2026-08-12 23:59:59'
GROUP BY transaction_application_channel_code
ORDER BY cnt DESC;


-- sukhraj top 7 errors

SELECT transaction_result_code AS "Error_Code", transaction_result_desc AS "Error_Description", COUNT(*) AS "Error_Count" FROM transaction WHERE transaction_result_code <> '0' AND transaction_ctc >= TO_TIMESTAMP('2026-08-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND transaction_ctc < TO_TIMESTAMP('2026-08-21 23:59:59', 'YYYY-MM-DD HH24:MI:SS') GROUP BY transaction_result_code, transaction_result_desc ORDER BY "Error_Count" DESC LIMIT 7;