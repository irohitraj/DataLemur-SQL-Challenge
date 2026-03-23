with cte as 
(
SELECT pc.*,pinfo.country_id as caller_country,
pif.country_id as receiver_country
FROM phone_calls pc 
JOIN
phone_info pinfo 
on pc.caller_id = pinfo.caller_id
JOIN
phone_info pif 
on pc.receiver_id = pif.caller_id
)

select 
round(100.0 * sum(case when caller_country != receiver_country
then 1 else 0 END)/ count(*) ,1) as international_calls_pct from cte

