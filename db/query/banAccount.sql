

-- name: CreateBankAccountBasic :one
INSERT INTO 
  bank_account(bank, account_number, account_type, isbn, rv)
VALUES 
  ($1, $2, $3, $4, $5) RETURNING bank_account_id;