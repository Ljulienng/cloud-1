#!/bin/bash

# Copy Wordpress files
cp -rn /wordpress/* /var/www/html

# Configure Wordpress
sed -i s/ENV_GET_USER/$MYSQL_USER/g /var/www/html/wp-config.php
sed -i s/ENV_GET_PASS/$MYSQL_PASS/g /var/www/html/wp-config.php

# # Run PHP-FPM in foreground
/usr/sbin/php-fpm8.2 -F
