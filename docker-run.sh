#!/bin/bash

CURRENT_DIR=$(dirname "$(readlink -f "$0")")

PROJECT_DIR=$(dirname "$CURRENT_DIR")

sudo docker rm -f php5
sudo docker rm -f php7

sudo docker build -t php5 -f ./Dockerfile.php5 .
sudo docker build -t php7 -f ./Dockerfile.php7 .

echo "Running PHP5 at 5000!" && \
    sudo docker run -p 5000:80 \
        --name php5 -d \
        -v "$CURRENT_DIR/files":/var/www/html \
        -i php5

echo "Running PHP7 at 7000!" && \
    sudo docker run -p 7000:80 \
        --name php7 -d \
        -v "$CURRENT_DIR/files":/var/www/html \
        -i php7

