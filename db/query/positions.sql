-- name: CreatePositionBasic :one
INSERT INTO 
  positions(department, position, rv)
VALUES 
  ($1, $2, $3) RETURNING position_id, department, position;
