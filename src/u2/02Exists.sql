use CLINICA;
-- explain: medir el costo de las consultas

-- pacientes que no tienen citas

EXPLAIN select *
from pacientes p
where IDPACIENTE not in (SELECT distinct idpaciente
                         FROM citas);

EXPLAIN select p.*
from pacientes p left join citas c on p.idpaciente = c.idpaciente
where c.idpaciente is null;

EXPLAIN SELECT *
FROM pacientes p
WHERE NOT EXISTS (SELECT DISTINCT(idpaciente)  1
                  FROM citas c
                  WHERE p.idpaciente = c.idpaciente);

