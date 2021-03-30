// Code generated by sqlc. DO NOT EDIT.
// source: base.read.sql

package pgdb

import (
	"context"
	"database/sql"
	"time"

	"github.com/google/uuid"
)

const getAppById = `-- name: GetAppById :one
SELECT 
  app_id, app, app_base_os, desktop, web, mobile, ios, android, pwa, paid, industry_id, created_at, updated_at
FROM 
  apps
WHERE 
  app_id = $1 AND deleted = false
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

const getBanAccountAllById = `-- name: GetBanAccountAllById :one
SELECT 
  bank_account_all_id, account_1, account_2, account_3, account_4, account_5
FROM 
  bank_account_all
WHERE 
  bank_account_all_id = $1 AND deleted = false
`

type GetBanAccountAllByIdRow struct {
	BankAccountAllID uuid.UUID     `db:"bank_account_all_id" json:"bank_account_all_id"`
	Account1         sql.NullInt64 `db:"account_1" json:"account_1"`
	Account2         sql.NullInt64 `db:"account_2" json:"account_2"`
	Account3         sql.NullInt64 `db:"account_3" json:"account_3"`
	Account4         sql.NullInt64 `db:"account_4" json:"account_4"`
	Account5         sql.NullInt64 `db:"account_5" json:"account_5"`
}

func (q *Queries) GetBanAccountAllById(ctx context.Context, bankAccountAllID uuid.UUID) (GetBanAccountAllByIdRow, error) {
	row := q.queryRow(ctx, q.getBanAccountAllByIdStmt, getBanAccountAllById, bankAccountAllID)
	var i GetBanAccountAllByIdRow
	err := row.Scan(
		&i.BankAccountAllID,
		&i.Account1,
		&i.Account2,
		&i.Account3,
		&i.Account4,
		&i.Account5,
	)
	return i, err
}

const getCompanies = `-- name: GetCompanies :many
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  deleted = false
LIMIT $1
OFFSET $2
`

type GetCompaniesParams struct {
	Limit  int32 `db:"limit" json:"limit"`
	Offset int32 `db:"offset" json:"offset"`
}

type GetCompaniesRow struct {
	CompanyID        int32          `db:"company_id" json:"company_id"`
	Company          string         `db:"company" json:"company"`
	Bio              string         `db:"bio" json:"bio"`
	Country          string         `db:"country" json:"country"`
	Region           string         `db:"region" json:"region"`
	Ceo              sql.NullString `db:"ceo" json:"ceo"`
	Manager          sql.NullString `db:"manager" json:"manager"`
	Hr               sql.NullString `db:"hr" json:"hr"`
	Address          string         `db:"address" json:"address"`
	HowClean         int32          `db:"how_clean" json:"how_clean"`
	IndustryID       int64          `db:"industry_id" json:"industry_id"`
	BankAccountAllID uuid.UUID      `db:"bank_account_all_id" json:"bank_account_all_id"`
	CreatedAt        time.Time      `db:"created_at" json:"created_at"`
	UpdatedAt        sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetCompanies(ctx context.Context, arg GetCompaniesParams) ([]GetCompaniesRow, error) {
	rows, err := q.query(ctx, q.getCompaniesStmt, getCompanies, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetCompaniesRow
	for rows.Next() {
		var i GetCompaniesRow
		if err := rows.Scan(
			&i.CompanyID,
			&i.Company,
			&i.Bio,
			&i.Country,
			&i.Region,
			&i.Ceo,
			&i.Manager,
			&i.Hr,
			&i.Address,
			&i.HowClean,
			&i.IndustryID,
			&i.BankAccountAllID,
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

const getCompanyById = `-- name: GetCompanyById :one
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  company_id = $1 AND deleted = false
`

type GetCompanyByIdRow struct {
	CompanyID        int32          `db:"company_id" json:"company_id"`
	Company          string         `db:"company" json:"company"`
	Bio              string         `db:"bio" json:"bio"`
	Country          string         `db:"country" json:"country"`
	Region           string         `db:"region" json:"region"`
	Ceo              sql.NullString `db:"ceo" json:"ceo"`
	Manager          sql.NullString `db:"manager" json:"manager"`
	Hr               sql.NullString `db:"hr" json:"hr"`
	Address          string         `db:"address" json:"address"`
	HowClean         int32          `db:"how_clean" json:"how_clean"`
	IndustryID       int64          `db:"industry_id" json:"industry_id"`
	BankAccountAllID uuid.UUID      `db:"bank_account_all_id" json:"bank_account_all_id"`
	CreatedAt        time.Time      `db:"created_at" json:"created_at"`
	UpdatedAt        sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetCompanyById(ctx context.Context, companyID int32) (GetCompanyByIdRow, error) {
	row := q.queryRow(ctx, q.getCompanyByIdStmt, getCompanyById, companyID)
	var i GetCompanyByIdRow
	err := row.Scan(
		&i.CompanyID,
		&i.Company,
		&i.Bio,
		&i.Country,
		&i.Region,
		&i.Ceo,
		&i.Manager,
		&i.Hr,
		&i.Address,
		&i.HowClean,
		&i.IndustryID,
		&i.BankAccountAllID,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getCompanyByName = `-- name: GetCompanyByName :one
SELECT 
  company_id, company, bio, country, region, ceo, manager, hr, address, how_clean, industry_id, bank_account_all_id, created_at, updated_at
FROM 
  companies
WHERE 
  company = $1 AND deleted = false
`

type GetCompanyByNameRow struct {
	CompanyID        int32          `db:"company_id" json:"company_id"`
	Company          string         `db:"company" json:"company"`
	Bio              string         `db:"bio" json:"bio"`
	Country          string         `db:"country" json:"country"`
	Region           string         `db:"region" json:"region"`
	Ceo              sql.NullString `db:"ceo" json:"ceo"`
	Manager          sql.NullString `db:"manager" json:"manager"`
	Hr               sql.NullString `db:"hr" json:"hr"`
	Address          string         `db:"address" json:"address"`
	HowClean         int32          `db:"how_clean" json:"how_clean"`
	IndustryID       int64          `db:"industry_id" json:"industry_id"`
	BankAccountAllID uuid.UUID      `db:"bank_account_all_id" json:"bank_account_all_id"`
	CreatedAt        time.Time      `db:"created_at" json:"created_at"`
	UpdatedAt        sql.NullTime   `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetCompanyByName(ctx context.Context, company string) (GetCompanyByNameRow, error) {
	row := q.queryRow(ctx, q.getCompanyByNameStmt, getCompanyByName, company)
	var i GetCompanyByNameRow
	err := row.Scan(
		&i.CompanyID,
		&i.Company,
		&i.Bio,
		&i.Country,
		&i.Region,
		&i.Ceo,
		&i.Manager,
		&i.Hr,
		&i.Address,
		&i.HowClean,
		&i.IndustryID,
		&i.BankAccountAllID,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getIndustries = `-- name: GetIndustries :many
SELECT 
  industry_id, industry, how_clean, created_at, updated_at 
FROM 
  industries 
WHERE 
  deleted = false
`

type GetIndustriesRow struct {
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	Industry   string       `db:"industry" json:"industry"`
	HowClean   int32        `db:"how_clean" json:"how_clean"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetIndustries(ctx context.Context) ([]GetIndustriesRow, error) {
	rows, err := q.query(ctx, q.getIndustriesStmt, getIndustries)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetIndustriesRow
	for rows.Next() {
		var i GetIndustriesRow
		if err := rows.Scan(
			&i.IndustryID,
			&i.Industry,
			&i.HowClean,
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

const getIndustryById = `-- name: GetIndustryById :one
SELECT 
  industry_id, industry, how_clean, created_at, updated_at 
FROM 
  industries 
WHERE 
  industry_id = $1 AND deleted = false
`

type GetIndustryByIdRow struct {
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	Industry   string       `db:"industry" json:"industry"`
	HowClean   int32        `db:"how_clean" json:"how_clean"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetIndustryById(ctx context.Context, industryID int64) (GetIndustryByIdRow, error) {
	row := q.queryRow(ctx, q.getIndustryByIdStmt, getIndustryById, industryID)
	var i GetIndustryByIdRow
	err := row.Scan(
		&i.IndustryID,
		&i.Industry,
		&i.HowClean,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getIndustryByName = `-- name: GetIndustryByName :one
SELECT 
  industry_id, industry, how_clean, created_at, updated_at 
FROM 
  industries 
WHERE 
  industry = $1 AND deleted = false
`

type GetIndustryByNameRow struct {
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	Industry   string       `db:"industry" json:"industry"`
	HowClean   int32        `db:"how_clean" json:"how_clean"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetIndustryByName(ctx context.Context, industry string) (GetIndustryByNameRow, error) {
	row := q.queryRow(ctx, q.getIndustryByNameStmt, getIndustryByName, industry)
	var i GetIndustryByNameRow
	err := row.Scan(
		&i.IndustryID,
		&i.Industry,
		&i.HowClean,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getPositionByDepartment = `-- name: GetPositionByDepartment :one
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  department = $1 AND deleted = false
`

type GetPositionByDepartmentRow struct {
	PositionID int64        `db:"position_id" json:"position_id"`
	Department string       `db:"department" json:"department"`
	Position   string       `db:"position" json:"position"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetPositionByDepartment(ctx context.Context, department string) (GetPositionByDepartmentRow, error) {
	row := q.queryRow(ctx, q.getPositionByDepartmentStmt, getPositionByDepartment, department)
	var i GetPositionByDepartmentRow
	err := row.Scan(
		&i.PositionID,
		&i.Department,
		&i.Position,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getPositionById = `-- name: GetPositionById :one
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  position_id = $1 AND deleted = false
`

type GetPositionByIdRow struct {
	PositionID int64        `db:"position_id" json:"position_id"`
	Department string       `db:"department" json:"department"`
	Position   string       `db:"position" json:"position"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetPositionById(ctx context.Context, positionID int64) (GetPositionByIdRow, error) {
	row := q.queryRow(ctx, q.getPositionByIdStmt, getPositionById, positionID)
	var i GetPositionByIdRow
	err := row.Scan(
		&i.PositionID,
		&i.Department,
		&i.Position,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getPositionByName = `-- name: GetPositionByName :one
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  position = $1 AND deleted = false
`

type GetPositionByNameRow struct {
	PositionID int64        `db:"position_id" json:"position_id"`
	Department string       `db:"department" json:"department"`
	Position   string       `db:"position" json:"position"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetPositionByName(ctx context.Context, position string) (GetPositionByNameRow, error) {
	row := q.queryRow(ctx, q.getPositionByNameStmt, getPositionByName, position)
	var i GetPositionByNameRow
	err := row.Scan(
		&i.PositionID,
		&i.Department,
		&i.Position,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getPositions = `-- name: GetPositions :many
SELECT 
  position_id, department, position, created_at, updated_at
FROM 
  positions
WHERE 
  deleted = false
`

type GetPositionsRow struct {
	PositionID int64        `db:"position_id" json:"position_id"`
	Department string       `db:"department" json:"department"`
	Position   string       `db:"position" json:"position"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetPositions(ctx context.Context) ([]GetPositionsRow, error) {
	rows, err := q.query(ctx, q.getPositionsStmt, getPositions)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetPositionsRow
	for rows.Next() {
		var i GetPositionsRow
		if err := rows.Scan(
			&i.PositionID,
			&i.Department,
			&i.Position,
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

const getRoleById = `-- name: GetRoleById :one
SELECT 
  role_id, role, created_at, updated_at
FROM 
  roles
WHERE 
  role_id = $1 AND deleted = false
`

type GetRoleByIdRow struct {
	RoleID    int64        `db:"role_id" json:"role_id"`
	Role      string       `db:"role" json:"role"`
	CreatedAt time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetRoleById(ctx context.Context, roleID int64) (GetRoleByIdRow, error) {
	row := q.queryRow(ctx, q.getRoleByIdStmt, getRoleById, roleID)
	var i GetRoleByIdRow
	err := row.Scan(
		&i.RoleID,
		&i.Role,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getRoleByName = `-- name: GetRoleByName :one
SELECT 
  role_id, role, created_at, updated_at
FROM 
  roles
WHERE 
  role = $1 AND deleted = false
`

type GetRoleByNameRow struct {
	RoleID    int64        `db:"role_id" json:"role_id"`
	Role      string       `db:"role" json:"role"`
	CreatedAt time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetRoleByName(ctx context.Context, role string) (GetRoleByNameRow, error) {
	row := q.queryRow(ctx, q.getRoleByNameStmt, getRoleByName, role)
	var i GetRoleByNameRow
	err := row.Scan(
		&i.RoleID,
		&i.Role,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getRoles = `-- name: GetRoles :many
SELECT 
  role_id, role, created_at, updated_at
FROM 
  roles
WHERE 
  deleted = false
`

type GetRolesRow struct {
	RoleID    int64        `db:"role_id" json:"role_id"`
	Role      string       `db:"role" json:"role"`
	CreatedAt time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetRoles(ctx context.Context) ([]GetRolesRow, error) {
	rows, err := q.query(ctx, q.getRolesStmt, getRoles)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetRolesRow
	for rows.Next() {
		var i GetRolesRow
		if err := rows.Scan(
			&i.RoleID,
			&i.Role,
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

const getTeamById = `-- name: GetTeamById :one
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  team_id = $1 AND deleted = false
`

type GetTeamByIdRow struct {
	TeamID     int64        `db:"team_id" json:"team_id"`
	Team       string       `db:"team" json:"team"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetTeamById(ctx context.Context, teamID int64) (GetTeamByIdRow, error) {
	row := q.queryRow(ctx, q.getTeamByIdStmt, getTeamById, teamID)
	var i GetTeamByIdRow
	err := row.Scan(
		&i.TeamID,
		&i.Team,
		&i.IndustryID,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getTeamByName = `-- name: GetTeamByName :one
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  team = $1 AND deleted = false
`

type GetTeamByNameRow struct {
	TeamID     int64        `db:"team_id" json:"team_id"`
	Team       string       `db:"team" json:"team"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetTeamByName(ctx context.Context, team string) (GetTeamByNameRow, error) {
	row := q.queryRow(ctx, q.getTeamByNameStmt, getTeamByName, team)
	var i GetTeamByNameRow
	err := row.Scan(
		&i.TeamID,
		&i.Team,
		&i.IndustryID,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}

const getTeams = `-- name: GetTeams :many
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  deleted = false
LIMIT $1
OFFSET $2
`

type GetTeamsParams struct {
	Limit  int32 `db:"limit" json:"limit"`
	Offset int32 `db:"offset" json:"offset"`
}

type GetTeamsRow struct {
	TeamID     int64        `db:"team_id" json:"team_id"`
	Team       string       `db:"team" json:"team"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	CreatedAt  time.Time    `db:"created_at" json:"created_at"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetTeams(ctx context.Context, arg GetTeamsParams) ([]GetTeamsRow, error) {
	rows, err := q.query(ctx, q.getTeamsStmt, getTeams, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetTeamsRow
	for rows.Next() {
		var i GetTeamsRow
		if err := rows.Scan(
			&i.TeamID,
			&i.Team,
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

const getTeamsAppsCompanies = `-- name: GetTeamsAppsCompanies :many
SELECT 
  team_app_company_id, team_id, app_id, company_id, created_at, updated_at
FROM 
  teams_apps_companies
WHERE 
  deleted = false
LIMIT $1
OFFSET $2
`

type GetTeamsAppsCompaniesParams struct {
	Limit  int32 `db:"limit" json:"limit"`
	Offset int32 `db:"offset" json:"offset"`
}

type GetTeamsAppsCompaniesRow struct {
	TeamAppCompanyID int64         `db:"team_app_company_id" json:"team_app_company_id"`
	TeamID           sql.NullInt64 `db:"team_id" json:"team_id"`
	AppID            sql.NullInt64 `db:"app_id" json:"app_id"`
	CompanyID        sql.NullInt64 `db:"company_id" json:"company_id"`
	CreatedAt        time.Time     `db:"created_at" json:"created_at"`
	UpdatedAt        sql.NullTime  `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetTeamsAppsCompanies(ctx context.Context, arg GetTeamsAppsCompaniesParams) ([]GetTeamsAppsCompaniesRow, error) {
	rows, err := q.query(ctx, q.getTeamsAppsCompaniesStmt, getTeamsAppsCompanies, arg.Limit, arg.Offset)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetTeamsAppsCompaniesRow
	for rows.Next() {
		var i GetTeamsAppsCompaniesRow
		if err := rows.Scan(
			&i.TeamAppCompanyID,
			&i.TeamID,
			&i.AppID,
			&i.CompanyID,
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

const getTeamsAppsCompaniesById = `-- name: GetTeamsAppsCompaniesById :one
SELECT 
  team_app_company_id, team_id, app_id, company_id, created_at, updated_at
FROM 
  teams_apps_companies
WHERE 
  team_app_company_id = $1 AND deleted = false
`

type GetTeamsAppsCompaniesByIdRow struct {
	TeamAppCompanyID int64         `db:"team_app_company_id" json:"team_app_company_id"`
	TeamID           sql.NullInt64 `db:"team_id" json:"team_id"`
	AppID            sql.NullInt64 `db:"app_id" json:"app_id"`
	CompanyID        sql.NullInt64 `db:"company_id" json:"company_id"`
	CreatedAt        time.Time     `db:"created_at" json:"created_at"`
	UpdatedAt        sql.NullTime  `db:"updated_at" json:"updated_at"`
}

func (q *Queries) GetTeamsAppsCompaniesById(ctx context.Context, teamAppCompanyID int64) (GetTeamsAppsCompaniesByIdRow, error) {
	row := q.queryRow(ctx, q.getTeamsAppsCompaniesByIdStmt, getTeamsAppsCompaniesById, teamAppCompanyID)
	var i GetTeamsAppsCompaniesByIdRow
	err := row.Scan(
		&i.TeamAppCompanyID,
		&i.TeamID,
		&i.AppID,
		&i.CompanyID,
		&i.CreatedAt,
		&i.UpdatedAt,
	)
	return i, err
}