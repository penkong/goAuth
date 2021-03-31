
-- name: CreateRoleBasic :one
INSERT INTO 
  roles(role, rv)
VALUES 
  ($1, $2) RETURNING role_id, role;