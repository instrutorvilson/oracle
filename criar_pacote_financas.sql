CREATE TABLE tb_contas(
  id_conta NUMBER,
  titular varchar2(20),
  saldo number
);

CREATE OR REPLACE PACKAGE pk_financas AS 
   TYPE rec_conta IS RECORD(
     id tb_contas.ID_CONTA%TYPE,
     titular tb_contas.TITULAR %TYPE,
     saldo tb_contas.SALDO%TYPE
   );
   
   PROCEDURE criarConta(p_id NUMBER, p_titular varchar2, p_saldo number); 
   PROCEDURE sacar(p_id NUMBER, p_valor number);
   PROCEDURE depositar(p_id NUMBER, p_valor number);
   PROCEDURE transferir(p_id_conta_origem NUMBER, p_id_conta_destino NUMBER, p_valor number);
   FUNCTION saldo(p_id_conta number) RETURN NUMBER;
   FUNCTION getSaldo(p_id_conta number) RETURN rec_conta;
END pk_financas;

CREATE OR REPLACE PACKAGE BODY pk_financas AS
   PROCEDURE criarConta(p_id NUMBER, p_titular varchar2, p_saldo number) IS 
   BEGIN 
      INSERT INTO TB_CONTAS tc (id_conta, titular, saldo)
      values(p_id,p_titular, p_saldo);
   END;
  --
   PROCEDURE sacar(p_id NUMBER, p_valor number) IS
      v_saldo NUMBER;
   BEGIN
	   SELECT saldo INTO v_saldo
	   FROM TB_CONTAS tc 
	   WHERE id_conta = p_id;
	  
	   IF v_saldo < p_valor THEN
	      RAISE_APPLICATION_ERROR(-20001, 'Saldo insuficiente');
	   END IF;
	   
	   UPDATE TB_CONTAS SET 
	   saldo = saldo - p_valor
	   WHERE id_conta = p_id;
   END;
  
  PROCEDURE depositar(p_id NUMBER, p_valor number) IS
  BEGIN	  
	 UPDATE TB_CONTAS SET 
	 saldo = saldo + p_valor
	 WHERE id_conta = p_id; 
	 
	 IF SQL%ROWCOUNT = 0 THEN
	    RAISE_APPLICATION_ERROR(-20002, 'Conta não encontrada');
	 END IF;
  END;
 
  PROCEDURE transferir(p_id_conta_origem NUMBER,
 p_id_conta_destino NUMBER, p_valor number) IS
 BEGIN
	 sacar(p_id_conta_origem,p_valor);
	 depositar(p_id_conta_destino, p_valor);
 EXCEPTION 
    WHEN OTHERS THEN 
       ROLLBACK;
      
       RAISE_APPLICATION_ERROR(-20003, 'Erro: ' || SQLERRM); 
      
 END;
 --
FUNCTION saldo(p_id_conta number) RETURN NUMBER IS 
  v_saldo tb_contas.saldo%TYPE;
BEGIN
   SELECT saldo INTO v_saldo
   FROM TB_CONTAS tc 
   WHERE id_conta = p_id_conta;
  
  RETURN v_saldo;
END;
--
FUNCTION getSaldo(p_id_conta number) RETURN rec_conta IS
  v_conta rec_conta;
BEGIN
	SELECT id_conta,titular,saldo
	INTO v_conta
    FROM TB_CONTAS tc 
    WHERE id_conta = p_id_conta;
  
  RETURN v_conta;
END;
  
END pk_financas;