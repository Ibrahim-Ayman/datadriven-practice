SELECT tbl_name , 
    PERCENTILE_CONT(0.5) 
    WITHIN GROUP (ORDER BY fail_pct) AS median 
FROM dq_checks dc
GROUP BY tbl_name
