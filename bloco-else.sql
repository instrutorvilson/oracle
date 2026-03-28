DECLARE
   altura NUMBER(4,2);
   peso NUMBER;
   imc NUMBER(4,2);
BEGIN
  altura := :altura;
  peso := :peso;
  imc := peso /(altura * altura); 
 
  DBMS_OUTPUT.PUT_LINE(imc);
  IF imc < 18.50 THEN
     DBMS_OUTPUT.PUT_LINE(imc || ' Magreza');
  ELSIF imc < 25 THEN
     DBMS_OUTPUT.PUT_LINE(imc || ' Normal');
  ELSIF imc < 30 THEN
     DBMS_OUTPUT.PUT_LINE(imc || ' sobrepeso');
  ELSIF imc < 35 THEN
     DBMS_OUTPUT.PUT_LINE(imc || ' Obesidade grau I');
  ELSIF imc < 40 THEN
     DBMS_OUTPUT.PUT_LINE(imc || ' Obesidade grau II');
  ELSE
     DBMS_OUTPUT.PUT_LINE(imc || ' Obesidade grau III');
  END IF;
END;
