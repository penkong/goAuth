

-- name: CreateCompanyBasic :one
INSERT INTO 
  companies(company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING company_id, company;