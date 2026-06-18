delimiter $$
create function fn_partido (id int)
returns varchar(10) deterministic
begin
	declare vPartido varchar(10);
    /*
	select partido into vPartido
	from gobernadores
	where idCiudad = id;
    */
    set vPartido = (select partido from gobernadores 
                    where idCiudad = id );
    return vPartido;
end;
$$

select idCiudad, Abr, fn_partido(idciudad) partido
from ciudades;

