use northwind;

# ---------------------------------------------------------------------- #
# Add FUNCTION "MyRound"                                                 #
# ---------------------------------------------------------------------- #

DROP FUNCTION IF EXISTS `MyRound`;

DELIMITER $$

CREATE FUNCTION `MyRound`(Operand DOUBLE,Places INTEGER) RETURNS DOUBLE
DETERMINISTIC
BEGIN

DECLARE x DOUBLE;
DECLARE i INTEGER;
DECLARE ix DOUBLE;

  SET x = Operand*POW(10,Places);
  SET i=x;
  
  IF (i-x) >= 0.5 THEN                   
    SET ix = 1;                  
  ELSE
    SET ix = 0;                 
  END IF;     

  SET x=i+ix;
  SET x=x/POW(10,Places);

RETURN x;


END $$

DELIMITER ;


# ---------------------------------------------------------------------- #
# Add FUNCTION "DateOnly"                                                #
# ---------------------------------------------------------------------- #

DELIMITER $$

DROP FUNCTION IF EXISTS `DateOnly` $$

CREATE FUNCTION `DateOnly` (InDateTime datetime) RETURNS VARCHAR(10)
BEGIN

  DECLARE MyOutput varchar(10);
	SET MyOutput = DATE_FORMAT(InDateTime,'%Y-%m-%d');

  RETURN MyOutput;

END $$

DELIMITER ;


