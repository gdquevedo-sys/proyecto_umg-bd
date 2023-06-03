IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEVOLUCION]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DEVOLUCION](
		[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,	
		[Cantidad] [int] NOT NULL,
		[FacturaId] [decimal](18, 0) NOT NULL,			
		[DetalleId] [decimal](18, 0) NOT NULL,			
		[ProductoId] [decimal](18, 0) NOT NULL,		
		[Fecha] [datetime] NULL,		
	 CONSTRAINT [PK_DEVOLUCION] PRIMARY KEY CLUSTERED	
	(
		[Id] DESC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
	) ON [PRIMARY]
	
	ALTER TABLE [dbo].[DEVOLUCION]  WITH CHECK ADD  CONSTRAINT [FK_DEVOLUCION_FacturaId] FOREIGN KEY([FacturaId])
	REFERENCES [dbo].[FACTURA] ([Id])
	ALTER TABLE [dbo].[DEVOLUCION]  WITH CHECK ADD  CONSTRAINT [FK_DEVOLUCION_DetalleId] FOREIGN KEY([DetalleId])
	REFERENCES [dbo].[DETALLE] ([Id])
	ALTER TABLE [dbo].[DEVOLUCION]  WITH CHECK ADD  CONSTRAINT [FK_DEVOLUCION_ProductoId] FOREIGN KEY([ProductoId])
	REFERENCES [dbo].[PRODUCTO] ([Id])
	
	PRINT N'CREATE TABLE [dbo].[DEVOLUCION]'
END
ELSE
BEGIN
	DROP TABLE [dbo].[DEVOLUCION];

	PRINT N'DROP TABLE [dbo].[DEVOLUCION]'
END