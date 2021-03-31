-- name: CreateAppBasic :one
INSERT INTO 
  apps(app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING app_id, app;

-- name: GetAppById :one
SELECT 
  app_id, app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, created_at, updated_at
FROM 
  apps
WHERE 
  app_id = $1 AND deleted = false;

-- name: GetAppByName :one
SELECT 
  app_id, app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, created_at, updated_at
FROM 
  apps
WHERE 
  app = $1 AND deleted = false;

-- name: GetApps :many
SELECT 
  app_id, app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, created_at, updated_at
FROM 
  apps
WHERE 
  deleted = false;

-- name: UpdateAppByPaid :one
UPDATE
  apps
SET 
  (paid, updated_at, rv) = ($2, now(), $3)
WHERE
  app_id = $1 AND deleted = false RETURNING app_id, app, paid, updated_at;

-- name: UpdateAppById :one
UPDATE
  apps
SET 
  (paid, updated_at, rv) = ($1, now(), $2)
WHERE
  app_id = $1 AND deleted = false RETURNING app_id, app, paid, updated_at;

-- name: UpdateAppByName :one
UPDATE
  apps
SET 
  (app, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  app = $1 AND deleted = false RETURNING app_id, app , updated_at;

-- name: UpdateAppEnvs :one
UPDATE
  apps
SET 
  (app_base_os, desktop, web, mobile, ios, android, pwa, updated_at, rv) = ($2, $3, $4, $5, $6, now(), $7)
WHERE
  app = $1 AND deleted = false RETURNING app_id, app , updated_at;

-- name: DeleteApp :exec
UPDATE
  apps 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  app_id = $1 AND deleted = false;