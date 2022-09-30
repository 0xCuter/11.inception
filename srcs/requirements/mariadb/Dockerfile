FROM debian:buster

RUN	apt update -y && \
	apt upgrade -y && \
	apt install -y mariadb-server gettext-base

EXPOSE 3306

WORKDIR /tmp/mariadb/

COPY tools/my.cnf /etc/mysql

COPY tools/script.sh /tmp/mariadb/

ENTRYPOINT ["sh", "/tmp/mariadb/script.sh"]

CMD ["mysqld_safe"]
