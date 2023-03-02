postgres: 
	docker run --name postgres-tors -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:latest

createdb:
	docker exec -it postgres-tors  createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres-tors dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgres://root:secret@localhost/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://root:secret@localhost/simple_bank?sslmode=disable" -verbose down

fixdirtymigration:
	migrate -path db/migration -database "postgres://root:secret@localhost/simple_bank?sslmode=disable" -verbose force 15

test: 
	go test -v -cover ./...