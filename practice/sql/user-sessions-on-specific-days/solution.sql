SELECT *
FROM user_sessions 
WHERE TRIM(TO_CHAR(session_start , 'day')) 
IN ("saturday" , "monday")
