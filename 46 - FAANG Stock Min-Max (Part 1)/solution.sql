-- anything other than TO_CHAR is too problematic


with cte as (
select 
ticker,
first_value(TO_CHAR(date, 'Mon-YYYY')) OVER (PARTITION by ticker order by open DESC) as highest_mth,
first_value(open) over(PARTITION by ticker order by open DESC) as highest_open,
first_value(TO_CHAR(date, 'Mon-YYYY')) OVER (PARTITION by ticker order by open asc) as lowest_mth,
first_value(open) over(PARTITION by ticker order by open asc ) as lowest_open
from stock_prices

)
select distinct * from cte 
order by ticker

