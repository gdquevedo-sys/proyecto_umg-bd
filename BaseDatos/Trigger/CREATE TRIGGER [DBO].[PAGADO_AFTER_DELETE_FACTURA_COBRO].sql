DROP TRIGGER IF EXISTS [DBO].[PAGADO_AFTER_DELETE_FACTURA_COBRO];

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [DBO].[PAGADO_AFTER_DELETE_FACTURA_COBRO] 
   ON  [DBO].[COBRO] 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE [DBO].[FACTURA]
	SET [Pagado] = 0
	WHERE Id = (SELECT D.FacturaId FROM Deleted AS D);
END
GO