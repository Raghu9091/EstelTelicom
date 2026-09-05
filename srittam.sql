 SELECT
     COALESCE(u.user_code, 'UNKNOWN') AS partner_code,
     COALESCE(u.user_first_name || ' ' || u.user_last_name, 'UNKNOWN') AS partner_name,

     COUNT(*) FILTER (
    ) AS may_cnt,

    COUNT(*) AS total_activated

         WHERE DATE_TRUNC('month', v.activation_date) = DATE '2026-01-01'
     ) AS jan_cnt,

     COUNT(*) FILTER (
         WHERE DATE_TRUNC('month', v.activation_date) = DATE '2026-02-01'
     ) AS feb_cnt,

     COUNT(*) FILTER (
         WHERE DATE_TRUNC('month', v.activation_date) = DATE '2026-03-01'
     ) AS mar_cnt,

     COUNT(*) FILTER (
         WHERE DATE_TRUNC('month', v.activation_date) = DATE '2026-04-01'
     ) AS apr_cnt,

     COUNT(*) FILTER (
         WHERE DATE_TRUNC('month', v.activation_date) = DATE '2026-05-01'
     ) AS may_cnt,

     COUNT(*) AS total_activated

 FROM vms_voucher v
 LEFT JOIN vms_user_profile u
        ON u.id = v.activated_by

 WHERE v.current_status_id = 11
   AND v.activation_date >= DATE '2026-01-01'
   AND v.activation_date < DATE '2026-06-01'

 GROUP BY
     u.user_code,
     u.user_first_name,
     u.user_last_name

 ORDER BY total_activated DESC;
     partner_code     |                        partner_name                         | jan_cnt | feb_cnt | mar_cnt | apr_cnt | may_cnt | total_activated
----------------------+-------------------------------------------------------------+---------+---------+---------+---------+---------+-----------------
 E0003-B0015-1        | NAZARUL AMIR BIN NASIRIN NIL                                |   53058 |    7548 |  296220 |       0 |  203556 |          560382
 20215704             | LEOW WEI SIANG NIL                                          |   15269 |   13985 |   37944 |   69792 |  211887 |          348877
 20598630             | YEOW NAM LOW NIL                                            |       0 |       0 |    3982 |   59962 |  137126 |          201070
 D0028-B0028-1        | WONG SHALINE                                                |   23699 |   23322 |   29014 |   28232 |   65310 |          169577
 20260263             | UN JEK YUNG NIL                                             |    3787 |    8982 |   12063 |   26281 |  115035 |          166148
 20186335             | WEE CHEE SIANG NIL                                          |    7799 |    7554 |   13621 |   23785 |   46404 |           99163
 E0027-B0027-1        | ROSZALI BIN RIDZWAN                                         |   13477 |   13760 |   20174 |   18011 |   32288 |           97710
 31313052             | R004910620 R004910620 NIL                                   |    2395 |    3814 |   10022 |   46545 |   28799 |           91575
 31424101             | MILDRED CHONG VUN SIM NIL                                   |   12637 |    3584 |    3010 |    8397 |   20940 |           48568
 20182758             | NGU CHING HING NIL                                          |    1410 |    1675 |    3150 |    7632 |   18455 |           32322
 32505085             | R002905352 R002905352 NIL     
 
 
 -- Delare wise count 
WITH v AS (
    SELECT
        activated_by,
        current_status_id
    FROM vms_voucher
    WHERE create_date >= DATE '2026-01-01'
      AND create_date <  DATE '2026-02-01'
)
SELECT
    COALESCE(u.user_code,'UNKNOWN') AS dealer_code,
    COALESCE(u.user_first_name || ' ' || u.user_last_name,'UNKNOWN') AS dealer_name,
 
    SUM(CASE WHEN v.current_status_id = 10 THEN 1 ELSE 0 END) AS generated_cnt,
    SUM(CASE WHEN v.current_status_id = 11 THEN 1 ELSE 0 END) AS activated_cnt,
    SUM(CASE WHEN v.current_status_id = 12 THEN 1 ELSE 0 END) AS used_cnt,
    SUM(CASE WHEN v.current_status_id = 13 THEN 1 ELSE 0 END) AS locked_cnt,
    SUM(CASE WHEN v.current_status_id = 14 THEN 1 ELSE 0 END) AS permanently_locked_cnt,
    SUM(CASE WHEN v.current_status_id = 15 THEN 1 ELSE 0 END) AS reserved_cnt,
    SUM(CASE WHEN v.current_status_id = 16 THEN 1 ELSE 0 END) AS expired_cnt,
    COUNT(*) AS total_vouchers
FROM v
LEFT JOIN vms_user_profile u
       ON u.id = v.activated_by
GROUP BY
    u.user_code,
    u.user_first_name,
    u.user_last_name
ORDER BY total_vouchers DESC;


o/P
     dealer_code      |                         dealer_name                         | generated_cnt | activated_cnt | used_cnt | locked_cnt | permanently_locked_cnt | reserved_cnt | expired_cnt | total_vouchers
----------------------+-------------------------------------------------------------+---------------+---------------+----------+------------+------------------------+--------------+-------------+----------------
 UNKNOWN              |                                                             |       7380077 |             0 |        0 |          0 |                     35 |            0 |           0 |        7380112
 20598630             | YEOW NAM LOW NIL                                            |             0 |         97687 |   376914 |          2 |                      0 |            0 |           0 |         474603
 20215704             | LEOW WEI SIANG NIL                                          |             0 |        302448 |   150202 |          0 |                      0 |            0 |           0 |         452650
 20186335             | WEE CHEE SIANG NIL                                          |             0 |         56839 |   155359 |          2 |                      0 |            0 |           0 |         212200
 20260263             | UN JEK YUNG NIL                                             |             0 |         54897 |    62896 |          7 |                      0 |            0 |           0 |         117800
 E0003-B0015-1        | NAZARUL AMIR BIN NASIRIN NIL                                |             0 |         52320 |    27379 |        434 |                     68 |            0 |           0 |          80201
 31313052             | R004910620 R004910620 NIL                                   |             0 |         49287 |     2663 |          0 |                      0 |            0 |           0 |          51950
 DS002-J0765-1        | SIEW FONG WONG NIL                                          |             0 |         15888 |    31912 |          0 |                      0 |            0 |           0 |          47800
 DS001-K0366-DIGI1    | YORK PING KHOO NIL                                          |             0 |         22469 |    24531 |          0 |                      0 |            0 |           0 |          47000
 20193808             | NYON NGAH YIN NIL                                           |             0 |         27164 |    18844 |          2 |                      0 |            0 |           0 |          46010
 DS002-C0419-1        | LEE KOK SIONG NIL                                           |             0 |         15196 |    15972 |          2 |                      0 |            0 |           0 |          31170
 DS001-K0387-1        | KEAN HUAT WONG NIL                                          |             0 |          7956 |    22244 |          0 |                      0 |            0 |           0 |          30200
 31424101             | MILDRED CHONG VUN SIM NIL                                   |             0 |         11721 |    14829 |          0 |                      0 |            0 |           0 |          26550
 D0028-B0028-1        | WONG SHALINE                                                |             0 |         23357 |     1813 |        463 |                      0 |            0 |           0 |          25633
 DS001-P1273-1        | CHAN AH WAH CHAN GAIK HOON NIL                              |             0 |         13538 |    11600 |          0 |                      0 |            0 |           0 |          25138
 20199982             | CHEAH HUI WEI NIL                                           |             0 |         10639 |    10511 |          0 |                      0 |            0 |           0 |          21150
 DS002-J2103-1        | SIA SIEW YEE NIL                                            |             0 |          6388 |    14722 |          0 |                      0 |            0 |           0 |          21110
 20144309             | S001915051 S001915051 NIL                            


