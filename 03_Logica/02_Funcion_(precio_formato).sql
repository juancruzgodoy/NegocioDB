USE NegocioDB;

SELECT * FROM Producto;

GO
/* Creo una función que calcule el precio total para una
cantidad de un producto y devuelva el resultado como un texto
bien formateado ("$ 1.500,50", por si se quiere imprimir para
un ticket por ejemplo). */

CREATE FUNCTION f_Precio_FormatoARG
	(@ID_Producto INT,
	@cantidad FLOAT)
	RETURNS VARCHAR(30)
	BEGIN
		DECLARE @precioVenta DECIMAL(10,2)
		SET @precioVenta=(
			SELECT precioVenta
			FROM Producto
			WHERE ID=@ID_Producto)
		DECLARE @total DECIMAL(10,2)
		SET @total=(@precioVenta * @cantidad)
		RETURN (FORMAT(@total, 'C', 'es-AR'))
	END;

GO