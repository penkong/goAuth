-- name: CreateCredFirst :one
INSERT INTO creds (hashed_pass) VALUES ($1) RETURNING *;

-- name: CreateUserBaseInfo :one
INSERT INTO
  users_info (first_name, last_name, dob, rv)
VALUES
  ($1, $2, $3, $4) RETURNING *;


