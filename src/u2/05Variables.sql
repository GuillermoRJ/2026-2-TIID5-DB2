-- set @cadena = 'c:\\matematicas\\algebra\\binomios.txt';
set @cadena = 'c:/matematicas/algebra/binomios.txt';
select @cadena from dual;

-- Extraer el nombre del archivo
select substr(@cadena, length(@cadena) - instr(reverse(@cadena),'/')+2) archivo;
select substring_index(@cadena,'/',-1) as archivo;

use MEXICO;
set @abreviatura = (select abr from ciudades where idciudad = 1 );
select @abreviatura;

select abr, nombre into @a, @b from ciudades
where idciudad = 1;
Select @a, @b;
