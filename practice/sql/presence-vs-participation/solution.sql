SELECT hostname , cpu_pct , 
      CASE   
        WHEN cpu_pct >= 50 THEN 'busy' 
        ELSE 'idle' 
        END AS load_status , 
      (
        SELECT COUNT(DISTINCT user_id) 
        FROM users
        WHERE account_status = 'active'
      ) AS active_users
FROM infra_nodes
WHERE region = 'us-east-1'
