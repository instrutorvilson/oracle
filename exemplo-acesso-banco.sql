select * from funcionarios order by salario;

DECLARE
  iprf varchar2(20);
BEGIN
  FOR reg IN (select nome, salario from funcionarios) LOOP
      IF reg.salario < 5000 THEN
         iprf := 'Isento';
      ELSE
         iprf := 'Não Isento';
      END IF;
      DBMS_OUTPUT.PUT_LINE(reg.nome || ' R$ ' || reg.salario || ' ' || iprf);
  END LOOP;
END;