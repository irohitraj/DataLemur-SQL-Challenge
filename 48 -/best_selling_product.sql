with complete_data as 
(SELECT 
p.product_id,
p.product_name,    
p.category_name,
ps.sales_quantity,
ps.rating
FROM products p 
JOIN
product_sales ps 
on p.product_id = ps.product_id
)

select category_name, product_name from (
select category_name, product_name, sales_quantity, rating,
row_number() over(PARTITION by category_name order by sales_quantity DESC, rating desc) as rnk from complete_data
) as t
where rnk = 1
order by category_name, rating desc
