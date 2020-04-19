FROM debian:buster-slim
# FROM ubuntu:18.04

RUN apt-get update && \ 
	apt-get install -y 

RUN apt-get update && \ 
	apt-get install -y python3 libc6 libcurl4 libpython3.7  && \
	apt-get --fix-broken install && \
	rm -rf /var/lib/apt/lists/*

COPY mysql-shell_8.0.19-1debian10_amd64.deb /tmp 	
COPY libc6_2.30-0ubuntu2.1_amd64.deb /tmp

RUN dpkg -i /tmp/libc6_2.30-0ubuntu2.1_amd64.deb && \
	dpkg -i /tmp/mysql-shell_8.0.19-1debian10_amd64.deb && \
  	rm -Rf /tmp/* && \
	chmod 777 /usr/bin/mysqlsh

CMD ["/bin/bash"]



# docker network create cluster --subnet=192.168.0.0/16
# docker run -d --net=cluster --name=node1 --ip=192.168.0.2 -e MYSQL_ROOT_PASSWORD=16scm4 my8innodb mysqld
# docker run -p 3307:3306 --name node1 -e MYSQL_ROOT_PASSWORD=16scm4 -d my8innodb

# Deploy no Openshift 
# oc new-app https://github.com/marlonscastro/mysql-shell.git --strategy=docker --name mysql-shell
# Depois adiciona um Storage Mount com 1Gi no Deployment Config path::  /var/lib/mysql

#/.mysqlsh
