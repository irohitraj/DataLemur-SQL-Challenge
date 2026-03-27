with monthly_calls as(
SELECT 
extract(year from call_date) as yr, 
extract(month from call_date) as mth,
count(case_id) as curr_monthly_calls,
LAG(count(case_id)) over(order by extract(month from call_date)) as prev_month_calls
FROM callers
where call_duration_secs > 300
group by extract(year from call_date), extract(month from call_date)
order by yr, mth
)

select yr, mth, round(100.0*(curr_monthly_calls - prev_month_calls)/prev_month_calls ,1) as long_calls_growth_pct
from monthly_calls
order by yr, mth
