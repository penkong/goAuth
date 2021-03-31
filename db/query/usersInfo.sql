-- name: CreateUserInfoBasic :one
INSERT INTO 
  users_info(first_name, last_name, dob, rv)
VALUES 
  ($1, $2, $3, $4) RETURNING user_info_id, created_at;

-- name: GetUserInfoBasic :one
SELECT 
  *
FROM 
  users_info 
WHERE 
  user_info_id = $1 AND deleted = false;