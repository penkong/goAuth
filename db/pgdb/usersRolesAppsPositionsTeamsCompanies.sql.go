// Code generated by sqlc. DO NOT EDIT.
// source: usersRolesAppsPositionsTeamsCompanies.sql

package pgdb

import (
	"context"

	"github.com/google/uuid"
)

const createUserRoleAppPositionTeamCompany = `-- name: CreateUserRoleAppPositionTeamCompany :exec
INSERT INTO 
  users_roles_apps_positions_teams_companies(user_id, role_id, app_id, position_id, team_id, company_id, rv)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7)
`

type CreateUserRoleAppPositionTeamCompanyParams struct {
	UserID     uuid.UUID `db:"user_id" json:"user_id"`
	RoleID     int64     `db:"role_id" json:"role_id"`
	AppID      int64     `db:"app_id" json:"app_id"`
	PositionID int64     `db:"position_id" json:"position_id"`
	TeamID     int64     `db:"team_id" json:"team_id"`
	CompanyID  int64     `db:"company_id" json:"company_id"`
	Rv         int32     `db:"rv" json:"rv"`
}

func (q *Queries) CreateUserRoleAppPositionTeamCompany(ctx context.Context, arg CreateUserRoleAppPositionTeamCompanyParams) error {
	_, err := q.exec(ctx, q.createUserRoleAppPositionTeamCompanyStmt, createUserRoleAppPositionTeamCompany,
		arg.UserID,
		arg.RoleID,
		arg.AppID,
		arg.PositionID,
		arg.TeamID,
		arg.CompanyID,
		arg.Rv,
	)
	return err
}

const getUserRoleAppPositionTeamCompany = `-- name: GetUserRoleAppPositionTeamCompany :one
SELECT 
  user_id
FROM
  users_roles_apps_positions_teams_companies
WHERE
  user_id = $1 AND app_id = $2 AND deleted = false
`

type GetUserRoleAppPositionTeamCompanyParams struct {
	UserID uuid.UUID `db:"user_id" json:"user_id"`
	AppID  int64     `db:"app_id" json:"app_id"`
}

func (q *Queries) GetUserRoleAppPositionTeamCompany(ctx context.Context, arg GetUserRoleAppPositionTeamCompanyParams) (uuid.UUID, error) {
	row := q.queryRow(ctx, q.getUserRoleAppPositionTeamCompanyStmt, getUserRoleAppPositionTeamCompany, arg.UserID, arg.AppID)
	var user_id uuid.UUID
	err := row.Scan(&user_id)
	return user_id, err
}
