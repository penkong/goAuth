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

-- name: UpdateTeamById :one
UPDATE
  teams
SET 
  (team, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  team_id = $1 AND deleted = false RETURNING team_id, team, industry_id, updated_at;

-- name: UpdateTeamByName :one
UPDATE
  teams
SET 
  (team, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  team = $1 AND deleted = false RETURNING team_id, team, industry_id, updated_at;

-- name: UpdateCompanyById :one
UPDATE
  companies
SET 
  (company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, updated_at, rv) 
  = ($2, $3, $4, $5, $6, $7, $8, $9, $10, $11, now(), $12)
WHERE
  company_id = $1 AND deleted = false RETURNING company_id, company, industry_id, updated_at;

-- name: UpdateCompanyBankAccount :one
UPDATE
  companies
SET 
  (bank_account_all_id, updated_at, rv) 
  = ($2, now(), $3)
WHERE
  company_id = $1 AND deleted = false RETURNING company_id, company, updated_at;

-- name: UpdateTeamAppCompany :one
UPDATE
  teams_apps_companies
SET 
  (team_id, app_id, company_id, updated_at, rv) 
  = ($2, $3, $4, now(), $5)
WHERE
  team_app_company_id = $1 AND deleted = false RETURNING team_app_company_id, team_id, app_id, company_id, updated_at;

-- name: UpdateBankAccount :exec
UPDATE
  bank_account
SET 
  (bank, account_number, account_type, isbn, updated_at, rv) 
  = ($2, $3, $4, $5, now(), $6)
WHERE
  bank_account_id = $1 AND deleted = false;

-- name: UpdateBankAccountAll :exec
UPDATE
  bank_account_all
SET 
  (account_1, account_2, account_3, account_4, account_5, updated_at, rv) 
  = ($2, $3, $4, $5, $6, now(), $7)
WHERE
  bank_account_all_id = $1 AND deleted = false;