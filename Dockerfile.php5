FROM ubuntu:14.04

MAINTAINER Matheus S. Fontana <matheussteinfontana@gmail.com>

RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y php5
RUN apt-get install -y vim

RUN rm -rfv /var/www/html/*

EXPOSE 80

CMD service apache2 stop

RUN echo 'date.timezone = America/Sao_Paulo' >> etc/php5/apache2/php.ini
RUN echo 'display_errors = On' >> etc/php5/apache2/php.ini

ENTRYPOINT service apache2 start && bash

