BEGIN
  pk_funcionario.inserir(15,'aena',5000);	
END;

DECLARE
  v_nome varchar2(100);
BEGIN
  v_nome := pk_cadastro.consultar_departamento(14);	
  DBMS_OUTPUT.PUT_LINE(v_nome);
END;

SELECT * FROM DEPARTAMENTOS d ;
SELECT pk_cadastro.consultar_departamento(14) FROM dual;

SELECT * from funcionarios;

