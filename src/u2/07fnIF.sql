delimiter $$
create function fnIf (dato int)
returns char(10) deterministic
begin
   declare leyenda char(10);
   
   if dato between 1 and 10 then
      set leyenda="A";
   elseif dato between 11 and 20 then set leyenda ='B';
   else set leyenda= 'Z';
   end if;
   return leyenda;
end;
$$

select fnIf(30) from dual;
