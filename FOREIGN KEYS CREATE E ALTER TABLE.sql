--DROP TABLE Alunos; -- COMANDO PARA DELETAR UMA TABELA

CREATE TABLE Alunos        --COMANDO PARA CRIAÇÃO DE UMA TABELA
(
	id_aluno INT PRIMARY KEY NOT NULL,
	nome VARCHAR(200) NOT NULL,
	data_nascimento DATE NOT NULL,
	sexo VARCHAR(1) NULL, -- M or F
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL,
);



CREATE TABLE Situacao
(
	id_situacao INT PRIMARY KEY NOT NULL,
	situacao VARCHAR(25) NOT NULL,
	data_cadastro DATETIME,
	login_cadastro VARCHAR(15)
);

CREATE TABLE Cursos
(
	id_curso INT PRIMARY KEY NOT NULL,
	nome_curso VARCHAR(200) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

CREATE TABLE Turmas 
(
	id_turma INT PRIMARY KEY NOT NULL,
	id_aluno int NOT NULL,
	id_curso int NOT NULL,
	valor_turma NUMERIC(15,2) NOT NULL, -- NUMERIC - PRIMEIRO PARAMETRO REFERE-SE A QUANTIDADE DE INTEIROS E O SEGUNDO REFERE-SE A QUANTIDADE DE CASAS DECIMAIS ACEITAS
	desconto NUMERIC(3,2) NOT NULL,
	data_inicio DATE,
	data_termino DATE,
	data_cadastro DATETIME NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL,
);

ALTER TABLE Turmas -- alterar tabela
	ADD CONSTRAINT fk_Alunos FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Turmas
	ADD CONSTRAINT fk_Curso FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso);

CREATE TABLE Registro_Presenca
(
	id_turma INT NOT NULL,
	id_aluno INT NOT NULL,
	id_situacao INT NOT NULL,
	date_presenca DATE NOT NULL,
	date_cadastro DATE NOT NULL,
	login_cadastro VARCHAR(15) NOT NULL
);

ALTER TABLE Registro_Presenca
	ADD CONSTRAINT fk_TurmasRP FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma);

ALTER TABLE Registro_Presenca
	ADD CONSTRAINT fk_AlunosRP FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno);

ALTER TABLE Registro_Presenca
	ADD CONSTRAINT fk_SituacaoRP FOREIGN KEY (id_situacao) REFERENCES Situacao (id_situacao);


--DROP TABLE Turmas, Situacao, Registro_Presenca, Cursos, Alunos;