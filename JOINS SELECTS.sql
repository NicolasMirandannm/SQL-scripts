--Total de turmas por curso

SELECT c.id_curso, c.nome_curso, count(t.id_turma) Total_Turmas FROM dbo.Turmas t
	INNER JOIN dbo.Cursos c on c.id_curso = t.id_curso
	GROUP BY c.id_curso, c.nome_curso

SELECT A.nome, A.sexo, A.data_nascimento, T.data_inicio, T.data_termino
	FROM dbo.Alunos A
		INNER JOIN dbo.Turmas T on A.id_aluno = T.id_aluno


		--TIPOS DE JOINS

		--INNER JOIN -- ligando duas tabelas pelas suas chaves primarias, buscamos os dados comuns entre as duas tabelas

			-- SELECT * FROM tableA INNER JOIN tableB ON tableA.key = tableB.key


		--LEFT JOIN -- Prioriza a tabela que esta a esquerda
				
				--Nessa query buscamos apenas dados da tabela A que NÃO possuem ligação com a tabela B
			-- SELECT * FROM tableA LEFT JOIN tableB ON tableA.key = tableB.key

				--Nessa query buscamos todos os dados da tabela A que não possui nenhuma ligação com a tabela B e não buscamos nenhum dado da tabela B
			-- SELECT * FROM tableA LEFT JOIN tableB ON tableA.key = tableB.key WHERE tableB.key IS NULL

		--RIGHT JOIN 
			
				--Nessa query buscamos todos os dados da tabela B e tambem os dados que possuem a mesma chave na tabela A
			-- SELECT * FROM tableA RIGHT JOIN tableB ON tableA.key = tableB.key

				--Nessa query buscamos apenas dados da tabela B que NÃO possuem ligação com a tabela A
			-- SELECT * FROM tableA RIGHT JOIN tableB ON tableA.key = tableB.key WHERE tableA.key IS NULL

		--FULL OUTER JOIN

				--Nessa query fazemos a busca de todos os elementos de das duas tabelas
			-- SELECT * FROM tableA FULL OUTER JOIN tableB ON tableA.key = tableB.key
				
				--Nessa query selecionamos todos os dados das duas tabelas com exceção dos elementos que possuem a mesma chave
			-- SELECT * FROM tableA FULL OUTER JOIN tableB ON tableA.key = tableB.key WHERE tableA.key IS NULL OR tableB.key IS NULL