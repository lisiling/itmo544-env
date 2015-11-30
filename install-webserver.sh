#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y apache2 git php5 php5-curl mysql-client curl php5-mysql

git clone https://github.com/lisiling/itmo-544-fall2015.git

mv ./itmo-544-fall2015/images /var/www/html/images
mv ./itmo-544-fall2015/*.html /var/www/html
mv ./itmo-544-fall2015/*.php /var/www/html
# mv ./itmo-544-launch/setup.php /var/www/html

curl -sS https://getcomposer.org/installer | sudo php &> /tmp/getcomposer.txt

sudo php composer.phar require aws/aws-sdk-php &> /tmp/runcomposer.txt

sudo mv vendor /var/www/html &> /tmp/movecomposer.txt

sudo php /var/www/html/setup.php &> /tmp/database-setup.txt

echo "Hello!" > /tmp/hello.txt




# sns-service

ARN=(`aws sns create-topic --name mp2-lisiling`)
echo "This is the ARN: $ARN"

# arn arn:aws:sns:us-east-1:632259975581:mp2-lisiling
# subscribed and send message to 13126782765
# subscrib confirmed



aws sns set-topic-attributes --topic-arn $ARN --attribute-name DisplayName --attribute-value mp2-lisiling

aws sns subscribe --topic-arn $ARN --protocol sms --notification-endpoint 13126782765

aws sns publish --topic-arn arn:aws:sns:us-east-1:632259975581:mp2-lisiling --message "sms for test mp2"


# subscription id is: 
# arn:aws:sns:us-east-1:632259975581:mp2-lisiling:2686605e-d210-4d33-b6ad-5ddc393e3c3b