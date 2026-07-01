-- Active: 1778258982896@@127.0.0.1@3306@HR
-- Cuantos empleados ganan mas que cada empleado
SELECT EMPLOYEE_ID, COUNT(*)
FROM employees e
WHERE salary > (select salary
                from employees x
                where e.EMPLOYEE_ID = x.EMPLOYEE_ID)
group by employee_id; 