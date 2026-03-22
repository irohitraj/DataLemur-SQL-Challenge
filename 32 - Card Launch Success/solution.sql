with cte as (
SELECT card_name,
issued_amount,
(CONCAT(issue_year,' ', issue_month)) as issue_date,
min(CONCAT(issue_year,' ', issue_month)) 
OVER(PARTITION BY card_name ) as launch_date
FROM monthly_cards_issued
)

select card_name, issued_amount
from cte
where issue_date = launch_date
order by issued_amount DESC

-- over doesnt not collapses results like group by it retains all the rows
