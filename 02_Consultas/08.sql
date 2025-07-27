/*
Listar el ID y la fecha de todas las ventas en las que se haya
vendido una 'Coca-Cola 2.25L'. */

USE NegocioDB;

SELECT * FROM DetalleVenta;
SELECT * FROM Producto;

SELECT v.ID, v.fecha
FROM Venta AS v
JOIN DetalleVenta AS d
ON v.ID=d.ID_Venta
JOIN Producto AS p
ON d.ID_Producto=p.ID
WHERE p.nombre='Coca-Cola 2.25L';