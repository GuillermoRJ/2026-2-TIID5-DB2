delimiter $$
CREATE FUNCTION fnLoop (n int)
   RETURNS DECIMAL(20,0) deterministic

BEGIN
   DECLARE factorial DECIMAL(20,0) DEFAULT 1;
   DECLARE counter int1;
   SET counter = n;
   
   ciclo: loop
      if counter <= 1 then LEAVE ciclo;
      end if;
	  SET factorial = factorial * counter;
	  SET counter = counter - 1;
   END loop ciclo;
   RETURN factorial;
END;
$$

select fnLoop(4);
