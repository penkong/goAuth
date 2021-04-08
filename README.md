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

---

select _ from person where email like '%@google%' limit 20;
select _ from person where email like '**\_**@google%' limit 20;
ilike case insensitive

select make, model, min(price) from car group by make, model order by make;

select id, make, model, price, round(price \* .10,2) as discounted from car;

select now() - interval '1 year';
select extract(dow from now());

alter table x add constraint unique_email_address unique(email)
insert ... ON CONFLICT (ID) DO NOTHING/ DO UPDATE SET email=excluded.eamil ;

\copy (query) to 'addres/sth.csv' delimiter ',' csv header;

select \* from person_id_seq;
restart sequence :
alter sequence person_id_seq restart with 10;

check available extensions :
select \* from pg_available_extensions;

to install extensions;
create extension if not exists 'uuid-ossp';

to get list of available installed function by extensions
\df

---

rather than simple join use this
select \* from table1 join car using(car_uid);

---

// check (created_at < updated_at)
// created_at timestamp with time zone default current_timestamp
// check(coalesce(phone , email) is not null)
// lat REAL check(lat is null or (lat >= -90 and lat <= 90)

show data_directory;
-- show data_directory;
-- select oid, datname from pg_database;
select \* from pg_class;

for uuid
select \* from pg_available_extensions;
create extension if not exists "uuid-ossp";

\df

id uuid DEFAULT uuid_generate_v4 ()

===============

go mod init github.com/penkong/goAtuh

deadlock cost by the foreign key constraits
normally to lock db

in a transaction child table (contain foreign key) start a query
tx continue
if any query exec against parent tabke deadlock happen
we must inform in parent query that foreign key in this context will not update
transaction done

select \* from accounts where id = \$1 limit 1 for update

but to not deadlock happen
select _ from accounts where id = $1 limit for no key update
update accounts set balance = $2 where id = \$1 returnning _;

====================

docker exec -it pg13 psql -U root -d <name of db>

show transaction isolation level

in ps we can only set transaction level inside transactyion

begin
set transaction level (read uncommitted) or (read committed) or (Repeateable read) or (Serializable);

===

github actions

we must define workflow
workflow is basically an automated procedure that made up of one or more jobs
it can be triggred by events or scheduled or manuallly
add .yml file
it contain name , on (when it must trigger) , list of jobs to run
in order to run jobs we must specify a runner for each job
a runner is a server to run a job and it will run one job at time
github hosted or self husted
then it report progress and logs result to github
we use github (runs-on : ...)
job : is set of steps that will be executed on the same runner
jobs like build or test

step is an individual task that run serially after another

each step contain 1 or more action

action is standalone command
action can be reused (run by us or uses by provider)
