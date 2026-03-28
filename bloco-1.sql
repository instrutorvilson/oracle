DECLARE
   nome varchar2(20);
   idade NUMBER;
   hoje DATE;
BEGIN
	nome := 'Vilson';
    idade := 50;
	DBMS_OUTPUT.PUT_LINE('Olá ' || nome || ' vc tem ' || idade || ' anos.');

    hoje := sysdate;
    DBMS_OUTPUT.PUT_LINE('Hoje é dia: ' || hoje);
END;

DECLARE
  nome varchar2(20);
BEGIN
  nome := '${nome}';
  DBMS_OUTPUT.PUT_LINE('Olá ' || nome);	
END;
