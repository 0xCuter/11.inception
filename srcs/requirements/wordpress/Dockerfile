FROM debian:buster

RUN	apt update -y && \
	apt upgrade -y && \
	apt install -y php7.3 php7.3-fpm php7.3-mysql curl

WORKDIR /tmp/wordpress/

COPY tools/www.conf /etc/php/7.3/fpm/pool.d
COPY tools/script.sh /tmp/wordpress/

RUN mkdir -p /run/php
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress
RUN wp core download --allow-root
RUN chown -R www-data:www-data /var/www/html

#RUN sh /tmp/wordpress/script.sh && rm /tmp/wordpress/script.sh

#CMD ["php-fpm7.3", "-F"]

CMD ["sh", "/tmp/wordpress/script.sh"]
