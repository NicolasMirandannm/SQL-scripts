INSERT INTO dbo.Alunos
(id_aluno, nome, data_nascimento, sexo, data_cadastro, login_cadastro)
VALUES
(
	2,
	'Alessandro Soares', 
	'1989/10/04',
	'M',
	'2022/11/23 08:55:00',
	'nicolas.lima'
)


SELECT * FROM dbo.Alunos

INSERT INTO dbo.Cursos
(id_curso, nome_curso, data_cadastro, login_cadastro)
VALUES
(1, 'VBA I', '2022/11/23 08:55:00', 'nicolas.lima')

SELECT * FROM dbo.Cursos

INSERT INTO dbo.Situacao
(id_situacao, situacao, data_cadastro, login_cadastro)
VALUES
(1, 'Presença confirmada','2022/11/23 08:55:00', 'nicolas.lima'),
(2, 'Ausente Sem Justificativa','2022/11/23 08:55:00', 'nicolas.lima'),
(3, 'Ausente Com Justificativa','2022/11/23 08:55:00', 'nicolas.lima')

SELECT * FROM dbo.Situacao