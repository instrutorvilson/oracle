DECLARE
  contador NUMBER := 1;
BEGIN
	LOOP
	  DBMS_OUTPUT.PUT_LINE(contador);	
	  contador := contador + 1;
	  EXIT WHEN contador > 10;
	END LOOP;	
END;

DECLARE
  contador NUMBER := 1;
BEGIN
	WHILE contador < 10 LOOP	
	  DBMS_OUTPUT.PUT_LINE(contador);	
	  contador := contador + 1;
	END LOOP;	
END;

BEGIN
	FOR i IN 1..10 LOOP 
		DBMS_OUTPUT.PUT_LINE(i);
	END LOOP;	
END;