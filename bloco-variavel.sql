DECLARE
	a NUMBER := 10;
	b NUMBER := 5;
BEGIN
	a := :a;
    b := :b;
   
	DBMS_OUTPUT.PUT_LINE('Soma: ' || (a + b));
    DBMS_OUTPUT.PUT_LINE('Subtração: ' || (a - b));
    DBMS_OUTPUT.PUT_LINE('Mulitplicação: ' || (a * b));
    DBMS_OUTPUT.PUT_LINE('Divisaõ: ' || (a / b));
END;