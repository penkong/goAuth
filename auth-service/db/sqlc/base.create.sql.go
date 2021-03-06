// Code generated by sqlc. DO NOT EDIT.
// source: base.create.sql

package db

import (
	"context"
	"database/sql"
)

const createIndustry = `-- name: CreateIndustry :one
INSERT INTO
  industries (industry_name, how_clean)
VALUES
  ($1, $2) RETURNING id, industry_name, how_clean, deleted, created_at, updated_at, deleted_at, rv
`

type CreateIndustryParams struct {
	IndustryName string `db:"industry_name" json:"industry_name"`
	HowClean     string `db:"how_clean" json:"how_clean"`
}

func (q *Queries) CreateIndustry(ctx context.Context, arg CreateIndustryParams) (Industry, error) {
	row := q.queryRow(ctx, q.createIndustryStmt, createIndustry, arg.IndustryName, arg.HowClean)
	var i Industry
	err := row.Scan(
		&i.ID,
		&i.IndustryName,
		&i.HowClean,
		&i.Deleted,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.DeletedAt,
		&i.Rv,
	)
	return i, err
}

const createRole = `-- name: CreateRole :one
INSERT INTO
  roles (role_name, rv)
VALUES
  ($1, $2) RETURNING id, role_name, deleted, created_at, updated_at, deleted_at, rv
`

type CreateRoleParams struct {
	RoleName string        `db:"role_name" json:"role_name"`
	Rv       sql.NullInt32 `db:"rv" json:"rv"`
}

func (q *Queries) CreateRole(ctx context.Context, arg CreateRoleParams) (Role, error) {
	row := q.queryRow(ctx, q.createRoleStmt, createRole, arg.RoleName, arg.Rv)
	var i Role
	err := row.Scan(
		&i.ID,
		&i.RoleName,
		&i.Deleted,
		&i.CreatedAt,
		&i.UpdatedAt,
		&i.DeletedAt,
		&i.Rv,
	)
	return i, err
}
