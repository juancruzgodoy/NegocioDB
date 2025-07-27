
USE master;
GO

IF DB_ID('NegocioDB') IS NOT NULL
BEGIN
    DROP DATABASE NegocioDB;
END
GO

CREATE DATABASE NegocioDB;
GO

USE NegocioDB;
GO

IF OBJECT_ID('DetalleVenta') IS NOT NULL DROP TABLE DetalleVenta;
IF OBJECT_ID('Venta') IS NOT NULL DROP TABLE Venta;
IF OBJECT_ID('Cliente') IS NOT NULL DROP TABLE Cliente;
IF OBJECT_ID('Producto') IS NOT NULL DROP TABLE Producto;
IF OBJECT_ID('Proveedor') IS NOT NULL DROP TABLE Proveedor;
IF OBJECT_ID('Categoria') IS NOT NULL DROP TABLE Categoria;
GO

CREATE TABLE Producto(
	ID INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	ID_Categoria INT,
	ID_Proveedor INT,
	unidadDeMedida VARCHAR(6),
	precioVenta DECIMAL(10, 2),
	stockActual FLOAT
);
GO

ALTER TABLE Producto
ADD CONSTRAINT CK_Producto_UnidadDeMedida
CHECK (unidadDeMedida IN ('Kg', 'Unidad'));
GO

CREATE TABLE Proveedor(
	ID INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	tipo VARCHAR(20),
	telefono VARCHAR(25),
	CUIT VARCHAR(13)
);
GO

ALTER TABLE Proveedor
ADD CONSTRAINT CK_Proveedor_Tipo
CHECK (tipo IN ('Particular', 'Empresa', 'Persona Física', 'Persona Jurídica'));
GO

CREATE TABLE Categoria(
	ID INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(50) UNIQUE NOT NULL
);
GO

CREATE TABLE Cliente(
	ID INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	telefono VARCHAR(25)
);
GO

CREATE TABLE Venta (
	ID INT IDENTITY PRIMARY KEY,
    ID_Cliente INT NOT NULL,
	fecha DATETIME NOT NULL,
	totalVenta DECIMAL(10, 2),
	metodoDePago VARCHAR(15)
);
GO

ALTER TABLE Venta
ADD CONSTRAINT CK_Venta_metodoDePago
CHECK (metodoDePago IN ('Efectivo', 'MercadoPago', 'Tarjeta', 'Cuenta Corriente'));
GO

CREATE TABLE DetalleVenta (
	ID INT IDENTITY PRIMARY KEY,
	ID_Venta INT,
	ID_Producto INT,
	cantidad FLOAT,
	precioUnitario DECIMAL(10, 2),
	subtotal DECIMAL(10, 2)
);
GO

