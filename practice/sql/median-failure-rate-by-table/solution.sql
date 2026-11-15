WITH OrderedData AS (
    SELECT 
        tbl_name,
        fail_pct,
        ROW_NUMBER() OVER (PARTITION BY tbl_name ORDER BY fail_pct ASC) AS row_num,
        COUNT(*) OVER (PARTITION BY tbl_name) AS total_rows
    FROM dq_checks
    WHERE fail_pct IS NOT NULL
)
SELECT 
    tbl_name,
    AVG(fail_pct) AS median
FROM OrderedData
WHERE row_num IN (FLOOR((total_rows + 1) / 2.0), CEIL((total_rows + 1) / 2.0))
GROUP BY tbl_name;
