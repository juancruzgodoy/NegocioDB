/*
Calcular cu�nto dinero ingres� por cada m�todo de pago
(Efectivo, MercadoPago, etc.). La consulta debe devolver dos
columnas: metodoDePago y TotalRecaudado.
*/

USE NegocioDB;

SELECT metodoDePago, SUM(totalVenta) AS TotalRecaudado
FROM Venta
GROUP BY metodoDePago;