# Reactivated Users Per Month [SQL Interview Question]

> Problem info:
> Difficulty: `Medium`
> Company: `Facebook`

Imagine you're provided with a table containing information about user logins on Facebook in 2022. Write a query that determines the number of reactivated users for a given month. Reactivated users are those who were inactive the previous month but logged in during the current month.

Output the month in numerical format along with the count of reactivated users.

Here's some important assumptions to consider:

- The user_logins table only contains data for the year 2022 and there are no missing dates within that period.
- For instance, if a user whose first login date is on 3 March 2022, we assume that they had previously logged in during the year 2021. Although the data for their previous logins is not present in the user_logins table, we consider these users as reactivated users.

## `user_logins` Table:

| Column Name | Type |
| --- | --- |
| user_id | integer |
| login_date | datetime |

### `user_logins` Example Input:

| user_id | login_date |
| --- | --- |
| 123 | 02/22/2022 12:00:00 |
| 112 | 03/15/2022 12:00:00 |
| 245 | 03/28/2022 12:00:00 |
| 123 | 05/01/2022 12:00:00 |
| 725 | 05/25/2022 12:00:00 |

## Example Output:

| mth | reactivated_users |
| --- | --- |
| 2 | 1 |
| 3 | 2 |
| 5 | 2 |

### Explanation:

- In February 2022, there is 1 reactivated user (user 123). Since their previous login history is assumed to be in 2021, they are considered reactivated.
- In March 2022, users 112 and 245 logged in but had no activity in February, so both are counted as reactivated users.
- In May 2022, user 123 logged in again after being inactive in April, and user 725 logged in for the first time in the dataset. Both are counted as reactivated users.

The dataset you are querying against may have different input & output - this is just an example!
