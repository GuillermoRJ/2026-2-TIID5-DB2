use CLINICA;

select *
from pacientes p
where IDPACIENTE not in (SELECT distinct idpaciente
                         FROM citas);

select p.*
from pacientes p left join citas c on p.idpaciente = c.idpaciente
where c.idpaciente is null;

SELECT *
FROM pacientes p
WHERE NOT EXISTS (SELECT DISTINCT(idpaciente)
                  FROM citas c
                  WHERE p.idpaciente = c.idpaciente);

