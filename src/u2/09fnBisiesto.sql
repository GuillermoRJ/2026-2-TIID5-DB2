delimiter $$
create function fnBisiesto (year int)
returns boolean deterministic
begin
	declare bBisiesto tinyint;
    
    -- if ternanio
	set bBisiesto = if (year % 400 = 0, 1, if(mod(year,4)=0 and year % 100 !=0,1,0));
    
	-- if elseif
    if year % 400 = 0 then set bBisiesto = 1;
    elseif year % 4 = 0 and mod(year,100)<>0 then set bBisiesto = 1;
    else set bBisiesto = 0;
    end if;

    -- case
    case when year % 400 = 0 then set bBisiesto = true;
         when year % 4 = 0 and year %100 != 0 then set bBisiesto = true;
         else set bBisiesto = false;
	end case;
    return bBisiesto;
end;
$$

select fnBisiesto(2024);
select fnBisiesto(year("2026-06-18"));

select Gobernador, inicio
from gobernadores
where fnBisiesto(year(inicio));

