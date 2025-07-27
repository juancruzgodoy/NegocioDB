/*
Identificar cuáles son los 3 productos que más se vendieron en
total (sumando las cantidades de todas las ventas). La consulta
debe devolver el nombre del producto y la cantidad total vendida.
*/

USE NegocioDB;

SELECT TOP 3 p.nombre, SUM(cantidad) AS CantidadVentas
FROM DetalleVenta AS d
JOIN Producto AS p
ON d.ID_Producto=p.ID
GROUP BY p.nombre
ORDER BY CantidadVentas DESC;