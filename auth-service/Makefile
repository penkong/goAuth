postgres:
	docker run --name pg13 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

pgadmin:
	docker run --name pgadmin4 -p 80:80 -e 'PGADMIN_DEFAULT_EMAIL=nazemi.works@gmail.com' -e 'PGADMIN_DEFAULT_PASSWORD=secret' --link pg13:pg13 -d dpage/pgadmin4

rmpgadmin:
	docker stop pgadmin4 && docker rm pgadmin4 && docker stop pg13 && docker rm pg13
commit:
	git add . && git commit -m 'more on' && git push origin main

it:
	git pull && docker build -t penkong/westgoauth . && docker push penkong/westgoauth

	