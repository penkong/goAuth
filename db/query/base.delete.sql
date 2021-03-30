-- name: DeleteIndustry :exec
UPDATE
  industries 
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  industry_id = $1;

-- name: DeleteStatus :exec
UPDATE
  industries 
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  industry_id = $1;

-- name: DeleteRole :exec
UPDATE
  roles 
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  role_id = $1;

-- name: DeletePosition :exec
UPDATE
  positions 
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  position_id = $1;

-- name: DeleteApp :exec
UPDATE
  apps 
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  app_id = $1;

-- name: DeleteTeam :exec
UPDATE
  teams
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  team_id = $1;

-- name: DeleteCompany :exec
UPDATE
  companies
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  company_id = $1;

-- name: DeleteTeamsAppsCompanies :exec
UPDATE
  teams_apps_companies
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  team_app_company_id = $1;

-- name: DeleteBankAccount :exec
UPDATE
  bank_account
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  bank_account_id = $1;

-- name: DeleteBankAccountAll :exec
UPDATE
  bank_account_all
SET 
  (deleted_at, deleted) = (now(), true)
WHERE
  bank_account_all_id = $1;