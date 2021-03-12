-- name: CreateUserBaseInfo :one
INSERT INTO
  users_info (first_name, last_name, dob, rv)
VALUES
  ($1, $2, $3, $4) RETURNING *;

-- name: CreateRole :one
INSERT INTO
  roles (role_name, rv)
VALUES
  ($1, $2) RETURNING *;

-- name: CreateTeamBasic :one 
INSERT INTO
  teams (team_name, indsutry, rv)
VALUES
  ($1, $2, $3) RETURNING *;

-- name: CreateCred :one
INSERT INTO
  creds (hashed_pass)
VALUES
  ($1) RETURNING *;

-- name: CreateUser :one
INSERT INTO
  users (
    email,
    username,
    user_info_id,
    cred_id,
    role_id,
    team_id,
    rv
  )
VALUES
  ($1, $2, $3, $4, $5, $6, $7) RETURNING *;