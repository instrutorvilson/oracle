BEGIN
	--pk_financas.criarConta(2,'Pedro',1000);
	--pk_financas.sacar(2,100);
	--pk_financas.depositar(2,100);
	--pk_financas.transferir(2,1,1100);	
END;

DECLARE
  v_valor NUMBER;
BEGIN
	v_valor := pk_financas.saldo(1);
    DBMS_OUTPUT.PUT_LINE(v_valor);
END;

DECLARE
  v_conta pk_financas.rec_conta;
BEGIN
	v_conta := pk_financas.getSaldo(1);
    DBMS_OUTPUT.PUT_LINE(v_conta.id);
    DBMS_OUTPUT.PUT_LINE(v_conta.titular);
   DBMS_OUTPUT.PUT_LINE(v_conta.saldo);
END;

SELECT * FROM TB_CONTAS tc ;