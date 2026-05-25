-- Relación jerárquica de empleados (manager)
ALTER TABLE emp 
  ADD CONSTRAINT FK_EMP_EMP FOREIGN KEY (MGR) REFERENCES emp(EMPNO);