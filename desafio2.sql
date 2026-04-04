BEGIN
    FOR func IN (SELECT nome, salario FROM funcionario WHERE departamento_id = 3 ) LOOP 
    	DBMS_OUTPUT.PUT_LINE(func.nome || ' ' || func.salario);
    END LOOP;    
END;


CREATE OR REPLACE PROCEDURE relatorio_funcionarios(
p_departamento_id IN funcionario.departamento_id%TYPE)
IS 
BEGIN 
	FOR func IN (SELECT nome, salario FROM funcionario WHERE departamento_id = p_departamento_id ) LOOP 
    	DBMS_OUTPUT.PUT_LINE(func.nome || ' ' || func.salario);
    END LOOP; 
END;


BEGIN
   relatorio_funcionarios(1);
   relatorio_funcionarios(2);
   relatorio_funcionarios(3);
END;


