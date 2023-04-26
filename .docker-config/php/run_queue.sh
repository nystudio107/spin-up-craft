#!/bin/sh

# Run Queue shell script
#
# This shell script runs the Craft CMS queue via `php craft queue/listen`
# It waits until the database container responds, then runs any pending
# migrations / project config changes via the `craft-update` Composer script,
# then runs the queue listener that listens for and runs pending queue jobs
#
# @author    nystudio107
# @copyright Copyright (c) 2023 nystudio107
# @link      https://nystudio107.com/
# @license   MIT

cd /var/www/project
# Wait until the `composer install` is done by looking for the `vendor/autoload.php` file
echo "### Waiting for vendor/autoload.php"
while [ ! -f "composer.lock" ] || [ ! -d "vendor" ] || [ ! -f "vendor/autoload.php" ]
do
  sleep 5
done
# Wait until the MySQL db container responds
COMMAND="mysql -h mysql -u $CRAFT_DB_USER -p$CRAFT_DB_PASSWORD $CRAFT_DB_DATABASE -se 'SELECT EXISTS(SELECT * FROM info)'"
# First wait until the command runs without error
until eval "$COMMAND > /dev/null 2>&1"
do
    echo "### Waiting for MySQL database"
    sleep 5
done
# Second wait until content in the `info` table exists
until [ $(eval "$COMMAND") !=  "0" ]
do
    echo "### Waiting for database 'info' table"
    sleep 5
done
# Ensure permissions on directories Craft needs to write to
chown -R www-data:www-data /var/www/project/storage
chown -R www-data:www-data /var/www/project/web/cpresources
# Create a security key if it doesn't exist already
if [ -z "$CRAFT_SECURITY_KEY" ] ; then
    su-exec www-data php craft setup/security-key --interactive=0
fi
# Create an app id if it doesn't exist already
if [ -z "$CRAFT_APP_ID" ] ; then
    su-exec www-data php craft setup/app-id --interactive=0
fi
# Run any pending migrations/project config changes
su-exec www-data php craft up --interactive=0
# Banner message
source '/var/www/banner_message.sh'
# Run a queue listener
su-exec www-data php craft queue/listen 10
