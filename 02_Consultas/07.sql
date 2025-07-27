/*
Encontrar los productos de la categoría "Carnes Vacunas" cuyo
stock sea menor a 15 Kg.*/

USE NegocioDB;

SELECT p.nombre, p.stockActual
FROM Producto AS p
JOIN Categoria AS c
ON p.ID_Categoria=c.ID
WHERE
	c.nombre='Carnes Vacunas'
	AND
	p.stockActual<=15
ORDER BY stockActual DESC;
