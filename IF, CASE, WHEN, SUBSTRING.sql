SELECT SUBSTRING('Nicolas Leonardo', 1, 7) as Nome;

SELECT A.nome, SUBSTRING(A.NOME, 1, 20) nome_parcial
	FROM Alunos A;


--DOIS PRIMEIROS NOMES
-- CASE / WHEN

SELECT  A.nome,
		CASE SUBSTRING(A.nome, 1, charindex(' ', A.nome, charindex(' ', A.nome)+1))
			WHEN '' THEN
				A.nome
			ELSE
				SUBSTRING(A.nome, 1, charindex(' ', A.nome, charindex(' ', A.nome)+1))
		END AS nome_extraido
	FROM dbo.Alunos A;

SELECT  A.nome,
		IIF(SUBSTRING(A.nome, 1, CHARINDEX(' ', A.nome, CHARINDEX(' ', A.nome)+1)) = '',
			A.nome,
			SUBSTRING(A.nome, 1, CHARINDEX(' ', A.nome, CHARINDEX(' ', A.nome)+1)))
	FROM dbo.Alunos A;


--TRANSLATE

SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');
SELECT TRANSLATE('abcdefghij', 'adbc', '1234');

--TRIM

SELECT TRIM('    NICOLAS     LEONARDO       ')

--WHILE
declare @vString varchar(100);
	set @vString = 'SQL      Server       |';

	WHILE CHARINDEX(' ', @vString) > 0
	BEGIN
		set @vString = replace(@vString, ' ', ' ')
	END

SELECT @vString;

