--INSERT EM TABELAS

--INSERT COM DESCRI플O DOS CAMPOS
SELECT * FROM Alunos;
SELECT MAX(id_aluno) + 1 FROM Alunos


--CRIANDO UMA SEQUENCE PARA INSERIR ALUNOS NO FIM DA TABELA
CREATE SEQUENCE seq_tbAlunos
	START WITH 17
	INCREMENT BY 1;


--Indentificar campos em tabelas
EXEC sp_columns Alunos;
---------------------------------

--INSERT COM A DESCRI플O DOS CAMPOS
INSERT INTO dbo.Alunos
	(id_aluno,nome,data_nascimento, sexo, data_cadastro,login_cadastro)
VALUES
	(
		NEXT VALUE FOR dbo.seq_tbAlunos,
		'Nicolas Leonardo Miranda Lima',
		'10/10/2002',
		'M',
		getdate(),
		'nicolas.lima'
	);

SELECT *
	FROM Alunos
	WHERE data_cadastro >= CONVERT(date, getdate());


--primeira forma de inserir dados

EXEC SP_COLUMNS CURSOS
SELECT * FROM CURSOS

INSERT INTO CURSOS
	(id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
	(
		6,
		'SQL',
		GETDATE(),
		'nicolas.lima'
	);

--segunda forma de inserir
DECLARE @vID INT;
SELECT @vID = MAX(id_curso) + 1 FROM dbo.cursos

INSERT INTO Cursos
	(id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
	(
		@vID,
		'VBA-BASIC',
		GETDATE(),
		'nicolas.lima'
	);

--INSERT COM A CRIA플O DE UMA NOVA TABELA
SELECT *
	INTO dbo.tbNova
	FROM dbo.Cursos

SELECT * FROM tbNova;
DROP TABLE tbNova;


DELETE FROM dbo.tbNova; -- DELETA OS DADOS DA TABELA DBO.TBNOVA
exec sp_columns tbNova; -- LISTA AS INFORMA합ES GERAIS TA TABELA

--INSERT COM SELECT
INSERT INTO tbNova
	(id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT	id_curso, -- insere todos os dados desse select dentro da tbNova
		nome_curso,
		getdate(),
		'NICOLAS'
	FROM cursos
	WHERE id_curso > 5;

SELECT * FROM tbNova;

DELETE FROM tbNova

INSERT INTO tbNova
	(id_curso, nome_curso, data_cadastro, login_cadastro)
SELECT  id_curso,
		nome_curso,
		getdate(),
		'NICOLAS'
	FROM cursos
	WHERE cursos.nome_curso like '%java%';