#!/bin/bash

docker run -d --rm --name apache_static res/apache_php
docker run -d --rm --name express_dynamic res/express_animals
docker run -d -p 8080:80 --rm --name apache_rp res/apache_rp
echo "apache_static :"
docker inspect apache_static | grep -i ipadd
echo "apache_dynamic :"
docker inspect express_dynamic | grep -i ipadd
echo "apache_rp :"
docker inspect apache_rp | grep -i ipadd
