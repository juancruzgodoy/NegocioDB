/*
Calcular cuánto dinero ingresó por cada método de pago
(Efectivo, MercadoPago, etc.). La consulta debe devolver dos
columnas: metodoDePago y TotalRecaudado.
*/

USE NegocioDB;

SELECT metodoDePago, SUM(totalVenta) AS TotalRecaudado
FROM Venta
GROUP BY metodoDePago;