IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DETALLE]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[DETALLE](
		[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,	
		[FacturaId] [decimal](18, 0) NOT NULL,
		[ProductoId] [decimal](18, 0) NOT NULL,		
		[Cantidad] [int] NULL,		
		[Precio] [decimal](20, 2) NOT NULL,	
		[SubTotal] [decimal](20, 2) NOT NULL,	
	 CONSTRAINT [PK_DETALLE] PRIMARY KEY CLUSTERED	
	(
		[Id] DESC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
	) ON [PRIMARY]
	
	ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_FacturaId] FOREIGN KEY([FacturaId])
	REFERENCES [dbo].[FACTURA] ([Id])
	ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_ProductoId] FOREIGN KEY([ProductoId])
	REFERENCES [dbo].[PRODUCTO] ([Id])

	PRINT N'CREATE TABLE [dbo].[DETALLE]'
END
ELSE
BEGIN
	DROP TABLE [dbo].[DETALLE];

	PRINT N'DROP TABLE [dbo].[DETALLE]'
END