# Export the `.env` variables to sub-commands
include .env
export $(shell sed 's/=.*//' .env)
INITIAL_SERVER_PORT?=8050
# Dummy empty values for Codespaces to avoid warnings from Docker
CODESPACES?=
CODESPACE_NAME?=
GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN?=
export CODESPACES
export CODESPACE_NAME
export GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN

.PHONY: db-admin-reset db-export db-import clean composer craft dev nuke ssh up

# Reset the admin password, user name, and email address
db-admin-reset: up
	docker compose exec -it php su-exec www-data mysql \
		-h mysql -u "${CRAFT_DB_USER}" -p"${CRAFT_DB_PASSWORD}" "${CRAFT_DB_DATABASE}" \
		-e 'UPDATE users SET username=${CRAFT_CP_USER}, email=${CRAFT_CP_EMAIL}, password=${CRAFT_HASHED_PASSWORD} WHERE id=1;'
# Clean the `db-seed` directory and export the database to it
db-export: up
	rm -rf db-seed/*
	docker compose exec -it php su-exec www-data php craft \
		db/backup /var/www/project/db-seed
# Import the db from db-seed/ into the mysql container
db-import: up
	docker compose exec -it php su-exec www-data /bin/sh \
		-c 'cat /var/www/project/db-seed/*.sql | mysql -h mysql -u "${CRAFT_DB_USER}" -p"${CRAFT_DB_PASSWORD}" "${CRAFT_DB_DATABASE}"'
# Remove `vendor/` & `composer.lock`
clean:
	rm -f composer.lock
	rm -rf vendor/
# Execute a composer command in the PHP container
composer: up
	docker compose exec -it php su-exec www-data composer \
		$(filter-out $@,$(MAKECMDGOALS)) $(MAKEFLAGS)
# Execute a craft command in the PHP container
craft: up
	docker compose exec -it php su-exec www-data php craft \
		$(filter-out $@,$(MAKECMDGOALS)) $(MAKEFLAGS)
# Start the dev server
dev: up
# Remove the Docker volumes & start clean
nuke: clean
	cp -n example.env .env; \
	docker compose down -v
	if ! command -v nc &>/dev/null ; then \
		DEV_SERVER_PORT="$${DEV_SERVER_PORT:=$(INITIAL_SERVER_PORT)}"; \
		export DEV_SERVER_PORT; \
	else \
		port=$(INITIAL_SERVER_PORT); \
		while [ -z "$$DEV_SERVER_PORT" ] ; do \
		  nc -z localhost $$port &>/dev/null || export DEV_SERVER_PORT=$$port; \
		  ((port++)); \
		done; \
		echo "### Using port: $$DEV_SERVER_PORT"; \
	fi; \
	docker compose up --build --force-recreate
# Open up a shell in the PHP container
ssh:
	docker compose exec -it php su-exec www-data /bin/sh
up:
	if [ ! "$$(docker compose ps --services | grep php)" ]; then \
		if ! command -v nc &>/dev/null ; then \
			DEV_SERVER_PORT="$${DEV_SERVER_PORT:=$(INITIAL_SERVER_PORT)}"; \
			export DEV_SERVER_PORT; \
		else \
	  		port=$(INITIAL_SERVER_PORT); \
			while [ -z "$$DEV_SERVER_PORT" ] ; do \
			  nc -z localhost $$port &>/dev/null || export DEV_SERVER_PORT=$$port; \
			  ((port++)); \
			done; \
			echo "### Using port: $$DEV_SERVER_PORT"; \
		fi; \
		cp -n example.env .env; \
		docker compose up; \
    fi
%:
	@:
# ref: https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line
