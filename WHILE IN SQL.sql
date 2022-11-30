--WHILE
-------------------------------
SELECT *
	INTO TTEMP
	FROM ALUNOS;

--SUBSTITUIÇÃO DE VALOR COM O WHILE

DECLARE @vSTRING VARCHAR(100);
	SET @vSTRING = 'SQL        SERVER         |';

WHILE CHARINDEX('  ', @vSTRING) > 0
BEGIN
	SET @vSTRING = REPLACE(@vSTRING, '  ', ' ')
END

SELECT @vSTRING;

------------

DECLARE @vCONT INT;
	SET @vCONT = 1;

WHILE (@VCONT <= 10)
BEGIN
	PRINT 'O contador está em : ' + convert(varchar, @VCONT)
		SET @VCONT = @VCONT + 1
END;

-------------

DECLARE @VCONT1 INT;
	SET @VCONT1 = 1;

WHILE (@VCONT1 > 0)
BEGIN
	PRINT 'O contador está em : ' + CONVERT(VARCHAR, @VCONT1)
	IF @VCONT1 = 7
		BREAK
	SET @VCONT1 = @VCONT1 + 1
END

-----------
DECLARE @VCONT2 INT;
	SET @VCONT2 = 1;

WHILE (@VCONT2 <= 17)
BEGIN
	IF @VCONT2 % 2 = 0
	BEGIN
		SET @VCONT2 = @VCONT2 + 1
		CONTINUE
	END
	PRINT 'O valor é : ' + CONVERT(VARCHAR, @VCONT2)
	SET @VCONT2 = @VCONT2 + 1
END

-----------------------
SELECT *
	INTO TabelaTemp
	FROM ALUNOS

SELECT * FROM TABELATEMP

DELETE FROM TABELATEMP
	WHERE SEXO = 'F'

SELECT * FROM ALUNOS


------------------
DROP TABLE TTEMP;

-- LER REGISTROS DE UMA TABELA

SELECT x.*
	INTO TTEMP
	FROM (
			SELECT	ROW_NUMBER() OVER(ORDER BY ID_ALUNO) Linha,
					y.id_aluno,
					y.nome,
					y.nome_curso,
					y.data_inicio,
					y.data_termino
				FROM (
						SELECT	A.id_aluno,
								A.nome,
								C.nome_curso, 
								T.data_inicio,
								T.data_termino
							FROM AlunosxTurmas at
								INNER JOIN TURMAS T ON (T.id_turma = AT.id_turma)
								INNER JOIN CURSOS C ON (C.id_curso = T.ID_CURSO)
								INNER JOIN ALUNOS A ON (A.id_aluno = AT.id_aluno)
					 ) y
		 ) x

DECLARE @CONTADOR	  INT,
		@MAXLINHA	  INT,
		@CURSOPROCURA NVARCHAR(100),
		@CURSONOME	  NVARCHAR(100),
		@NOMEALUNO	  NVARCHAR(100);

	SET @CURSOPROCURA = 'Python';

SELECT @CONTADOR = MIN(LINHA), @MAXLINHA = MAX(LINHA) FROM TTEMP;

WHILE(@CONTADOR IS NOT NULL AND @CONTADOR <= @MAXLINHA)
BEGIN
	SELECT @CURSONOME = NOME_CURSO, @NOMEALUNO = NOME
		FROM TTEMP
		WHERE LINHA = @CONTADOR;

		IF (@CURSOPROCURA = @CURSONOME)
			PRINT CONVERT(VARCHAR, @CONTADOR) + ' > CURSO: ' + @CURSONOME + ' ALUNO : ' + @NOMEALUNO;
	SET @CONTADOR = @CONTADOR + 1;
END