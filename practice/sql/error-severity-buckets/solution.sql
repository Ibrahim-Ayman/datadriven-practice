SELECT err_type ,
    CASE 
        WHEN count = 0 THEN 'NONE'
        WHEN count < 6 THEN 'LOW'
        WHEN count < 21 THEN 'MODERATE'
        WHEN count < 51 THEN 'HIGH'
        ELSE 'CRITICAL' END AS severity_label
FROM err_tracks et
WHERE count > 0
