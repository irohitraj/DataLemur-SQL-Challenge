# Shopping Spree Users [SQL Interview Question]

> Problem info:
> Difficulty: `Medium`
> Company: `Amazon`

In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

List the user IDs who have gone on at least 1 shopping spree in ascending order.

## `transactions` Table:

| Column Name | Type |
| --- | --- |
| user_id | integer |
| amount | float |
| transaction_date | timestamp |

### `transactions` Example Input:

| user_id | amount | transaction_date |
| --- | --- | --- |
| 1 | 9.99 | 08/01/2022 10:00:00 |
| 1 | 55 | 08/17/2022 10:00:00 |
| 2 | 149.5 | 08/05/2022 10:00:00 |
| 2 | 4.89 | 08/06/2022 10:00:00 |
| 2 | 34 | 08/07/2022 10:00:00 |

## Example Output:

| user_id |
| --- |
| 2 |

### Explanation:

- A shopping spree is defined as purchases made on 3 or more consecutive days.
- User 2 made transactions on August 5th, 6th, and 7th — three consecutive days — so they qualify.
- User 1 does not have transactions on consecutive days, so they are excluded.

The dataset you are querying against may have different input & output - this is just an example!
