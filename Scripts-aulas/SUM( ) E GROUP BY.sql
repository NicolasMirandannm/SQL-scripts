-- sum() -- retorna a soma dos elemententos da coluna
-- round(a,b) -- Arrendonda o numero float para a quantidade 'b' de casas decimais

--ganhos por curso
SELECT	c.nome_curso,  
		sum(at.valor) Valor_bruto, 
		sum(at.valor * at.valor_desconto) Valor_desconto, 
		sum(at.valor - (at.valor * at.valor_desconto)) Valor_Liquido
	FROM dbo.turmas t
		inner join dbo.AlunosxTurmas at on t.id_turma = at.id_turma
		inner join dbo.cursos c on c.id_curso = t.id_curso
GROUP BY c.nome_curso;

--ganhos por ano
SELECT	
		YEAR(t.data_inicio) Ano,
		sum(at.valor) Valor_bruto, 
		sum(at.valor * at.valor_desconto) Valor_Descontado, 
		sum(at.valor - (at.valor * at.valor_desconto)) Valor_Liquido
	FROM dbo.AlunosxTurmas at
		inner join dbo.turmas t on at.id_turma = t.id_turma
		inner join dbo.cursos c on t.id_curso = c.id_curso
GROUP BY YEAR(t.data_inicio);


--ganhos por mes (teste)
SELECT	MONTH(t.data_inicio) Mes,
		YEAR(t.data_inicio) Ano,
		sum(at.valor) Valor_bruto, 
		sum(at.valor * at.valor_desconto) Valor_Descontado, 
		sum(at.valor - (at.valor * at.valor_desconto)) Valor_Liquido
	FROM dbo.AlunosxTurmas at
		inner join dbo.turmas t on at.id_turma = t.id_turma
		inner join dbo.cursos c on t.id_curso = c.id_curso
GROUP BY MONTH(t.data_inicio), YEAR(t.data_inicio);



