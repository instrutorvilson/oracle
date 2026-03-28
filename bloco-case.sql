DECLARE
   diaSemana NUMBER;
BEGIN
	diaSemana := :diaSemana;
	CASE diaSemana
	  WHEN 1 THEN
	     DBMS_OUTPUT.PUT_LINE('Segunda-feira');
	  WHEN 2 THEN
	     DBMS_OUTPUT.PUT_LINE('Terça-feira');
	  WHEN 3 THEN
	     DBMS_OUTPUT.PUT_LINE('Quarta-feira');
	  WHEN 4 THEN
	     DBMS_OUTPUT.PUT_LINE('Quinta-feira');
	  WHEN 5 THEN
	     DBMS_OUTPUT.PUT_LINE('Sexta-feira');
	  WHEN 6 THEN
	     DBMS_OUTPUT.PUT_LINE('Sabádo-feira');
	  WHEN 7 THEN
	     DBMS_OUTPUT.PUT_LINE('Domingo');
	  ELSE
	     DBMS_OUTPUT.PUT_LINE('Dia inválido');
	END CASE;		
END;
