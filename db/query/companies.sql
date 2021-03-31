-- name: CreateCompanyBasic :one
INSERT INTO 
  companies(company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING company_id, company;

-- name: GetCompanyById :one
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  company_id = $1 AND deleted = false;

-- name: GetCompanyByName :one
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  company = $1 AND deleted = false;

-- name: GetCompanies :many
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  deleted = false
LIMIT $1
OFFSET $2;

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

-- name: DeleteCompany :exec
UPDATE
  companies
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  company_id = $1 AND deleted = false;