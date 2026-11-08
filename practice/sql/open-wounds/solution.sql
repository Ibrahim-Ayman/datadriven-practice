WITH svc_min_t
AS (
SELECT svc_name , MIN(fired_at) t
FROM alert_events ae
WHERE resolved IS NULL
GROUP BY svc_name 
)

SELECT  ae.svc_name , alert_id , severity , status , fired_at
FROM alert_events ae 
INNER JOIN svc_min_t smt
ON ae.svc_name = smt.svc_name 
AND ae.fired_at = smt.t
ORDER BY ae.svc_name
