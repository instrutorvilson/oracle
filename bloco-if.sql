DECLARE
   nome varchar(20);
   idade NUMBER;
   msg varchar(10);
BEGIN
  nome := '${nome}';
  idade := :idade;
  IF idade < 18 THEN
     msg := 'menor';
  ELSE
     msg := 'maior';
  END IF;
 
  DBMS_OUTPUT.PUT_LINE('Olá ' || nome ||' vc tem ' || idade || ' portanto vc é '|| msg ||' de idade');
END;


DECLARE
   numero NUMBER;
BEGIN
   numero := 0;
   IF numero < 0 THEN
      DBMS_OUTPUT.PUT_LINE('negativo');
   ELSIF numero > 0 THEN
      DBMS_OUTPUT.PUT_LINE('positivo');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Zero');
   END IF;
END;
