--FUNÇÕES DE TEXTO

-- FUNÇÕES: ASCII, NCHAR, CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFFERENCE

--ASCII
SELECT ASCII('N'); -- pega o valor ascii do primeiro caracter

--NCHAR E CHAR
SELECT NCHAR(65); -- busca na tabela ascii o caracter do numero passado por parametro
SELECT CHAR(41); -- Faz a mesma coisa que o NCHAR

--CHARINDEX (pesquisa um char ou string em uma sequencia de ate 8000 caracteres)
SELECT CHARINDEX('a', 'nicolas');
SELECT CHARINDEX('miranda', 'nicolas leonardo miranda lima');

--CONCAT -- concatena duas strings

--CONCAT_WS -- concatena quantas strings precisar, com o separador no primeiro parametro da função
SELECT CONCAT_WS(' - ', 'Nicolas', 'Leonardo', 'Miranda', 'Lima');

--TRIM -- ELIMINA ESPAÇOS DESNECESSARIOS

--DIFFERENCE(ESCALA DE 0 A 4)
SELECT DIFFERENCE('Nicolas', 'Joao');



--Funções: FORMAT, LEFT, RIGTH, LEN, LOWER, UPPER


--FORMAT
DECLARE @DT DATETIME = GETDATE()

--Formatando datas, mas pode ser aplicado para outros valores. Pesquisar na documentação para mais informalções se for nescessario
SELECT  FORMAT(@DT, 'D','en-US') AS AMERICANO_EXTENSO,
		FORMAT(@DT, 'd', 'en-US') AS Americano,
		FORMAT(@DT, 'D', 'zh-cn') AS CHINES_EXTENSO,
		FORMAT(@DT, 'd', 'zh-cn') AS Chines,
		FORMAT(@DT, 'D', 'pt-br') AS "PT-BR",
		FORMAT(@DT, 'd', 'pt-br') AS "pt-br";


--LEFT
SELECT LEFT('NICOLAS LEONARDO MIRANDA LIMA', 10);

--RIGHT
SELECT RIGHT('NICOLAS LEONARDO MIRANDA LIMA', 10);

--LEN -- IGUAL AO LENGHT
SELECT LEN('NICOLAS LEONARDO MIRANDA LIMA');

--MAX -- retorna o maior valor

--MIN -- retorna o menor valor

--UPPER -- converte os caracteres para maiusculo

--LOWER -- converte os caracteres para minusculo






--Outras funções de texto

--FUNÇÕES: LTRIM, RTRIM, PATINDEX, REPLACE, REPLICATE E REVERSE

--LTRIM -- REMOVE SPACES A ESQUERDA DA STRING
SELECT LTRIM('     NICOLAS LEONARDO MIRANDA LIMA');

--RTRIM() -- REMOVE SPACES A DIREITA DA STRING
SELECT RTRIM('NICOLAS LEONARDO MIRANDA LIMA        ');

--PATINDEX -- RETORNA A POSIÇÃO INICIAL DA PRIMEIRA OCORRENCIA DE UM PADRAO

SELECT PATINDEX('%leo%', 'nicolas leonardo miranda lima');
SELECT PATINDEX('%a', 'nicolas leonardo miranda lima');
SELECT PATINDEX('ni%', 'nicolas');

--SUBSTRING
SELECT SUBSTRING('nicolas leonardo miranda lima', PATINDEX('%leonardo%', 'nicolas leonardo miranda lima'), 8);

--REPLACE -- TROCA OS ELEMENTOS DO PRIMEIRO PARAMETRO, SELECIONANDO O CARACTER QUE DEJESA ALTERAR, E O VALOR DESEJADO
SELECT REPLACE('NICOLXS LEONXRDO MIRXNDX LIMX', 'X', 'A');
SELECT REPLACE('NICOLAS LEONARDO MIRANDA LIMA', 'A', 'X');

--REPLICATE -- REPLICA O PRIMEIRO ARGUMENTO PELO NUMERO DE VEZES DO SEGUNDO ARGUMENTO
SELECT REPLICATE('NICOLAS ', 4);

--REVERSE -- INVERTE A A STRING
SELECT REVERSE('NICOLAS LEONARDO');
SELECT REVERSE('1221'); --palindromo



--FUNCÕES DE TEXTO
-- FUNÇÕES: SPACE, STRING_AGG e STUFF

--SPACE
SELECT 'NICOLAS' + SPACE(25) + 'X';

--STRING_AGG
SELECT STRING_AGG(CONVERT(NVARCHAR(MAX), A.sexo), ' - ') as registro -- retorna todas as ocorrencias com uma separação
	FROM Alunos A;

SELECT STRING_AGG(CONVERT(NVARCHAR(MAX), isnull(A.sexo, 'N')), ' - ') as registro -- retorna todas as ocorrencias com uma separação, e se o campo for null, ele retorna 'N'
	FROM Alunos A;

--STUFF
 

declare @vProcura varchar(50);
declare @vSubstitut varchar(30);
	set @vProcura = 'Eu, xxxxxxxxxxxxxxxxxxxx, autorizo ...';
	set @vSubstitut = 'Nicolas Leonardo';

SELECT STUFF(@vProcura,5,30, @vSubstitut + space(30 - len(@vSubstitut)));
SELECT STUFF(@vProcura,5,30, trim(@vSubstitut + space(30 - len(@vSubstitut)))) as termo;

