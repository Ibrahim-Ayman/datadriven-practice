SELECT LOWER(framework) AS framework, ROUND(AVG(accuracy) ,2 ) AS avg_accuracy
FROM ml_models 
WHERE REGEXP_LIKE(version , '(1\.\d+|2\.0)') = 1 
GROUP BY LOWER(framework)
