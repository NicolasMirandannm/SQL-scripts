--SEQUENCES

--para inserir no fim da tabela
SELECT * FROM Alunos;
SELECT MAX(id_aluno) + 1 FROM Alunos

------------------
CREATE SEQUENCE seq_Teste01; -- cria um sequences padrao do tipo bigInt
SELECT NEXT VALUE FOR seq_Teste01;

CREATE SEQUENCE seq_Teste02 -- inicia com 1, e é incrementado de um em um
	AS NUMERIC
	START WITH 1
	INCREMENT BY 1;

SELECT NEXT VALUE FOR seq_Teste02;


CREATE SEQUENCE seq_Teste03 -- inicia com 100, e é incrementado de -1 em -1
	START WITH 100
	INCREMENT BY -1

SELECT NEXT VALUE FOR seq_Teste03;

-- ESTIPULANDO VALORES MAXIMOS E MINIMOS

CREATE SEQUENCE seq_Teste04
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1 -- menor valor 1
	MAXVALUE 100 -- maior valor 100
	CYCLE -- Quando chegar no 100, a contagem é reiniciada
	--NO CYCLE -- Quando chegar no 100, a contagem para
	CACHE 3; -- mantem os primeiros 3 valores em memoria

SELECT NEXT VALUE FOR seq_Teste04;


--ALTERAR UMA SEQUENCE

ALTER SEQUENCE seq_Teste04
	RESTART WITH 100 -- Recomeça a contagem com o valor 100
	MAXVALUE 1000
	NO CACHE


--CONSULTAR SEQUENCES 
SELECT * FROM SYS.SEQUENCES WHERE NAME = 'seq_Teste04';

--PARA DELETAR UMA SEQUENCE
DROP SEQUENCE seq_Teste03;