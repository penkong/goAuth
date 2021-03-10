postgres:
	docker run --name pg13 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres

commit:
	git add . && git commit -m 'more on' && git push origin main

it:
	git pull && docker build -t penkong/westgoauth . && docker push penkong/westgoauth

	