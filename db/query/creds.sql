-- name: CreateCreds :one
INSERT INTO 
  creds(hashed_pass, rv)
VALUES 
  ($1, $2) RETURNING cred_id, created_at;

-- name: GetCred :one
SELECT 
  cred_id , hashed_pass, created_at, updated_at
FROM 
  creds
WHERE 
  cred_id = $1 AND deleted = false;
