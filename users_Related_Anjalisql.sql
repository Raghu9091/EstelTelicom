SELECT user_code, user_first_name, status_id
FROM vms_user_profile
WHERE user_code IN (
'13575',
'16079',
'200720',
'200722',
'200727',
'200745',
'201420',
'967237',
'970132');


-- Deletion
SELECT user_code, user_first_name, status_id
FROM vms_user_profile
WHERE user_code IN (
'200225',
'200711',
'200725',
'200737',
'202119',
'V8881');

SELECT user_code, user_first_name, status_id
FROM vms_user_profile
WHERE user_code IN (
'200225',
'200711',
'200725',
'200737',
'V20978X');


V22099X
'%V17462X%','%V17484X%','%V17487X%','%V17489X%','%V17502X%','%V17504X%','%V17096X%','%V17098X%','%V17105X%','%V17572X%','%V17582X%','%V17587X%','%V17590X%','%V17593X%','%V17594X%'

SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id WHERE u.user_code LIKE ANY (ARRAY['%V17462X%','%V17484X%','%V17487X%','%V17489X%','%V17502X%','%V17504X%','%V17096X%','%V17098X%','%V17105X%','%V17572X%','%V17582X%','%V17587X%','%V17590X%','%V17593X%','%V17594X%']);

 user_first_name  | user_code | user_status |      trans_type_code       | channel_code |               comments               |    transaction_cts
------------------+-----------+-------------+----------------------------+--------------+--------------------------------------+------------------------
 Vasanthan        | V17462X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response      | 13-APR-26 12:47:45.713
 Alexander        | V17489X   | Active      | QUERYBLACKLISTSUBSCRIBER   | IWP          | Query Black List Subscriber Response | 07-APR-26 14:21:07.756
 Elysia Stacy     | V17502X   | Active      | LOGIN                      | IWP          | User Login request                   | 26-JAN-26 09:03:57.647
 MUHAMMAD FIRDAUS | V17572X   | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response      | 31-MAR-26 18:28:37.73
 Abdul Azfar      | V17587X   | Active      | CREATEUSER                 | IWP          | Internal User Creation               | 10-FEB-26 14:37:35.272
(5 rows)

SELECT user_code, status_id FROM vms_user_profile WHERE user_code LIKE ANY (ARRAY['%V17462X%','%V17484X%','%V17487X%','%V17489X%','%V17502X%','%V17504X%','%V17096X%','%V17098X%','%V17105X%','%V17572X%','%V17582X%','%V17587X%','%V17590X%','%V17593X%','%V17594X%']);

  user_code   | status_id
--------------+-----------                        
 1760_V17487X |         4                        
 V17462X      |         5                        
 V17489X      |         5                        
 V17105X      |         6                        
 V17502X      |         5                        
 1775_V17504X |         4                        
 V17572X      |         5                        
 V17484X      |         6                        
 V17096X      |         6                        
 V17098X      |         6                        
 2960_V17582X |         4                        
 2955_V17590X |         4                        
 V17587X      |         5                        
(13 rows)
=======================

SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id WHERE u.user_code LIKE ANY (ARRAY['%V21927X%','%V21988X%','%V21990X%','%V21993X%','%V21996X%','%V22099X%','%V22151X%','%V22155X%','%V22162X%','%V19852X%','%V22231X%','%V22286X%','%V22288X%','%V22289X%']);

'%V21927X%','%V21988X%','%V21990X%','%V21993X%','%V21996X%','%V22099X%','%V22151X%','%V22155X%','%V22162X%','%V19852X%','%V22231X%','%V22286X%','%V22288X%','%V22289X%',


SELECT user_code, status_id FROM vms_user_profile WHERE user_code LIKE ANY (ARRAY['%V21927X%','%V21988X%','%V21990X%','%V21993X%','%V21996X%','%V22099X%','%V22151X%','%V22155X%','%V22162X%','%V19852X%','%V22231X%','%V22286X%','%V22288X%','%V22289X%']);

vms_digi=> SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id WHERE u.user_code LIKE ANY (ARRAY['%V21927X%','%V21988X%','%V21990X%','%V21993X%','%V21996X%','%V22099X%','%V22151X%','%V22155X%','%V22162X%','%V19852X%','%V22231X%','%V22286X%','%V22288X%','%V22289X%']);
 user_first_name | user_code | user_status |      trans_type_code       | channel_code |               comments               |    transaction_cts
-----------------+-----------+-------------+----------------------------+--------------+--------------------------------------+------------------------
 DARSHAN         | V21927X   | Active      | QUERYBLACKLISTSUBSCRIBER   | IWP          | Query Black List Subscriber Response | 21-FEB-26 17:51:43.319
 Muhammad Fadil  | V21988X   | Active      | LOGOUT                     | IWP          | User Logout request                  | 02-FEB-26 08:13:10.844
 Rohaiza         | V21990X   | Active      | LOGIN                      | IWP          | User Login request                   | 25-FEB-26 07:40:24.638
 Afiq Aizuddin   | V21993X   | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response      | 14-MAR-26 17:39:35.149
 Azhar Fariz     | V21996X   | Active      | LOGIN                      | IWP          | User Login request                   | 27-JAN-26 16:47:24.953
 Gobbinaath      | V22099X   | Active      | LOGIN                      | IWP          | User Login request                   | 20-FEB-26 16:32:02.019
 Nagajothi       | V22155X   | Active      | LOGIN                      | IWP          | User Login request                   | 29-MAR-26 18:15:22.633
 MUHAMMAD ADAM   | V22231X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response      | 23-JAN-26 16:35:31.216
 Mohamad         | V22286X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response      | 08-APR-26 18:22:29.775
 Mahendra        | V22288X   | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response      | 22-FEB-26 19:48:17.375
 Avester         | V22289X   | Active      | LOGOUT                     | IWP          | User Logout request                  | 23-JAN-26 10:24:29.204
(11 rows)

vms_digi=> SELECT user_code, status_id FROM vms_user_profile WHERE user_code LIKE ANY (ARRAY['%V22292X%','%V22294X%','%V22295X%','%V22296X%','%V22317X%','%V22320X%','%V22321X%','%V22322X%','%V22327X%','%V22328X%']);
  user_code   | status_id
--------------+-----------
 V21996X      |         5
 V21993X      |         5  V22099X

 V21988X      |         5
 V21927X      |         5
 V21990X      |         5
 V22099X      |         5
 V22155X      |         5
 3361_V22151X |         4
 V19852X      |         6
 V22162X      |         6
 V22288X      |         5
 V22289X      |         5
 V22286X      |         5
 V22231X      |         5
(14 rows)






===========================================
'%V22292X%','%	%','%V22295X%','%V22296X%','%V22317X%','%V22320X%','%V22321X%','%V22322X%','%V22327X%','%V22328X%'

SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id WHERE u.user_code LIKE ANY (ARRAY['%V22292X%','%V22294X%','%V22295X%','%V22296X%','%V22317X%','%V22320X%','%V22321X%','%V22322X%','%V22327X%','%V22328X%']);

   user_first_name   |  user_code   | user_status |      trans_type_code       | channel_code |                  comments                   |    transaction_cts
---------------------+--------------+-------------+----------------------------+--------------+---------------------------------------------+------------------------
 Krisheelaa Vani     | 3376_V22294X | Delete      | UPDATEUSER                 | IWP          | Internal User Modification                  | 06-APR-26 10:18:03.674
 Ajda Hadirah        | V22292X      | Active      | LOGIN                      | IWP          | User Login request                          | 01-APR-26 12:07:17.388
 Krisheelaa Vani     | V22294X      | Active      | QUERYBLACKLISTSUBSCRIBER   | IWP          | Query Black List Subscriber Response        | 09-FEB-26 13:48:22.507
 Meerabaanu          | V22295X      | Active      | LOGIN                      | IWP          | User Login request                          | 18-APR-26 08:19:03.453
 Nor Atikah          | V22296X      | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response             | 22-FEB-26 17:36:20.535
 Muhammad Hafizuddin | V22317X      | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response             | 12-MAR-26 10:30:15.433
 Sudaarsonrau        | V22320X      | Active      | QUERYBLACKLISTSUBSCRIBER   | IWP          | Query Black List Subscriber Response        | 28-MAR-26 10:00:55.37
 Asweni              | V22321X      | Active      | DELETEBLACKLISTSUBSCRIBER  | IWP          | Delete Query Black List Subscriber Response | 02-FEB-26 16:56:14.288
 Asimah              | V22322X      | Active      | LOGIN                      | IWP          | User Login request                          | 18-FEB-26 15:00:01.009
 Jegatiswary         | V22327X      | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response             | 05-FEB-26 11:12:24.287
 Muhammad Imran      | V22328X      | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response             | 16-APR-26 11:09:37.901
(11 rows)



 SELECT user_code, status_id FROM vms_user_profile WHERE user_code LIKE ANY (ARRAY['%V22292X%','%V22294X%','%V22295X%','%V22296X%','%V22317X%','%V22320X%','%V22321X%','%V22322X%','%V22327X%','%V22328X%']);
   user_code   | status_id
--------------+-----------
 V22292X      |         5
 V22295X      |         5
 V22296X      |         5
 3376_V22294X |         4
 V22317X      |         5
 V22320X      |         5
 V22321X      |         5
 V22322X      |         5
 V22327X      |         5
 V22328X      |         5
 V22294X      |         5
(11 rows)


=========================

'%V22332X%','%V22333X%','%V22334X%','%V22404X%','%V18543X%','%V22400X%','%V22402X%','%V22407X%','%V22412X%','%V22468X%'

SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id WHERE u.user_code LIKE ANY (ARRAY['%V22332X%','%V22333X%','%V22334X%','%V22404X%','%V18543X%','%V22400X%','%V22402X%','%V22407X%','%V22412X%','%V22468X%']);
    user_first_name     | user_code | user_status |      trans_type_code       | channel_code |               comments               |    transaction_cts
------------------------+-----------+-------------+----------------------------+--------------+--------------------------------------+------------------------
 Eshwaar                | V22332X   | Active      | LOGIN                      | IWP          | User Login request                   | 19-APR-26 16:57:54.052
 Zuhairi Afifi          | V22333X   | Active      | LOGIN                      | IWP          | User Login request                   | 16-APR-26 08:00:06.025
 Muhammad Khairul Iqram | V22334X   | Active      | QUERYBLACKLISTSUBSCRIBER   | IWP          | Query Black List Subscriber Response | 04-APR-26 16:46:02.299
 Aiman Alif             | V22400X   | Active      | LOGOUT                     | IWP          | User Logout request                  | 17-MAR-26 14:09:02.085
 Rahul                  | V22402X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response      | 13-APR-26 10:26:38.671
 Nursyafiqah            | V22407X   | Active      | LOGIN                      | IWP          | User Login request                   | 31-JAN-26 08:09:29.887
 Aien Quzaima           | V22412X   | Active      | QUERYBLACKLISTSUBSCRIBER   | IWP          | Query Black List Subscriber Response | 27-FEB-26 08:46:26.068
 Aiman Alif             | V22468X   | Active      | LOGIN                      | IWP          | User Login request                   | 14-APR-26 17:01:03.687
(8 rows)



 SELECT user_code, status_id FROM vms_user_profile WHERE user_code LIKE ANY (ARRAY['%V22332X%','%V22333X%','%V22334X%','%V22404X%','%V18543X%','%V22400X%','%V22402X%','%V22407X%','%V22412X%','%V22468X%']);
 
   user_code   | status_id
--------------+-----------
 2279_V18543X |         4
 V22332X      |         5
 V22333X      |         5
 V22334X      |         5
 V22400X      |         5
 V22402X      |         5
 V22407X      |         5
 V22412X      |         5
 V22404X      |         5
 V22468X      |         5
(10 rows)

================================
'%V22469X%','%V22471X%','%V22473X%','%V22481X%','%V22484X%','%V22488X%','%V22489X%','%V22490X%','%V22494X%','%V22496X%',

SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id 
WHERE u.user_code LIKE ANY (ARRAY['%V22469X%','%V22471X%','%V22473X%','%V22481X%','%V22484X%','%V22488X%','%V22489X%','%V22490X%','%V22494X%','%V22496X%']);

 user_first_name  | user_code | user_status |     trans_type_code      | channel_code |               comments               |    transaction_cts
------------------+-----------+-------------+--------------------------+--------------+--------------------------------------+------------------------
 Syafrie Syazlan  | V22469X   | Active      | LOGIN                    | IWP          | User Login request                   | 04-FEB-26 10:49:52.014
 Nursyafiqah      | V22471X   | Active      | LOGIN                    | IWP          | User Login request                   | 02-FEB-26 08:28:46.096
 Iman Maisarah    | V22473X   | Active      | QUERYBLACKLISTSUBSCRIBER | IWP          | Query Black List Subscriber Response | 29-JAN-26 15:40:55.681
 Hindumathi       | V22481X   | Active      | VOUCHERSTATUSINQUIRY     | EWP          | Search Voucher Inquiry Response      | 27-MAR-26 18:00:37.206
 Shamil Ambia     | V22488X   | Active      | LOGIN                    | IWP          | User Login request                   | 31-MAR-26 14:00:11.475
 Raneeka          | V22489X   | Active      | LOGIN                    | IWP          | User Login request                   | 15-FEB-26 09:20:32.474
 Muhammad Firdaus | V22490X   | Active      | LOGIN                    | IWP          | User Login request                   | 29-MAR-26 14:04:24.936
 Nabiha Farisha   | V22494X   | Active      | LOGIN                    | IWP          | User Login request                   | 08-APR-26 16:45:13.349
 Ashley Singh     | V22496X   | Active      | QUERYBLACKLISTSUBSCRIBER | IWP          | Query Black List Subscriber Response | 16-MAR-26 13:17:30.727


 SELECT user_code, status_id FROM vms_user_profile WHERE user_code 
 LIKE ANY (ARRAY['%V22469X%','%V22471X%','%V22473X%','%V22481X%','%V22484X%','%V22488X%','%V22489X%','%V22490X%','%V22494X%','%V22496X%']);
 
  user_code | status_id
-----------+-----------
 V22471X   |         5
 V22473X   |         5
 V22481X   |         5
 V22484X   |         5
 V22488X   |         5
 V22489X   |         5
 V22490X   |         5
 V22494X   |         5
 V22496X   |         5
 V22469X   |         5
(10 rows)

==============================================================
'%V22535X%','%V22560X%','%V22575X%','%V22578X%','%V22584X%','%V22589X%','%V22595X%','%V22600X%','%V22610X%','%V22536X%',
SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id 
WHERE u.user_code LIKE ANY (ARRAY['%V22535X%','%V22560X%','%V22575X%','%V22578X%','%V22584X%','%V22589X%','%V22595X%','%V22600X%','%V22610X%','%V22536X%']);
  user_first_name   | user_code | user_status |   trans_type_code    | channel_code |            comments             |    transaction_cts
--------------------+-----------+-------------+----------------------+--------------+---------------------------------+------------------------
 Siti Nooradila     | V22535X   | Active      | LOGIN                | IWP          | User Login request              | 27-JAN-26 07:43:30.442
 Nur Syamimi Balqis | V22560X   | Active      | VOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 17-APR-26 09:01:49.237
 Muhammad Firdaus   | V22575X   | Active      | LOGIN                | IWP          | User Login request              | 15-APR-26 08:02:20.07
 Muhammad Safiq     | V22578X   | Active      | LOGOUT               | IWP          | User Logout request             | 24-MAR-26 15:15:27.066
 Nasrul Safwan      | V22584X   | Active      | LOGOUT               | IWP          | User Logout request             | 31-JAN-26 18:53:01.519
 Naveen             | V22589X   | Active      | LOGIN                | IWP          | User Login request              | 07-MAR-26 12:01:25.839
 Nurhasanah         | V22595X   | Active      | LOGIN                | IWP          | User Login request              | 16-MAR-26 08:06:21.481
 Zulaikha Ayuni     | V22610X   | Active      | LOGOUT               | IWP          | User Logout request             | 16-MAR-26 11:54:37.458
(8 rows)

 SELECT user_code, status_id FROM vms_user_profile WHERE user_code 
 LIKE ANY (ARRAY['%V22535X%','%V22560X%','%V22575X%','%V22578X%','%V22584X%','%V22589X%','%V22595X%','%V22600X%','%V22610X%','%V22536X%']);
 
 user_code | status_id
-----------+-----------
 V22610X   |         5
 V22536X   |         5
 V22560X   |         5
 V22575X   |         5
 V22578X   |         5
 V22584X   |         5
 V22589X   |         5
 V22595X   |         5
 V22535X   |         5
(9 rows)

================
'%V22538X%','%V22539X%','%V22551X%','%V22552X%','%V22557X%','%V22571X%','%V22581X%','%V22587X%','%V22588X%','%V22591X%',
SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id 
WHERE u.user_code LIKE ANY (ARRAY['%V22538X%','%V22539X%','%V22551X%','%V22552X%','%V22557X%','%V22571X%','%V22581X%','%V22587X%','%V22588X%','%V22591X%']);
 user_first_name   | user_code | user_status |      trans_type_code       | channel_code |            comments             |    transaction_cts
---------------------+-----------+-------------+----------------------------+--------------+---------------------------------+------------------------
 ARIVINRAJ           | V22538X   | Active      | LOGOUT                     | IWP          | User Logout request             | 09-APR-26 19:55:45.469
 SUBANU              | V22552X   | Active      | LOGIN                      | IWP          | User Login request              | 03-APR-26 17:51:38.275
 HASVETTA            | V22557X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 27-MAR-26 11:47:05.725
 VASHMITHA ROSHINY   | V22571X   | Active      | LOGIN                      | IWP          | User Login request              | 21-MAR-26 19:31:17.72
 KHAIRUL ARIFF RADZI | V22581X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 29-JAN-26 19:59:42.13
 MOHD FARID          | V22587X   | Active      | LOGIN                      | IWP          | User Login request              | 05-APR-26 14:41:11.348
(6 rows)



 SELECT user_code, status_id FROM vms_user_profile WHERE user_code 
 LIKE ANY (ARRAY['%V22538X%','%V22539X%','%V22551X%','%V22552X%','%V22557X%','%V22571X%','%V22581X%','%V22587X%','%V22588X%','%V22591X%']);
  user_code | status_id
-----------+-----------
 V22571X   |         5
 V22581X   |         5
 V22587X   |         5
 V22588X   |         5
 V22591X   |         5
 V22538X   |         5
 V22539X   |         5
 V22551X   |         5
 V22552X   |         5
 V22557X   |         5
(10 rows)
===========================
'%V22601X%','%V22613X%','%V22644X%','%V22696X%','%V22781X%','%V22783X%','%V22786X%','%V22794X%','%V22796X%','%V22798X%'


SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id 
WHERE u.user_code LIKE ANY (ARRAY['%V22601X%','%V22613X%','%V22644X%','%V22696X%','%V22781X%','%V22783X%','%V22786X%','%V22794X%','%V22796X%','%V22798X%']);
  user_first_name  | user_code | user_status |   trans_type_code    | channel_code |            comments             |    transaction_cts
-------------------+-----------+-------------+----------------------+--------------+---------------------------------+------------------------
 IRHAM HAZIQ       | V22613X   | Active      | LOGIN                | IWP          | User Login request              | 31-MAR-26 08:19:26.234
 Norhidayah        | V22644X   | Active      | VOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 30-MAR-26 09:30:04.8
 Ezzah Nur Shuhada | V22781X   | Active      | LOGIN                | IWP          | User Login request              | 17-APR-26 10:43:49.185
 Mohana Kumar      | V22783X   | Active      | LOGIN                | IWP          | User Login request              | 13-FEB-26 13:04:53.185
 Muhammad Hazim    | V22794X   | Active      | LOGIN                | IWP          | User Login request              | 25-FEB-26 12:29:54.184
 Rishines          | V22796X   | Active      | LOGOUT               | IWP          | User Logout request             | 09-FEB-26 12:59:08.854
(6 rows)


 SELECT user_code, status_id FROM vms_user_profile WHERE user_code 
 LIKE ANY (ARRAY['%V22601X%','%V22613X%','%V22644X%','%V22696X%','%V22781X%','%V22783X%','%V22786X%','%V22794X%','%V22796X%','%V22798X%']);
 
  user_code | status_id
-----------+-----------
 V22601X   |         5
 V22613X   |         5
 V22644X   |         5
 V22781X   |         5
 V22783X   |         5
 V22786X   |         5
 V22794X   |         5
 V22796X   |         5
 V22696X   |         5
(9 rows)
=============================================================================
'%V22804X%','%V22805X%','%V22806X%','%V22809X%','%V22810X%','%V22880X%','%V22882X%','%V22884X%','%V22885X%','%V22890X%',
SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id 
WHERE u.user_code LIKE ANY (ARRAY['%V22804X%','%V22805X%','%V22806X%','%V22809X%','%V22810X%','%V22880X%','%V22882X%','%V22884X%','%V22885X%','%V22890X%']);
   user_first_name    | user_code | user_status |      trans_type_code       | channel_code |            comments             |    transaction_cts
-----------------------+-----------+-------------+----------------------------+--------------+---------------------------------+------------------------
 Dineshrao A L Arjunan | V22804X   | Active      | LOGIN                      | IWP          | User Login request              | 01-FEB-26 10:27:03.615
 Peter Yoganathan      | V22805X   | Active      | LOGIN                      | IWP          | User Login request              | 07-MAR-26 16:53:41.638
 Rosliah               | V22806X   | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response | 27-FEB-26 12:46:10.563
 Sathiya Murthy        | V22809X   | Active      | LOGIN                      | IWP          | User Login request              | 15-APR-26 10:53:59.471
 Tharshini             | V22810X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 01-FEB-26 12:34:20.839
 Durrga                | V22880X   | Active      | LOGIN                      | IWP          | User Login request              | 13-MAR-26 19:45:32.236
 Jamuna                | V22882X   | Active      | LOGIN                      | IWP          | User Login request              | 05-FEB-26 11:55:20.158
 Yuganeswri            | V22884X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 26-JAN-26 19:09:36.452
 Siti Nur Alisya       | V22885X   | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response | 31-JAN-26 14:31:20.992
 Noor Zahirah          | V22890X   | Active      | LOGOUT                     | IWP          | User Logout request             | 18-FEB-26 11:59:58.776
(10 rows)


SELECT user_code, status_id FROM vms_user_profile WHERE user_code 
 LIKE ANY (ARRAY['%V22804X%','%V22805X%','%V22806X%','%V22809X%','%V22810X%','%V22880X%','%V22882X%','%V22884X%','%V22885X%','%V22890X%']);
 
  user_code | status_id
-----------+-----------
 V22804X   |         5
 V22805X   |         5
 V22806X   |         5
 V22809X   |         5
 V22810X   |         5
 V22880X   |         5
 V22882X   |         5
 V22884X   |         5
 V22885X   |         5
 V22890X   |         5
(10 rows)
============================================

'%V22870X%','%V22871X%','%V22872X%','%V22873X%','%V22875X%','%V23023X%','%V23024X%','%V23025X%','%V23026X%','%V23027X%'
SELECT DISTINCT ON (u.user_code) u.user_first_name, u.user_code, s.description AS user_status, t.trans_type_code, t.channel_code, t.comments, t.transaction_cts FROM vms_user_profile u JOIN vms_transaction t ON u.user_code = t.user_code LEFT JOIN vms_status s ON u.status_id = s.id 
WHERE u.user_code LIKE ANY (ARRAY['%V22870X%','%V22871X%','%V22872X%','%V22873X%','%V22875X%','%V23023X%','%V23024X%','%V23025X%','%V23026X%','%V23027X%']);
   user_first_name    | user_code | user_status |      trans_type_code       | channel_code |            comments             |    transaction_cts
----------------------+-----------+-------------+----------------------------+--------------+---------------------------------+------------------------
 FIKRI HANAFI         | V22870X   | Active      | LOGIN                      | IWP          | User Login request              | 21-APR-26 16:49:35.428
 DHENOSHENAA          | V22871X   | Active      | LOGIN                      | IWP          | User Login request              | 02-FEB-26 11:20:10.152
 PUNITHA              | V22872X   | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response | 08-APR-26 08:33:23.152
 THARSINI             | V22873X   | Active      | LOGIN                      | IWP          | User Login request              | 12-MAR-26 16:24:18.692
 FILZAH FARHANAH SUFI | V22875X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 17-MAR-26 15:21:09.1
 Muhammad Asri        | V23024X   | Active      | SEARCHVOUCHERSTATUSINQUIRY | EWP          | Search Voucher Inquiry Response | 18-MAR-26 15:25:12.891
 Edwig Joshua         | V23026X   | Active      | VOUCHERSTATUSINQUIRY       | EWP          | Search Voucher Inquiry Response | 01-FEB-26 10:02:49.007
(7 rows)


SELECT user_code, status_id FROM vms_user_profile WHERE user_code 
 LIKE ANY (ARRAY['%V22870X%','%V22871X%','%V22872X%','%V22873X%','%V22875X%','%V23023X%','%V23024X%','%V23025X%','%V23026X%','%V23027X%']);
 user_code | status_id
-----------+-----------
 V22871X   |         5
 V22872X   |         5
 V22873X   |         5
 V23025X   |         5
 V22870X   |         5
 V22875X   |         5
 V23023X   |         5
 V23024X   |         5
 V23026X   |         5
 V23027X   |         5
(10 rows)

