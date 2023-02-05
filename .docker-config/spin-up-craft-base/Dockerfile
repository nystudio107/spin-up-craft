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
