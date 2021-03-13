-- name: CreateRole :one
INSERT INTO
  roles (role_name, rv)
VALUES
  ($1, $2) RETURNING *;

-- name: CreateIndustry :one
INSERT INTO
  industries (industry_name, how_clean)
VALUES
  ($1, $2) RETURNING *;

