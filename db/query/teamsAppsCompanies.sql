-- name: CreateTeamsAppsCompanies :one
INSERT INTO 
  teams_apps_companies(team_id, app_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4) RETURNING team_app_company_id, team_id, app_id, company_id;

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

-- name: UpdateTeamAppCompany :one
UPDATE
  teams_apps_companies
SET 
  (team_id, app_id, company_id, updated_at, rv) 
  = ($2, $3, $4, now(), $5)
WHERE
  team_app_company_id = $1 AND deleted = false RETURNING team_app_company_id, team_id, app_id, company_id, updated_at;

-- name: DeleteTeamsAppsCompanies :exec
UPDATE
  teams_apps_companies
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  team_app_company_id = $1 AND deleted = false;
