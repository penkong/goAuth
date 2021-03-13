-- name: GetUserWithEmail :one
select
  *
from
  users
WHERE
  email = ($ 1);

-- name: GetUserWithUserName :one
select
  *
from
  users
WHERE
  username = ($ 1);