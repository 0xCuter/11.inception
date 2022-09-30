#!/bin/sh

rm -rf /var/www/html/wordpress/wp-config.php
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost="mariadb" --path="/var/www/html/wordpress/" --allow-root --skip-check

if ! wp core is-installed --allow-root; then
	wp core install --url="scuter.42.fr" --title="wordpress" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="scuter@student.42nice.fr" --path="/var/www/html/wordpress/" --allow-root
fi

if ! wp user get wpuser --allow-root; then
	wp user create wpuser wpuser@42.fr --role=author --user_pass="wppass" --allow-root
fi

chown -R www-data:www-data /var/www/html/wordpress

exec php-fpm7.3 --nodaemonize
