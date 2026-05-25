
CREATE DATABASE IF NOT EXISTS PLANS;

drop user if exists 'plans'@'localhost';

CREATE USER 'plans'@'localhost' IDENTIFIED BY 'plans';

GRANT ALL PRIVILEGES ON PLANS.* TO 'plans'@'localhost';

-- GRANT select ON MEXICO.ciudades TO 'mexico'@'localhost';


