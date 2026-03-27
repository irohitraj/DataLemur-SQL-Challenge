with cte as 
(select user_id,
transaction_date,
lead(transaction_date, 1) OVER(PARTITION BY user_id order by transaction_date) as second_day,
lead(transaction_date, 2) OVER(PARTITION BY user_id order by transaction_date) as third_day
from transactions
)

select user_id from cte
where Extract(DAY from second_day- transaction_date) = 1
and Extract(DAY from third_day - transaction_date) = 2
-- OR
-- select user_id from cte 
-- where transaction_date is not NULL and 
-- second_day	is not NULL  and third_day is not NULL

-- sol 1 
-- SELECT
--   T1.*, T2.transaction_date
-- FROM transactions AS T1
-- INNER JOIN transactions AS T2
--   ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
-- INNER JOIN transactions AS T3
--   ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
-- WHERE t1.user_id = t2.user_id and t2.user_id = t3.user_id
-- ORDER BY T1.user_id;
