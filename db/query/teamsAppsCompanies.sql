

-- name: CreateTeamsAppsCompanies :one
INSERT INTO 
  teams_apps_companies(team_id, app_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4) RETURNING team_app_company_id, team_id, app_id, company_id;
