-- PROCEDURES
-- CONJUNTOS DE COMANDOS SQL QUE PODEM SER EXECUTADOS DE UMA SÓ VEZ
----------------------------------------------------------------------------

CREATE PROCEDURE BuscaCurso 
	@NomeCurso VARCHAR(20)  -- Parametro de entrada da procedure
AS
SET @NomeCurso = '%' + @NomeCurso + '%'  -- ADICIONAR ESTE '%' FAZ COM QUE SE EU FAÇA UMA  BUSCA COMPARANDO ESSE NOME, ELE BUSCA O DADO QUE PELO MENOS POSSUIR O CONTEUDO DA VARIAVEL ESCRITO.

SELECT	C.id_curso,
		C.nome_curso,
		A.nome,
		ISNULL(A.sexo, 'NI') sexo
	FROM CURSOS C
		INNER JOIN TURMAS T ON T.id_curso = C.id_curso
		INNER JOIN AlunosxTurmas ALT ON ALT.id_turma = T.id_turma
		INNER JOIN ALUNOS A ON A.id_aluno = ALT.id_aluno
	
	WHERE NOME_CURSO LIKE @NomeCurso;



EXEC BuscaCurso 'Java'; -- 'Java' foi passado com parametro para a execução da procedure 'BuscaCurso'.
EXEC BuscaCurso '%'  -- busca todos os alunos que estão matriculados em algum curso, pois ele efetua a busca com o 'like %' ou seja, inclui tudo que existir naquela coluna.



--PROCEDURE COM RETORNO
------------------------

CREATE PROCEDURE IncluirNovoCurso
	@NomeCurso     VARCHAR(100),
	@LoginCadastro VARCHAR(100)
AS
BEGIN
	DECLARE @IDCURSO INT;

	SELECT @IDCURSO = MAX(ID_CURSO) + 1 FROM CURSOS;

	INSERT INTO CURSOS
	(id_curso, nome_curso, data_cadastro, login_cadastro)
		VALUES
			(
				@IDCURSO, @NomeCurso, getdate(), @LoginCadastro
			);

	SELECT @IDCURSO = ID_CURSO FROM CURSOS WHERE ID_CURSO = @IDCURSO; -- SELECIONO QUAL O ID DO CURSO EU REALIZEI O INSERT.

	SELECT @IDCURSO AS RETORNO; -- RETORNA O ID DO CURSO CRIADO PARA QUEM CHAMAR A PROCEDURE.

END
GO

EXEC IncluirNovoCurso 'C++', 'NICK'; 


------------------------------------------------


--VALIDAÇÃO EM PROCEDURES

CREATE PROCEDURE IncluirNovoCursoComValidacao
	@NomeCurso     VARCHAR(100),
	@LoginCadastro VARCHAR(100)
AS
BEGIN
	DECLARE @IDCURSO INT;
	DECLARE @EXISTECURSO INT;

	SELECT @EXISTECURSO = ID_CURSO FROM CURSOS WHERE NOME_CURSO = @NomeCurso;
	IF @EXISTECURSO > 0
		BEGIN
			SELECT 'O CURSO JA EXISTE! GRAVAÇÃO NÃO REALIZADA' AS RETORNO;
		END
	ELSE
		BEGIN
			SELECT @IDCURSO = MAX(ID_CURSO) + 1 FROM CURSOS;

			INSERT INTO CURSOS
			(id_curso, nome_curso, data_cadastro, login_cadastro)
				VALUES
					(
						@IDCURSO,
						@NomeCurso,
						GETDATE(),
						@LoginCadastro
					)
			SELECT @IDCURSO = ID_CURSO FROM CURSOS WHERE ID_CURSO = @IDCURSO;
			SELECT @IDCURSO AS RETORNO;
		END
END
GO

EXEC IncluirNovoCursoComValidacao 'ASSEMBY', 'nicolas.lima';