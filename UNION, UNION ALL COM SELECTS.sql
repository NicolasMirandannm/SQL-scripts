--UNION DE SELECTS

-- mesmo numero de colunas
-- o uso do null para contornar limitação
-- nome das colunas serã do primeiro select
-- Executa um distinct quando utilizado

SELECT  P.EnglishProductName,
		P.SafetyStockLevel,
		P.DaysToManufacture,
		P.class,
		P.color
	FROM DimProduct P
	WHERE P.Color = 'NA'
UNION
SELECT  P.EnglishProductName,
		P.SafetyStockLevel,
		P.DaysToManufacture,
		P.Class,
		P.Color
	FROM DimProduct P
	WHERE P.Color <> 'NA';


--ALIAS PARA COLUNAS

SELECT  P.EnglishProductName as "Nome do produto", 
		P.SafetyStockLevel as "Estoque seguro", 
		P.DaysToManufacture as "Dias de produção", 
		P.Class as Classe, 
		P.color as Cor
	FROM DimProduct P 
	WHERE color = 'NA'
		AND Class IS NOT NULL
UNION 
SELECT  p.EnglishProductName, p.SafetyStockLevel, p.DaysToManufacture, p.class, p.color
	FROM DimProduct p
	WHERE color = 'Black'
		AND Class = 'L'

-- UNION(DISTINCT, FILTRO DE ELEMENTOS IGUAIS) / UNION ALL(BUSCA TODOS ELEMENTOS, MESMO OS REPETIDOS)

SELECT	EnglishProductName, class, color
	FROM dimproduct
UNION ALL -- 'ALL' FAZ COM QUE TODOS OS ELEMENTOS REPETIDOS SEJAM LISTADOS
SELECT EnglishProductName, class, color
	FROM DimProduct
ORDER BY 1 -- ESSE UM FAZ COM QUE O SELECT VENHA ORDENADO PELA COLUNA NUMERO 1