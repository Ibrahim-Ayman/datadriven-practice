SELECT ca.svc_name , ROUND(SUM(ca.amount) / COUNT(DISTINCT LOWER(team_name)) , 0)
FROM cost_allocs ca
INNER JOIN cloud_costs cc
ON ca.svc_name = cc.svc_name
GROUP BY ca.svc_name
