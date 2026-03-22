-- sol 2
select item_count from items_per_order
where order_occurrences = (
select max(order_occurrences) from items_per_order
)
order by item_count

-- sol 1 
-- with cte as (
-- SELECT *, 
-- RANK() OVER(order by order_occurrences DESC) as rnk
-- FROM items_per_order
-- )

-- select item_count as mode 
-- from cte
-- where rnk = 1
