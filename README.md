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

---

generate crud code from sql

sqlc init -f sqlc.yaml
make configuartion

after that
sqlc generate


-----------

select * from person where email like '%@google%' limit 20;
select * from person where email like '_____@google%' limit 20;
ilike case insensitive

select make, model, min(price) from car group by make, model order by make;

select id, make, model, price, round(price * .10,2) as discounted from car;

select now() - interval '1 year';
select extract(dow from now());


alter table x add constraint unique_email_address unique(email)
insert ... ON CONFLICT (ID) DO NOTHING/ DO UPDATE SET email=excluded.eamil  ;

\copy (query) to 'addres/sth.csv' delimiter ',' csv header;

select * from person_id_seq;
restart sequence :
alter sequence person_id_seq restart with 10;

check available extensions :
select * from pg_available_extensions;

to install extensions;
create extension if not exists 'uuid-ossp';

to get list of available installed function by extensions
\df

---
rather than simple join use this
select * from table1 join car using(car_uid);
------------

// check (created_at < updated_at)
// created_at timestamp with time zone default current_timestamp
// check(coalesce(phone , email) is not null)
// lat REAL check(lat is null or (lat >= -90 and lat <= 90)

show data_directory;
-- show data_directory;
-- select oid, datname from pg_database;
select * from pg_class;

for uuid 
select * from pg_available_extensions;
create extension if not exists "uuid-ossp";

\df

id uuid DEFAULT uuid_generate_v4 ()

===============

go mod init github.com/penkong/goAtuh