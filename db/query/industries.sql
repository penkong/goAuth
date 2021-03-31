-- name: CreateIndustryBasic :one
INSERT INTO 
  industries(industry, how_clean, rv)
VALUES 
  ($1, $2, $3) RETURNING industry_id, industry;

-- name: GetIndustryById :one
SELECT 
  industry_id, industry, how_clean, created_at, updated_at 
FROM 
  industries 
WHERE 
  industry_id = $1 AND deleted = false;

-- name: GetIndustryByName :one
SELECT 
  industry_id, industry, how_clean, created_at, updated_at 
FROM 
  industries 
WHERE 
  industry = $1 AND deleted = false;

-- name: GetIndustries :many
SELECT 
  industry_id, industry, how_clean, created_at, updated_at 
FROM 
  industries 
WHERE 
  deleted = false
LIMIT $1 OFFSET $2;

-- name: UpdateIndustryById :one
SELECT 
  industry_id, industry, how_clean, created_at, updated_at 
FROM 
  industries 
WHERE 
  industry_id = $1 AND deleted = false;

-- name: DeleteIndustry :exec
UPDATE
  industries 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  industry_id = $1;