USE NegocioDB;
GO

ALTER TABLE Producto
 ADD CONSTRAINT FK_Producto_Categoria
 FOREIGN KEY (ID_Categoria) REFERENCES Categoria (ID);
GO

ALTER TABLE Producto
 ADD CONSTRAINT FK_Producto_Proveedor
 FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor (ID);
GO

ALTER TABLE DetalleVenta
 ADD CONSTRAINT FK_DetalleVenta_Venta
 FOREIGN KEY (ID_Venta) REFERENCES Venta (ID);
GO

ALTER TABLE DetalleVenta
 ADD CONSTRAINT FK_DetalleVenta_Producto
 FOREIGN KEY (ID_Producto) REFERENCES Producto (ID);
GO

ALTER TABLE Venta
 ADD CONSTRAINT FK_Venta_Cliente
 FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID);
GO
