-- name: GetCred :one
SELECT 
  cred_id , hashed_pass, created_at, updated_at
FROM 
  creds
WHERE 
  cred_id = $1 AND deleted = false;

-- name: GetUserInfoBasic :one
SELECT 
  *
FROM 
  users_info 
WHERE 
  user_info_id = $1 AND deleted = false;

-- name: GetUserBasic :one
SELECT 
  email, username, cred_id, user_info_id, status_id, updated_at
FROM 
  users 
WHERE 
  (email = $1 OR username = $2) AND deleted = false;

-- name: GetBankAccountAllBasic :one
SELECT 
  account_1, created_at, updated_at
FROM
  bank_account_all
WHERE
  bank_account_all_id = $1 AND deleted = false;

-- name: GetUserRoleAppCompanyByUserAppId :one
SELECT 
  user_id, role_id, app_id, company_id, created_at, updated_at
FROM
  users_roles_apps_companies
WHERE
  user_id = $1 AND app_id = $2 AND deleted = false;

-- name: GetUserRoleAppPositionTeamCompany :one
SELECT 
  user_id
FROM
  users_roles_apps_positions_teams_companies
WHERE
  user_id = $1 AND app_id = $2 AND deleted = false;