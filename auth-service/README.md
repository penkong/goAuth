make postgres
make pgadmin
docker exec -it pgadmin4 sh
cat /etc/hosts
use ip to connect

docker exec -it pg13 psql -U root
select now();

docker logs pg13

psql
\l = databases
\c postgres = change database
\dt = list databases

---

db migration :
install
golang-migrate/migrate
migrate version, help

make migrate

copy your sql raw to up
write drop cases

now go in db container
