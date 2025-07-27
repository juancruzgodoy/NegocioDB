USE NegocioDB;

/*  Creo un SP que reciba toda la información de una venta y la inserte en las tablas Venta y
DetalleVenta, actualizando el stock, todo como una única operación "atómica" (o se hace todo
bien, o no se hace nada).

Para recibir todos los productos con sus cantidades primero creo un nuevo tipo de parametro
que sea una tabla, donde cada fila sea el ID_Producto y cantidad vendida.
*/

CREATE TYPE tipo_ProductosVendidos AS TABLE(
	ID_Producto INT,
	cantidad FLOAT
);

GO

CREATE PROCEDURE pa_Venta_insertarVentaCompleta
	@ID_Cliente INT,
	@MetodoDePago VARCHAR(15),
	@Productos dbo.tipo_ProductosVendidos READONLY
AS
	BEGIN TRANSACTION
		IF EXISTS
			(SELECT * FROM Producto
				JOIN @Productos AS p
				ON Producto.ID = p.ID_Producto
				WHERE p.cantidad > producto.stockActual)

			BEGIN
				RAISERROR ('No hay suficiente stock de algun/os producto/s.', 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END

		ELSE IF NOT EXISTS
			(SELECT * FROM Cliente AS c
				WHERE @ID_Cliente=c.ID)
			BEGIN
				RAISERROR ('No existe el cliente seleccionado.', 16, 1);
				ROLLBACK TRANSACTION;
				RETURN;
			END

		ELSE
			BEGIN
				INSERT INTO Venta
					VALUES (@ID_Cliente, GETDATE(), NULL, @MetodoDePago);

				DECLARE @ID_Venta INT;
				SET @ID_Venta = SCOPE_IDENTITY();

				INSERT INTO DetalleVenta
					SELECT
						@ID_Venta,
						Producto.ID,
						p.cantidad,
						Producto.precioVenta,
						p.cantidad*Producto.precioVenta
					FROM @Productos AS p
					JOIN Producto
					ON p.ID_Producto=Producto.ID;

				UPDATE p_Stock
				SET
					p_Stock.stockActual = p_Stock.stockActual-p_Pedido.cantidad
					FROM Producto AS p_Stock
					JOIN @Productos AS p_Pedido
					ON p_Stock.ID = p_Pedido.ID_Producto;

				UPDATE v_Total
				SET
					v_Total.totalVenta = (
						SELECT SUM(subtotal)
						FROM DetalleVenta
						WHERE ID_Venta=@ID_Venta)
					FROM Venta AS v_Total
					WHERE v_Total.ID = @ID_Venta;

				COMMIT TRANSACTION;
			END