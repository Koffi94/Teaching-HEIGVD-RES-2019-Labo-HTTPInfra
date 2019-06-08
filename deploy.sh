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

docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

docker ps

google-chrome "http://localhost:9000" &
