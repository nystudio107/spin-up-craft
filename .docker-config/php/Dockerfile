FROM nystudio107/spin-up-craft-base:8.1-alpine

WORKDIR /var/www

COPY run_queue.sh banner_message.sh ./
RUN mkdir -p /var/www/project/storage \
    && \
    mkdir -p /var/www/project/web/cpresources \
    && \
    chown -R www-data:www-data /var/www/project \
    && \
    chmod a+x run_queue.sh \
    && \
    chmod a+x banner_message.sh

WORKDIR /var/www/project

# Run the composer_install.sh script that will do a `composer install`:
# - If `composer.lock` is missing
# - If `vendor/` is missing
# ...then start up php-fpm. The `run_queue.sh` script in the queue container
# will take care of running any pending migrations and apply any Project Config changes,
# as well as set permissions via an async CLI process
CMD su-exec www-data composer install --verbose --no-progress --no-scripts --no-interaction \
    && \
    php-fpm
