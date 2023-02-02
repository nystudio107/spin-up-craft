# Export the `.env` variables to sub-commands
include .env
export $(shell sed 's/=.*//' .env)
# Determine the docker compose API version to get the separator character
VERSION?=$(shell docker-compose -v)
ifneq (,$(findstring v2.,$(VERSION)))
	SEPARATOR:=-
else
	SEPARATOR:=_
endif
CONTAINER?=$(shell basename $(CURDIR))$(SEPARATOR)php$(SEPARATOR)1

.PHONY: db-admin-reset db-export db-import clean composer craft dev nuke ssh up

# Reset the admin password, user name, and email address
db-admin-reset: up
	docker exec -it $(CONTAINER) su-exec www-data mysql \
		-h mysql -u "${CRAFT_DB_USER}" -p"${CRAFT_DB_PASSWORD}" "${CRAFT_DB_DATABASE}" \
		-e 'UPDATE users SET username=${CRAFT_CP_USER}, email=${CRAFT_CP_EMAIL}, password=${CRAFT_CP_PASSWORD} WHERE id=1;'
# Clean the `db-seed` directory and export the database to it
db-export: up
	rm -rf db-seed/*
	docker exec -it $(CONTAINER) su-exec www-data php craft \
		db/backup /var/www/project/db-seed
# Import the db from db-seed/ into the mysql container
db-import: up
	docker exec -it $(CONTAINER) su-exec www-data /bin/sh \
		-c 'cat /var/www/project/db-seed/*.sql | mysql -h mysql -u "${CRAFT_DB_USER}" -p"${CRAFT_DB_PASSWORD}" "${CRAFT_DB_DATABASE}"'
# Start the dev server
dev: up
# Remove `vendor/` & `composer.lock`
clean:
	rm -f composer.lock
	rm -rf vendor/
# Execute a composer command in the PHP container
composer: up
	docker exec -it $(CONTAINER) su-exec www-data composer \
		$(filter-out $@,$(MAKECMDGOALS)) $(MAKEFLAGS)
# Execute a craft command in the PHP container
craft: up
	docker exec -it $(CONTAINER) su-exec www-data php craft \
		$(filter-out $@,$(MAKECMDGOALS)) $(MAKEFLAGS)
# Remove the Docker volumes & start clean
nuke: clean
	docker-compose down -v
	docker-compose up --build --force-recreate
# Open up a shell in the PHP container
ssh:
	docker exec -it $(CONTAINER) su-exec www-data /bin/sh
up:
	if [ ! "$$(docker ps -q -f name=$(CONTAINER))" ]; then \
		cp -n example.env .env; \
		docker-compose up; \
    fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
