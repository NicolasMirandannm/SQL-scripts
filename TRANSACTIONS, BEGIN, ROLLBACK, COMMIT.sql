--TRANSACTION

--BEGIN TRANSACTION -- ANTES DE INICIAR A TRANSA플O
--ROLLBACK TRANSACTION -- CASO ALGO OCORRA E PRECISE VOLTAR O BANCO VOLTAR NA VERSAO ANTERIOR, USER O ROLLBACK
--COMMIT -- SALVAR A ALTERA플O NO BANCO;

DROP TABLE TTEMP;

SELECT *
	INTO TTEMP
	FROM ALUNOS


SELECT * FROM TTEMP;

--INICIANDO UMA TRANSACTION

BEGIN TRANSACTION; --INICIA UMA ALTERA플O
		UPDATE TTEMP
			SET SEXO = LOWER(SEXO);


BEGIN TRANSACTION; 
	UPDATE TTEMP
		SET SEXO = UPPER(SEXO);

ROLLBACK; -- VOLTA ATRAS NAS ALTERA합ES
COMMIT; -- SALVA AS ALTERA합ES


----------------------
DECLARE @TR1 VARCHAR(20);
	SELECT @TR1 = 'Transaca豫o Delete';

BEGIN TRANSACTION @TR1;
	DELETE FROM TTEMP
		WHERE NOME LIKE 'G%';

SELECT * FROM TTEMP;

--DEU TUDO CERTO?
	COMMIT;
--DEU ERRADO?
	ROLLBACK;


-------------------

IF OBJECT_ID('TABELATESTE', 'U') IS NOT NULL
	DROP TABLE TABELATESTE;
GO

CREATE TABLE TABELATESTE (
	ID INT PRIMARY KEY,
	LETRA CHAR(1)
)
GO

-- INICIAR A VARIAVEL DE CONTROLE DE TRANSACTIONS @@TRANCOUNT PARA 1

BEGIN TRANSACTION TR1;
	PRINT 'Transaction : contador depois do BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10)); -- @@TRANCOUNT CONTA O NUMERO DE TRANSA합ES
	INSERT INTO TABELATESTE VALUES (1, 'A');

BEGIN TRANSACTION TR2;
	PRINT 'Transaction : contador depois do 2� BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO TABELATESTE VALUES (2, 'B');

BEGIN TRANSACTION TR3;
	PRINT 'Transaction : contador depois do 3� BEGIN = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
	INSERT INTO TABELATESTE VALUES (3, 'C');


COMMIT TRANSACTION TR2;
	PRINT 'Transaction : contador depois do COMMIT TR2 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

COMMIT TRANSACTION TR1;
	PRINT 'Transaction : contador depois do COMMIT TR1 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

COMMIT TRANSACTION TR3;
	PRINT 'Transaction : contador depois do COMMIT TR3 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));