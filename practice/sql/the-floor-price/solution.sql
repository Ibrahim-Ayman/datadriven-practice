SELECT UPPER(provider) provider, MAX(amount) max_amount
FROM cloud_costs cc 
WHERE acct_id IS NOT NULL
GROUP BY UPPER(provider)
