-- name: CreateRoleBasic :one
INSERT INTO
  roles (role_name, rv)
VALUES
  ($ 1, $ 2) RETURNING *;

-- name: CreateIndustryBasic :one
INSERT INTO
  industries (industry_name, how_clean, rv)
VALUES
  ($ 1, $ 2, $ 3) RETURNING *;

-- name: CreateCompanyBasic :one
INSERT INTO
  companies (
    company_name,
    industry_id,
    ceo_name,
    country,
    region,
    address,
    how_clean,
    rv
  )
VALUES
  ($ 1, $ 2, $ 3, $ 4, $ 5, $ 6, $ 7, $ 8) RETURNING *;

-- name: CreateAppBasic :one
INSERT INTO
  apps (app_name, industry_id, company_id, team_id, rv)
VALUES
  ($ 1, $ 2, $ 3, $ 4, $ 4) RETURNING *;

-- name: CreateTeamBasic :one
INSERT INTO
  teams (team_name, industry_id, leader, rv)
VALUES
  ($ 1, $ 2, $ 3, $ 4) RETURNING *;

-- name: CreateAccountBasic :one
INSERT INTO
  accounts (bank_name, account_number, account_type, rv)
VALUES
  ($ 1, $ 2, $ 3, $ 4) RETURNING *;

-- name: CreateAccountAllBasic :one
INTO INTO accounts_all (account_main, rv)
VALUES
  ($ 1, $ 2) RETURNING *;