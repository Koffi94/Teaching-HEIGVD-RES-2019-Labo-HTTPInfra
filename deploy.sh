#!/bin/bash

docker stop $(docker ps -q) && docker rm $(docker ps -aq)
docker run -d --rm --name apache_static_1 res/apache_php
docker run -d --rm --name apache_static_2 res/apache_php
docker run -d --rm --name express_dynamic_1 res/express_animals
docker run -d --rm --name express_dynamic_2 res/express_animals
docker build -t res/apache_rp ./docker-images/apache-reverse-proxy/
docker run -d --rm -e STATIC_APP_1=172.17.0.2:80 -e STATIC_APP_2=172.17.0.3:80 -e DYNAMIC_APP_1=172.17.0.3:3000 -e DYNAMIC_APP_2=172.17.0.4:3000 --name apache_rp -p 8080:80 res/apache_rp
