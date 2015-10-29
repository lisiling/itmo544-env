#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apache2 git php5 php5-curl mysql-client curl

git clone https://github.com/lisiling/itmo-544-fall2015.git

mv ./itmo-544-fall2015/images /var/www/html/images
mv ./itmo-544-fall2015/index.html /var/www/html
mv ./itmo-544-fall2015/*.php /var/www/html

curl -sS http://getcomposer.org/installer | php

php composer.phar require aws/aws-sdk-php

mv vendor /var/www/html

echo "Hello!" > /tmp/hello.txt


