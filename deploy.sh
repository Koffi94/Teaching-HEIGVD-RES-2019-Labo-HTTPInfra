#!/bin/bash

docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
docker run -d --rm res/apache_php
docker run -d --rm res/apache_php
docker run -d --rm res/apache_php
docker run -d --rm --name apache_static res/apache_php
docker run -d --rm res/express_animals
docker run -d --rm res/express_animals
docker run -d --rm --name express_dynamic res/express_animals
docker build -t res/apache_rp ./docker-images/apache-reverse-proxy/
docker run -d --rm -e STATIC_APP=172.17.0.5:80 -e DYNAMIC_APP=172.17.0.8:3000 --name apache_rp -p 8080:80 res/apache_rp
