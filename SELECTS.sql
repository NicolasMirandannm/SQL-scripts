-- EXEMPLO DE QUERY UTILIZANDO O NOME DA TABELA
SELECT Turmas.* from Turmas

--SELECIONAR APENAS ALGUNS CAMPOS DA TABELA
SELECT id_turma, id_curso, data_inicio, login_cadastro FROM dbo.Turmas

--Utilizar Alias(APELIDO) para nome da tabela 
SELECT * FROM dbo.Turmas T

SELECT t.* FROM dbo.Turmas T;

SELECT T.id_turma, T.id_curso, T.data_inicio FROM dbo.Turmas T

--Utilizar nomes personalizados para nossos campos

SELECT T.id_curso AS IDC, T.id_turma AS IDT  , T.data_inicio AS DATA_COMECO FROM dbo.Turmas T

--Filtrando selects

SELECT A.* FROM dbo.Alunos A WHERE A.id_aluno = 2

SELECT A.* FROM dbo.Alunos A WHERE A.data_nascimento >= '01/01/2000' -- to_date('01012000', 'ddmmyyyy') -- EM ORACLE

-- OPERADORES LOGICOS PARA COMPARAÇÃO
	-- > maior
	-- < menor
	-- >= maior ou igual
	-- <= menor ou igual
	-- <> diferente
	-- = igual
	-- AND
	-- OR


SELECT * FROM dbo.Alunos A WHERE A.sexo = 'M'

SELECT * FROM dbo.Alunos A WHERE A.sexo = 'M' OR A.data_nascimento >= '01/01/2000'

SELECT * FROM dbo.AlunosxTurmas
