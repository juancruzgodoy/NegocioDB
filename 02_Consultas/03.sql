/*Contar cuántos productos diferentes nos suministra cada
proveedor. El resultado debe mostrar el nombre del proveedor
y la cantidad de productos.*/

SELECT Proveedor.nombre, count(*) as CantidadProductos
FROM Proveedor
JOIN Producto
ON ID_Proveedor=Proveedor.ID
GROUP BY Proveedor.nombre
ORDER BY CantidadProductos DESC;