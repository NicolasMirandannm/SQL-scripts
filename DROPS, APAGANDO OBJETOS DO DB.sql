--DROP
--APAGA ITENS DO BANCO DE DADOS

--APAGAR TABELAS
SELECT * FROM SYS.TABLES;
DROP TABLE tbNova;
DROP TABLE AlunosTemp;


-- Apagar sequences
SELECT * FROM SYS.SEQUENCES;
DROP SEQUENCE seq_Teste02;

-- Apagar indices
CREATE INDEX indAlunosTeste ON Alunos(id_aluno);
DROP INDEX Alunos.indAlunosTeste;

--Apagar procedures
CREATE PROCEDURE prcListaAlunos
AS
	SELECT al.nome, al.data_nascimento
		FROM alunos al
		WHERE al.nome like 'n%';

EXEC prcListaAlunos

DROP PROCEDURE prcListaAlunos

--Apagar constraints

SELECT NAME FROM SYS.key_constraints WHERE NAME like 'pk%'

SELECT *
	INTO tbDelete
	FROM CURSOS

USE sql_db_1;
GO
ALTER TABLE tbDelete
	ADD CONSTRAINT pk_idcurso UNIQUE (id_curso);

	--APAGAR

ALTER TABLE tbDelete
	DROP CONSTRAINT pk_idcurso;


--Apaga views
CREATE VIEW vwAlunosTurmasTeste --aqui criamos uma view simples para um select
AS
	SELECT nome, data_nascimento, datediff(year, data_nascimento, getdate()) as Idade
		FROM alunos
		WHERE datediff(year, data_nascimento, getdate()) < 25;

SELECT * FROM vwAlunosTurmasTeste

DROP VIEW vwAlunosTurmasTeste; -- aqui apagamos a view


-- APAGA BANCO DE DADOS --
CREATE DATABASE dbTesteDrop;
DROP DATABASE dbTesteDrop;
