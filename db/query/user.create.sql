-- name: CreateCreds :one
INSERT INTO 
  creds(hashed_pass, rv)
VALUES 
  ($1, $2) RETURNING cred_id, created_at;

-- name: CreateUserInfoBasic :one
INSERT INTO 
  users_info(first_name, last_name, dob, rv)
VALUES 
  ($1, $2, $3, $4) RETURNING user_info_id, created_at;

-- name: CreateUserBasic :one
INSERT INTO 
  users(email, username, status_id, cred_id, user_info_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6) RETURNING user_id, email, username, user_info_id, created_at;

-- name: CreateUserRoleAppCompany :exec
INSERT INTO 
  users_roles_apps_companies(user_id, role_id, app_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4, $5);


-- name: CreateUserRoleAppPositionTeamCompany :exec
INSERT INTO 
  users_roles_apps_positions_teams_companies(user_id, role_id, app_id, position_id, team_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7);

-- name: CreateUserLog :exec
INSERT INTO 
  user_logs(event, device, os, ip, agent, position_id, company_id, role_id, team_id, app_id, creator)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);