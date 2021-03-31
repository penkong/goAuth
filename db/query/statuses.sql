

-- name: CreateStatusBasic :one
INSERT INTO 
  statuses(status, rv)
VALUES 
  ($1, $2) RETURNING status_id, status;
