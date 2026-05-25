CREATE DATABASE IF NOT EXISTS HR;

drop user 'hr'@'localhost';

CREATE USER 'hr'@'localhost' IDENTIFIED BY 'hr';

GRANT ALL PRIVILEGES ON HR.* TO 'hr'@'localhost';

-- GRANT select ON mexico.ciudades TO 'planos'@'localhost';

