-- name: CreateRoleBasic :one
INSERT INTO 
  roles(role, rv)
VALUES 
  ($1, $2) RETURNING role_id, role;

-- name: GetRoleById :one
SELECT 
  role_id, role, created_at, updated_at
FROM 
  roles
WHERE 
  role_id = $1 AND deleted = false;

-- name: GetRoleByName :one
SELECT 
  role_id, role, created_at, updated_at
FROM 
  roles
WHERE 
  role = $1 AND deleted = false;

-- name: GetRoles :many
SELECT 
  role_id, role, created_at, updated_at
FROM 
  roles
WHERE 
  deleted = false;

-- name: UpdateRoleById :one
UPDATE
  roles 
SET 
  (role, updated_at, rv) = ($2, now(), $3)
WHERE
  role_id = $1 AND deleted = false RETURNING role_id, role, updated_at;

-- name: UpdateRoleByName :one
UPDATE
  roles 
SET 
  (role, updated_at, rv) = ($2, now(), $3)
WHERE
  role = $1 AND deleted = false RETURNING role_id, role, updated_at;

-- name: DeleteRole :exec
UPDATE
  roles 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  role_id = $1;