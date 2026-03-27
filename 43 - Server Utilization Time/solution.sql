with cte as 
(
SELECT *,
LEAD(session_status) over (PARTITION BY  server_id order by status_time) as end_status, 
LEAD(status_time) over (PARTITION BY  server_id order by status_time) as end_time
FROM server_utilization
)

select round(sum( EXTRACT(EPOCH from (end_time - status_time)))/ (24*3600)) as total_uptime_days
from cte
where session_status = 'start' and end_status = 'stop'
