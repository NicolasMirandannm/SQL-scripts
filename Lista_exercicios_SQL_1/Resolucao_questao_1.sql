CREATE DATABASE SQL_EXERCICES; -- Criando banco de dados para exercicios de pratica

--Exercicio 1.
CREATE TABLE Loja
(
	ID_NF INT NOT NULL,
	ID_ITEM INT NOT NULL,
	COD_PROD INT NOT NULL,
	VALOR_UNIT NUMERIC(10,2) NOT NULL,
	QUANTIDADE INT NOT NULL,
	DESCONTO INT NULL
);

INSERT INTO dbo.Loja
(ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO)
	VALUES
		(1,1,1,25.00,10,5),
		(1,2,2,13.50,3, NULL),
		(1,3,3,15.00,2, null),
		(1,4,4,10.00,1, null),
		(1,5,5,30.00,1, null),
		(2,1,3,15.00,4, null),
		(2,2,4,10.00,5, null),
		(2,3,5,30.00,7, null),
		(3,1,1,25.00,5, null),
		(3,2,4,10.00,4, null),
		(3,3,5,30.00,5, null),
		(3,4,2,13.50,7, NULL),
		(4,1,5,30.00,10, 15),
		(4,2,4,10.00,12, 5),
		(4,3,1,25.00,13, 5),
		(4,4,2,13.50,15, 5),
		(5,1,3,15.00,3, null),
		(5,2,5,30.00,6, null),
		(6,1,1,25.00,22, 15),
		(6,2,3,15.00,25, 20),
		(7,1,1,25.00,10, 3),
		(7,2,2,13.50,10, 4),
		(7,3,3,15.00,10, 4),
		(7,4,5,30.00,10, 1);

--a) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no
--   resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.

	SELECT  L.ID_NF,
			L.ID_ITEM,
			L.COD_PROD,
			L.VALOR_UNIT
		FROM dbo.Loja L
		WHERE  L.DESCONTO IS NULL;

--b) Pesquise os itens que foram vendidos com desconto. As colunas presentes no
--   resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR
--   VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -
--   (VALOR_UNIT*(DESCONTO/100)).	SELECT	L.ID_NF,			L.ID_ITEM,			L.COD_PROD,			FORMAT(L.VALOR_UNIT, 'C', 'PT-BR'),			L.DESCONTO,			FORMAT((L.VALOR_UNIT - (L.VALOR_UNIT * (L.DESCONTO / 100.0))), 'C', 'pt-br') AS "VALOR VENDIDO"  		FROM DBO.LOJA L		WHERE L.DESCONTO IS NOT NULL--c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.	UPDATE dbo.Loja		SET DESCONTO = 0		WHERE DESCONTO IS NULL;	SELECT * FROM DBO.LOJA--d) Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta
--   são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO,
--   VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE *
--   VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -
--   (VALOR_UNIT*(DESCONTO/100)).	SELECT	L.ID_NF,			L.ID_ITEM,			L.COD_PROD,			L.VALOR_UNIT,			L.QUANTIDADE,			FORMAT(L.QUANTIDADE * L.VALOR_UNIT, 'C', 'PT-BR') AS VALOR_TOTAL,			L.DESCONTO,			FORMAT(L.QUANTIDADE * (L.VALOR_UNIT - (L.VALOR_UNIT * (L.DESCONTO / 100.0))), 'C', 'PT-BR') AS VALOR_VENDIDO -- FIZ O CALCULO DO TOTAL VENDIDO COM DESCONTO		FROM DBO.LOJA L--e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As
--   colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O
--   VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o
--   resultado da consulta por ID_NF.

	SELECT	L.ID_NF,
			FORMAT(SUM(L.QUANTIDADE * L.VALOR_UNIT), 'C', 'PT-BR') AS VALOR_TOTAL
		FROM DBO.Loja L 
	GROUP BY L.ID_NF
	ORDER BY VALOR_TOTAL DESC


--f) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
--   colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O
--   VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O
--   VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe
--   o resultado da consulta por ID_NF.

	SELECT	L.ID_NF,
			FORMAT(SUM(L.QUANTIDADE * L.VALOR_UNIT), 'C', 'PT-BR') AS VALOR_TOTAL,
			FORMAT(SUM(L.QUANTIDADE * (L.VALOR_UNIT - (L.VALOR_UNIT * (L.DESCONTO / 100.0)))), 'C', 'PT-BR') AS VALOR_VENDIDO,
			FORMAT(SUM(l.QUANTIDADE * (L.VALOR_UNIT * L.DESCONTO/100.0)), 'C', 'PT-BR') AS SOMA_DO_VALOR_DESCONTADO,
			SUM(L.QUANTIDADE) AS QTD_PRODUTOS_VENDIDOS
		FROM DBO.LOJA L
	GROUP BY L.ID_NF
	ORDER BY VALOR_TOTAL DESC

	--- TESTE PARA TREINAR LAÇO -- FORA DO ESCOPO DE EXERCICIO
	DECLARE @CONT INT = 1;
	WHILE @CONT <= 7
	BEGIN
		SELECT SUM(L.QUANTIDADE * (L.VALOR_UNIT - (L.VALOR_UNIT * (L.DESCONTO/100.0)))) FROM DBO.LOJA L WHERE L.ID_NF = @CONT
		GROUP BY L.ID_NF;

		SET @CONT += 1;
	END
	--- FIM DO TESTE


--g) Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da
--   consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por
--   COD_PROD.	SELECT	MAX_VENDA.COD_PROD AS "Codigo do produto",			MAX_VENDA.QTD_VENDAS AS "Numero de vendas"		FROM  (						SELECT	PRD.QTD_VENDAS,						PRD.COD_PROD,						ROW_NUMBER() OVER( ORDER BY PRD.QTD_VENDAS DESC) AS LINHA -- CRIA UM INDICE DE LINHAS ORDENADO PELA QUANTIDADE DE PRODUTOS VENDIDOS, DO MAIOR PAR AO MENOR					FROM (							SELECT	SUM(L.QUANTIDADE) AS QTD_VENDAS,									L.COD_PROD								FROM DBO.Loja L							GROUP BY COD_PROD						 ) PRD			  ) MAX_VENDA		WHERE MAX_VENDA.LINHA = 1			