# Senior Managers and Their Direct Reports [SQL Interview Question]

> Problem info:
> Difficulty: `Hard`
> Company: `Google`

Assume we have a table of Google employees with their corresponding managers.

A manager is an employee with a direct report. A senior manager is an employee who manages at least one manager, but none of their direct reports is a senior manager themselves.

Write a query to find the senior managers and their direct reports.

Output the senior manager's name and the count of their direct reports. The senior manager with the most direct reports should be the first result.

## Assumptions:

- An employee can report to two senior managers.

## `employees` Table:

| Column Name | Type |
| --- | --- |
| emp_id | integer |
| manager_id | integer |
| manager_name | string |

### `employees` Example Input:

| emp_id | manager_id | manager_name |
| --- | --- | --- |
| 1 | 101 | Duyen |
| 101 | 1001 | Rick |
| 103 | 1001 | Rick |
| 1001 | 1008 | John |

## Example Output:

| manager_name | direct_reportees |
| --- | --- |
| Rick | 1 |

### Explanation:

- Rick is a manager because employees 101 and 103 report to him.
- Employee 101 is also a manager (since employee 1 reports to them).
- Therefore, Rick manages at least one manager, making him a senior manager.
- Rick has exactly one direct report who is a manager (employee 101), so the count is 1.

The dataset you are querying against may have different input & output - this is just an example!
