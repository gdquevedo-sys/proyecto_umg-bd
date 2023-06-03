DROP TRIGGER IF EXISTS [DBO].[STOCK_AFTER_DELETE_INVENTARIO_COMPRA];

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [DBO].[STOCK_AFTER_DELETE_INVENTARIO_COMPRA] 
   ON  [DBO].[COMPRA] 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE [DBO].[INVENTARIO]
	SET [Stock] = [Stock] - (SELECT D.Cantidad FROM deleted AS D),
	[AuditUsuarioModificacion] = (SELECT D.AuditUsuarioModificacion FROM deleted AS D)
	WHERE ProductoId = (SELECT D.ProductoId FROM deleted AS D);
END
GO
