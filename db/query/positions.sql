-- name: CreatePositionBasic :one
INSERT INTO 
  positions(department, position, rv)
VALUES 
  ($1, $2, $3) RETURNING position_id, department, position;

-- name: GetPositionById :one
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  position_id = $1 AND deleted = false;

-- name: GetPositionByName :one
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  position = $1 AND deleted = false;

-- name: GetPositionByDepartment :one
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  department = $1 AND deleted = false;

-- name: GetPositions :many
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  deleted = false;

-- name: UpdatePostionById :one
UPDATE
  positions 
SET 
  (position, department, updated_at, rv) = ($2, now(), $3)
WHERE
  position_id = $1 AND deleted = false RETURNING position_id, position, department, updated_at;

-- name: DeletePosition :exec
UPDATE
  positions 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  position_id = $1 AND deleted = false;