/*
Encontrar el precio del producto más caro y el del más barato
de todo el catálogo.*/

USE NegocioDB;

SELECT 
MAX(precioVenta) AS MasCaro,
MIN(precioVenta) AS MasBarato
FROM Producto;