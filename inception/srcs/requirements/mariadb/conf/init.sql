CREATE DATABASE IF NOT EXISTS wordpress_db;

CREATE USER IF NOT EXISTS 'super_user'@'localhost' IDENTIFIED BY 'njeanbou';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'super_user'@'localhost';

CREATE USER IF NOT EXISTS 'njeanbou'@'localhost' IDENTIFIED BY 'njeanbou';
GRANT SELECT, INSERT, UPDATE, DELETE ON wordpress_db.* TO 'njeanbou'@'localhost';

FLUSH PRIVILEGES;

