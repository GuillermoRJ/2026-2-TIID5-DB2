CREATE DATABASE IF NOT EXISTS MEXICO;

drop user if exists 'mexico'@'localhost';

CREATE USER 'mexico'@'localhost' IDENTIFIED BY 'mexico';

GRANT ALL PRIVILEGES ON MEXICO.* TO 'mexico'@'localhost';

-- GRANT select ON mexico.ciudades TO 'planos'@'localhost';
