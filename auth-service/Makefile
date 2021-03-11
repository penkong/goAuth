# step 1
postgres:
	docker run --name pg13 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

# step 2
pgadmin:
	docker run --name pgadmin4 -p 80:80 -e 'PGADMIN_DEFAULT_EMAIL=nazemi.works@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=secret' --link pg13:pg13 -d dpage/pgadmin4


# step 3
createdb: 
	docker exec -it pg13 createdb --username=root --owner=root authservice

# if you need
removedb: 
	docker exec -it pg13 dropdb authservice

# step 4
migrateCreate:
	migrate create -ext sql -dir db/migration -seq init_schema

# step 5
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/authservice?sslmode=disable" -verbose up

# if you need 
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/authservice?sslmode=disable" -verbose down


sqlc: 
	sqlc generate

test:
	go test -v -cover ./...

# if you need 
delpg:
	docker stop pg13 && docker rm pg13


# if you need 
deladmin:
	docker stop pgadmin4 && docker rm pgadmin4


it:
	git pull && docker build -t penkong/authservice . && docker push penkong/authservice

.PHONY: postgres createdb migrateup migratedown sqlc