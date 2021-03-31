-- name: CreateCreds :one
INSERT INTO 
  creds(hashed_pass, rv)
VALUES 
  ($1, $2) RETURNING cred_id, created_at;

-- name: CreateUserInfoBasic :one
INSERT INTO 
  users_info(first_name, last_name, dob, rv)
VALUES 
  ($1, $2, $3, $4) RETURNING user_info_id, created_at;

-- name: CreateUserBasic :one
INSERT INTO 
  users(email, username, status_id, cred_id, user_info_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6) RETURNING user_id, email, username, user_info_id, created_at;
  