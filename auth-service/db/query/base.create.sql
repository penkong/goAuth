-- name: CreateRole :one
INSERT INTO
  roles (role_name, rv)
VALUES
  ($ 1, $ 2) RETURNING *;

-- name: CreateIndustry :one
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
    how_clean
  )
VALUES
  ($ 1, $ 2, $ 3, $ 4, $ 5, $ 6) RETURNING *;

-- name: CreateAppBasic :one
INSERT INTO
  apps (app_name, industry_name, company_id)
VALUES
  () RETURNING *;