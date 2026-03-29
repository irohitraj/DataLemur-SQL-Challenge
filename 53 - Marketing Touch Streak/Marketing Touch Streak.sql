with cte as(
select contact_id,
lag(DATE_TRUNC('week',event_date),1) over(PARTITION BY contact_id order by event_date) as event_week_prev,
DATE_TRUNC('week',event_date) as event_week ,
lead(DATE_TRUNC('week',event_date),1) over(PARTITION BY contact_id order by event_date) as event_week_next
from marketing_touches
where contact_id in (
select contact_id from marketing_touches where event_type = 'trial_request'
)
)

SELECT DISTINCT contacts.email
FROM cte AS events
INNER JOIN crm_contacts AS contacts
  ON events.contact_id = contacts.contact_id
WHERE events.event_week_prev = events.event_week - INTERVAL '1 week'
  AND events.event_week_next = events.event_week + INTERVAL '1 week'
