
-- name: CreateAppBasic :one
INSERT INTO 
  apps(app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING app_id, app;