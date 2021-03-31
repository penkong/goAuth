
-- name: GetStatusById :one
SELECT 
  status_id, status, created_at, updated_at
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

-- name: GetTeamById :one
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  team_id = $1 AND deleted = false;

-- name: GetTeamByName :one
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  team = $1 AND deleted = false;

-- name: GetTeams :many
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  deleted = false
LIMIT $1
OFFSET $2;

-- name: GetCompanyById :one
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  company_id = $1 AND deleted = false;

-- name: GetCompanyByName :one
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  company = $1 AND deleted = false;

-- name: GetCompanies :many
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  deleted = false
LIMIT $1
OFFSET $2;

-- name: GetTeamsAppsCompaniesById :one
SELECT 
  team_app_company_id, team_id, app_id, company_id, created_at, updated_at
FROM 
  teams_apps_companies
WHERE 
  team_app_company_id = $1 AND deleted = false;

-- name: GetTeamsAppsCompanies :many
SELECT 
  team_app_company_id, team_id, app_id, company_id, created_at, updated_at
FROM 
  teams_apps_companies
WHERE 
  deleted = false
LIMIT $1
OFFSET $2;

-- name: GetBanAccountAllById :one
SELECT 
  bank_account_all_id, account_1, account_2, account_3, account_4, account_5
FROM 
  bank_account_all
WHERE 
  bank_account_all_id = $1 AND deleted = false;