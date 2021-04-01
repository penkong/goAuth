-- name: CreateStatusBasic :one
INSERT INTO 
  statuses(status, rv)
VALUES 
  ($1, $2) RETURNING status_id, status, created_at;

-- name: GetStatusById :one
SELECT 
  status_id, status, created_at
FROM 
  statuses
WHERE 
  status_id = $1 AND deleted = false;

-- name: GetStatusByName :one
SELECT 
  status_id, status, created_at, updated_at
FROM 
  statuses
WHERE 
  status = $1 AND deleted = false;

-- name: GetStatuses :many
SELECT 
  status_id, status, created_at, updated_at
FROM 
  statuses 
WHERE 
  deleted = false;

-- name: UpdateSatusById :one
UPDATE
  statuses 
SET 
  (status, updated_at, rv) = ($2, now(), $3)
WHERE
  status_id = $1 AND deleted = false RETURNING status_id, status, updated_at;

-- name: UpdateSatusByName :one
UPDATE
  statuses 
SET 
  (status, updated_at, rv) = ($2, now(), $3)
WHERE
  status = $1 AND deleted = false RETURNING status_id, status, updated_at;

-- name: DeleteStatus :one
UPDATE
  statuses 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  status_id = $1 RETURNING status_id, deleted_at, deleted;