/*
Encontrar el precio del producto m�s caro y el del m�s barato
de todo el cat�logo.*/

USE NegocioDB;

SELECT 
MAX(precioVenta) AS MasCaro,
MIN(precioVenta) AS MasBarato
FROM Producto;