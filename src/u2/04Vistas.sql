-- vistas view
create view vw_cxp
as
select idpaciente, count(*) conteo
from citas
group by idpaciente;

select * from vw_cxp;

-- Numero de citas por paciente mostrando nombre

select p.idpaciente, nombre, conteo
from pacientes p inner join vw_cxp vw
  on p.idpaciente = vw.idpaciente;

select p.idpaciente, nombre, count(*)
from pacientes p inner join citas c on p.idpaciente = c.idpaciente
group by p.idpaciente, nombre;

select p.idpaciente, nombre, conteo
from pacientes p 
   inner join (select idpaciente, count(*) conteo
               from citas
               group by idpaciente) cxp
   on p.idpaciente = cxp.idpaciente;

-- * * * Pacientes con el numero maximo de citas * * * --

-- Obtener primero el numero maximo: Escalar = 2
select max(conteo)
from ( select idpaciente, count(*) conteo
       from citas
       group by idpaciente) cxp;

-- Pacientes que tienen el numero maximo
select idpaciente, count(*)
from citas
group by idpaciente
having count(*) = (select max(conteo)
                   from (select idpaciente, count(*) conteo
                         from citas
                         group by idpaciente) cxp
				   );
-- Usando ahora la vista
select *
from vw_cxp
where conteo = (select max(conteo)
                from vw_cxp);

-- Usando With
with
  cxp as (SELECT idpaciente, count(*) AS conteo
          FROM citas
          GROUP BY idpaciente) 
select p.idpaciente, p.nombre, conteo
from pacientes p inner join cxp on p.idpaciente = cxp.idpaciente
where conteo = (select max(conteo) from cxp b);

				


