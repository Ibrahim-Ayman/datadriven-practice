WITH svc_uptime_avg
AS (
SELECT svc_name , AVG(uptime) AS avg_uptime 
FROM svc_health sh
GROUP BY svc_name
) , gap_to_best_tiers AS 
(
SELECT svc_name , avg_uptime , NTILE(4) OVER(ORDER BY avg_uptime) AS tier ,
    FIRST_VALUE(avg_uptime) OVER(ORDER BY avg_uptime DESC) - avg_uptime AS gap_to_best
FROM svc_uptime_avg 
) , tiers_average AS
(
SELECT tier , MAX(avg_uptime) AS tier_best
FROM gap_to_best_tiers 
GROUP BY tier
)
SELECT svc_name , avg_uptime , gap_to_best ,tier_best - avg_uptime AS gap_to_tier_best  
FROM gap_to_best_tiers gtbt
INNER JOIN tiers_average ta
ON gtbt.tier = ta.tier
WHERE gtbt.tier IN (1,2)
