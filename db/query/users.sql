-- name: CreateUserBasic :one
INSERT INTO 
  users(email, username, status_id, cred_id, user_info_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6) RETURNING user_id, email, username, user_info_id, created_at;
  
-- name: GetUserBasic :one
SELECT 
  email, username, cred_id, user_info_id, status_id, updated_at
FROM 
  users 
WHERE 
  (email = $1 OR username = $2) AND deleted = false;
