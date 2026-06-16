delimiter $$
CREATE FUNCTION fnWhile (n int)
   RETURNS DECIMAL(20,0) deterministic

BEGIN
   DECLARE factorial DECIMAL(20,0) DEFAULT 1;
   DECLARE counter int1;
   SET counter = n;
   
   WHILE counter <> 1 DO
      SET factorial = factorial * counter;
      SET counter = counter - 1;
   END WHILE;   
   RETURN factorial;
END
$$

select fnWhile(5);
