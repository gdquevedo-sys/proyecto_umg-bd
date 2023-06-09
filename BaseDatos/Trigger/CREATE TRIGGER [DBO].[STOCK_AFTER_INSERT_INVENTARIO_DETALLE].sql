DROP TRIGGER IF EXISTS [DBO].[STOCK_AFTER_INSERT_INVENTARIO_DETALLE];

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [DBO].[STOCK_AFTER_INSERT_INVENTARIO_DETALLE] 
   ON  [DBO].[DETALLE] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE [DBO].[INVENTARIO]
	SET [Stock] = [Stock] - (SELECT I.Cantidad FROM Inserted AS I),
	[AuditUsuarioModificacion] = (SELECT I.AuditUsuarioCreacion FROM Inserted AS I)
	WHERE ProductoId = (SELECT I.ProductoId FROM Inserted AS I);
END
GO
