-- Crear tabla de departmentos
CREATE TABLE departamentos (
    id_dep INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Crear tabla de empleados, debe pertenecer a un departamento
CREATE TABLE empleados (    
    id_emp INT  AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50) NOT NULL,
    id_dep INT not null,
    CONSTRAINT pk_empleados PRIMARY KEY (id_emp),
    FOREIGN KEY (id_dep) REFERENCES departamentos(id_dep)
);

-- Crear una tabla de pcs, 
-- cada pc puede estar asignada a un empleado
-- cada empleado debe tener una pc asignada.

CREATE TABLE pcs (
    id_pc INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(50),
    numero_serie VARCHAR(20) NOT NULL,
    fecha_compra DATE,
    id_emp INT,
    UNIQUE INDEX unique_serie (numero_serie ASC) VISIBLE
);

create unique index unique_emp on pcs(id_emp);

alter table pcs 
add constraint fk_pcs_emp foreign key (id_emp) references empleados(id_emp);

-- Insertar datos en la tabla de departamentos
INSERT INTO departamentos (nombre) VALUES ('Ventas');
INSERT INTO departamentos  VALUES (null, 'Informatica');
INSERT INTO departamentos  VALUES (null, 'Recursos Humanos');
-- Insertar datos en la tabla de empleados
INSERT INTO empleados (nombre, apellido, id_dep) VALUES ('Jesus', 'Pérez', 1);
INSERT INTO empleados  VALUES (null, 'María', 'Gómez', 2);
INSERT INTO empleados  VALUES (null, 'Jose', 'Franco', 2);


-- Insertar datos en la tabla de pcs
INSERT INTO pcs (marca, numero_serie, fecha_compra, id_emp) VALUES ('Dell', 'SN12345', '2022-01-15', 1);
INSERT INTO pcs  VALUES (null, 'HP', 'SN54321', '2023-03-10', 2);   
INSERT INTO pcs  VALUES (null, 'ASUS', 'SN67890', '2024-10-15', null); 

insert 
-- PC sin asignar  

UPDATE pcs SET id_emp = 2 WHERE id_pc = 1;    
-- Un Empleado una PC
