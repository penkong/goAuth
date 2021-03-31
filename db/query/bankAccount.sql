-- name: CreateBankAccountBasic :one
INSERT INTO 
  bank_account(bank, account_number, account_type, isbn, rv)
VALUES 
  ($1, $2, $3, $4, $5) RETURNING bank_account_id;

-- name: UpdateBankAccount :exec
UPDATE
  bank_account
SET 
  (bank, account_number, account_type, isbn, updated_at, rv) 
  = ($2, $3, $4, $5, now(), $6)
WHERE
  bank_account_id = $1 AND deleted = false;

-- name: DeleteBankAccount :exec
UPDATE
  bank_account
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  bank_account_id = $1 AND deleted = false;