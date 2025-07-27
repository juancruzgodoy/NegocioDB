USE NegocioDB;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DELETE FROM DetalleVenta;
    DELETE FROM Venta;
    DELETE FROM Producto;
    DELETE FROM Cliente;
    DELETE FROM Proveedor;
    DELETE FROM Categoria;

    DBCC CHECKIDENT ('DetalleVenta', RESEED, 0);
    DBCC CHECKIDENT ('Venta', RESEED, 0);
    DBCC CHECKIDENT ('Producto', RESEED, 0);
    DBCC CHECKIDENT ('Cliente', RESEED, 0);
    DBCC CHECKIDENT ('Proveedor', RESEED, 0);
    DBCC CHECKIDENT ('Categoria', RESEED, 0);

    PRINT '--- Cargando Tablas Maestras ---';

    INSERT INTO Categoria (nombre) VALUES
    ('Carnes Vacunas'), ('Cerdo'), ('Pollo'), ('Fiambres'), ('Quesos'),
    ('Elaborados'), ('Bebidas'), ('Almacén');

    INSERT INTO Proveedor (nombre, tipo, telefono, CUIT) VALUES
    ('Frigorífico La Pampa S.A.', 'Empresa', '1141234567', '30123456789'),
    ('Distribuidora Láctea del Sur', 'Empresa', '1155554444', '30987654321'),
    ('Juan Pérez - Reparto Pollo', 'Particular', '1161237890', '20123456789'),
    ('Coca-Cola FEMSA', 'Empresa', '1143219876', '30112233445'),
    ('Elaborados Don Tito', 'Empresa', '1159871234', '30445566778');

    INSERT INTO Cliente (nombre, telefono) VALUES ('Consumidor Final', NULL);
    INSERT INTO Cliente (nombre, telefono) VALUES
    ('Juan Garcia', '1162345678'), ('Maria Fernandez', '1163456789'), ('Carlos Lopez', '1164567890'),
    ('Ana Martinez', '1165678901'), ('Luis Rodriguez', '1166789012'), ('Laura Sanchez', '1167890123'),
    ('Miguel Perez', '1168901234'), ('Sofia Gomez', '1169012345'), ('Jorge Diaz', NULL),
    ('Lucia Torres', '1123456789'), ('Pedro Ramirez', '1134567890'), ('Marta Flores', '1145678901'),
    ('Daniel Benitez', '1156789012'), ('Elena Acosta', '1167890123'), ('Roberto Alvarez', '1178901234'),
    ('Carmen Moreno', '1189012345'), ('Fernando Romero', '1190123456'), ('Raquel Suarez', '1112345678'),
    ('Jose Molina', '1122334455'), ('Isabel Castro', '1133445566'), ('Francisco Ortiz', '1144556677'),
    ('Teresa Gutierrez', '1155667788'), ('Antonio Navarro', '1166778899'), ('Dolores Ruiz', '1177889900'),
    ('David Pascual', '1188990011'), ('Sara Serrano', '1199001122'), ('Javier Gil', '1100112233'),
    ('Marina Iglesias', '1111223344'), ('Pablo Nuñez', '1122446688');

    INSERT INTO Producto (nombre, ID_Categoria, ID_Proveedor, unidadDeMedida, precioVenta, stockActual) VALUES
    ('Asado', 1, 1, 'Kg', 9500.50, 25.5), ('Vacío', 1, 1, 'Kg', 11200.00, 18.2),
    ('Lomo', 1, 1, 'Kg', 14500.75, 12.0), ('Nalga para Milanesa', 1, 1, 'Kg', 10500.00, 30.8),
    ('Matambre', 1, 1, 'Kg', 9800.00, 15.1), ('Entraña', 1, 1, 'Kg', 12500.50, 10.0),
    ('Carne Picada Especial', 1, 1, 'Kg', 7500.00, 22.3), ('Ojo de Bife', 1, 1, 'Kg', 13200.00, 14.7),
    ('Achuras (Chinchulin)', 1, 1, 'Kg', 4500.00, 10.0), ('Riñon', 1, 1, 'Kg', 3800.00, 12.5),
    ('Pecho de Cerdo', 2, 1, 'Kg', 6500.00, 20.0), ('Matambre de Cerdo', 2, 1, 'Kg', 7200.50, 16.5),
    ('Bondiola', 2, 1, 'Kg', 7800.00, 25.0), ('Costilla de Cerdo', 2, 1, 'Kg', 7500.00, 15.8),
    ('Pollo Entero', 3, 3, 'Kg', 3500.00, 30.0), ('Pata y Muslo', 3, 3, 'Kg', 3800.50, 40.2),
    ('Suprema de Pollo', 3, 3, 'Kg', 4500.00, 50.0), ('Alitas de Pollo', 3, 3, 'Kg', 2500.00, 35.4),
    ('Jamón Crudo', 4, 2, 'Kg', 15000.00, 8.5), ('Jamón Cocido', 4, 2, 'Kg', 8500.50, 15.3),
    ('Salame Milán', 4, 2, 'Kg', 9200.00, 12.8), ('Mortadela', 4, 2, 'Kg', 4500.00, 20.0),
    ('Lomito Ahumado', 4, 2, 'Kg', 13500.00, 9.1), ('Leberwurst', 4, 2, 'Kg', 6800.00, 9.8),
    ('Queso de Máquina', 5, 2, 'Kg', 7800.00, 22.4), ('Queso Cremoso', 5, 2, 'Kg', 6500.50, 18.9),
    ('Queso Sardo', 5, 2, 'Kg', 9500.00, 14.0), ('Queso Roquefort', 5, 2, 'Kg', 12000.00, 7.5),
    ('Muzzarella', 5, 2, 'Kg', 7200.00, 25.0), ('Queso Provolone', 5, 2, 'Kg', 11500.00, 11.2),
    ('Milanesas de Carne Preparadas', 6, 5, 'Kg', 11000.00, 15.0), ('Milanesas de Pollo Preparadas', 6, 5, 'Kg', 9500.00, 20.0),
    ('Hamburguesas Caseras', 6, 5, 'Unidad', 1500.00, 50.0), ('Chorizo', 6, 5, 'Kg', 5500.00, 30.0),
    ('Morcilla', 6, 5, 'Kg', 4800.00, 25.0), ('Salchicha Parrillera', 6, 5, 'Kg', 6200.00, 28.0),
    ('Matambre a la Pizza (pre-cocido)', 6, 5, 'Kg', 12500.00, 8.0),
    ('Coca-Cola 2.25L', 7, 4, 'Unidad', 3500.00, 40.0), ('Agua Mineral 2L', 7, 4, 'Unidad', 1500.00, 50.0),
    ('Cerveza Quilmes 1L', 7, 4, 'Unidad', 2800.00, 60.0), ('Vino Tinto Toro', 7, 4, 'Unidad', 2500.00, 35.0),
    ('Fernet Branca 750ml', 7, 4, 'Unidad', 9800.00, 24.0), ('Sprite 2.25L', 7, 4, 'Unidad', 3400.00, 38.0),
    ('Pan Rallado 500g', 8, 5, 'Unidad', 1200.00, 40.0), ('Huevos (Docena)', 8, 3, 'Unidad', 2500.00, 30.0),
    ('Sal Fina 500g', 8, 5, 'Unidad', 800.00, 50.0), ('Chimichurri', 8, 5, 'Unidad', 1800.00, 25.0),
    ('Carbón 4Kg', 8, 5, 'Unidad', 4500.00, 20.0), ('Aceitunas Verdes 250g', 8, 5, 'Unidad', 1900.00, 33.0),
    ('Papas Fritas 500g', 8, 5, 'Unidad', 2200.00, 45.0);

    PRINT '--- Cargando Datos Transaccionales (20 Ventas Explícitas) ---';

    DECLARE @idVenta INT;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (1, '2025-07-20 10:30:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 1, 1.5, 9500.50, 14250.75);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 34, 1, 5500.00, 5500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (2, '2025-07-20 11:15:00', 0, 'MercadoPago');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 4, 1, 10500.00, 10500.00);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 44, 2, 1200.00, 2400.00);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 45, 1, 2500.00, 2500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (3, '2025-07-21 18:00:00', 0, 'Tarjeta');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 20, 0.2, 8500.50, 1700.10);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 25, 0.3, 7800.00, 2340.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (4, '2025-07-21 19:30:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 17, 2, 4500.00, 9000.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (5, '2025-07-22 12:00:00', 0, 'MercadoPago');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 38, 1, 3500.00, 3500.00);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 13, 1.2, 7800.00, 9360.00);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 48, 1, 4500.00, 4500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (6, '2025-07-22 12:05:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 33, 4, 1500.00, 6000.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (7, '2025-07-23 09:10:00', 0, 'Tarjeta');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 7, 0.5, 7500.00, 3750.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (8, '2025-07-23 17:45:00', 0, 'MercadoPago');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 2, 2.1, 11200.00, 23520.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (9, '2025-07-24 11:00:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 16, 1.5, 3800.50, 5700.75);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 47, 1, 1800.00, 1800.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (10, '2025-07-24 19:00:00', 0, 'Tarjeta');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 28, 0.15, 12000.00, 1800.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (11, '2025-07-25 12:30:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 35, 1, 4800.00, 4800.00);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 36, 1, 6200.00, 6200.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (12, '2025-07-25 20:00:00', 0, 'MercadoPago');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 3, 0.8, 14500.75, 11600.60);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 41, 1, 2500.00, 2500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (13, '2025-07-26 10:00:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 19, 0.1, 15000.00, 1500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (14, '2025-07-26 13:00:00', 0, 'Tarjeta');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 15, 3, 3500.00, 10500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (15, '2025-07-27 11:30:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 29, 0.5, 7200.00, 3600.00);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 49, 1, 1900.00, 1900.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (1, '2025-07-27 19:45:00', 0, 'MercadoPago');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 40, 2, 2800.00, 5600.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (2, '2025-07-28 16:00:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 46, 1, 800.00, 800.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (3, '2025-07-28 18:20:00', 0, 'Tarjeta');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 31, 1.5, 11000.00, 16500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (4, '2025-07-29 10:15:00', 0, 'MercadoPago');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 22, 0.25, 4500.00, 1125.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    INSERT INTO Venta (ID_Cliente, fecha, totalVenta, metodoDePago) VALUES (5, '2025-07-29 19:50:00', 0, 'Efectivo');
    SET @idVenta = SCOPE_IDENTITY();
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 42, 1, 9800.00, 9800.00);
    INSERT INTO DetalleVenta (ID_Venta, ID_Producto, cantidad, precioUnitario, subtotal) VALUES (@idVenta, 38, 1, 3500.00, 3500.00);
    UPDATE Venta SET totalVenta = (SELECT SUM(subtotal) FROM DetalleVenta WHERE ID_Venta = @idVenta) WHERE ID = @idVenta;

    COMMIT TRANSACTION;
    PRINT 'Carga de datos completada y confirmada con éxito.';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Ocurrió un error durante la carga de datos. La transacción fue revertida.';
    PRINT 'Error Número: ' + CAST(ERROR_NUMBER() AS VARCHAR);
    PRINT 'Error Mensaje: ' + ERROR_MESSAGE();
    PRINT 'Error Línea: ' + CAST(ERROR_LINE() AS VARCHAR);
END CATCH;
GO