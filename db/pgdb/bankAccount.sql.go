// Code generated by sqlc. DO NOT EDIT.
// source: bankAccount.sql

package pgdb

import (
	"context"
)

const createBankAccountBasic = `-- name: CreateBankAccountBasic :one
INSERT INTO 
  bank_account(bank, account_number, account_type, isbn, rv)
VALUES 
  ($1, $2, $3, $4, $5) RETURNING bank_account_id
`

type CreateBankAccountBasicParams struct {
	Bank          string `db:"bank" json:"bank"`
	AccountNumber string `db:"account_number" json:"account_number"`
	AccountType   string `db:"account_type" json:"account_type"`
	Isbn          string `db:"isbn" json:"isbn"`
	Rv            int32  `db:"rv" json:"rv"`
}

func (q *Queries) CreateBankAccountBasic(ctx context.Context, arg CreateBankAccountBasicParams) (int64, error) {
	row := q.queryRow(ctx, q.createBankAccountBasicStmt, createBankAccountBasic,
		arg.Bank,
		arg.AccountNumber,
		arg.AccountType,
		arg.Isbn,
		arg.Rv,
	)
	var bank_account_id int64
	err := row.Scan(&bank_account_id)
	return bank_account_id, err
}

const deleteBankAccount = `-- name: DeleteBankAccount :exec
UPDATE
  bank_account
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  bank_account_id = $1 AND deleted = false
`

func (q *Queries) DeleteBankAccount(ctx context.Context, bankAccountID int64) error {
	_, err := q.exec(ctx, q.deleteBankAccountStmt, deleteBankAccount, bankAccountID)
	return err
}

const updateBankAccount = `-- name: UpdateBankAccount :exec
UPDATE
  bank_account
SET 
  (bank, account_number, account_type, isbn, updated_at, rv) 
  = ($2, $3, $4, $5, now(), $6)
WHERE
  bank_account_id = $1 AND deleted = false
`

type UpdateBankAccountParams struct {
	BankAccountID int64  `db:"bank_account_id" json:"bank_account_id"`
	Bank          string `db:"bank" json:"bank"`
	AccountNumber string `db:"account_number" json:"account_number"`
	AccountType   string `db:"account_type" json:"account_type"`
	Isbn          string `db:"isbn" json:"isbn"`
	Rv            int32  `db:"rv" json:"rv"`
}

func (q *Queries) UpdateBankAccount(ctx context.Context, arg UpdateBankAccountParams) error {
	_, err := q.exec(ctx, q.updateBankAccountStmt, updateBankAccount,
		arg.BankAccountID,
		arg.Bank,
		arg.AccountNumber,
		arg.AccountType,
		arg.Isbn,
		arg.Rv,
	)
	return err
}
