// Code generated by sqlc. DO NOT EDIT.
// source: statuses.sql

package pgdb

import (
	"context"
	"database/sql"
	"time"
)

const createStatusBasic = `-- name: CreateStatusBasic :one
INSERT INTO 
  statuses(status, rv)
VALUES 
  ($1, $2) RETURNING status_id, status
`

type CreateStatusBasicParams struct {
	Status sql.NullString `db:"status" json:"status"`
	Rv     int32          `db:"rv" json:"rv"`
}

type CreateStatusBasicRow struct {
	StatusID int64          `db:"status_id" json:"status_id"`
	Status   sql.NullString `db:"status" json:"status"`
}

func (q *Queries) CreateStatusBasic(ctx context.Context, arg CreateStatusBasicParams) (CreateStatusBasicRow, error) {
	row := q.queryRow(ctx, q.createStatusBasicStmt, createStatusBasic, arg.Status, arg.Rv)
	var i CreateStatusBasicRow
	err := row.Scan(&i.StatusID, &i.Status)
	return i, err
}

const deleteStatus = `-- name: DeleteStatus :exec
UPDATE
  industries 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  industry_id = $1
`

func (q *Queries) DeleteStatus(ctx context.Context, industryID int64) error {
	_, err := q.exec(ctx, q.deleteStatusStmt, deleteStatus, industryID)
	return err
}

const getStatusById = `-- name: GetStatusById :one
SELECT 
  status_id, status, created_at, updated_at
FROM 
  statuses
WHERE 
  status_id = $1 AND deleted = false
`

type GetStatusByIdRow struct {
	StatusID  int64          `db:"status_id" json:"status_id"`
	Status    sql.NullString `db:"status" json:"status"`
	CreatedAt time.Time      `db:"created_at" json:"created_at"`
	UpdatedAt sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetStatusById(ctx context.Context, statusID int64) (GetStatusByIdRow, error) {
	row := q.queryRow(ctx, q.getStatusByIdStmt, getStatusById, statusID)
	var i GetStatusByIdRow
	err := row.Scan(
		&i.StatusID,
		&i.Status,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getStatusByName = `-- name: GetStatusByName :one
SELECT 
  status_id, status, created_at, updated_at
FROM 
  statuses
WHERE 
  status = $1 AND deleted = false
`

type GetStatusByNameRow struct {
	StatusID  int64          `db:"status_id" json:"status_id"`
	Status    sql.NullString `db:"status" json:"status"`
	CreatedAt time.Time      `db:"created_at" json:"created_at"`
	UpdatedAt sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetStatusByName(ctx context.Context, status sql.NullString) (GetStatusByNameRow, error) {
	row := q.queryRow(ctx, q.getStatusByNameStmt, getStatusByName, status)
	var i GetStatusByNameRow
	err := row.Scan(
		&i.StatusID,
		&i.Status,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getStatuses = `-- name: GetStatuses :many
SELECT 
  status_id, status, created_at, updated_at
FROM 
  statuses 
WHERE 
  deleted = false
`

type GetStatusesRow struct {
	StatusID  int64          `db:"status_id" json:"status_id"`
	Status    sql.NullString `db:"status" json:"status"`
	CreatedAt time.Time      `db:"created_at" json:"created_at"`
	UpdatedAt sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetStatuses(ctx context.Context) ([]GetStatusesRow, error) {
	rows, err := q.query(ctx, q.getStatusesStmt, getStatuses)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetStatusesRow
	for rows.Next() {
		var i GetStatusesRow
		if err := rows.Scan(
			&i.StatusID,
			&i.Status,
			&i.CreatedAt,
			&i.UpdatedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const updateSatusById = `-- name: UpdateSatusById :one
UPDATE
  statuses 
SET 
  (status, updated_at, rv) = ($2, now(), $3)
WHERE
  status_id = $1 AND deleted = false RETURNING status_id, status, updated_at
`

type UpdateSatusByIdParams struct {
	StatusID int64          `db:"status_id" json:"status_id"`
	Status   sql.NullString `db:"status" json:"status"`
	Rv       int32          `db:"rv" json:"rv"`
}

type UpdateSatusByIdRow struct {
	StatusID  int64          `db:"status_id" json:"status_id"`
	Status    sql.NullString `db:"status" json:"status"`
	UpdatedAt sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateSatusById(ctx context.Context, arg UpdateSatusByIdParams) (UpdateSatusByIdRow, error) {
	row := q.queryRow(ctx, q.updateSatusByIdStmt, updateSatusById, arg.StatusID, arg.Status, arg.Rv)
	var i UpdateSatusByIdRow
	err := row.Scan(&i.StatusID, &i.Status, &i.UpdatedAt)
	return i, err
}

const updateSatusByName = `-- name: UpdateSatusByName :one
UPDATE
  statuses 
SET 
  (status, updated_at, rv) = ($2, now(), $3)
WHERE
  status = $1 AND deleted = false RETURNING status_id, status, updated_at
`

type UpdateSatusByNameParams struct {
	Status   sql.NullString `db:"status" json:"status"`
	Status_2 sql.NullString `db:"status_2" json:"status_2"`
	Rv       int32          `db:"rv" json:"rv"`
}

type UpdateSatusByNameRow struct {
	StatusID  int64          `db:"status_id" json:"status_id"`
	Status    sql.NullString `db:"status" json:"status"`
	UpdatedAt sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateSatusByName(ctx context.Context, arg UpdateSatusByNameParams) (UpdateSatusByNameRow, error) {
	row := q.queryRow(ctx, q.updateSatusByNameStmt, updateSatusByName, arg.Status, arg.Status_2, arg.Rv)
	var i UpdateSatusByNameRow
	err := row.Scan(&i.StatusID, &i.Status, &i.UpdatedAt)
	return i, err
}