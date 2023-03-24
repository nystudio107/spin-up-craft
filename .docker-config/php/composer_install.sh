#!/bin/sh

# Composer Install shell script
#
# This shell script runs `composer install` if either the `composer.lock` file or
# the `vendor/` directory is not present`
#
# @author    nystudio107
# @copyright Copyright (c) 2023 nystudio107
# @link      https://nystudio107.com/
# @license   MIT

# Ensure permissions on directories Craft needs to write to
chown -R www-data:www-data /var/www/project/storage
chown -R www-data:www-data /var/www/project/web/cpresources
# Check for `composer.lock` & `vendor/`
cd /var/www/project
if [ ! -f "composer.lock" ] || [ ! -d "vendor" ] || [ ! -f "vendor/autoload.php" ]; then
    chown -R www-data:www-data /var/www/project
    su-exec www-data composer install --verbose --no-progress --no-scripts --no-interaction
fi
