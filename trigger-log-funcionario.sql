CREATE TABLE log_funcionario (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    funcionario_id NUMBER,
    nome VARCHAR2(100),
    salario_antigo NUMBER(10,2),
    salario_novo NUMBER(10,2),
    data_alteracao DATE,
    operacao VARCHAR2(10)
);

CREATE OR REPLACE TRIGGER trg_log_funcionario
AFTER INSERT OR UPDATE OR DELETE ON funcionario
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        INSERT INTO log_funcionario (
            funcionario_id, nome, salario_novo, data_alteracao, operacao
        ) VALUES (
            :NEW.id, :NEW.nome, :NEW.salario, SYSDATE, 'INSERT'
        );

    -- UPDATE
    ELSIF UPDATING THEN
        INSERT INTO log_funcionario (
            funcionario_id, nome, salario_antigo, salario_novo, data_alteracao, operacao
        ) VALUES (
            :OLD.id, :OLD.nome, :OLD.salario, :NEW.salario, SYSDATE, 'UPDATE'
        );

    -- DELETE
    ELSIF DELETING THEN
        INSERT INTO log_funcionario (
            funcionario_id, nome, salario_antigo, data_alteracao, operacao
        ) VALUES (
            :OLD.id, :OLD.nome, :OLD.salario, SYSDATE, 'DELETE'
        );
    END IF;
END;

SELECT * FROM log_funcionario;

INSERT INTO funcionario(nome, salario)values('Zezinho',5000);
UPDATE funcionario SET salario = 4500 WHERE id = 12;
DELETE FROM funcionario WHERE id = 12;


