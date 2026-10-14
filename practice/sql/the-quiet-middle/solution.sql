SELECT job_name , rnk
FROM (
SELECT job_name , rows_done ,
    DENSE_RANK() OVER(order by rows_done DESC) rnk
FROM batch_jobs 
WHERE rows_done != (
SELECT MAX(rows_done)
FROM batch_jobs
) OR rows_done != (
SELECT MIN(rows_done)
FROM batch_jobs
)
) AS newtable
WHERE rnk BETWEEN 8 AND 10
