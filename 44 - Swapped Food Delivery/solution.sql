with order_cnts as (
SELECT count(*) as counts
FROM orders 
)

select 
case 
when order_id %2 !=0 and order_id != counts then order_id+1
when order_id %2 !=0 and order_id = counts then order_id
ELSE order_id -1
end as corrected_order_id,
item
from orders
cross join order_cnts
order by corrected_order_id
