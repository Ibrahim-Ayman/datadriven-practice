SELECT metric_value 
FROM employee_metrics 
GROUP BY metric_value
ORDER BY metric_value DESC
LIMIT 5
