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


-- name: UpdatePostionById :one
UPDATE
  positions 
SET 
  (position, department, updated_at, rv) = ($2, now(), $3)
WHERE
  position_id = $1 AND deleted = false RETURNING position_id, position, department, updated_at;

-- name: UpdateAppByPaid :one
UPDATE
  apps
SET 
  (piad, updated_at, rv) = ($1, now(), $2)
WHERE
  app_id = $1 AND deleted = false RETURNING app_id, app, paid, updated_at;

-- name: UpdateAppById :one
UPDATE
  apps
SET 
  (piad, updated_at, rv) = ($1, now(), $2)
WHERE
  app_id = $1 AND deleted = false RETURNING app_id, app, paid, updated_at;

-- name: UpdateAppByName :one
UPDATE
  apps
SET 
  (app, industry_id, updated_at, rv) = ($1, $2, now(), $3)
WHERE
  deleted = false RETURNING app_id, app , updated_at;

-- name: UpdateAppByType :one
UPDATE
  apps
SET 
  (app_base_os, desktop, web, mobile, ios, android, pwa, updated_at, rv) = ($1, $2, $3, $4, $5, now(), $2)
WHERE
  deleted = false RETURNING app_id, app , updated_at;