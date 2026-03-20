select 
round(1.0* count(t.email_id)/
count(distinct e.email_id),2) as confirm_rate
FROM emails as e
left JOIN texts as t
on e.email_id = t.email_id
and t.signup_action = 'Confirmed'
