-- BEGIN ... END
--CONTROLE DO FLUXO DE INSTRUÇÃO
-------------------------------
DROP TABLE TTEMP;

SELECT X.*
	INTO TTEMP
	FROM (
			SELECT	ROW_NUMBER() OVER(ORDER BY Y.ID_ALUNO) AS LINHA,
					Y.id_aluno,
					Y.nome,
					Y.data_nascimento,
					Y.sexo,
					Y.nome_curso,
					Y.data_inicio,
					Y.data_termino,
					Y.valor
				FROM (
						SELECT	A.id_aluno,
								A.nome,
								A.sexo,
								A.data_nascimento,
								C.nome_curso,
								T.data_inicio,
								T.data_termino,
								AT.valor
							FROM AlunosxTurmas AT
								INNER JOIN TURMAS T ON T.id_turma = AT.id_turma
								INNER JOIN CURSOS C ON C.id_curso = T.id_curso
								INNER JOIN ALUNOS A ON A.id_aluno = AT.id_aluno

					 )Y

		 ) X

--------

DECLARE @CONTADOR INT = 1;

WHILE @CONTADOR < 10
BEGIN
	PRINT 'CONTADOR ' + CONVERT(VARCHAR, @CONTADOR);
	SET @CONTADOR += 1;
END


--TRY...CATCH...
----------------


--EXEMPLO 1
--TABELA INEXISTENE
BEGIN TRY                               
	SELECT 1/0
END TRY
BEGIN CATCH
	SELECT
		ERROR_NUMBER() AS NUMERO_ERRO,
		ERROR_MESSAGE() AS MENSAGEM_ERRO,
		ERROR_LINE() AS "LINHA DO ERRO"
END CATCH




--EXEMPLO 2
-- TRATANDO ERRO DURANTE A EXECUÇÃO DE UMA PROCEDURE

CREATE PROCEDURE PRC_EXEMPLO
AS
	SELECT * FROM TTEMP;
	DROP TABLE TTEMP;
GO

BEGIN TRY
	EXECUTE PRC_EXEMPLO
END TRY

BEGIN CATCH
	SELECT
		ERROR_NUMBER() AS NUMERO_ERRO,
		ERROR_MESSAGE() AS MENSAGEM_ERRO,
		ERROR_LINE() AS LINHA DO ERRO,
END CATCH