SELECT device_type , 
    AVG(session_duration_sec) avg_duration ,
    MAX(session_duration_sec) max_duration , 
    COUNT(session_id) session_count
FROM user_sessions us
INNER JOIN devices d 
ON us.device_id = d.device_id 
GROUP BY device_type 
HAVING COUNT(session_id) >= 35
