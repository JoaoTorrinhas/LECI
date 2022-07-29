/*Script para as UDF's*/

/*Dado um numero de funcionário devolve um admin caso exista*/
GO
CREATE FUNCTION getAdminByNumFuncionario(@num_funcionario INT) RETURNS TABLE AS
		RETURN(SELECT * FROM PROJ_CINEMAS.ADMINISTRADOR WHERE num_funcionario = @num_funcionario)
GO

--teste
SELECT * FROM getAdminByNumFuncionario(101030);



/*Dado um username e uma pw devolve um user caso exista*/
GO
CREATE FUNCTION getUserByUsernamePw(@username NVARCHAR(50), @pw NVARCHAR(50)) RETURNS TABLE AS
		RETURN (SELECT * FROM PROJ_CINEMAS.UTILIZADOR WHERE username=@username AND pw=@pw)
GO

--teste
SELECT * FROM PROJ_CINEMAS.UTILIZADOR;
SELECT * FROM getUserByUsernamePw('rogerio10', 'r12345');



/*Dado um id do cinema devolve uma sala caso exista*/
GO
CREATE FUNCTION getSalaByIdCinema(@id_cinemaSALACINEMA INT) RETURNS TABLE AS
		RETURN (SELECT * FROM PROJ_CINEMAS.SALACINEMA WHERE id_cinemaSALACINEMA = @id_cinemaSALACINEMA)
GO

--teste
SELECT * FROM PROJ_CINEMAS.SALACINEMA;
SELECT * FROM getSalaByIdCinema(410);



/*Dado um id da sala devolve uma sessao caso exista*/
GO
CREATE FUNCTION getSessaoByIdSala(@id_salaSESSAO INT) RETURNS TABLE AS
		RETURN (SELECT * FROM PROJ_CINEMAS.SESSAO WHERE id_salaSESSAO = @id_salaSESSAO)
GO

--teste
SELECT * FROM PROJ_CINEMAS.SESSAO;
SELECT * FROM getSessaoByIdSala(33);



/*Dado um id do filme retorna a sessao para esse filme caso exista*/
GO 
CREATE FUNCTION getSessaoByIdFilme(@id_filmeSESSAO INT) RETURNS TABLE AS
		RETURN (SELECT * FROM PROJ_CINEMAS.SESSAO WHERE id_filmeSESSAO = @id_filmeSESSAO)
GO

--teste
SELECT * FROM PROJ_CINEMAS.SESSAO;
SELECT * FROM getSessaoByIdFilme(22);


/*Dado um id ver se o mesmo já existe na tabela sessoes*/
GO
CREATE FUNCTION PROJ_CINEMAS.id_sessaoExists (@id INT) RETURNS INT
AS
	BEGIN
		DECLARE @counter INT
		SELECT @counter=COUNT(*) FROM PROJ_CINEMAS.SESSAO WHERE id = @id
		RETURN @counter
	END
GO


/*Dado um id ver se o mesmo já existe na tabela filmes*/
GO
CREATE FUNCTION PROJ_CINEMAS.id_filmeExists (@id INT) RETURNS INT
AS
	BEGIN
		DECLARE @counter INT
		SELECT @counter=COUNT(*) FROM PROJ_CINEMAS.FILME WHERE id = @id
		RETURN @counter
	END
GO

SELECT * FROM PROJ_CINEMAS.FILME;


/*Dado um id ver se o mesmo já existe na tabela das salas de cinema*/
GO
CREATE FUNCTION PROJ_CINEMAS.id_salaExists (@id INT) RETURNS INT
AS
	BEGIN
		DECLARE @counter INT
		SELECT @counter=COUNT(*) FROM PROJ_CINEMAS.SALACINEMA WHERE id = @id
		RETURN @counter
	END
GO

SELECT * FROM PROJ_CINEMAS.SALACINEMA;
