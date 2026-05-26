CREATE DATABASE IF NOT EXISTS Northwind;

drop user 'Nw'@'localhost';

CREATE USER 'Nw'@'localhost' IDENTIFIED BY 'nw';

GRANT ALL PRIVILEGES ON Northwind.* TO 'Nw'@'localhost';

-- GRANT select ON mexico.ciudades TO 'nw'@'localhost';


-------------------------------------------------------
/*
php.ini
mysqli.allow_local_infile = On
check mysqli.allow_local_infile

C:\xampp\mysql\bin\my.ini
[mysqld]
     local-infile = 1 

Acceso denegado para usuario
??
GRANT FILE ON plans.* TO 'planos'@'localhost'
*/
