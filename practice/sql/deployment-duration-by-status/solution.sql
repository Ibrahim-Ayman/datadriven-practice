SELECT LOWER(svc_name) svc_name , LOWER(status) status , SUM(dur_secs) total_duration
FROM deploy_logs dl
GROUP BY LOWER(TRIM(svc_name)) , LOWER(status)
ORDER BY svc_name , status
