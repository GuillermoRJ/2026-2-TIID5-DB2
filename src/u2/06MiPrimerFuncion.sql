delimiter $$
CREATE FUNCTION fnLastDay(fecha date)
returns int deterministic
begin
	declare ultimoDia int;
    
    set ultimoDia = (select day(last_day(fecha)));
	select day(last_day(fecha)) into ultimoDia  from dual;
	return ultimoDia;
end;
$$

select fnLastDay("2024-02-15");
select fnLastDay(sysdate());
select idciudad, gobernador, inicio, fnLastDay(inicio)
from gobernadores;


