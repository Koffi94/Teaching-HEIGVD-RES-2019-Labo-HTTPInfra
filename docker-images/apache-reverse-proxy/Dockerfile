FROM php:7.2-apache

COPY apache2-foreground /usr/local/bin/
COPY templates/ /var/apache2/templates/
COPY conf/ /etc/apache2

RUN apt-get update && \
    apt-get install -y vim
RUN a2enmod lbmethod_byrequests proxy proxy_http proxy_balancer headers
RUN a2ensite 000-* 001-*
