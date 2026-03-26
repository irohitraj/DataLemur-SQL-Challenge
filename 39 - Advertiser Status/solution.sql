SELECT COALESCE(ad.user_id,dp.user_id) as user_id,
(case 
when ad.user_id IS NULL THEN 'NEW'
when dp.paid is NULL then 'CHURN'
when ad.status = 'CHURN' and dp.paid is NOT NULL then 'RESURRECT'
ELSE 'EXISTING' END) AS new_status
FROM advertiser as ad
FULL OUTER JOIN daily_pay as dp
on ad.user_id = dp.user_id
order by user_id
