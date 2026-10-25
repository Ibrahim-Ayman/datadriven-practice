SELECT user_id , username , email , 
      token_id , scope
FROM users u 
INNER JOIN api_tokens at
ON u.user_id = at.owner_id 
WHERE scope LIKE '%admin%'
ORDER BY user_id , DATE(issued)
