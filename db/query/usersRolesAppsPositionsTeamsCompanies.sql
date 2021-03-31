-- name: CreateUserRoleAppPositionTeamCompany :exec
INSERT INTO 
  users_roles_apps_positions_teams_companies(user_id, role_id, app_id, position_id, team_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7);

-- name: GetUserRoleAppPositionTeamCompany :one
SELECT 
  user_id
FROM
  users_roles_apps_positions_teams_companies
WHERE
  user_id = $1 AND app_id = $2 AND deleted = false;