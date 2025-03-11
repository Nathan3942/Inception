#!/bin/sh

################################################################
# script.sh has to be run by ENTRYPOINT from mariadb Dockerfile
################################################################

if [ ! -f "/run/mysqld/mysqld.pid" ];
then
	sed -i 's/= 127.0.0.1/= 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
	sed -i 's/basedir/port\t\t\t\t\t= 3306\nbasedir/' /etc/mysql/mariadb.conf.d/50-server.cnf
	echo "Inception : 50-server.cnf updated."
	if [ ! -d "/var/lib/mysql/${MYSQL_DB}" ];
	then
		echo "Inception : ${MYSQL_DB} database is being created."
		service mariadb start
		mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};"
		mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
		mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
		mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
		mysql -e "FLUSH PRIVILEGES;"
		mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
		mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
	else
		echo "Inception : ${MYSQL_DB} database is already there.";
	fi
fi

# Start the mariadb service in safe mode
exec "mysqld_safe";
