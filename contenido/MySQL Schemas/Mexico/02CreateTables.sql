use MEXICO;

-- Nivel 3
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS ladas;
DROP TABLE IF EXISTS codigos;

-- Nivel 2
DROP TABLE IF EXISTS gobernadores;
DROP TABLE IF EXISTS municipios;

-- Nivel 1
DROP TABLE IF EXISTS ciudades;


-- Nivel 1
CREATE TABLE ciudades (
  IdCiudad INT NOT NULL,
  Abr char(5),
  Nombre varchar(50) NOT NULL,
  Capital varchar(50),
  Lada int(3),
  Tot_mun INT,
  Hombres INT,
  Mujeres INT,
  PRIMARY KEY (IdCiudad),
  UNIQUE KEY unique_abr (Abr)
);

-- Nivel 2
CREATE TABLE gobernadores (
  IdCiudad INT NOT NULL,
  Gobernador varchar(38),
  Partido varchar(7),
  Inicio date,
  Fin date,
  PRIMARY KEY (IdCiudad),
  CONSTRAINT fk_gob_ciu FOREIGN KEY (IdCiudad) REFERENCES ciudades (IdCiudad)
);

CREATE TABLE municipios (
  IdCiudad INT NOT NULL,
  IdMunicipio INT NOT NULL,
  Nombre varchar(40) DEFAULT 'Conocido',
  Localidades INT,
  PRIMARY KEY (IdCiudad, IdMunicipio),
  KEY IDX_NOMBRE (Nombre),
  CONSTRAINT FK_Mun_Ciu FOREIGN KEY (IdCiudad) REFERENCES ciudades (IdCiudad)
);

-- Nivel 3
CREATE TABLE empleados (
  IdEmpleado INT NOT NULL AUTO_INCREMENT,
  Nombre varchar(20),
  Apellidos varchar(20),
  Fec_Ing date,
  Sexo char(1),
  Salario decimal(8,2),
  IdCiudad INT,
  IdMunicipio INT,
  Comision decimal(8,2),
  Activo tinyint(1),
  PRIMARY KEY (IdEmpleado),
  CONSTRAINT FK_Emp_Mun FOREIGN KEY (IdCiudad, IdMunicipio) REFERENCES municipios (IdCiudad, IdMunicipio)
);

CREATE TABLE ladas (
  IdCiudad INT,
  IdMunicipio INT,
  Localidad varchar(55),
  Lada INT,
  CONSTRAINT FK_Lad_Mun FOREIGN KEY (IdCiudad, IdMunicipio) REFERENCES municipios (IdCiudad, IdMunicipio)
);

CREATE TABLE codigos (
  IdCiudad INT ,
  IdMunicipio INT ,
  Asentamiento varchar(60),
  Codigo char(6),
  CONSTRAINT FK_Cod_Mun FOREIGN KEY (IdCiudad, IdMunicipio) REFERENCES municipios (IdCiudad, IdMunicipio)
);

