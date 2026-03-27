WITH cte AS (
SELECT transaction_id
  merchant_id, 
  credit_card_id, 
  amount, 
  transaction_timestamp as current_transaction,
  LAG(transaction_timestamp) OVER(PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS previous_transaction
FROM transactions
)

SELECT COUNT(merchant_id) as payment_count
FROM cte
WHERE current_transaction-previous_transaction <= INTERVAL '10 minutes'
