delimiter $$
CREATE FUNCTION fnLoop (n int)
   RETURNS varchar(200) deterministic

BEGIN
   DECLARE i int1 default 1;
   DECLARE tabla  varchar(200) default '';
   
   ciclo: loop
      if i > 10 then LEAVE ciclo;
      end if;
	  SET tabla = concat(tabla, n, " X ", i, ' = ', n*i, '\n');
	  SET i = i + 1;
   END loop ciclo;
   RETURN tabla;
END;
$$

select fnLoop(7);

