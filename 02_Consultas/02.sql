/*
Mostrar una lista con el nombre del producto y el nombre de la
categor�a a la que pertenece.
*/

USE NegocioDB;

SELECT Producto.nombre, Categoria.nombre as Categoria
FROM Producto
JOIN Categoria
ON ID_Categoria=Categoria.ID;