DELIMITER $$
DROP FUNCTION IF EXISTS fnRepeat;
CREATE FUNCTION fnRepeat(n int) 
   RETURNS int deterministic
BEGIN 
   DECLARE factorial int  DEFAULT 1;
   DECLARE counter   int1 default 1;

   REPEAT
	  SET factorial = factorial * counter; 	
      set counter = counter + 1;
   UNTIL counter > n end repeat; 
   RETURN factorial;
END;
$$

select fnRepeat(3);
    