// Code generated by sqlc. DO NOT EDIT.
// source: creds.sql

package pgdb

import (
	"context"
	"database/sql"
	"time"

	"github.com/google/uuid"
)

const createCreds = `-- name: CreateCreds :one
INSERT INTO 
  creds(hashed_pass, rv)
VALUES 
  ($1, $2) RETURNING cred_id, created_at
`

type CreateCredsParams struct {
	HashedPass string `db:"hashed_pass" json:"hashed_pass"`
	Rv         int32  `db:"rv" json:"rv"`
}

type CreateCredsRow struct {
	CredID    uuid.UUID `db:"cred_id" json:"cred_id"`
	CreatedAt time.Time `db:"created_at" json:"created_at"`
}

func (q *Queries) CreateCreds(ctx context.Context, arg CreateCredsParams) (CreateCredsRow, error) {
	row := q.queryRow(ctx, q.createCredsStmt, createCreds, arg.HashedPass, arg.Rv)
	var i CreateCredsRow
	err := row.Scan(&i.CredID, &i.CreatedAt)
	return i, err
}

const getCred = `-- name: GetCred :one
SELECT 
  cred_id , hashed_pass, created_at, updated_at
FROM 
  creds
WHERE 
  cred_id = $1 AND deleted = false
`

type GetCredRow struct {
	CredID     uuid.UUID    `db:"cred_id" json:"cred_id"`
	HashedPass string       `db:"hashed_pass" json:"hashed_pass"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetCred(ctx context.Context, credID uuid.UUID) (GetCredRow, error) {
	row := q.queryRow(ctx, q.getCredStmt, getCred, credID)
	var i GetCredRow
	err := row.Scan(
		&i.CredID,
		&i.HashedPass,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}