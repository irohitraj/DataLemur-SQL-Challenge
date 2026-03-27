# Best-Selling Product by Category [SQL Interview Question]

> Problem info:
> Difficulty: `Medium`

You're provided with two tables: the `products` table contains information about products and their respective categories, and the `product_sales` table contains sales quantity and rating for each product.

Write a query to find the best-selling product in each product category. If there are two or more products with the same sales quantity, select the product with the higher review rating.

Return the category name and product name in alphabetical order of the category.

## `products` Table:

| Column Name | Type |
| --- | --- |
| product_id | integer |
| product_name | varchar |
| category_name | varchar |

### `products` Example Input:

| product_id | product_name | category_name |
| --- | --- | --- |
| 3690 | Game of Thrones | Books |
| 5520 | Refrigerator | Home Appliances |
| 5952 | Dishwasher | Home Appliances |
| 3561 | IKGAI | Books |

## `product_sales` Table:

| Column Name | Type |
| --- | --- |
| product_id | integer |
| sales_quantity | integer |
| rating | decimal (1.0 - 5.0) |

### `product_sales` Example Input:

| product_id | sales_quantity | rating |
| --- | --- | --- |
| 3690 | 300 | 4.9 |
| 5520 | 70 | 3.8 |
| 5952 | 70 | 4.0 |
| 3561 | 290 | 4.5 |

## Example Output:

| category_name | product_name |
| --- | --- |
| Books | Game of Thrones |
| Home Appliances | Dishwasher |

### Explanation:

- In the **Books** category, *Game of Thrones* has higher sales (300) compared to *IKGAI* (290), so it is selected.
- In the **Home Appliances** category, both *Refrigerator* and *Dishwasher* have the same sales quantity (70). However, *Dishwasher* has a higher rating (4.0 vs 3.8), so it is chosen.

The dataset you are querying against may have different input & output - this is just an example!
