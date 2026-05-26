CREATE DATABASE IF NOT EXISTS NBA;

drop user if exists 'nba'@'localhost';

CREATE USER 'nba'@'localhost' IDENTIFIED BY 'nba';

GRANT ALL PRIVILEGES ON NBA.* TO 'nba'@'localhost';

-- GRANT select ON mexico.ciudades TO 'planos'@'localhost';

