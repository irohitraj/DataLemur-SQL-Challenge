with cte as (
SELECT *, row_number() over(PARTITION by 
(measurement_time:: DATE) 
order by measurement_time) as rnk
FROM measurements
)

select (measurement_time:: DATE) as measurement_day,
sum(measurement_value) FILTER(where rnk%2=0) as even_sum,
sum(measurement_value) FILTER(where rnk%2!=0) as odd_sum
from cte 
group by measurement_day
order by measurement_day
