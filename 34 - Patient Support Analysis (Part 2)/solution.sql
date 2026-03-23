-- SELECT round(100.0 * (count(*) - count(call_category))/ count(*), 1) as uncategorised_call_pct
-- FROM callers;



with cte as (
SELECT COUNT(case_id) AS uncategorised_calls
FROM callers
WHERE call_category IS NULL
  OR call_category = 'n/a'
)

select 
round((100.0 * uncategorised_calls/(select count(*) from callers)
),1) as uncategorised_call_pct
from cte
