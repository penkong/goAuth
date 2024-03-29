// Code generated by sqlc. DO NOT EDIT.
// source: teams.sql

package pgdb

import (
	"context"
	"database/sql"
	"time"
)

const createTeamBasic = `-- name: CreateTeamBasic :one
INSERT INTO 
  teams(team, industry_id, rv)
VALUES 
  ($1, $2, $3) RETURNING team_id, team
`

type CreateTeamBasicParams struct {
	Team       string `db:"team" json:"team"`
	IndustryID int64  `db:"industry_id" json:"industry_id"`
	Rv         int32  `db:"rv" json:"rv"`
}

type CreateTeamBasicRow struct {
	TeamID int64  `db:"team_id" json:"team_id"`
	Team   string `db:"team" json:"team"`
}

func (q *Queries) CreateTeamBasic(ctx context.Context, arg CreateTeamBasicParams) (CreateTeamBasicRow, error) {
	row := q.queryRow(ctx, q.createTeamBasicStmt, createTeamBasic, arg.Team, arg.IndustryID, arg.Rv)
	var i CreateTeamBasicRow
	err := row.Scan(&i.TeamID, &i.Team)
	return i, err
}

const deleteTeam = `-- name: DeleteTeam :exec
UPDATE
  teams
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  team_id = $1 AND deleted = false
`

func (q *Queries) DeleteTeam(ctx context.Context, teamID int64) error {
	_, err := q.exec(ctx, q.deleteTeamStmt, deleteTeam, teamID)
	return err
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

const updateTeamById = `-- name: UpdateTeamById :one
UPDATE
  teams
SET 
  (team, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  team_id = $1 AND deleted = false RETURNING team_id, team, industry_id, updated_at
`

type UpdateTeamByIdParams struct {
	TeamID     int64  `db:"team_id" json:"team_id"`
	Team       string `db:"team" json:"team"`
	IndustryID int64  `db:"industry_id" json:"industry_id"`
	Rv         int32  `db:"rv" json:"rv"`
}

type UpdateTeamByIdRow struct {
	TeamID     int64        `db:"team_id" json:"team_id"`
	Team       string       `db:"team" json:"team"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateTeamById(ctx context.Context, arg UpdateTeamByIdParams) (UpdateTeamByIdRow, error) {
	row := q.queryRow(ctx, q.updateTeamByIdStmt, updateTeamById,
		arg.TeamID,
		arg.Team,
		arg.IndustryID,
		arg.Rv,
	)
	var i UpdateTeamByIdRow
	err := row.Scan(
		&i.TeamID,
		&i.Team,
		&i.IndustryID,
		&i.UpdatedAt,
	)
	return i, err
}

const updateTeamByName = `-- name: UpdateTeamByName :one
UPDATE
  teams
SET 
  (team, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  team = $1 AND deleted = false RETURNING team_id, team, industry_id, updated_at
`

type UpdateTeamByNameParams struct {
	Team       string `db:"team" json:"team"`
	Team_2     string `db:"team_2" json:"team_2"`
	IndustryID int64  `db:"industry_id" json:"industry_id"`
	Rv         int32  `db:"rv" json:"rv"`
}

type UpdateTeamByNameRow struct {
	TeamID     int64        `db:"team_id" json:"team_id"`
	Team       string       `db:"team" json:"team"`
	IndustryID int64        `db:"industry_id" json:"industry_id"`
	UpdatedAt  sql.NullTime `db:"updated_at" json:"updated_at"`
}

func (q *Queries) UpdateTeamByName(ctx context.Context, arg UpdateTeamByNameParams) (UpdateTeamByNameRow, error) {
	row := q.queryRow(ctx, q.updateTeamByNameStmt, updateTeamByName,
		arg.Team,
		arg.Team_2,
		arg.IndustryID,
		arg.Rv,
	)
	var i UpdateTeamByNameRow
	err := row.Scan(
		&i.TeamID,
		&i.Team,
		&i.IndustryID,
		&i.UpdatedAt,
	)
	return i, err
}
