use CLINICA;

--   inner join
select e.idespecialidad, descripcion, 
       m.idespecialidad, idmedico, apellidos 
from especialidades e join medicos m 
  on e.idespecialidad = m.idespecialidad
order by e.idespecialidad;

-- Left join
select e.idespecialidad, descripcion, 
       m.idespecialidad, idmedico, apellidos
from especialidades e left join medicos m 
  on e.idespecialidad = m.idespecialidad
where m.idespecialidad is null;

-- Full [Outer] Join
select e.idespecialidad, descripcion, m.idespecialidad, idmedico, apellidos
from especialidades e left join medicos m 
  on e.idespecialidad = m.idespecialidad
where m.idespecialidad is null  
union 
select e.idespecialidad, descripcion, m.idespecialidad, idmedico, apellidos
from especialidades e right join medicos m 
  on e.idespecialidad = m.idespecialidad
where e.idespecialidad is null;

