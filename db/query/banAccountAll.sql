

-- name: CreateBankAccountAllBasic :exec
INSERT INTO 
  bank_account_all(account_1, rv)
VALUES 
  ($1, $2);