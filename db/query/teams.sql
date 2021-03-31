-- name: CreateTeamBasic :one
INSERT INTO 
  teams(team, industry_id, rv)
VALUES 
  ($1, $2, $3) RETURNING team_id, team;

-- name: GetTeamById :one
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  team_id = $1 AND deleted = false;

-- name: GetTeamByName :one
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  team = $1 AND deleted = false;

-- name: GetTeams :many
SELECT 
  team_id, team, industry_id, created_at, updated_at
FROM 
  teams
WHERE 
  deleted = false
LIMIT $1
OFFSET $2;

-- name: UpdateTeamById :one
UPDATE
  teams
SET 
  (team, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  team_id = $1 AND deleted = false RETURNING team_id, team, industry_id, updated_at;

-- name: UpdateTeamByName :one
UPDATE
  teams
SET 
  (team, industry_id, updated_at, rv) = ($2, $3, now(), $4)
WHERE
  team = $1 AND deleted = false RETURNING team_id, team, industry_id, updated_at;

-- name: DeleteTeam :exec
UPDATE
  teams
SET 
  (updated_at, deleted_at, deleted) = (now(), now(), true)
WHERE
  team_id = $1 AND deleted = false;