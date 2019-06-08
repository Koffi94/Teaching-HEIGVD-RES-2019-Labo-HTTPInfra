#!/bin/bash

docker stop $(docker ps -aq) && docker rm $(docker ps -aq)

docker build -t res/apache_php ./docker-images/apache-php-image/
docker build -t res/express_animals ./docker-images/express-image/
docker build -t res/apache_rp ./docker-images/apache-reverse-proxy/

docker run -d --rm --name apache_static_1 res/apache_php
docker run -d --rm --name apache_static_2 res/apache_php
docker run -d --rm --name express_dynamic_1 res/express_animals
docker run -d --rm --name express_dynamic_2 res/express_animals

docker run -d --rm -e STATIC_APP_1=172.17.0.2:80 -e STATIC_APP_2=172.17.0.3:80 -e DYNAMIC_APP_1=172.17.0.4:3000 -e DYNAMIC_APP_2=172.17.0.5:3000 --name apache_rp -p 8080:80 res/apache_rp

docker ps

google-chrome "http://demo.res.ch:8080" &
google-chrome "http://demo.res.ch:8080/balancer-manager" &
