ALTER TABLE Turmas
	DROP COLUMN id_aluno;

ALTER TABLE Turmas
	DROP COLUMN valor_turma;

ALTER TABLE Turmas
	DROP COLUMN desconto;

--ajuste na tabela turmas para normalização

CREATE TABLE AlunosxTurmas
(
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	valor NUMERIC(13,2) NOT NULL,
	valor_desconto NUMERIC(13,2),
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

ALTER TABLE AlunosxTurmas
	ADD CONSTRAINT fk_turmaAxT FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);

ALTER TABLE AlunosxTurmas
	ADD CONSTRAINT fk_alunoAxT FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);



INSERT INTO Turmas
(id_turma, id_curso, data_inicio, data_termino, data_cadastro, login_cadastro)
VALUES
(1, 1, '2022/11/17', '2022/12/27', GETDATE(), 'nicolas.lima')

SELECT * FROM AlunosxTurmas

INSERT INTO AlunosxTurmas
(id_turma, id_aluno, valor, valor_desconto, data_cadastro, login_cadastro)
VALUES
(1, 1, 1200, 0.1, GETDATE(), 'nicolas.lima')