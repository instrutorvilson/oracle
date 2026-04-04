DECLARE
   	CURSOR c_func IS
		SELECT  nome, salario FROM funcionario
		WHERE salario < 3000
		FOR UPDATE;

    v_nome funcionario.nome%TYPE;
    v_salario funcionario.salario%TYPE; 
    v_aumento funcionario.salario%TYPE; 
BEGIN
    OPEN c_func;
    LOOP
	    FETCH c_func INTO v_nome, v_salario;
	    EXIT WHEN c_func%NOTFOUND;
	        v_aumento := v_salario * 0.05;
			UPDATE funcionario SET 
			salario = v_salario + v_aumento
		    WHERE CURRENT OF c_func;
	   
	       DBMS_OUTPUT.PUT_LINE(v_nome || ' Salario atual: R$' 
	          || v_salario || 'Novo salario: '|| (v_salario + v_aumento));
	 END LOOP;  
  CLOSE c_func;
END;