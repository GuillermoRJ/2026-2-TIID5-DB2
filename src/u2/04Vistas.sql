-- vistas view
create view vw_cxp
as
select idpaciente, count(*) conteo
from citas
group by idpaciente;

select * from vw_cxp;
select p.idpaciente, nombre, conteo
from pacientes p inner join vw_cxp vw
  on p.idpaciente = vw.idpaciente;
