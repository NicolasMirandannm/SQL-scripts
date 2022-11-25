-- -- -- FUNÇOES DE AGREGAÇÃO -- -- --

SELECT * FROM AlunosxTurmas


-- -- SUM() -- --

--valor total sem filtro
SELECT T.id_turma, SUM(VALOR) as Total 
	FROM AlunosxTurmas AT
		INNER JOIN dbo.Turmas T ON T.id_turma = AT.id_turma
		INNER JOIN dbo.Cursos C ON C.id_curso = T.id_curso
GROUP BY T.id_turma;


--valor total por turma
SELECT	T.id_turma,
		SUM(valor) AS Valor,
		C.nome_curso
	FROM AlunosxTurmas AT
		INNER JOIN Turmas T ON T.id_turma = AT.id_turma
		INNER JOIN Cursos C ON C.id_curso = T.id_curso
group by T.id_turma, C.nome_curso;


-- -- COUNT -- --
SELECT	T.id_turma,
		COUNT(AT.id_aluno) AS TOTAL_ALUNO, SUM(AT.VALOR) "VALOR TOTAL"
	FROM AlunosxTurmas AT
		INNER JOIN DBO.Turmas T ON T.id_turma = AT.id_turma
GROUP BY T.ID_TURMA

-- -- AVERAGE (MÉDIA) -- -- 
SELECT	T.id_turma,       
		C.NOME_CURSO, 
		AVG(AT.VALOR) AS TOTAL -- (VALOR / QTD_LINHA)
	FROM AlunosxTurmas AT
		INNER JOIN DBO.Turmas T ON T.id_turma = AT.id_turma
		INNER JOIN DBO.CURSOS C ON C.id_curso = T.id_curso
GROUP BY T.ID_TURMA, C.NOME_CURSO

-- -- MAX -- -- 
SELECT	T.id_turma,       
		C.NOME_CURSO, 
		MAX(AT.VALOR) AS TOTAL -- MAIOR VALOR QUE EXISTIR NESSA COLUNA
	FROM AlunosxTurmas AT
		INNER JOIN DBO.Turmas T ON T.id_turma = AT.id_turma
		INNER JOIN DBO.CURSOS C ON C.id_curso = T.id_curso
GROUP BY T.ID_TURMA, C.NOME_CURSO

-- -- MIN -- -- 
SELECT	T.id_turma,       
		C.NOME_CURSO, 
		MIN(AT.VALOR) AS TOTAL -- MENOR VALOR QUE EXISTIR NESSA COLUNA
	FROM AlunosxTurmas AT
		INNER JOIN DBO.Turmas T ON T.id_turma = AT.id_turma
		INNER JOIN DBO.CURSOS C ON C.id_curso = T.id_curso
GROUP BY T.ID_TURMA, C.NOME_CURSO