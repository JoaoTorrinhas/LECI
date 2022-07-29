/*Script para as stored procedures*/

/*Criar uma sessao */
GO
CREATE PROCEDURE create_sessao( @id INT, @dataa DATETIME, @id_filmeSESSAO INT , @id_salaSESSAO INT) 
AS
BEGIN
	DECLARE @count INT;
	DECLARE @countF INT;
	DECLARE @erro NVARCHAR(200);
	SET  @count = (SELECT PROJ_CINEMAS.id_sessaoExists(@id))
	SET @countF = (SELECT PROJ_CINEMAS.id_filmeExists(@id_filmeSESSAO))
	IF(@count>0)
	BEGIN
		RAISERROR('O id da sessao ja existe',16,1);
	END
	ELSE IF (@countF = 0)
		BEGIN
			--INSERT INTO PROJ_CINEMAS.SESSAO VALUES(@id, @dataa, @id_filmeSESSAO, @id_salaSESSAO);
			RAISERROR('O id do filme nao existe',16,1);
		END
	ELSE
	BEGIN
		INSERT INTO PROJ_CINEMAS.SESSAO VALUES(@id, @dataa, @id_filmeSESSAO, @id_salaSESSAO);
	END
END

DROP PROCEDURE create_sessao;

--teste
--DROP PROCEDURE create_sessao;
EXEC create_sessao 10, '2022-12-31 16:30:00', 21, 31;
EXEC create_sessao 9, '2022-12-25 22:00:00', 22, 33;
EXEC create_sessao 8, '2022-02-17 19:30:00', 23, 33
EXEC create_sessao 17, '2022-11-20 22:00:00', 21, 32;

--EXEC delete_sala_byId 33;

--Exec delete_filme_byId 22;
--EXEC delete_sessao_byId 4;


/*Criar Filmes */
GO
CREATE PROCEDURE create_filme (@id INT, @foto NVARCHAR(50), @titulo NVARCHAR(50), @realizador NVARCHAR(50), @sinopse NVARCHAR(200), @elenco NVARCHAR(200))
AS
BEGIN
	DECLARE @count INT;
	DECLARE @erro NVARCHAR(200);
	SET  @count = (SELECT PROJ_CINEMAS.id_filmeExists(@id))
	IF(@count>0)
		RAISERROR('O id do filme ja existe',16,1);
	ELSE
		BEGIN
			INSERT INTO PROJ_CINEMAS.FILME VALUES(@id, @foto, @titulo, @realizador, @sinopse, @elenco);
		END
	--BEGIN TRY
		--INSERT INTO PROJ_CINEMAS.FILME VALUES(@id, @foto, @titulo, @realizador, @sinopse, @elenco)
	--END TRY
	--BEGIN CATCH
		--PRINT ERROR_MESSAGE()
	--END CATCH
END

--teste
--DROP PROCEDURE create_filme;
SELECT * FROM PROJ_CINEMAS.FILME;
EXEC create_filme 24, 'sniper.jpg', 'Sniper Americano', 'Clint Eastwood', 'Durante a guerra no iraque, sua missão era proteger os seus companheiros', 'Bradley Cooper, Sienna Miller, Luke Grims';



/*Criar Salas*/
GO
CREATE PROCEDURE create_sala (@id INT, @lotacao INT, @num_sala INT, @num_seats INT, @id_cinemaSALACINEMA INT)
AS
BEGIN
	DECLARE @count INT;
	DECLARE @erro NVARCHAR(200);
	SET  @count = (SELECT PROJ_CINEMAS.id_salaExists(@id))
	IF(@count>0)
		RAISERROR('O id da sala ja existe',16,1);
	ELSE
		BEGIN
			INSERT INTO PROJ_CINEMAS.SALACINEMA VALUES (@id, @lotacao, @num_sala, @num_seats, @id_cinemaSALACINEMA)
		END
	--BEGIN TRY
		--INSERT INTO PROJ_CINEMAS.SALACINEMA VALUES (@id, @lotacao, @num_sala, @num_seats, @id_cinemaSALACINEMA)
	--END TRY
	--BEGIN CATCH
		--PRINT ERROR_MESSAGE()
	--END CATCH
END

--teste
--DROP PROCEDURE create_sala;
SELECT * FROM PROJ_CINEMAS.CINEMA;
SELECT * FROM PROJ_CINEMAS.SALACINEMA;
EXEC create_sala 33, 50, 12, 70, 360;
EXEC create_sala 34, 35, 12, 70, 314;



/*Apagar sessao*/
GO
CREATE PROCEDURE delete_sessao_byId(@id INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM PROJ_CINEMAS.SESSAO WHERE id=@id;
		COMMIT
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END

--teste
SELECT * FROM PROJ_CINEMAS.SESSAO;
EXEC delete_sessao_byId 12;



/*Apagar Filme*/
GO
CREATE PROCEDURE delete_filme_byId(@id INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM PROJ_CINEMAS.FILME WHERE id=@id;
		COMMIT
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END

--teste
SELECT * FROM PROJ_CINEMAS.FILME;
EXEC delete_filme_byId 23;



/* Apagar Salas */
GO
CREATE PROCEDURE delete_sala_byId (@id INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			DELETE FROM PROJ_CINEMAS.SALACINEMA WHERE id=@id;
		COMMIT
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END

--teste
SELECT * FROM PROJ_CINEMAS.SALACINEMA;
EXEC delete_sala_byId 34;



/*Alterar Sessao*/
GO
CREATE PROCEDURE alter_sessao (@id INT, @dataa DATETIME, @id_filmeSESSAO INT, @id_salaSESSAO INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PROJ_CINEMAS.SESSAO SET dataa = @dataa, id_filmeSESSAO = @id_filmeSESSAO, id_salaSESSAO = @id_salaSESSAO  WHERE id = @id
		COMMIT
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END

--teste
SELECT * FROM PROJ_CINEMAS.SESSAO;
EXEC alter_sessao 8, '2022-01-22 19:15:00', 21, 31;



/*Alterar Filme*/
GO
CREATE PROCEDURE alter_filme (@id INT, @foto NVARCHAR(50), @titulo NVARCHAR(50), @realizador NVARCHAR(50), @sinopse NVARCHAR(200), @elenco NVARCHAR(200))
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PROJ_CINEMAS.FILME SET foto = @foto, titulo = @titulo, realizador = @realizador, sinopse = @sinopse, elenco = @elenco  WHERE id = @id
		COMMIT
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END

--teste
SELECT * FROM PROJ_CINEMAS.FILME;
EXEC alter_filme 23, 'man2.png', 'Man of Steel', 'Zack Snyder', 'Jor-El e a sua mulher procuram preservar a raça humana', 'Henry Cavill, Amy Adams, Kevin Costner';



/*Alterar Salas*/
GO
CREATE PROCEDURE alter_sala (@id INT, @lotacao INT, @num_sala INT, @num_seats INT, @id_cinemaSALACINEMA INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE PROJ_CINEMAS.SALACINEMA SET lotacao = @lotacao, num_sala = @num_sala, num_seats = @num_seats, id_cinemaSALACINEMA = @id_cinemaSALACINEMA  WHERE id = @id
		COMMIT
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END


--teste
SELECT * FROM PROJ_CINEMAS.SALACINEMA;
EXEC alter_sala 33, 41, 10, 60, 410;
