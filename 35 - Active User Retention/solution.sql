SELECT 
EXTRACT(month from event_date) as month,
count(DISTINCT user_id) FROM user_actions
where user_id in (

select distinct user_id from user_actions
where EXTRACT(month from event_date) = 6
and EXTRACT(YEAR from event_date) = 2022)
and EXTRACT(month from event_date) = 7
and EXTRACT(YEAR from event_date) = 2022
group by month
