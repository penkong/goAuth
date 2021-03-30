-- name: DeleteIndustry :exec
UPDATE
  industries 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  industry_id = $1;

-- name: DeleteStatus :exec
UPDATE
  industries 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  industry_id = $1;

-- name: DeleteRole :exec
UPDATE
  roles 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  role_id = $1;

-- name: DeletePosition :exec
UPDATE
  positions 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  position_id = $1 AND deleted = false;

-- name: DeleteApp :exec
UPDATE
  apps 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  app_id = $1 AND deleted = false;

-- name: DeleteTeam :exec
UPDATE
  teams
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  team_id = $1 AND deleted = false;

-- name: DeleteCompany :exec
UPDATE
  companies
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  company_id = $1 AND deleted = false;

-- name: DeleteTeamsAppsCompanies :exec
UPDATE
  teams_apps_companies
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  team_app_company_id = $1 AND deleted = false;

-- name: DeleteBankAccount :exec
UPDATE
  bank_account
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  bank_account_id = $1 AND deleted = false;

-- name: DeleteBankAccountAll :exec
UPDATE
  bank_account_all
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  bank_account_all_id = $1 AND deleted = false;