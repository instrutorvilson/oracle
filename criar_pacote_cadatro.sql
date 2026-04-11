/* declaração*/
CREATE OR REPLACE PACKAGE pk_cadastro AS 
  PROCEDURE inserir(id NUMBER,nome varchar2, salario NUMBER);
  FUNCTION consultar_departamento(p_id_funcionario number) RETURN varchar2;
END pk_cadastro;

/*implemenção*/
CREATE OR REPLACE PACKAGE BODY pk_cadastro AS 
   PROCEDURE inserir(id NUMBER,nome varchar2, salario NUMBER) IS 
   BEGIN 
	   INSERT INTO funcionarios(id_funcionario,nome, salario, id_departamento)
	   values(id,nome, salario, 4);
   END; 
  
  FUNCTION consultar_departamento(p_id_funcionario NUMBER)
		RETURN VARCHAR2
		IS
		    v_nome_departamento departamentos.nome_departamento%TYPE;
		BEGIN
		    SELECT d.nome_departamento
		    INTO v_nome_departamento
		    FROM departamentos d
		    INNER JOIN funcionarios f 
		        ON f.id_departamento = d.id_departamento
		    WHERE f.id_funcionario = p_id_funcionario;
		
		    RETURN v_nome_departamento;
		
		EXCEPTION
		    WHEN NO_DATA_FOUND THEN
		        RETURN 'NÃO ENCONTRADO';
		END;
END pk_cadastro;

BEGIN
  pk_cadastro.inserir(15,'aena',5000);	
END;

SELECT pk_cadastro.consultar_departamento(13) FROM dual;