

-- name: CreateTeamBasic :one
INSERT INTO 
  teams(team, industry_id, rv)
VALUES 
  ($1, $2, $3) RETURNING team_id, team;