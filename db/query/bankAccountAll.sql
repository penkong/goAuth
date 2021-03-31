-- name: CreateBankAccountAllBasic :exec
INSERT INTO 
  bank_account_all(account_1, rv)
VALUES 
  ($1, $2);

-- name: GetBanAccountAllById :one
SELECT 
  bank_account_all_id, account_1, account_2, account_3, account_4, account_5
FROM 
  bank_account_all
WHERE 
  bank_account_all_id = $1 AND deleted = false;

-- name: UpdateBankAccountAll :exec
UPDATE
  bank_account_all
SET 
  (account_1, account_2, account_3, account_4, account_5, updated_at, rv) 
  = ($2, $3, $4, $5, $6, now(), $7)
WHERE
  bank_account_all_id = $1 AND deleted = false;

-- name: DeleteBankAccountAll :exec
UPDATE
  bank_account_all
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  bank_account_all_id = $1 AND deleted = false;