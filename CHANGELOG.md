# nystudio107/spin-up-craft Change Log

## 1.0.14 - 2023.04.25
### Fixed
* Wait not just for the database to be available, but also that the `info` table has been populated before proceeding with the `queue` container ([#2](https://github.com/nystudio107/spin-up-craft/issues/2))

### Changed
* Remove PHP platform version

## 1.0.13 - 2023.03.30
### Changed
* Clean up the `Makefile` by using `docker compose` api
* Fully switch from the old `docker-compose` api to the new `docker compose` api

## 1.0.12 - 2023.03.23
### Changed
* Updated to `craftcms/cms` `^4.4.5`
* Switch to `jbergstroem/mariadb-alpine` for the db container, for a much smaller image size, and a much faster startup time
* Run `php craft up` and display the banner message only from the queue container

## 1.0.11 - 2023.03.02
### Fixed
* Use a unique CSRF token name, to avoid issues with CSRF validation with multiple instances of Craft running on the same host (localhost)

## 1.0.10 - 2023.03.02
### Changed
* Ship with empty `CRAFT_APP_ID` & `CRAFT_SECURITY_KEY` env vars, and generate them via the `run_queue.sh` script, so each instance will have unique values
* Move the copying of the `.env` file to the beginning of `make nuke` to handle the case where it isn't present

## 1.0.9 - 2023.02.26
### Added
* Added the `INITIAL_SERVER_PORT` env var so that we can scan for an open port, rather than just using a fixed port

### Changed
* Remove the `composer.lock` so people will always start with the latest
* Explicitly set the `@web` alias from the `PRIMARY_SITE_URL` env var

## 1.0.8 - 2023.02.23
### Added
* Add `spin-up-craft-base-dev` image that includes XDebug

### Changed
* Remove any `.` from container names, because Docker strips them when creating containers

### Fixed
* Run `php craft up` with `--interactive=0` so it's not waiting for user input

## 1.0.7 - 2023.02.17
### Changed
* Added `stop_grace_period: "1s"` to the services that have long-running processes in the `docker-compose.yaml`
* Add dummy empty values for Codespaces in the Makefile, to avoid warnings from Docker
* Updated to `"craftcms/cms": "^4.3.10"`

## 1.0.6 - 2023.02.15
### Changed
* Use the `GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN` env var
* Use `env_file` & `env` aliases in the docker-compose.yaml

## 1.0.5 - 2023.02.14
### Added
* Detect when we're running in Codespaces, and swap in the dynamic URL for the `PRIMARY_SITE_URL` env var automatically

### Changed
* Refactor the banner to a separate `banner_message.sh`

## 1.0.4 - 2023.02.08
### Added
*  Add PHP 8.1 as the default image

### Changed
* Use `#!/bin/sh` for the scripts shebang
* Updated to `"craftcms/cms": "^4.3.8"`

## 1.0.3 - 2023.02.05
### Added
* Added `nystudio107/craft-autocomplete` to allow for Craft API autocomplete in PhpStorm

### Changed
* Updated to `"craftcms/cms": "^4.3.7.1"`
* Removed `craftcms/generator` to lighten the dependency graph
* Removed `yiisoft/yii2-shell` to lighten the dependency graph
* Use `PHPIZE_DEPS` in `spin-up-craft-base` Docker image

## 1.0.2 - 2023.02.04
### Added
* Build docker images via Github Actions CI

### Changed
* Use a pre-built `spin-up-craft-base` for faster cold starts
* Removed vestigial `redis` container for faster cold starts

## 1.0.1 - 2023.02.02
### Fixed
* Fixed an issue with the default database seed and the `make db-admin-reset` had the wrong password

## 1.0.0 - 2023.02.02
### Added
* Initial release

Brought to you by [nystudio107](https://nystudio107.com/)
