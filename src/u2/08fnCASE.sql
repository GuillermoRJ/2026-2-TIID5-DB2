delimiter $$
create function fnCase (dato int)
returns char(10) deterministic
begin
   declare leyenda char(10);
   
   CASE 
      WHEN dato between 1  and 10 THEN set leyenda = 'A';
      WHEN dato between 11 and 20 THEN set leyenda = 'B';
      ELSE set leyenda= 'Z';
   END CASE;
   return leyenda;
end;
$$

select fnCase(10) from dual;
