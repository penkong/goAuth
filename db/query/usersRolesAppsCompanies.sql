-- name: CreateUserRoleAppCompany :exec
INSERT INTO 
  users_roles_apps_companies(user_id, role_id, app_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4, $5);

-- name: GetUserRoleAppCompanyByUserAppId :one
SELECT 
  user_id, role_id, app_id, company_id, created_at, updated_at
FROM
  users_roles_apps_companies
WHERE
  user_id = $1 AND app_id = $2 AND deleted = false;
