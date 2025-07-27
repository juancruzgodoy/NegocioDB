USE NegocioDB;

/* Crear un historial automático que cada vez que alguien
cambia el precio de un producto, lleve dicha informacion a
otra tabla para llevar un historial de precios.

1. Primero creo una tabla nueva llamada "auditoriaPrecio"
para guardar el ID_Producto, precioAnterior, precioNuevo
y fecha de modificacion.
*/

IF OBJECT_ID('AuditoriaPrecio', 'U') IS NOT NULL
    DROP TABLE AuditoriaPrecio;

CREATE TABLE AuditoriaPrecio(
	ID_Producto INT,
	precioAnterior DECIMAL(10,2),
	precioNuevo DECIMAL(10,2),
	fechaModificacion DATETIME
);

GO

CREATE TRIGGER DIS_auditoriaPrecio_actualizar
	ON Producto
	FOR UPDATE
	AS
		IF UPDATE(precioVenta)
			BEGIN
				INSERT INTO AuditoriaPrecio(ID_Producto, precioAnterior, precioNuevo, fechaModificacion)
				SELECT i.ID, d.precioVenta, i.precioVenta, GETDATE()
				FROM deleted AS d
				JOIN inserted AS i
				ON d.ID=i.ID
			END;
GO