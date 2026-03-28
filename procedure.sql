create or replace procedure mostrarMensagem(p_nome IN varchar2) AS 
begin
  DBMS_OUTPUT.PUT_LINE('olá ' || p_nome);
end;