select * from produto;

create or replace procedure pAddCarinho(p_pedido in NUMBER, 
                                        p_idProduto IN NUMBER, 
                                        p_qtde in NUMBER) AS 
   v_preco number;
   v_estoque number;
begin
  select preco, estoque into v_preco, v_estoque
  from produto where id = p_idProduto;
  
  IF v_estoque >= p_qtde THEN
      insert into item_pedido(id_pedido,id_produto, qtde, preco)
      VALUES(p_pedido, p_idproduto, p_qtde, v_preco);
      DBMS_OUTPUT.PUT_LINE('Item adicionado com sucesso');
      update produto set estoque = estoque - p_qtde where id = p_idProduto;
  ELSE
     DBMS_OUTPUT.PUT_LINE('Estoque insuficiente');
  END IF; 
end;


begin
  pAddCarinho(1,3,9);
end;