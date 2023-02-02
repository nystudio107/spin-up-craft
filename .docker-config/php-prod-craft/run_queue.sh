#!/bin/bash

# Run Queue shell script
#
# This shell script runs the Craft CMS queue via `php craft queue/listen`
# It waits until the database container responds, then runs any pending
# migrations / project config changes via the `craft-update` Composer script,
# then runs the queue listener that listens for and runs pending queue jobs
#
# @author    nystudio107
# @copyright Copyright (c) 2022 nystudio107
# @link      https://nystudio107.com/
# @license   MIT

cd /var/www/project
# Wait until the MySQL db container responds
echo "### Waiting for MySQL database"
until eval "mysql -h mysql -u $CRAFT_DB_USER -p$CRAFT_DB_PASSWORD $CRAFT_DB_DATABASE -e 'select 1' > /dev/null 2>&1"
do
    sleep 1
done
# Wait until the `composer install` is done by looking for the `vendor/autoload.php` file
echo "### Waiting for vendor/autoload.php"
while [ ! -f vendor/autoload.php ]
do
  sleep 1
done
# Ensure permissions on directories Craft needs to write to
chown -R www-data:www-data /var/www/project/storage
chown -R www-data:www-data /var/www/project/web/cpresources
# Run any pending migrations/project config changes
su-exec www-data php craft up
# Banner message
sleep 1
echo "### Your Craft site is ready!"
echo "Frontend URL: ${PRIMARY_SITE_URL}"
echo "CP URL: ${PRIMARY_SITE_URL}admin"
echo "CP User: ${CRAFT_CP_USER}"
echo "CP Password: ${CRAFT_CP_PASSWORD}"
# Run a queue listener
su-exec www-data php craft queue/listen 10
