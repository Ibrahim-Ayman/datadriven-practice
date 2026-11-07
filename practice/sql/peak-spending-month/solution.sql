SELECT     
  to_char(bill_date, 'YYYY-MM') billing_month, 
  SUM(amount) total_amount
FROM cloud_costs cc
GROUP BY MONTH(bill_date) , YEAR(bill_date)
ORDER BY total_amount DESC
LIMIT 1
