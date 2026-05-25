-- drop user 'Mexico'@'localhost';

CREATE DATABASE IF NOT EXISTS MEXICO;

CREATE USER 'Mexico'@'localhost' IDENTIFIED BY 'mexico';

GRANT ALL PRIVILEGES ON MEXICO.* TO 'Mexico'@'localhost';

-- GRANT select ON MEXICO.ciudades TO 'planos'@'localhost';

