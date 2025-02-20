# Local Variables
# ===============
#
# Pass custom values to the `make` cli as:
# > make start pg_name=foobar
#
pg_name?=test-db
pg_password?=postgres
pg_version?=14
pg_data?=../.docker-data
pg_port?=5432
project?=default
seed?=dummy


###
### Container Utilities
###

start:
	@echo "Starting Postgres..."
	@mkdir -p $(CURDIR)/$(pg_data)
	@docker build -t pgtap ./pgtap
	@docker run --rm -d \
		--name $(pg_name) \
		-e POSTGRES_PASSWORD=postgres \
		-v $(CURDIR)/$(pg_data)/pgtap:/var/lib/postgresql/data \
		postgres:$(pg_version)

start-public:
	@echo "Starting Postgres..."
	@mkdir -p $(CURDIR)/$(pg_data)
	@docker build -t pgtap ./pgtap
	@docker run --rm -d \
		--name $(pg_name) \
		-p $(pg_port):5432 \
		-e POSTGRES_PASSWORD=postgres \
		-v $(CURDIR)/$(pg_data)/pgtap:/var/lib/postgresql/data \
		postgres:$(pg_version)
	@docker logs -f $(pg_name)

stop:
	@echo "Stopping Postgres..."
	@docker stop $(pg_name) || true

clear: stop
	@echo "Destroy local data..."
	@rm -rf $(CURDIR)/$(pg_data)/pgtap

down: stop clear

psql:
	@echo "Connecting to the database ("quit" to exit) ..."
	@docker exec -it $(pg_name) psql -U postgres test-db

logs:
	clear
	@echo "Attaching to Postgres logs..."
	@docker container logs -f $(pg_name)



###
### Schema Utilities
###

reset:
	@docker exec -i $(pg_name) psql -U postgres < ./pgtap/reset-db.sql

schema: $(CURDIR)/migrations/$(project)/*
	@echo $^/up.sql
	@cat $^/up.sql
	@docker exec -i $(pg_name) psql -U postgres test-db < $^/up.sql

run:
	clear
	@echo "Running Unit Tests ..."
	@docker run --rm \
		--name pgtap \
		--link $(pg_name):db \
		-v $(CURDIR)/tests/$(project)/:/$(project) \
		pgtap \
    	-h db -u postgres -w $(pg_password) -d test-db -t '/$(project)/*.sql'

fill:
	@docker exec -i $(pg_name) psql -U postgres test-db < ./seeds/$(project)/$(seed).sql

init: reset schema
test: init run	
seed: init fill
