SELECT first_session_date, COUNT(user_id) AS new_user_count
FROM (
SELECT user_id , MIN(DATE(session_start)) AS first_session_date
FROM user_sessions us
GROUP BY user_id 
) AS new_users
GROUP BY first_session_date
