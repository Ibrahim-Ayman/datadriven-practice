WITH err_cate
AS (
SELECT err_type , 
        CASE 
            WHEN LOWER(err_type) LIKE '%memory%' 
                THEN 'memory' 
            WHEN LOWER(err_type) LIKE '%timeout%' 
                THEN 'timeout' 
            ELSE 'other'
            END error_category
FROM err_tracks et)

SELECT error_category , COUNT(*) AS track_count
FROM err_cate
GROUP BY error_category
