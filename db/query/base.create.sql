-- name: CreateIndustryBasic :one
INSERT INTO 
  industries(industry, how_clean, rv)
VALUES 
  ($1, $2, $3) RETURNING industry_id, industry;

-- name: CreateStatusBasic :one
INSERT INTO 
  statuses(status, rv)
VALUES 
  ($1, $2) RETURNING status_id, status;

-- name: CreateRoleBasic :one
INSERT INTO 
  roles(role, rv)
VALUES 
  ($1, $2) RETURNING role_id, role;

-- name: CreatePositionBasic :one
INSERT INTO 
  positions(department, position, rv)
VALUES 
  ($1, $2, $3) RETURNING position_id, department, position;

-- name: CreateAppBasic :one
INSERT INTO 
  apps(app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING app_id, app;

-- name: CreateTeamBasic :one
INSERT INTO 
  teams(team, industry_id, rv)
VALUES 
  ($1, $2, $3) RETURNING team_id, team;

-- name: CreateCompanyBasic :one
INSERT INTO 
  companies(company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING company_id, company;

-- name: CreateTeamsAppsCompanies :one
INSERT INTO 
  teams_apps_companies(team_id, app_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4) RETURNING team_app_company_id, team_id, app_id, company_id;


-- name: CreateBankAccountBasic :one
INSERT INTO 
  bank_account(bank, account_number, account_type, isbn, rv)
VALUES 
  ($1, $2, $3, $4, $5) RETURNING bank_account_id;

-- name: CreateBankAccountAllBasic :exec
INSERT INTO 
  bank_account_all(account_1, rv)
VALUES 
  ($1, $2);

-- name: CreateBusinessLogs :exec
INSERT INTO 
  business_logs(event, device, os, ip, agent, position_id, company_id, role_id, team_id, app_id, creator)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);





