-- name: CreateUserInfo :one
INSERT INTO users_info (first_name, last_name) VALUES ($1,$2) RETURNING *;

-- name: CreateUser :one
INSERT INTO users_login (email, username, hashed_pass, user_info_id, rv) VALUES ($1,$2,$3,$4,$5) RETURNING *;