FROM debian:buster

RUN	apt update -y && \
	apt upgrade -y && \
	apt install -y nginx openssl

COPY tools/wordpress.conf /etc/nginx/sites-enabled/

RUN openssl req -x509 -nodes -subj "/C=BE/ST=BXL/O=19/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt -days 365

CMD ["nginx", "-g", "daemon off;"]
