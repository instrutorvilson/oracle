BEGIN
    FOR func IN (SELECT * FROM funcionario WHERE salario < 3000 ) LOOP
	    DELETE FROM funcionario WHERE id = func.id;
	   
    	DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' funcionarios exlcuídos');
    END LOOP;    
END;


CREATE OR REPLACE PROCEDURE insere_funcionario(
 p_nome IN funcionario.nome%TYPE,
 p_salario funcionario.salario%TYPE 
)
IS 
   v_total NUMBER;
BEGIN
   SELECT count(*) 
   INTO v_total
   FROM funcionario
   WHERE UPPER(nome)  = upper(p_nome);
  
  IF v_total > 0 THEN
     DBMS_OUTPUT.PUT_LINE('Já existe um funcionário com esse nome');
  ELSE
     INSERT INTO funcionario(nome, salario)values(p_nome, p_salario);
     DBMS_OUTPUT.PUT_LINE('Funcionário inserido com sucesso');
  END IF;   
END;

BEGIN
	insere_funcionario('Teste', 500);
END;


SELECT * FROM funcionario