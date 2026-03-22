with cte as (
SELECT *,
RANK() OVER (PARTITION BY user_id order by transaction_date DESC) as rnk
FROM user_transactions

)
  
select transaction_date, user_id, 
count(spend) as purchase_count
from cte
where rnk = 1
group by transaction_date, user_id
