-- Empleados que ganan mas del promedio
use HR;
-- Escalar, un valor
SELECT avg(salary) 
FROM employees;

-- Select Tabla
select employee_id, salary
from employees
where salary > 6461;

select employee_id, salary
from employees
where salary > ( SELECT avg(salary) 
                 FROM employees);

-- partidos que no sean MORENA ni PRI
SELECT *
FROM gobernadores
WHERE PARTIDO not IN ("MORENA", 'PRI');

-- partidos que no sean de mujeres
SELECT *
FROM gobernadores
WHERE PARTIDO not IN (select partido
                      from gobernadores
                      where sexo = 'M');				 
					  

-- pacientes que no tienen citas 
-- doctores  que no tienen citas

					  