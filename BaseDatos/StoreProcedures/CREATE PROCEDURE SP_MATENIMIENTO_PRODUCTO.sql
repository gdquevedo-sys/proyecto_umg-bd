DROP PROCEDURE IF EXISTS [dbo].[SP_MATENIMIENTO_PRODUCTO] 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_MATENIMIENTO_PRODUCTO
	@Opcion				INT,
	@Id					INT = 0,
	@CategoriaId		INT,
	@Nombre				NVARCHAR(75) = NULL,
	@Vencimiento		DATETIME = NULL,
	@Imagen				NVARCHAR(250) = NULL,
	@Usuario			NVARCHAR(150)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN TRAN_MATENIMIENTO_PRODUCTO

		IF (@Opcion = 1) --Opci�n para devolver el listado completo
		BEGIN
			SELECT * FROM PRODUCTO;
		END
		
		IF (@Opcion = 2) --Opci�n para crear
		BEGIN
			INSERT INTO PRODUCTO ([CategoriaId], [Nombre], [Vencimiento], [Imagen], [AuditUsuarioCreacion]) 
			VALUES (@CategoriaId, @Nombre, @Vencimiento, @Imagen, @Usuario);
		END
		
		IF (@Opcion = 3) --Opci�n para actualizar
		BEGIN
			IF @Imagen IS NOT NULL AND @Imagen <> ''
			BEGIN
				UPDATE PRODUCTO SET [CategoriaId]=@CategoriaId, [Nombre] = @Nombre, [Vencimiento]=@Vencimiento,
				 [Imagen] = @Imagen, [AuditUsuarioModificacion] = @Usuario
				WHERE [Id] = @Id;
			END
			ELSE
			BEGIN
				UPDATE PRODUCTO SET [CategoriaId]=@CategoriaId, [Nombre] = @Nombre, [Vencimiento]=@Vencimiento,
					[AuditUsuarioModificacion] = @Usuario
				WHERE [Id] = @Id;
			END
		END
		
		IF (@Opcion = 4) --Opci�n para eliminar
		BEGIN
			DELETE FROM PRODUCTO WHERE [Id] = @Id; 
		END

		IF (@Opcion = 5) --Opci�n para seleccionar uno por ID
		BEGIN
			SELECT * FROM PRODUCTO WHERE [Id] = @Id;
		END

		COMMIT TRAN TRAN_MATENIMIENTO_PRODUCTO
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN TRAN_MATENIMIENTO_PRODUCTO
		SELECT ERROR_MESSAGE();
	END CATCH
END
GO
