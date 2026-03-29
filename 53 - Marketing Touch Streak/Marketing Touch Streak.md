# Snowflake CRM Marketing Analytics [SQL Interview Question]

> Problem info:
> Difficulty: `Medium`
> Company: `Snowflake`

Snowflake's Marketing Analytics team is analyzing customer relationship management (CRM) data to identify high-engagement contacts based on marketing touch activity.

The objective is to find contacts who meet **both** of the following conditions:

- Had marketing touches for **three or more consecutive weeks**
- Had **at least one** marketing touch with event type `trial_request`

Marketing touches represent interactions or points of contact between a brand and its customers.

Return the **email addresses** of these qualifying contacts.

---

## `marketing_touches` Schema:

| Column Name | Type | Description |
|------------|------|-------------|
| event_id   | integer | Unique identifier for each marketing touch |
| contact_id | integer | The ID of the contact |
| event_type | string  | Type of marketing touch (`webinar`, `conference_registration`, `trial_request`, etc.) |
| event_date | date    | Date of the marketing touch |

### `marketing_touches` Example Input:

| event_id | contact_id | event_type              | event_date |
|----------|------------|--------------------------|------------|
| 1        | 1          | webinar                  | 4/17/2022  |
| 2        | 1          | trial_request            | 4/23/2022  |
| 3        | 1          | whitepaper_download      | 4/30/2022  |
| 4        | 2          | handson_lab              | 4/19/2022  |
| 5        | 2          | trial_request            | 4/23/2022  |
| 6        | 2          | conference_registration  | 4/24/2022  |
| 7        | 3          | whitepaper_download      | 4/30/2022  |
| 8        | 4          | trial_request            | 4/30/2022  |
| 9        | 4          | webinar                  | 5/14/2022  |

---

## `crm_contacts` Schema:

| Column Name | Type | Description |
|------------|------|-------------|
| contact_id | integer | Unique identifier for the contact |
| email      | string  | Email address of the contact |

### `crm_contacts` Example Input:

| contact_id | email                       |
|------------|-----------------------------|
| 1          | andy.markus@att.net         |
| 2          | rajan.bhatt@capitalone.com  |
| 3          | lissa_rogers@jetblue.com    |
| 4          | kevinliu@square.com         |

---

## Example Output:

| email                     |
|---------------------------|
| andy.markus@att.net       |

---

## Explanation:

- **Contact ID 1**:
  - Has a `trial_request`
  - Has marketing touches across **3 consecutive weeks**
  - ✅ Included in output

- **Contact ID 2**:
  - Has a `trial_request`
  - ❌ All touches occur within the **same week**, not consecutive weeks

- **Contact IDs 3 & 4**:
  - ❌ Do not meet both conditions

---

The dataset you are querying against may have different input & output - this is just an example!
