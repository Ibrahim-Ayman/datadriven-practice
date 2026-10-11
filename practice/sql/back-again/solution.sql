WITH user_trans_count
AS (
  SELECT user_id , COUNT(transaction_id) txn_count
  FROM transactions t
  WHERE total_amount > 0 
  GROUP BY user_id
) , user_tiers 
AS (
  SELECT u.username, txn_count, DENSE_RANK() OVER(ORDER BY txn_count DESC) AS tier
  FROM 
  user_trans_count t
  INNER JOIN users u
  ON t.user_id = u.user_id
)

SELECT username, txn_count , tier 
FROM user_tiers 
WHERE tier = 1 OR tier = 2
