WITH dept_total_metric
AS (
SELECT department dept , SUM(metric_value) AS q1_metric_total
FROM employee_metrics em
WHERE fiscal_quarter = 'Q1'
GROUP BY department
) , dept_total_payroll
AS (
SELECT department dept , SUM(salary) AS total_payroll
FROM employees e 
GROUP BY department 
)

SELECT dtp.dept , 
    total_payroll , 
    COALESCE(q1_metric_total , 0) AS q1_metric_total 
FROM dept_total_payroll dtp
LEFT JOIN dept_total_metric dtm
ON dtp.dept = dtm.dept
