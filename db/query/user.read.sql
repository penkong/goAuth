-- name: GetUserWithUserName :one
select
  *
from
  users
WHERE
  email = ($ 1)
  OR username = ($ 1);