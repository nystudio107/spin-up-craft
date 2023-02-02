FROM nystudio107/php-prod-base:8.0-alpine

# Install packages
RUN set -eux; \
    # Packages to install
    apk add --no-cache \
        su-exec \
        nano \
        mysql-client \
        mariadb-connector-c \
    && \
    # Install PHP extensions
    docker-php-ext-install \
        pdo_mysql \
        soap \
    && \
    # Install Composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \
    && \
    # Clean out directories that don't need to be part of the image
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www

COPY ./run_queue.sh .
RUN chmod a+x run_queue.sh \
    && \
    mkdir -p /var/www/project/storage \
    && \
    mkdir -p /var/www/project/web/cpresources \
    && \
    chown -R www-data:www-data /var/www/project
COPY ./composer_install.sh .
RUN chmod a+x composer_install.sh

WORKDIR /var/www/project

# Run the composer_install.sh script that will do a `composer install`:
# - If `composer.lock` is missing
# - If `vendor/` is missing
# ...then start up php-fpm. The `run_queue.sh` script in the queue container
# will take care of running any pending migrations and apply any Project Config changes,
# as well as set permissions via an async CLI process
CMD /var/www/composer_install.sh \
    && \
    php-fpm
