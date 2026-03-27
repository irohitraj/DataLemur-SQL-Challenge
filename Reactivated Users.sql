with cte as (
SELECT
user_id,
extract(month from login_date ) as mth,
-- login_date as curr_login,
LAG(extract(month from login_date ), 1) over(PARTITION by user_id order by extract(month from login_date )) as prev_login
FROM
user_logins
order by user_id
)

select mth, count(user_id) as reactivated_users
from cte 
where prev_login is null or mth> prev_login+1
group by mth
order by mth
