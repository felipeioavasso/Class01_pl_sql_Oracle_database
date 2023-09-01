CREATE OR REPLACE PROCEDURE get_cliente(p_id_cliente IN tb_clientes.id_cliente%TYPE)
AS
v_nome          tb_clientes.nome%TYPE;
v_sobrenome     tb_clientes.sobrenome%TYPE;
v_controle      INTEGER;

BEGIN
 SELECT COUNT(*)INTO v_controle
 FROM tb_clientes
 WHERE id_cliente = p_id_cliente;
 
 IF (v_controle = 1) THEN
  SELECT nome, sobrenome INTO v_nome,v_sobrenome
  FROM tb_clientes
  WHERE id_cliente = p_id_cliente;
  
  DBMS_OUTPUT.PUT_LINE('Cliente localizado: ' || v_nome || ' ' || v_sobrenome);
 
 ELSE
  DBMS_OUTPUT.PUT_LINE('Cliente NÃO localizado');
 END IF;
 
 EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Erro');

END get_cliente;~

-- INVOCANDO O OBJETO get_cliente para efeito de testes
-- Testando via bloco anonimo
SET serveroutput ON
BEGIN
    get_cliente(99);
END;