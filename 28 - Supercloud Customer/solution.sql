with cte as (
SELECT cc.customer_id, 
count(distinct p.product_category)
FROM 
customer_contracts as cc
join 
products as p
on cc.product_id = p.product_id
where cc.amount > 0
group by cc.customer_id
)

select customer_id from cte
where count = (select count(DISTINCT product_category) from products)
