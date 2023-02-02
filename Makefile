# Determine the docker compose API version to get the separator character
VERSION?=$(shell docker-compose -v)
ifneq (,$(findstring v2.,$(VERSION)))
	SEPARATOR:=-
else
	SEPARATOR:=_
endif
CONTAINER?=$(shell basename $(CURDIR))$(SEPARATOR)php$(SEPARATOR)1

.PHONY: clean composer craft dev nuke ssh up

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
# Start the dev server
dev: up
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
