# nystudio107/spin-up-craft Change Log

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
