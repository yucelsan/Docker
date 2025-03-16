#!/bin/bash

docker ps -a
docker stop nginx_ssl
docker stop mysql-db
docker stop apache-app
docker stop nginx-proxy
docker stop nginx-custom
docker stop apache-custom
docker rm nginx_ssl
docker rm mysql-db
docker rm apache-app
docker rm nginx-proxy
docker start nginx-custom
docker start apache-custom

cd dockProject
docker-compose down -v 
docker-compose up -d --build
cd ansible
ansible-playbook deploy_nginx_ssl.yml
docker exec -it nginx_ssl mkdir -p /var/www
docker exec -it nginx_ssl mkdir -p /var/www/html
docker exec -it nginx_ssl chown -R www-data:www-data /var/www/html
docker cp /var/www/html/index.nginx-debian.html nginx_ssl:/var/www/html
docker ps
echo "ALL CONTAINERS STOP AND START AGAIN. YOU CAN TEST THE FOLLOWING URLS :"
echo "http://127.0.0.1"
echo "http://127.0.0.1:8081"
echo "http://127.0.0.1:8082"
echo "http://127.0.0.1:8090"
echo "http://127.0.0.1:8387"
echo "https://127.0.0.1"
echo "https://yucelsan.local"
