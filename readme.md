# Docker , golang, postgres


## Install Docker
Download docker and install

### Install Postgres in docker
docker pull 
docker pull postgres:12-alpine

### or 

docker run --name postgres-tors -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

### Access Docker Container Console
docker exec -it postgres-tors psql -U root

exec -run command in running container
-it  pseudo-tty

### Display docker logs of container
docker logs <container_name>
docker logs postgres-tors


## Install golang migrate
brew install golang-migrate

## Migrate create Schema 

migrate create -ext sql -dir db/migration -seq init_schema

These files will be Created
/Users/jsiddiqui/db/migration/000001_init_schema.up.sql
/Users/jsiddiqui/db/migration/000001_init_schema.down.sql

## createdb
docker exec -it postgres-tors psql -U root
createdb --username=root --owner=root simple_bank
psql simple_bank

##  createdb Directly without accessing container shell
docker exec -it postgres-tors createdb --username=root --owner=root simple_bank
docker exec -it postgres-tors psql simple_bank

## Stop Start Docker Container
docker start container_name

## Check Existing Container list 
docker ps -a 

## Remove container
docker rm container_name

## Create Schema through migrate - up

migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

-verbose -added for more typical log information


## Create Schema through migrate - up

migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down


# schema_migrations table
Version column - which version is migrated
dirty column - tell us about any error 



CRUD - 
# Database / SQL
# GORM  
- run slowly on hight load, need to learn query writing using gorm
# SQLX  
- fast , field mapping, failure not occured until runtime
# SQLC  
- very fast, automatic code generated, caught error during code generation
- Install brew install sqlc

sqlc init 
- it will create sqlc.yaml file 
