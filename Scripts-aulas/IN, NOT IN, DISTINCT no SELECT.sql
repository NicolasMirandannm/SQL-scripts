SELECT c.id_curso, c.nome_curso, count(t.id_turma) as Total_turma
	FROM dbo.Turmas t
		INNER JOIN dbo.cursos c on c.id_curso = t.id_curso
GROUP BY c.id_curso, c.nome_curso


--Utilização da clausula IN -- IN é um tipo de filtro, podendo receber mais de um parametro
SELECT * FROM dbo.Alunos A
	WHERE sexo IN ('F');

--Utilização da clausula NOT IN -- NOT IN é o oposto do IN, ele filtra e retorna quem nao possui o parametro filtrado.
SELECT * FROM dbo.Alunos A
	WHERE sexo NOT IN ('F')


--Utilização da clausula DISTINCT
SELECT DISTINCT DATEPART(YEAR, data_nascimento)
	FROM dbo.Alunos
ORDER BY 1 -- o 1 é o numero da coluna que eu quero ordenar

SELECT DISTINCT DATEPART(YEAR, data_nascimento)
	FROM dbo.Alunos
ORDER BY 1 ASC; --Ordenação crescente

SELECT DISTINCT DATEPART(YEAR, data_nascimento)
	FROM dbo.Alunos
ORDER BY 1 DESC; --Ordenação decrescente


--lista completa de alunos
SELECT DISTINCT C.nome_curso,
		C.id_curso,
		AT.valor,
		AT.valor_desconto,
		T.data_inicio,
		T.data_termino,
		A.nome,
		A.sexo
	FROM dbo.AlunosxTurmas AT
		INNER JOIN dbo.Turmas T ON T.id_turma = AT.id_turma
		INNER JOIN dbo.Cursos C ON C.id_curso = T.id_curso
		INNER JOIN dbo.Alunos A ON A.id_aluno = AT.id_aluno
ORDER BY 1;