-- name: CreateBusinessLogs :exec
INSERT INTO 
  business_logs(event, device, os, ip, agent, position_id, company_id, role_id, team_id, app_id, creator)
VALUES 
  ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11);





