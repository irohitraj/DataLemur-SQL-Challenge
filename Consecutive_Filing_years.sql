with cte as (
SELECT *,
lead(filing_date,1) over (PARTITION BY user_id order by filing_date) as second_year,
lead(filing_date,2) over (PARTITION BY user_id order by filing_date) as third_year
FROM filed_taxes
where product SIMILAR TO '(Turbo| QuickBooks)%'
)

select distinct user_id from cte
where (extract(year from second_year) - extract(year from filing_date )) = 1
and extract(year from third_year) - extract(year from filing_date) = 2





-- below is wrong solution as it doesnt accomodate consecutive years
-- with cte as (
-- SELECT *,
-- row_number() over (PARTITION BY user_id order by filing_date)
-- FROM filed_taxes
-- where product SIMILAR TO '(Turbo| QuickBooks)%'
-- )

-- select user_id  from cte
-- group by user_id
-- having count(product)>=3
-- order by user_id
