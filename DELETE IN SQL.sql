--DELETE

SELECT *
	INTO dbo.tbDelete
	FROM dbo.Alunos;

DELETE FROM dbo.tbDelete -- REMOVE TODOS OS DADOS DA TABELA

DROP TABLE dbo.tbDelete -- APAGA A TABELA DO BANCO

select * from dbo.tbDelete;
select * from dbo.Alunos;


DELETE FROM dbo.tbDelete
	WHERE nome like '%Gustavo%'; -- remove linhas que possui 'Gustavo' na coluna nome;


--criando uma tabela com todos os dados da tabela aluno
SELECT *
	INTO AlunosTemp
	FROM Alunos;

SELECT * FROM AlunosTemp;
DROP TABLE AlunosTemp;

--Apagar os alunos que não estão em nenhum curso

SELECT	a.nome,
		a.sexo
	FROM AlunosTemp a
		INNER JOIN AlunosxTurmas t on t.id_aluno = a.id_aluno

-- DELETANDO ALUNOS QUE NÃO ESTAO CADASTRADOS EM NENHUMA TURMA

DELETE FROM AlunosTemp
	WHERE id_aluno not in(
		SELECT	a.id_aluno -- SELECT ANINHADO
			FROM AlunosTemp a
				INNER JOIN AlunosxTurmas t on t.id_aluno = a.id_aluno
	)


-- apagar todos os registros de alunos que tenham mais de 30 anos

--1) identificar os registros
SELECT	a.nome,
		datediff(year, data_nascimento, getdate()) as idade,
		a.sexo
	FROM alunos a
	WHERE datediff(year, data_nascimento, getdate()) > 30
ORDER BY idade 


--2) Apagar os registros

DELETE FROM AlunosTemp
	WHERE datediff(year, data_nascimento, getdate()) > 30

SELECT * FROM AlunosTemp;

--Query unificada

DELETE FROM ALUNOSTEMP
	WHERE ID_ALUNO IN 
	(
		SELECT	 a.id_aluno
			FROM Alunostemp a
			WHERE datediff(year, data_nascimento, getdate()) > 20
	);

SELECT * FROM ALUNOSTEMP
