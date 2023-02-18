FROM nystudio107/php-dev-base:8.1-alpine

# dependencies required for running "phpize"
# these get automatically installed and removed by "docker-php-ext-*" (unless they're already installed)
ENV PHPIZE_DEPS \
        autoconf \
        dpkg-dev \
        dpkg \
        file \
        g++ \
        gcc \
        libc-dev \
        make \
        pkgconf \
        re2c \
        wget

# Install packages
RUN set -eux; \
    # Packages needed only for build
    apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
    && \
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
    # Remove the build deps
    apk del .build-deps \
    && \
    # Clean out directories that don't need to be part of the image
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
