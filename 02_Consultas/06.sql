/* Calcular el monto total que ha gastado cada cliente. La
consulta debe mostrar el nombre del cliente y el total gastado,
ordenado de mayor a menor. */

USE NegocioDB;

SELECT * FROM Venta;

SELECT c.nombre, SUM(v.totalVenta) AS TotalGastado
FROM Cliente AS c
JOIN Venta AS v
ON c.ID=v.ID_Cliente
GROUP BY c.nombre
ORDER BY TotalGastado DESC;