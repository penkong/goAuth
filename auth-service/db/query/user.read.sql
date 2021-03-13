-- name: CreateRole :one
INSERT INTO
  roles (role_name, rv)
VALUES
  ($ 1, $ 2) RETURNING *;