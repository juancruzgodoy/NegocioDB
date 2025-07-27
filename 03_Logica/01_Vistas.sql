USE NegocioDB;


GO
/*
Creo una vista que muestre una lista de todos tus productos, pero en vez de mostrar los IDs de categoría y proveedor, muestre directamente sus nombres.
*/
CREATE VIEW vista_productos (nombre, unidadDeMedida, precioVenta, stockActual, categoria, proveedor)
	AS
	SELECT pd.nombre, pd.unidadDeMedida, pd.precioVenta, pd.stockActual, c.nombre, pv.nombre
	FROM producto as pd
	JOIN Categoria as c
	ON pd.ID_Categoria=c.ID
	JOIN Proveedor as pv
	ON pd.ID_Proveedor=pv.ID;

GO
/*
Creo una vista que muestre una fila por cada ítem vendido, con toda la información relevante:
ID_Venta, fecha, metodoDePago, producto, categoriaProducto, cantidad, unidadDeMedida, precioUnitario, subtotal
*/
CREATE VIEW vista_VentasDetalladas (ID_Venta, fecha, metodoDePago, producto, categoriaProducto, cantidad, unidadDeMedida, precioUnitario, subtotal)
	AS
	SELECT v.ID, v.fecha, v.metodoDePago, p.nombre, ca.nombre, dv.cantidad, p.unidadDeMedida, dv.precioUnitario, dv.subtotal
	FROM Venta AS v
	JOIN DetalleVenta AS dv
	ON dv.ID_Venta=v.ID
	JOIN Cliente AS cl
	ON v.ID_Cliente=cl.ID
	JOIN Producto AS p
	ON dv.ID_Producto=p.ID
	JOIN Categoria AS ca
	ON p.ID_Categoria=ca.ID;
