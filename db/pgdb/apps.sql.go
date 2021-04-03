// Code generated by sqlc. DO NOT EDIT.
// source: apps.sql

package pgdb

import (
	"context"
	"database/sql"
	"time"
)

const createAppBasic = `-- name: CreateAppBasic :one
INSERT INTO 
  apps(app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING app_id, app
`

type CreateAppBasicParams struct {
	App        string        `db:"app" json:"app"`
	AppBaseOs  string        `db:"app_base_os" json:"app_base_os"`
	Desktop    sql.NullBool  `db:"desktop" json:"desktop"`
	Web        sql.NullBool  `db:"web" json:"web"`
	Mobile     sql.NullBool  `db:"mobile" json:"mobile"`
	Ios        sql.NullBool  `db:"ios" json:"ios"`
	Android    sql.NullBool  `db:"android" json:"android"`
	Pwa        sql.NullBool  `db:"pwa" json:"pwa"`
	Paid       sql.NullBool  `db:"paid" json:"paid"`
	IndustryID int64         `db:"industry_id" json:"industry_id"`
	Rv         sql.NullInt32 `db:"rv" json:"rv"`
}

type CreateAppBasicRow struct {
	AppID int64  `db:"app_id" json:"app_id"`
	App   string `db:"app" json:"app"`
}

func (q *Queries) CreateAppBasic(ctx context.Context, arg CreateAppBasicParams) (CreateAppBasicRow, error) {
	row := q.queryRow(ctx, q.createAppBasicStmt, createAppBasic,
		arg.App,
		arg.AppBaseOs,
		arg.Desktop,
		arg.Web,
		arg.Mobile,
		arg.Ios,
		arg.Android,
		arg.Pwa,
		arg.Paid,
		arg.IndustryID,
		arg.Rv,
	)
	var i CreateAppBasicRow
	err := row.Scan(&i.AppID, &i.App)
	return i, err
}

const deleteApp = `-- name: DeleteApp :exec
UPDATE
  apps 
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  app_id = $1 AND deleted = false
`

func (q *Queries) DeleteApp(ctx context.Context, appID int64) error {
	_, err := q.exec(ctx, q.deleteAppStmt, deleteApp, appID)
	return err
}

const getAppById = `-- name: GetAppById :one
SELECT 
  app_id, app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, created_at, updated_at
FROM 
  apps
WHERE 
  app_id = $1 AND deleted = false FOR NO KEY UPDATE
`

type GetAppByIdRow struct {
	AppID      int64        `db:"app_id" json:"app_id"`
	App        string       `db:"app" json:"app"`
	AppBaseOs  string       `db:"app_base_os" json:"app_base_os"`
	Desktop    sql.NullBool `db:"desktop" json:"desktop"`
	Web        sql.NullBool `db:"web" json:"web"`
	Mobile     sql.NullBool `db:"mobile" json:"mobile"`
	Ios        sql.NullBool `db:"ios" json:"ios"`
	Android    sql.NullBool `db:"android" json:"android"`
	Pwa        sql.NullBool `db:"pwa" json:"pwa"`
	Paid       sql.NullBool `db:"paid" json:"paid"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetAppById(ctx context.Context, appID int64) (GetAppByIdRow, error) {
	row := q.queryRow(ctx, q.getAppByIdStmt, getAppById, appID)
	var i GetAppByIdRow
	err := row.Scan(
		&i.AppID,
		&i.App,
		&i.AppBaseOs,
		&i.Desktop,
		&i.Web,
		&i.Mobile,
		&i.Ios,
		&i.Android,
		&i.Pwa,
		&i.Paid,
		&i.IndustryID,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getAppByName = `-- name: GetAppByName :one
SELECT 
  app_id, app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, created_at, updated_at
FROM 
  apps
WHERE 
  app = $1 AND deleted = false
`

type GetAppByNameRow struct {
	AppID      int64        `db:"app_id" json:"app_id"`
	App        string       `db:"app" json:"app"`
	AppBaseOs  string       `db:"app_base_os" json:"app_base_os"`
	Desktop    sql.NullBool `db:"desktop" json:"desktop"`
	Web        sql.NullBool `db:"web" json:"web"`
	Mobile     sql.NullBool `db:"mobile" json:"mobile"`
	Ios        sql.NullBool `db:"ios" json:"ios"`
	Android    sql.NullBool `db:"android" json:"android"`
	Pwa        sql.NullBool `db:"pwa" json:"pwa"`
	Paid       sql.NullBool `db:"paid" json:"paid"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetAppByName(ctx context.Context, app string) (GetAppByNameRow, error) {
	row := q.queryRow(ctx, q.getAppByNameStmt, getAppByName, app)
	var i GetAppByNameRow
	err := row.Scan(
		&i.AppID,
		&i.App,
		&i.AppBaseOs,
		&i.Desktop,
		&i.Web,
		&i.Mobile,
		&i.Ios,
		&i.Android,
		&i.Pwa,
		&i.Paid,
		&i.IndustryID,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getApps = `-- name: GetApps :many
SELECT 
  app_id, app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, created_at, updated_at
FROM 
  apps
WHERE 
  deleted = false
`

type GetAppsRow struct {
	AppID      int64        `db:"app_id" json:"app_id"`
	App        string       `db:"app" json:"app"`
	AppBaseOs  string       `db:"app_base_os" json:"app_base_os"`
	Desktop    sql.NullBool `db:"desktop" json:"desktop"`
	Web        sql.NullBool `db:"web" json:"web"`
	Mobile     sql.NullBool `db:"mobile" json:"mobile"`
	Ios        sql.NullBool `db:"ios" json:"ios"`
	Android    sql.NullBool `db:"android" json:"android"`
	Pwa        sql.NullBool `db:"pwa" json:"pwa"`
	Paid       sql.NullBool `db:"paid" json:"paid"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetApps(ctx context.Context) ([]GetAppsRow, error) {
	rows, err := q.query(ctx, q.getAppsStmt, getApps)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetAppsRow
	for rows.Next() {
		var i GetAppsRow
		if err := rows.Scan(
			&i.AppID,
			&i.App,
			&i.AppBaseOs,
			&i.Desktop,
			&i.Web,
			&i.Mobile,
			&i.Ios,
			&i.Android,
			&i.Pwa,
			&i.Paid,
			&i.IndustryID,
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

const updateAppById = `-- name: UpdateAppById :one
UPDATE
  apps
SET 
  (paid, updated_at, rv) = ($1, now(), $2)
WHERE
  app_id = $1 AND deleted = false RETURNING app_id, app, paid, updated_at
`

type UpdateAppByIdParams struct {
	Paid sql.NullBool  `db:"paid" json:"paid"`
	Rv   sql.NullInt32 `db:"rv" json:"rv"`
}

type UpdateAppByIdRow struct {
	AppID     int64        `db:"app_id" json:"app_id"`
	App       string       `db:"app" json:"app"`
	Paid      sql.NullBool `db:"paid" json:"paid"`
	UpdatedAt sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateAppById(ctx context.Context, arg UpdateAppByIdParams) (UpdateAppByIdRow, error) {
	row := q.queryRow(ctx, q.updateAppByIdStmt, updateAppById, arg.Paid, arg.Rv)
	var i UpdateAppByIdRow
	err := row.Scan(
		&i.AppID,
		&i.App,
		&i.Paid,
		&i.UpdatedAt,
	)
	return i, err
}

const updateAppByName = `-- name: UpdateAppByName :one
UPDATE
  apps
SET 
  (app, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  app = $1 AND deleted = false RETURNING app_id, app , updated_at
`

type UpdateAppByNameParams struct {
	App        string        `db:"app" json:"app"`
	App_2      string        `db:"app_2" json:"app_2"`
	IndustryID int64         `db:"industry_id" json:"industry_id"`
	Rv         sql.NullInt32 `db:"rv" json:"rv"`
}

type UpdateAppByNameRow struct {
	AppID     int64        `db:"app_id" json:"app_id"`
	App       string       `db:"app" json:"app"`
	UpdatedAt sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateAppByName(ctx context.Context, arg UpdateAppByNameParams) (UpdateAppByNameRow, error) {
	row := q.queryRow(ctx, q.updateAppByNameStmt, updateAppByName,
		arg.App,
		arg.App_2,
		arg.IndustryID,
		arg.Rv,
	)
	var i UpdateAppByNameRow
	err := row.Scan(&i.AppID, &i.App, &i.UpdatedAt)
	return i, err
}

const updateAppByPaid = `-- name: UpdateAppByPaid :one
UPDATE
  apps
SET 
  (paid, updated_at, rv) = ($2, now(), $3)
WHERE
  app_id = $1 AND deleted = false RETURNING app_id, app, paid, updated_at
`

type UpdateAppByPaidParams struct {
	AppID int64         `db:"app_id" json:"app_id"`
	Paid  sql.NullBool  `db:"paid" json:"paid"`
	Rv    sql.NullInt32 `db:"rv" json:"rv"`
}

type UpdateAppByPaidRow struct {
	AppID     int64        `db:"app_id" json:"app_id"`
	App       string       `db:"app" json:"app"`
	Paid      sql.NullBool `db:"paid" json:"paid"`
	UpdatedAt sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateAppByPaid(ctx context.Context, arg UpdateAppByPaidParams) (UpdateAppByPaidRow, error) {
	row := q.queryRow(ctx, q.updateAppByPaidStmt, updateAppByPaid, arg.AppID, arg.Paid, arg.Rv)
	var i UpdateAppByPaidRow
	err := row.Scan(
		&i.AppID,
		&i.App,
		&i.Paid,
		&i.UpdatedAt,
	)
	return i, err
}

const updateAppEnvs = `-- name: UpdateAppEnvs :one
UPDATE
  apps
SET 
  (app_base_os, desktop, web, mobile, ios, android, pwa, updated_at, rv) = ($2, $3, $4, $5, $6, now(), $7)
WHERE
  app = $1 AND deleted = false RETURNING app_id, app , updated_at
`

type UpdateAppEnvsParams struct {
	App       string       `db:"app" json:"app"`
	AppBaseOs string       `db:"app_base_os" json:"app_base_os"`
	Desktop   sql.NullBool `db:"desktop" json:"desktop"`
	Web       sql.NullBool `db:"web" json:"web"`
	Mobile    sql.NullBool `db:"mobile" json:"mobile"`
	Ios       sql.NullBool `db:"ios" json:"ios"`
	Pwa       sql.NullBool `db:"pwa" json:"pwa"`
}

type UpdateAppEnvsRow struct {
	AppID     int64        `db:"app_id" json:"app_id"`
	App       string       `db:"app" json:"app"`
	UpdatedAt sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateAppEnvs(ctx context.Context, arg UpdateAppEnvsParams) (UpdateAppEnvsRow, error) {
	row := q.queryRow(ctx, q.updateAppEnvsStmt, updateAppEnvs,
		arg.App,
		arg.AppBaseOs,
		arg.Desktop,
		arg.Web,
		arg.Mobile,
		arg.Ios,
		arg.Pwa,
	)
	var i UpdateAppEnvsRow
	err := row.Scan(&i.AppID, &i.App, &i.UpdatedAt)
	return i, err
}
