FROM phpdockerio/php56-fpm:latest

# Install selected extensions and other stuff

RUN apt-get update \
    && apt-get -y --no-install-recommends install  php5-memcached php5-mysql \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


COPY ./www.conf /etc/php5/fpm/pool.d/www.conf


RUN mkdir -p /var/log/php5-fpm


RUN apt-get install nano

WORKDIR "/var/www/apzcrawl"
