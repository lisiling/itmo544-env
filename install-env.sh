#!/usr/local/bin/bash

sudo apt-get update -y
sudo apt-get install -y apache2 git

git clone https://github.com/lisiling/itmo-544-fall2015.git

mv ./itmo-544-fall2015/images /var/www/html/images
mv ./itmo-544-fall2015/index.html /var/www/html
mv ./itmo-544-2015fall/page2.html /var/www/html
mv ./itmo-544-2015fall/*.php /var/www/html

echo "Hello!" > /tmp/hello.txt




