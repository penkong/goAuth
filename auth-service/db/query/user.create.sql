-- name: CreateCredBasic :one
INSERT INTO
  creds (hashed_pass, rv)
VALUES
  ($ 1, $ 2) RETURNING *;

-- name: CreateUserInfoBasic :one
INSERT INTO
  users_info (first_name, last_name, dob, rv)
VALUES
  ($ 1, $ 2, $ 3, $ 4) RETURNING *;

-- name: CreateUserBasic :one
INSERT INTO
  users (
    email,
    username,
    user_info_id,
    cred_id,
    apps_id,
    rv
  )
VALUES
  ($ 1, $ 2, $ 3, $ 4, $ 5, $ 6) RETURNING *;